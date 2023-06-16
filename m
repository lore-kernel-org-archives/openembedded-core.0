Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC9DC16B13
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.822.1686887483215210538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IDHKynL8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c2544501-359b97c5-1086-45c2-b529-35586bfc5645-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ka/+wrGlJ8F3jMPB/vYdXAAPm5hIZ6Ex9HzqpmKvL3E=;
	b=IDHKynL8ipR5TtRuxHuMyqs/HR4cmHIxkseJ1M07ioO/vNwS/dkTQrt2/ZEGu5o3
	17puuzHK4bj5y850SyfCM026N/NcPA0zJarlIs+wNKA3ETW5MCHylbRZo1eHG+Zwyl5
	bFvQl/YzdtmFPxI22CMwg6J6vrQoWPQFoEJHJhsY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ka/+wrGlJ8F3jMPB/vYdXAAPm5hIZ6Ex9HzqpmKvL3E=;
	b=eK2SnsNkp3jMfJzw8t5G9cii3RR2pcvr9IOBpTWQgpQB8TGhOD3qccjy25PiVo2Z
	orH5phDWu+Bxe2Wf/5M0vic2DVImX8sJ9INI4r30NarY+bUlJ0GV/RynIyUfdBy/56C
	WrALGEv3Y5CtU0g4YjniTljGDK50RgWGgEgb9nrA=
Content-Type: multipart/mixed; boundary="===============2831787110470653810=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-iso8601: upgrading to 2.0.0 SUCCEEDED
Message-ID: <01010188c2544501-359b97c5-1086-45c2-b529-35586bfc5645-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182914

--===============2831787110470653810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-iso8601* to *2.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-iso8601-upgrade-1.1.0-2.0.0.patch
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
From 1f17962b68384d42e0acd66c77e21ef44cdf0e6b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 13:25:52 +0000
Subject: [PATCH] python3-iso8601: upgrade 1.1.0 -> 2.0.0

---
 .../{python3-iso8601_1.1.0.bb => python3-iso8601_2.0.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-iso8601_1.1.0.bb => python3-iso8601_2.0.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb b/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-iso8601_1.1.0.bb
rename to meta/recipes-devtools/python/python3-iso8601_2.0.0.bb
index 797607f81e..a8dccb90c7 100644
--- a/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb
+++ b/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyiso8601.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aab31f2ef7ba214a5a341eaa47a7f367"
 
-SRC_URI[sha256sum] = "32811e7b81deee2063ea6d2e94f8819a86d1f3811e49d23623a41fa832bef03f"
+SRC_URI[sha256sum] = "739960d37c74c77bd9bd546a76562ccb581fe3d4820ff5c3141eb49c839fda8f"
 
 inherit pypi python_poetry_core
 
-- 
2.39.2


--===============2831787110470653810==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-iso8601-upgrade-1.1.0-2.0.0.patch"

RnJvbSAxZjE3OTYyYjY4Mzg0ZDQyZTBhY2Q2NmM3N2UyMWVmNDRjZGYwZTZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTM6MjU6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWlzbzg2MDE6IHVwZ3JhZGUgMS4xLjAgLT4gMi4wLjAKCi0tLQogLi4uL3tweXRob24z
LWlzbzg2MDFfMS4xLjAuYmIgPT4gcHl0aG9uMy1pc284NjAxXzIuMC4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1pc284NjAxXzEuMS4wLmJiID0+
IHB5dGhvbjMtaXNvODYwMV8yLjAuMC5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvODYwMV8xLjEuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pc284NjAxXzIuMC4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1p
c284NjAxXzEuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtaXNvODYwMV8yLjAuMC5iYgppbmRleCA3OTc2MDdmODFlLi5hOGRjY2I5MGM3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvODYwMV8xLjEu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvODYwMV8y
LjAuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3B5aXNvODYwMS5yZWFk
dGhlZG9jcy5vcmcvIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT1hYWIzMWYyZWY3YmEyMTRhNWEzNDFlYWE0N2E3ZjM2NyIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjMyODExZTdiODFkZWVlMjA2M2VhNmQyZTk0Zjg4MTlhODZkMWYzODEx
ZTQ5ZDIzNjIzYTQxZmE4MzJiZWYwM2YiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzM5OTYwZDM3
Yzc0Yzc3YmQ5YmQ1NDZhNzY1NjJjY2I1ODFmZTNkNDgyMGZmNWMzMTQxZWI0OWM4MzlmZGE4ZiIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9wb2V0cnlfY29yZQogCi0tIAoyLjM5LjIKCg==

--===============2831787110470653810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-iso8601: PV changed from "1.1.0" to "2.0.0"
packages/core2-32-poky-linux/python3-iso8601: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/iso8601/iso8601-1.1.0.tar.gz;downloadfilename=iso8601-1.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/iso8601/iso8601-2.0.0.tar.gz;downloadfilename=iso8601-2.0.0.tar.gz"
packages/core2-32-poky-linux/python3-iso8601: PKGV changed from 1.1.0 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dbg: PV changed from "1.1.0" to "2.0.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dbg: PKGV changed from 1.1.0 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dev: PV changed from "1.1.0" to "2.0.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dev: PKGV changed from 1.1.0 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-doc: PV changed from "1.1.0" to "2.0.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-doc: PKGV changed from 1.1.0 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-locale: PV changed from "1.1.0" to "2.0.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-locale: PKGV changed from 1.1.0 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-src: PV changed from "1.1.0" to "2.0.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-src: PKGV changed from 1.1.0 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-staticdev: PV changed from "1.1.0" to "2.0.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-staticdev: PKGV changed from 1.1.0 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PV changed from "1.1.0" to "2.0.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PKGSIZE changed from 46470 to 40428 (-13%)
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PKGV changed from 1.1.0 [default] to 2.0.0 [default]
Changes to packages/core2-32-poky-linux/python3-iso8601 (sysroot):
  /usr/lib/python3.11/site-packages/iso8601-1.1.0.dist-info moved to /usr/lib/python3.11/site-packages/iso8601-2.0.0.dist-info

--===============2831787110470653810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PKGSIZE changed from 46470 to 40428 (-13%)
Changes to packages/core2-32-poky-linux/python3-iso8601 (sysroot):
  /usr/lib/python3.11/site-packages/iso8601-1.1.0.dist-info moved to /usr/lib/python3.11/site-packages/iso8601-2.0.0.dist-info

--===============2831787110470653810==--

