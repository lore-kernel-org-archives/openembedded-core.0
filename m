Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CC4CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 06:00:43 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5283.1790920842662012913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 23:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iqY4R1AC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SJnFcI1w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0fb3359ea-47834dfd-395f-4a19-b2c0-ca8300c79a54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790920841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qknjaCQ0m9y/1wEZ+ArOe54BeVwNNIdHkAMmKpivFDk=;
	b=iqY4R1ACbRvRjCBI21SGtJjjE1pmw0fGhGf5tZLQbwlzmnXWLMKot1CVpPrDTC7O
	P42hR2F+g6sZYtbmBZqINmnrxBI0F3QMeePkRTLoejKQtll+kEMwfvhLj4cLhAI75Md
	yRb7G6G34op8eZvRFIhueEi1Rs2f6gtkWEcOTyCc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790920841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qknjaCQ0m9y/1wEZ+ArOe54BeVwNNIdHkAMmKpivFDk=;
	b=SJnFcI1wPVrHB9x0oD29BfUe9FECnnQii4g1662F6SN+D0Ay/9XOnmorfLnoJ8Y4
	BJ0ziuZ/LjyzCipYdB3Op1/Rwsbdu8FQq48FqefyzhtprRO7vlAZnV6Zal2J+bLXf/r
	YgDyastully99HnfkfMym9YFRJgDmUCSo4+VlX/w=
Content-Type: multipart/mixed; boundary="===============1078421666001441984=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patchelf: upgrading to 0.19.2 SUCCEEDED
Message-ID: <010101a0fb3359ea-47834dfd-395f-4a19-b2c0-ca8300c79a54-000000@us-west-2.amazonses.com>
Date: Fri, 2 Oct 2026 06:00:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 06:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247060

--===============1078421666001441984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *patchelf* to *0.19.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-patchelf-upgrade-0.19.1-0.19.2.patch
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
From 4064a6dc024f61bbc665e306159fb184cb7e4e2c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 2 Oct 2026 05:33:30 +0000
Subject: [PATCH] patchelf: upgrade 0.19.1 -> 0.19.2

## 0.19.2 (October 1, 2026)
A bug fix release for rewriting executables after stripping.
### Bug fixes
---
 meta/recipes-devtools/patchelf/patchelf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf_git.bb b/meta/recipes-devtools/patchelf/patchelf_git.bb
index 741c1e6612..a69f3b9d75 100644
--- a/meta/recipes-devtools/patchelf/patchelf_git.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master;tag=${PV}"
-SRCREV = "7688b17c18d16f67fa8d5a82a2404c2e3a18648d"
+SRCREV = "382d8bc12db9e720515da49d9c272ef4a622c3c0"
 
-PV = "0.19.1"
+PV = "0.19.2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
-- 
2.47.1


--===============1078421666001441984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="patchelf-changelog.txt"

## 0.19.2 (October 1, 2026)
A bug fix release for rewriting executables after stripping.
### Bug fixes

--===============1078421666001441984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/patchelf: SRC_URI changed from "git://github.com/NixOS/patchelf;protocol=https;branch=master;tag=0.19.1" to "git://github.com/NixOS/patchelf;protocol=https;branch=master;tag=0.19.2"
packages/x86-64-v3-poky-linux/patchelf: PKGV changed from 0.19.1 [default] to 0.19.2 [default]
packages/x86-64-v3-poky-linux/patchelf: PV changed from "0.19.1" to "0.19.2"
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PKGV changed from 0.19.1 [default] to 0.19.2 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PKGSIZE changed from 4033128 to 4033832 (+0%)
packages/x86-64-v3-poky-linux/patchelf/patchelf-dbg: PV changed from "0.19.1" to "0.19.2"
packages/x86-64-v3-poky-linux/patchelf/patchelf-dev: PKGV changed from 0.19.1 [default] to 0.19.2 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-dev: PV changed from "0.19.1" to "0.19.2"
packages/x86-64-v3-poky-linux/patchelf/patchelf-doc: PKGV changed from 0.19.1 [default] to 0.19.2 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-doc: PV changed from "0.19.1" to "0.19.2"
packages/x86-64-v3-poky-linux/patchelf/patchelf-locale: PKGV changed from 0.19.1 [default] to 0.19.2 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-locale: PV changed from "0.19.1" to "0.19.2"
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PKGV changed from 0.19.1 [default] to 0.19.2 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PKGSIZE changed from 321453 to 321838 (+0%)
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: PV changed from "0.19.1" to "0.19.2"
packages/x86-64-v3-poky-linux/patchelf/patchelf-src: FILELIST: directory renamed /usr/src/debug/patchelf/0.19.1/src -> /usr/src/debug/patchelf/0.19.2/src
packages/x86-64-v3-poky-linux/patchelf/patchelf-staticdev: PKGV changed from 0.19.1 [default] to 0.19.2 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-staticdev: PV changed from "0.19.1" to "0.19.2"
packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PKGV changed from 0.19.1 [default] to 0.19.2 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf-zsh-completion: PV changed from "0.19.1" to "0.19.2"
packages/x86-64-v3-poky-linux/patchelf/patchelf: PKGV changed from 0.19.1 [default] to 0.19.2 [default]
packages/x86-64-v3-poky-linux/patchelf/patchelf: PV changed from "0.19.1" to "0.19.2"

--===============1078421666001441984==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-patchelf-upgrade-0.19.1-0.19.2.patch"

RnJvbSA0MDY0YTZkYzAyNGY2MWJiYzY2NWUzMDYxNTlmYjE4NGNiN2U0ZTJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBPY3QgMjAyNiAwNTozMzozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
dGNoZWxmOiB1cGdyYWRlIDAuMTkuMSAtPiAwLjE5LjIKCiMjIDAuMTkuMiAoT2N0b2JlciAxLCAy
MDI2KQpBIGJ1ZyBmaXggcmVsZWFzZSBmb3IgcmV3cml0aW5nIGV4ZWN1dGFibGVzIGFmdGVyIHN0
cmlwcGluZy4KIyMjIEJ1ZyBmaXhlcwotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wYXRjaGVs
Zi9wYXRjaGVsZl9naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bh
dGNoZWxmL3BhdGNoZWxmX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wYXRjaGVsZi9w
YXRjaGVsZl9naXQuYmIKaW5kZXggNzQxYzFlNjYxMi4uYTY5ZjNiOWQ3NSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BhdGNoZWxmL3BhdGNoZWxmX2dpdC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYvcGF0Y2hlbGZfZ2l0LmJiCkBAIC01LDkgKzUsOSBA
QCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vTml4T1MvcGF0Y2hlbGYiCiBMSUNFTlNF
ID0gIkdQTC0zLjAtb25seSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL05peE9TL3Bh
dGNoZWxmO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPSR7UFZ9IgotU1JDUkVWID0g
Ijc2ODhiMTdjMThkMTZmNjdmYThkNWE4MmEyNDA0YzJlM2ExODY0OGQiCitTUkNSRVYgPSAiMzgy
ZDhiYzEyZGI5ZTcyMDUxNWRhNDlkOWMyNzJlZjRhNjIyYzNjMCIKIAotUFYgPSAiMC4xOS4xIgor
UFYgPSAiMC4xOS4yIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1j
Njc4OTU3YjBjOGU5NjRhYTZjNzBmZDc3NjQxYTcxZSIKIAotLSAKMi40Ny4xCgo=

--===============1078421666001441984==--

