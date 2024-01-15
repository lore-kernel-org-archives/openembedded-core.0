Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030BFC48BF3
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.88840.1705340029293973474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A3CksKJQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qi1ggkAB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d0e2fcb5e-17c7719f-dda8-4ac5-991b-08c0a11d4a15-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jMlYy3Y5VO0D3po/f12HYk9bZvClWVlxtiqRQ0z3ciw=;
	b=A3CksKJQa0PQVTtq7lEFzYclLg3MGN6Na6cMB89kKcPL3km5lWzXghTzm1E4nKQh
	7LZRo9pC3fqwyUGdONm0sVRQLPGSLYkbdeefw88FRzO+Vd3cM1boeR3HnIBI1+i1Euu
	FyePiOMY+9pP1kYdYEND5yPgiLzyRwqVNUXITBkY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jMlYy3Y5VO0D3po/f12HYk9bZvClWVlxtiqRQ0z3ciw=;
	b=qi1ggkABj8I6tRCVemPjeyJdh+aw1SD4LB4i+DFUHU8w2cMi7EURqki0FsTqdQLM
	M3P6SilBx7mn0qaJd743BCifqKte2EODtVIW2MQ1Uo6rHVYUY7yVP0OIszL105zt1J/
	EokXf3dYKTeao6FOpUpowexw9ylKzo+ee6YAqAUE=
Content-Type: multipart/mixed; boundary="===============0667457586336021817=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-serializinghtml: upgrading to 1.1.10
 SUCCEEDED
Message-ID: <0101018d0e2fcb5e-17c7719f-dda8-4ac5-991b-08c0a11d4a15-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193725

--===============0667457586336021817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-serializinghtml* to *1.1.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-serializinghtml-upgrade-1.1.9-.patch
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
From e548ead8de1a549d047c7481042975f4c6b97a47 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 08:15:33 +0000
Subject: [PATCH] python3-sphinxcontrib-serializinghtml: upgrade 1.1.9 ->
 1.1.10

---
 ...1.1.9.bb => python3-sphinxcontrib-serializinghtml_1.1.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-serializinghtml_1.1.9.bb => python3-sphinxcontrib-serializinghtml_1.1.10.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb
index fbf0c3c9b2..b13bc82977 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=32a84ac5cd3bbd10c4d479233ad588b6"
 
-SRC_URI[sha256sum] = "0c64ff898339e1fac29abd2bf5f11078f3ec413cfe9c046d3120d7ca65530b54"
+SRC_URI[sha256sum] = "93f3f5dc458b91b192fe10c397e324f262cf163d79f3282c158e8436a2c4511f"
 
 PYPI_PACKAGE = "sphinxcontrib-serializinghtml"
 
-- 
2.42.0


--===============0667457586336021817==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-serializinghtml-upgrade-1.1.9-.patch"

RnJvbSBlNTQ4ZWFkOGRlMWE1NDlkMDQ3Yzc0ODEwNDI5NzVmNGM2Yjk3YTQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDg6MTU6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueGNvbnRyaWItc2VyaWFsaXppbmdodG1sOiB1cGdyYWRlIDEuMS45IC0+CiAx
LjEuMTAKCi0tLQogLi4uMS4xLjkuYmIgPT4gcHl0aG9uMy1zcGhpbnhjb250cmliLXNlcmlhbGl6
aW5naHRtbF8xLjEuMTAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy1zcGhpbnhjb250cmliLXNlcmlhbGl6aW5naHRtbF8xLjEuOS5iYiA9PiBweXRob24zLXNw
aGlueGNvbnRyaWItc2VyaWFsaXppbmdodG1sXzEuMS4xMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1zZXJp
YWxpemluZ2h0bWxfMS4xLjkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc3BoaW54Y29udHJpYi1zZXJpYWxpemluZ2h0bWxfMS4xLjEwLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
cGhpbnhjb250cmliLXNlcmlhbGl6aW5naHRtbF8xLjEuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItc2VyaWFsaXppbmdodG1s
XzEuMS4xMC5iYgppbmRleCBmYmYwYzNjOWIyLi5iMTNiYzgyOTc3IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1zZXJpYWxpemlu
Z2h0bWxfMS4xLjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNwaGlueGNvbnRyaWItc2VyaWFsaXppbmdodG1sXzEuMS4xMC5iYgpAQCAtMyw3ICszLDcgQEAg
SE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cuc3BoaW54LWRvYy5vcmciCiBMSUNFTlNFID0gIkJTRC0y
LUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTMyYTg0YWM1
Y2QzYmJkMTBjNGQ0NzkyMzNhZDU4OGI2IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGM2NGZm
ODk4MzM5ZTFmYWMyOWFiZDJiZjVmMTEwNzhmM2VjNDEzY2ZlOWMwNDZkMzEyMGQ3Y2E2NTUzMGI1
NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5M2YzZjVkYzQ1OGI5MWIxOTJmZTEwYzM5N2UzMjRm
MjYyY2YxNjNkNzlmMzI4MmMxNThlODQzNmEyYzQ1MTFmIgogCiBQWVBJX1BBQ0tBR0UgPSAic3Bo
aW54Y29udHJpYi1zZXJpYWxpemluZ2h0bWwiCiAKLS0gCjIuNDIuMAoK

--===============0667457586336021817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml (sysroot):
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info was added
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info was removed
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/WHEEL was removed

--===============0667457586336021817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-serializinghtml/sphinxcontrib_serializinghtml-1.1.9.tar.gz;downloadfilename=sphinxcontrib_serializinghtml-1.1.9.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-serializinghtml/sphinxcontrib_serializinghtml-1.1.10.tar.gz;downloadfilename=sphinxcontrib_serializinghtml-1.1.10.tar.gz"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-dbg: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-dbg: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-dev: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-dev: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-doc: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-doc: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-locale: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-locale: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-src: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-src: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-staticdev: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml-staticdev: PV changed from "1.1.9" to "1.1.10"
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml: PKGV changed from 1.1.9 [default] to 1.1.10 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml: PKGSIZE changed from 134276 to 134448 (+0%)
packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml/python3-sphinxcontrib-serializinghtml: PV changed from "1.1.9" to "1.1.10"
Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-serializinghtml (sysroot):
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info was added
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.10.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info was removed
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/sphinxcontrib_serializinghtml-1.1.9.dist-info/WHEEL was removed

--===============0667457586336021817==--

