Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597A5C44509
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 06:06:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.262.1783749983264470713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 23:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FgfBdjMq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jxwAu3cX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f4fc8b8e9-69b8b3da-3380-4cf0-ad1a-7087dfd67ab8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783749982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ek7ttFaqlAsAiNZO3A3DDwNoAGwbIXMQsMLWbnJlmy8=;
	b=FgfBdjMqSffDvEXpVleMaF3ckIUzzE/GxITb+a3xGbfyqfPMWyWCf6dUakem0wZo
	SIYihBAv1URu4HhMF2NnjUHEdbwrrelXgcABG923HOhxpQPup+Rm4OjIEuM5+IAqD6T
	EPxDkl22GhUONKFjtliTW8XHhSFHDMY9cxczkrvQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783749982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ek7ttFaqlAsAiNZO3A3DDwNoAGwbIXMQsMLWbnJlmy8=;
	b=jxwAu3cXL7J/EMHZn4HnPcjwHRI9cGNesBHQ/njI65nUgxIkhlevs1GXxG0yRsE4
	trQrF/iWVfjcatTTVBA2jqgDX4TpDn5IHMvGTmxq2DVZ80WZ+uNGsNILIEODoBm33BB
	TUh6ORiRwkBB8XIQ+JforHc+Myp7qFJq5YRe+pH8=
Content-Type: multipart/mixed; boundary="===============8788845246074574156=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 16.1 SUCCEEDED
Message-ID: <0101019f4fc8b8e9-69b8b3da-3380-4cf0-ad1a-7087dfd67ab8-000000@us-west-2.amazonses.com>
Date: Sat, 11 Jul 2026 06:06:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 06:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240706

--===============8788845246074574156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *16.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-16.0-16.1.patch
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
From c16f98e12f7a2d70a59b4bbe9276b8441f37eeab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 11 Jul 2026 05:34:58 +0000
Subject: [PATCH] python3-websockets: upgrade 16.0 -> 16.1

---
 .../{python3-websockets_16.0.bb => python3-websockets_16.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_16.0.bb => python3-websockets_16.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_16.0.bb b/meta/recipes-devtools/python/python3-websockets_16.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_16.0.bb
rename to meta/recipes-devtools/python/python3-websockets_16.1.bb
index 0cad5569c0..0f819aecfd 100644
--- a/meta/recipes-devtools/python/python3-websockets_16.0.bb
+++ b/meta/recipes-devtools/python/python3-websockets_16.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "5f6261a5e56e8d5c42a4497b364ea24d94d9563e8fbd44e78ac40879c60179b5"
+SRC_URI[sha256sum] = "299468cbe42e2b9981134c7c51d99387d8a7bf562b00183b3eec53f882846dad"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============8788845246074574156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-16.0.dist-info -> /usr/lib/python3.14/site-packages/websockets-16.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/websockets-16.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-16.0.dist-info moved to /usr/lib/python3.14/site-packages/websockets-16.1.dist-info

--===============8788845246074574156==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-16.0-16.1.patch"

RnJvbSBjMTZmOThlMTJmN2EyZDcwYTU5YjRiYmU5Mjc2Yjg0NDFmMzdlZWFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTEgSnVsIDIwMjYgMDU6MzQ6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYnNvY2tldHM6IHVwZ3JhZGUgMTYuMCAtPiAxNi4xCgotLS0KIC4uLi97cHl0aG9u
My13ZWJzb2NrZXRzXzE2LjAuYmIgPT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE2LjEuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtd2Vic29ja2V0c18xNi4wLmJi
ID0+IHB5dGhvbjMtd2Vic29ja2V0c18xNi4xLmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE2LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNi4xLmJiCnNpbWls
YXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy13ZWJzb2NrZXRzXzE2LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE2LjEuYmIKaW5kZXggMGNhZDU1NjljMC4uMGY4
MTlhZWNmZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXdlYnNvY2tldHNfMTYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2Vic29ja2V0c18xNi4xLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT01MTkyNGE2YWY0NDk1YjhjZmFlZTFiMWRhODY5YjZmNCIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjVmNjI2MWE1ZTU2ZThkNWM0MmE0NDk3YjM2NGVhMjRkOTRkOTU2M2U4ZmJk
NDRlNzhhYzQwODc5YzYwMTc5YjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjk5NDY4Y2JlNDJl
MmI5OTgxMTM0YzdjNTFkOTkzODdkOGE3YmY1NjJiMDAxODNiM2VlYzUzZjg4Mjg0NmRhZCIKIAog
QkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi0tIAoyLjQ3LjEKCg==

--===============8788845246074574156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-websockets: PKGV changed from 16.0 [default] to 16.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets: PV changed from "16.0" to "16.1"
packages/x86-64-v3-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-16.0.tar.gz;downloadfilename=websockets-16.0.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-16.1.tar.gz;downloadfilename=websockets-16.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 16.0 [default] to 16.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "16.0" to "16.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 16.0 [default] to 16.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "16.0" to "16.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 16.0 [default] to 16.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "16.0" to "16.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 16.0 [default] to 16.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "16.0" to "16.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 16.0 [default] to 16.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PV changed from "16.0" to "16.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: FILELIST: directory renamed /usr/src/debug/python3-websockets/16.0/src/websockets -> /usr/src/debug/python3-websockets/16.1/src/websockets
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 16.0 [default] to 16.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "16.0" to "16.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1370590 to 1385918 (+1%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGV changed from 16.0 [default] to 16.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PV changed from "16.0" to "16.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-16.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-16.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/websockets-16.0.dist-info -> /usr/lib/python3.14/site-packages/websockets-16.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-16.0.dist-info moved to /usr/lib/python3.14/site-packages/websockets-16.1.dist-info

--===============8788845246074574156==--

