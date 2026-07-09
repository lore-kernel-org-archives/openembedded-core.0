Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0E6C44501
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:11:59 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2990.1783577517114363396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Qehtq3W3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IncDIKZt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f458118d5-c0af548f-1b4f-414f-aab1-c9cec1277c56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577516;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AGs6hV/u0szWAH09yvrHS47SJ7dGjUNOcy2Vgs++uO4=;
	b=Qehtq3W3u4vR6J/Ts405V4kILBkTwuK+oarq5eBptOo+b/5y3GFZCll6BdgDx+ZU
	fC6OE8H979nxoqZkeeT2lBxAtnzmLXdlrLYZCmPg4TdfNl3SYk4jRvv/FtPJajAw1Eo
	S+eBHoE5u49Q60+lv0mTD7xd0tRXisTjp6cqG13c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577516;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AGs6hV/u0szWAH09yvrHS47SJ7dGjUNOcy2Vgs++uO4=;
	b=IncDIKZtok951ZpNjIppnBhcMTZ3gDeUAHOlnaY4eYqTENTh05bf0JzKe533THgH
	LfNWPAH1q062iEVU07jo8kN5eHidcyMm4Ux04gwq48GraW8OeBxydP148xNh+skR2p/
	LoUB1EztHMslm9LUvxRqQAhT16xKbI/YJtzLfZjo=
Content-Type: multipart/mixed; boundary="===============7465774620360622730=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyasn1: upgrading to 0.6.4 SUCCEEDED
Message-ID: <0101019f458118d5-c0af548f-1b4f-414f-aab1-c9cec1277c56-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240530

--===============7465774620360622730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyasn1* to *0.6.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyasn1-upgrade-0.6.3-0.6.4.patch
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
From 30d5119977304fcd5a63db473a7b1157745d5d16 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 9 Jul 2026 05:29:28 +0000
Subject: [PATCH] python3-pyasn1: upgrade 0.6.3 -> 0.6.4

---
 .../python/{python3-pyasn1_0.6.3.bb => python3-pyasn1_0.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.3.bb => python3-pyasn1_0.6.4.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
index fb572d9da4..1c9f3eb670 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf"
+SRC_URI[sha256sum] = "9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b67025bd9fb8ce81"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============7465774620360622730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyasn1: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.6.3.tar.gz;downloadfilename=pyasn1-0.6.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.6.4.tar.gz;downloadfilename=pyasn1-0.6.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyasn1: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1: PV changed from "0.6.3" to "0.6.4"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PV changed from "0.6.3" to "0.6.4"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dev: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dev: PV changed from "0.6.3" to "0.6.4"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-doc: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-doc: PV changed from "0.6.3" to "0.6.4"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-locale: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-locale: PV changed from "0.6.3" to "0.6.4"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGSIZE changed from 334694 to 342710 (+2%)
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PV changed from "0.6.3" to "0.6.4"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-src: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-src: PV changed from "0.6.3" to "0.6.4"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PV changed from "0.6.3" to "0.6.4"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PKGV changed from 0.6.3 [default] to 0.6.4 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PKGSIZE changed from 830153 to 832755 (+0%)
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PV changed from "0.6.3" to "0.6.4"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info -> /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info moved to /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info

--===============7465774620360622730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info -> /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info moved to /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info

--===============7465774620360622730==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyasn1-upgrade-0.6.3-0.6.4.patch"

RnJvbSAzMGQ1MTE5OTc3MzA0ZmNkNWE2M2RiNDczYTdiMTE1Nzc0NWQ1ZDE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOSBKdWwgMjAyNiAwNToyOToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlhc24xOiB1cGdyYWRlIDAuNi4zIC0+IDAuNi40CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHlhc24xXzAuNi4zLmJiID0+IHB5dGhvbjMtcHlhc24xXzAuNi40LmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlhc24xXzAuNi4zLmJiID0+IHB5
dGhvbjMtcHlhc24xXzAuNi40LmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFfMC42LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNi40LmJiCnNpbWlsYXJpdHkgaW5kZXggODIl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFf
MC42LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eWFzbjFfMC42LjQuYmIKaW5kZXggZmI1NzJkOWRhNC4uMWM5ZjNlYjY3MCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjYuMy5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNi40LmJiCkBA
IC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vcHlhc24xLnNvdXJjZWZvcmdlLm5ldC8i
CiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0UucnN0O21kNT0xOTBmNzkyNTM5MDhjOTg2ZTZjYWNmMzgwYzNhNWY2ZCIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjY5N2E4ZWNkNmQ5ODg5MTE4OTE4NGNhMWZhMDVkMWJiMDBlMmY4NGI1
OTc3YzQ4MTQ1MjA1MDU0OWM4YTcyY2YiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWM0NDdkODQz
MWM5NDdmZTRjOGZlYmM0ZWQ5ZTc2MGJjMjkwMTFhNWIwMWU1Yzc0YjY3MDI1YmQ5ZmI4Y2U4MSIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9u
LXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============7465774620360622730==--

