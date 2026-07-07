Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E61C44501
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 05:50:04 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167395.1783403397058438519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 22:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CmY0I3hW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DcPlbDy9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f3b203be0-09f79489-0bee-4857-8a17-5bcf8d8d53f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783403396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=unovA0cnSvQlmXaVwtkiuiF7lDCEDfYYzNO3bkKSoV0=;
	b=CmY0I3hWcm3giUztt6TDVB31Z4aLzv1fBJfYMPEWf/j2dEIvdjiSOmEbT42CGhS7
	qAoTMqdJRzUhiS2Y7s0lWw6rGvtaM09n8Ah47sGZtr6eMsP28y0uIaLMbs8mZWg8NRw
	cG+uf2ANxTCKMLmrCdXZP3uWxo2+p8BN0JvtmLMg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783403396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=unovA0cnSvQlmXaVwtkiuiF7lDCEDfYYzNO3bkKSoV0=;
	b=DcPlbDy981MSSiN0KGQF/uJeqN3/44GeNiLDNWPoO7bX6w3KI94q6pSfvQAueJNg
	OyT0l66y28HTDl4W3rBrl7rVwECoxkPHJP4dIUieuIUYPZc3GplUwYHK0QI9CjsHQcp
	Kl2L6GzvdDnzXmBvXELc/jZlzd6cpkmgsdbDwJZ4=
Content-Type: multipart/mixed; boundary="===============8672134371325109555=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patchelf: upgrading to 0.19.1 SUCCEEDED
Message-ID: <0101019f3b203be0-09f79489-0bee-4857-8a17-5bcf8d8d53f5-000000@us-west-2.amazonses.com>
Date: Tue, 7 Jul 2026 05:49:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.07-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 05:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240356

--===============8672134371325109555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *patchelf* to *0.19.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-patchelf-upgrade-0.19.0-0.19.1.patch
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
From a1508500fc61c98f83de8199bc7d28e5da21e296 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 7 Jul 2026 05:30:30 +0000
Subject: [PATCH] patchelf: upgrade 0.19.0 -> 0.19.1

---
 meta/recipes-devtools/patchelf/patchelf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf_git.bb b/meta/recipes-devtools/patchelf/patchelf_git.bb
index 6ce7721353..6c88da1b09 100644
--- a/meta/recipes-devtools/patchelf/patchelf_git.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
@@ -6,9 +6,9 @@ LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
 "
-SRCREV = "1e279e99b952c765824fa0401abb8dc0d944e4ea"
+SRCREV = "7688b17c18d16f67fa8d5a82a2404c2e3a18648d"
 
-PV = "0.19.0"
+PV = "0.19.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
-- 
2.47.1


--===============8672134371325109555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/patchelf: PV changed from "0.19.0" to "0.19.1"
packages/x86-64-v3-poky-linux/patchelf: PKGV changed from 0.19.0 [default] to 0.19.1 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PV changed from "0.19.0" to "0.19.1"
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PKGSIZE changed from 3999336 to 4002952 (+0%)
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PKGV changed from 0.19.0 [default] to 0.19.1 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-dev: PV changed from "0.19.0" to "0.19.1"
packages/x86-64-v3-poky-linux/patchelf/patchelf-dev: PKGV changed from 0.19.0 [default] to 0.19.1 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-doc: PV changed from "0.19.0" to "0.19.1"
packages/x86-64-v3-poky-linux/patchelf/patchelf-doc: PKGSIZE changed from 10089 to 10228 (+1%)
packages/x86-64-v3-poky-linux/patchelf/patchelf-doc: PKGV changed from 0.19.0 [default] to 0.19.1 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-locale: PV changed from "0.19.0" to "0.19.1"
packages/x86-64-v3-poky-linux/patchelf/patchelf-locale: PKGV changed from 0.19.0 [default] to 0.19.1 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PV changed from "0.19.0" to "0.19.1"
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PKGSIZE changed from 320787 to 321453 (+0%)
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: FILELIST: directory renamed /usr/src/debug/patchelf/0.19.0/src -> /usr/src/debug/patchelf/0.19.1/src
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PKGV changed from 0.19.0 [default] to 0.19.1 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-staticdev: PV changed from "0.19.0" to "0.19.1"
packages/x86-64-v3-poky-linux/patchelf/patchelf-staticdev: PKGV changed from 0.19.0 [default] to 0.19.1 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PV changed from "0.19.0" to "0.19.1"
packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PKGV changed from 0.19.0 [default] to 0.19.1 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf: PV changed from "0.19.0" to "0.19.1"
packages/x86-64-v3-poky-linux/patchelf/patchelf: PKGSIZE changed from 301288 to 305384 (+1%)
packages/x86-64-v3-poky-linux/patchelf/patchelf: PKGV changed from 0.19.0 [default] to 0.19.1 [default]

--===============8672134371325109555==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-patchelf-upgrade-0.19.0-0.19.1.patch"

RnJvbSBhMTUwODUwMGZjNjFjOThmODNkZTgxOTliYzdkMjhlNWRhMjFlMjk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNyBKdWwgMjAyNiAwNTozMDozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
dGNoZWxmOiB1cGdyYWRlIDAuMTkuMCAtPiAwLjE5LjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BhdGNoZWxmL3BhdGNoZWxmX2dpdC5iYiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGF0Y2hlbGYvcGF0Y2hlbGZfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BhdGNoZWxmL3BhdGNoZWxmX2dpdC5iYgppbmRleCA2Y2U3NzIxMzUzLi42Yzg4ZGExYjA5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYvcGF0Y2hlbGZfZ2l0LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wYXRjaGVsZi9wYXRjaGVsZl9naXQuYmIKQEAg
LTYsOSArNiw5IEBAIExJQ0VOU0UgPSAiR1BMLTMuMC1vbmx5IgogCiBTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vTml4T1MvcGF0Y2hlbGY7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBc
CiAiCi1TUkNSRVYgPSAiMWUyNzllOTliOTUyYzc2NTgyNGZhMDQwMWFiYjhkYzBkOTQ0ZTRlYSIK
K1NSQ1JFViA9ICI3Njg4YjE3YzE4ZDE2ZjY3ZmE4ZDVhODJhMjQwNGMyZTNhMTg2NDhkIgogCi1Q
ViA9ICIwLjE5LjAiCitQViA9ICIwLjE5LjEiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PWM2Nzg5NTdiMGM4ZTk2NGFhNmM3MGZkNzc2NDFhNzFlIgogCi0tIAoyLjQ3
LjEKCg==

--===============8672134371325109555==--

