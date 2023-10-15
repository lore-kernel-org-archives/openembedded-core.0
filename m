Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954C9C04ABC
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.102707.1697399114626126905
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KbSuW7cU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kEBDP8Fw;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b34df0854-faa9f274-7a4a-4854-bb83-23835fa5d22a-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z0efdiw1l70WQrMdskiNZgxiECebO4dY3wkiYIkdUPw=;
	b=KbSuW7cUwuy+oFuCb4U142ZGT/xGZd1A8ayXC4arZ+u37LN2mVPIUWKSuYw0cKDQ
	SYreZ3kgYvrKJVR4f77Tce70ly+fLiIpt0gEeRNNcgq43CZuhdDwM5k7mk2DZ6IFmX/
	buF0KAZZ+OzKkIXVvCUuFp0BzfWvElBtAK3NhoKo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z0efdiw1l70WQrMdskiNZgxiECebO4dY3wkiYIkdUPw=;
	b=kEBDP8Fw/5AaYWy+e382o57KEi8rLWuJqmSuIANqR1FJwydgNM8OUjh57WbE2AOQ
	sGCv3oCkIaZK1k3VFreZ62x2LNXlty7hMF8To4GmPGGmh9fcdvtUSL7l+cV/jSqTxTQ
	q79RAJfahhCOvFzWPPD0/CiwqYS+6Rub8PKHGey0=
Content-Type: multipart/mixed; boundary="===============2022537484827765540=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-iso8601: upgrading to 2.1.0 SUCCEEDED
Message-ID: <0101018b34df0854-faa9f274-7a4a-4854-bb83-23835fa5d22a-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189189

--===============2022537484827765540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-iso8601* to *2.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-iso8601-upgrade-2.0.0-2.1.0.patch
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
From b002bbd33e7b98a56c9eb3aafc321b0a481d3410 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 11:12:45 +0000
Subject: [PATCH] python3-iso8601: upgrade 2.0.0 -> 2.1.0

---
 .../{python3-iso8601_2.0.0.bb => python3-iso8601_2.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-iso8601_2.0.0.bb => python3-iso8601_2.1.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb b/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-iso8601_2.0.0.bb
rename to meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
index a8dccb90c7..40ca5177be 100644
--- a/meta/recipes-devtools/python/python3-iso8601_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyiso8601.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aab31f2ef7ba214a5a341eaa47a7f367"
 
-SRC_URI[sha256sum] = "739960d37c74c77bd9bd546a76562ccb581fe3d4820ff5c3141eb49c839fda8f"
+SRC_URI[sha256sum] = "6b1d3829ee8921c4301998c909f7829fa9ed3cbdac0d3b16af2d743aed1ba8df"
 
 inherit pypi python_poetry_core
 
-- 
2.39.2


--===============2022537484827765540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-iso8601 (sysroot):
  /usr/lib/python3.11/site-packages/iso8601-2.0.0.dist-info moved to /usr/lib/python3.11/site-packages/iso8601-2.1.0.dist-info

--===============2022537484827765540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-iso8601: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/iso8601/iso8601-2.0.0.tar.gz;downloadfilename=iso8601-2.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/iso8601/iso8601-2.1.0.tar.gz;downloadfilename=iso8601-2.1.0.tar.gz"
packages/core2-32-poky-linux/python3-iso8601: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601: PV changed from "2.0.0" to "2.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dbg: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dbg: PV changed from "2.0.0" to "2.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dev: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dev: PV changed from "2.0.0" to "2.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-doc: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-doc: PV changed from "2.0.0" to "2.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-locale: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-locale: PV changed from "2.0.0" to "2.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-src: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-src: PV changed from "2.0.0" to "2.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-staticdev: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-staticdev: PV changed from "2.0.0" to "2.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PKGSIZE changed from 40428 to 40478 (+0%)
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PV changed from "2.0.0" to "2.1.0"
Changes to packages/core2-32-poky-linux/python3-iso8601 (sysroot):
  /usr/lib/python3.11/site-packages/iso8601-2.0.0.dist-info moved to /usr/lib/python3.11/site-packages/iso8601-2.1.0.dist-info

--===============2022537484827765540==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-iso8601-upgrade-2.0.0-2.1.0.patch"

RnJvbSBiMDAyYmJkMzNlN2I5OGE1NmM5ZWIzYWFmYzMyMWIwYTQ4MWQzNDEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTE6MTI6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWlzbzg2MDE6IHVwZ3JhZGUgMi4wLjAgLT4gMi4xLjAKCi0tLQogLi4uL3tweXRob24z
LWlzbzg2MDFfMi4wLjAuYmIgPT4gcHl0aG9uMy1pc284NjAxXzIuMS4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1pc284NjAxXzIuMC4wLmJiID0+
IHB5dGhvbjMtaXNvODYwMV8yLjEuMC5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvODYwMV8yLjAuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pc284NjAxXzIuMS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1p
c284NjAxXzIuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtaXNvODYwMV8yLjEuMC5iYgppbmRleCBhOGRjY2I5MGM3Li40MGNhNTE3N2JlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvODYwMV8yLjAu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvODYwMV8y
LjEuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3B5aXNvODYwMS5yZWFk
dGhlZG9jcy5vcmcvIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT1hYWIzMWYyZWY3YmEyMTRhNWEzNDFlYWE0N2E3ZjM2NyIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjczOTk2MGQzN2M3NGM3N2JkOWJkNTQ2YTc2NTYyY2NiNTgxZmUzZDQ4
MjBmZjVjMzE0MWViNDljODM5ZmRhOGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmIxZDM4Mjll
ZTg5MjFjNDMwMTk5OGM5MDlmNzgyOWZhOWVkM2NiZGFjMGQzYjE2YWYyZDc0M2FlZDFiYThkZiIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9wb2V0cnlfY29yZQogCi0tIAoyLjM5LjIKCg==

--===============2022537484827765540==--

