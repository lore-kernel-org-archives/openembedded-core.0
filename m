Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248CCC44503
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 06:08:05 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50704.1782540476026876135
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 23:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K/OR72ZS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=s/hKnM7l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f07b11b29-3a011d70-4bb5-4d6f-980a-c50b3d79a576-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782540475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z+rUkfqA7Rh7wNVCJbuKl0uVnMCHEQHIOkLhgiv6ECk=;
	b=K/OR72ZSRgPj9HiFgRC8VGwsikY6LE1Pbyahr4uYKqZ6kGmdErVaex3wuK50OnJE
	n9cDD1+txTTrcQASYvteoejyvmfSZQJY/5J7jBsGO/40/72HkuBNDXfY6bKTqaA0tb6
	Q1WBb9M9QN6NVIUUfHsee4fwgOCuuci2bXWcwPU4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782540475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z+rUkfqA7Rh7wNVCJbuKl0uVnMCHEQHIOkLhgiv6ECk=;
	b=s/hKnM7lEecpSB14gMipzJqsE+t4Fm0GIfySWcfARiIHiqPa83aPXQPSKl3rYREm
	5GD+r5DAGiX5peogzrlm2N9R8ZfkOqkwJUPwc38r/fPxdzeTc4/2HsAxoIKb775BWVO
	CS7wjaSk0w3X8VaLZMF06JF11M2OcrzykdmWt1FA=
Content-Type: multipart/mixed; boundary="===============7346298871769110323=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patchelf: upgrading to 0.19.0 SUCCEEDED
Message-ID: <0101019f07b11b29-3a011d70-4bb5-4d6f-980a-c50b3d79a576-000000@us-west-2.amazonses.com>
Date: Sat, 27 Jun 2026 06:07:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.27-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 06:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239676

--===============7346298871769110323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *patchelf* to *0.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-patchelf-upgrade-0.18.0-0.19.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 7c4daa4bcf9d160afcc750fc1a6ba14f2e54170b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 27 Jun 2026 05:22:02 +0000
Subject: [PATCH] patchelf: upgrade 0.18.0 -> 0.19.0

---
 meta/recipes-devtools/patchelf/patchelf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf_git.bb b/meta/recipes-devtools/patchelf/patchelf_git.bb
index daeae96142..6ce7721353 100644
--- a/meta/recipes-devtools/patchelf/patchelf_git.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
@@ -6,9 +6,9 @@ LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
 "
-SRCREV = "b49de1b3384e7928bf0df9a889fe5a4e7b3fbddf"
+SRCREV = "1e279e99b952c765824fa0401abb8dc0d944e4ea"
 
-PV = "0.18.0+git"
+PV = "0.19.0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
-- 
2.47.1


--===============7346298871769110323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/patchelf: PKGV changed from 0.18.0+git [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf: PV changed from "0.18.0+git" to "0.19.0"
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PV changed from "0.18.0+git" to "0.19.0"
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PKGSIZE changed from 3676616 to 3999336 (+9%)
packages/x86-64-v3-poky-linux/patchelf/patchelf-dev: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-dev: PV changed from "0.18.0+git" to "0.19.0"
packages/x86-64-v3-poky-linux/patchelf/patchelf-doc: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-doc: PV changed from "0.18.0+git" to "0.19.0"
packages/x86-64-v3-poky-linux/patchelf/patchelf-doc: PKGSIZE changed from 9250 to 10089 (+9%)
packages/x86-64-v3-poky-linux/patchelf/patchelf-locale: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-locale: PV changed from "0.18.0+git" to "0.19.0"
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PV changed from "0.18.0+git" to "0.19.0"
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PKGSIZE changed from 298358 to 320787 (+8%)
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: FILELIST: directory renamed /usr/src/debug/patchelf/0.18.0+git/src -> /usr/src/debug/patchelf/0.19.0/src
packages/x86-64-v3-poky-linux/patchelf/patchelf-staticdev: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-staticdev: PV changed from "0.18.0+git" to "0.19.0"
packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PV changed from "0.18.0+git" to "0.19.0"
packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PKGSIZE changed from 3575 to 3709 (+4%)
packages/x86-64-v3-poky-linux/patchelf/patchelf: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf: PV changed from "0.18.0+git" to "0.19.0"
packages/x86-64-v3-poky-linux/patchelf/patchelf: PKGSIZE changed from 268520 to 301288 (+12%)

--===============7346298871769110323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-dev: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-doc: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-locale: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-staticdev: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf: PKGV changed from 0.18.0+git0+b49de1b338 to 0.19.0 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf: PKGSIZE changed from 268520 to 301288 (+12%)

--===============7346298871769110323==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-patchelf-upgrade-0.18.0-0.19.0.patch"

RnJvbSA3YzRkYWE0YmNmOWQxNjBhZmNjNzUwZmMxYTZiYTE0ZjJlNTQxNzBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjcgSnVuIDIwMjYgMDU6MjI6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
YXRjaGVsZjogdXBncmFkZSAwLjE4LjAgLT4gMC4xOS4wCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9wYXRjaGVsZi9wYXRjaGVsZl9naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BhdGNoZWxmL3BhdGNoZWxmX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wYXRjaGVsZi9wYXRjaGVsZl9naXQuYmIKaW5kZXggZGFlYWU5NjE0Mi4uNmNlNzcyMTM1MyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BhdGNoZWxmL3BhdGNoZWxmX2dpdC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYvcGF0Y2hlbGZfZ2l0LmJiCkBA
IC02LDkgKzYsOSBAQCBMSUNFTlNFID0gIkdQTC0zLjAtb25seSIKIAogU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL05peE9TL3BhdGNoZWxmO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIg
XAogIgotU1JDUkVWID0gImI0OWRlMWIzMzg0ZTc5MjhiZjBkZjlhODg5ZmU1YTRlN2IzZmJkZGYi
CitTUkNSRVYgPSAiMWUyNzllOTliOTUyYzc2NTgyNGZhMDQwMWFiYjhkYzBkOTQ0ZTRlYSIKIAot
UFYgPSAiMC4xOC4wK2dpdCIKK1BWID0gIjAuMTkuMCIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9YzY3ODk1N2IwYzhlOTY0YWE2YzcwZmQ3NzY0MWE3MWUiCiAKLS0g
CjIuNDcuMQoK

--===============7346298871769110323==--

