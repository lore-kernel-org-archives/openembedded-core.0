Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A95C30630
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.173811.1692224345044631087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IIUV2mVq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HCtA1pIS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a006e50a5-765b6e31-2c4f-45d3-be6f-360655681263-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZDtZYBbHteNzQ3lrFWIl3qJxriH6xYOY76Nb7nGXGgg=;
	b=IIUV2mVquHRxA0vBt76IvW4Szjwv5MtundyLKOyor50kmgyfGtwu2XiGHxNGMsaZ
	hmndp5LUn5QdoG3qR+VinBRiCnQ0oOXQ++h0JDWKzgHSNhefIRCtbgR61n+qLYBHTcC
	ueX7l+jiR7AKKr8GYZCfFWoRw1WloH80sKfKWJfQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZDtZYBbHteNzQ3lrFWIl3qJxriH6xYOY76Nb7nGXGgg=;
	b=HCtA1pISY/G1nOXraQtl94ZDibUQVAdqVnNQ9r87GBcCLfnJ62TAQoxywJMUJBWT
	2/TMTv71yAuqbeDUcvp8bwZyf+FFS1LdAWYimST2QZxKuuU11qrbXqHWI+1aD2o+o0x
	0qoRtFXJ0KWwiLJ9ng9BR92StHK7jsuSUDwoWB1Y=
Content-Type: multipart/mixed; boundary="===============2584604203902484509=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.16.1 SUCCEEDED
Message-ID: <0101018a006e50a5-765b6e31-2c4f-45d3-be6f-360655681263-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186185

--===============2584604203902484509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygments* to *2.16.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.15.1-2.16.1.patch
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
From 3d076546b7e5f2b6fe92f9d1515cebc25f270f2c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 06:19:18 +0000
Subject: [PATCH] python3-pygments: upgrade 2.15.1 -> 2.16.1

---
 .../{python3-pygments_2.15.1.bb => python3-pygments_2.16.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.15.1.bb => python3-pygments_2.16.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.15.1.bb b/meta/recipes-devtools/python/python3-pygments_2.16.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.15.1.bb
rename to meta/recipes-devtools/python/python3-pygments_2.16.1.bb
index e0e477100e..240d01d0df 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.16.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_setuptools_build_meta
-SRC_URI[sha256sum] = "8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366be1a21e171d12775c"
+SRC_URI[sha256sum] = "1daff0494820c69bc8941e407aa20f577374ee88364ee10a98fdbe0aece96e29"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.39.2


--===============2584604203902484509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pygments: PV changed from "2.15.1" to "2.16.1"
packages/core2-32-poky-linux/python3-pygments: PKGV changed from 2.15.1 [default] to 2.16.1 [default]
packages/core2-32-poky-linux/python3-pygments: SRC_URI changed from "https://files.pythonhosted.org/packages/source/P/Pygments/Pygments-2.15.1.tar.gz;downloadfilename=Pygments-2.15.1.tar.gz" to "https://files.pythonhosted.org/packages/source/P/Pygments/Pygments-2.16.1.tar.gz;downloadfilename=Pygments-2.16.1.tar.gz"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.15.1" to "2.16.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.15.1 [default] to 2.16.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.15.1" to "2.16.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.15.1 [default] to 2.16.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.15.1" to "2.16.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.15.1 [default] to 2.16.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.15.1" to "2.16.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.15.1 [default] to 2.16.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.15.1" to "2.16.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.15.1 [default] to 2.16.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.15.1" to "2.16.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.15.1 [default] to 2.16.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PV changed from "2.15.1" to "2.16.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.15.1 [default] to 2.16.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Pygments-2.15.1.dist-info -> /usr/lib/python3.11/site-packages/Pygments-2.16.1.dist-info, added "/usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/yara.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/verifpal.py /usr/lib/python3.11/site-packages/pygments/lexers/bqn.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/verifpal.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/openscad.py /usr/lib/python3.11/site-packages/pygments/lexers/asn1.py /usr/lib/python3.11/site-packages/pygments/lexers/yara.py /usr/lib/python3.11/site-packages/pygments/styles/lightbulb.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/bqn.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/ptx.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/ptx.cpython-311.pyc /usr/lib/python3.11/site
 -packages/pygments/styles/__pycache__/lightbulb.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/graphql.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/dns.py /usr/lib/python3.11/site-packages/pygments/lexers/tls.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/dns.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/tls.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/openscad.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/blueprint.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/asn1.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/graphql.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/blueprint.cpython-311.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 7893381 to 8004461 (+1%)
Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.11/site-packages/Pygments-2.15.1.dist-info moved to /usr/lib/python3.11/site-packages/Pygments-2.16.1.dist-info
  /usr/lib/python3.11/site-packages/pygments/lexers/asn1.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/blueprint.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/bqn.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/dns.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/graphql.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/openscad.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/ptx.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/asn1.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/blueprint.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/bqn.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/dns.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/graphql.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/openscad.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/ptx.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/tls.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/verifpal.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/yara.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/tls.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/verifpal.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/yara.py was added
  /usr/lib/python3.11/site-packages/pygments/styles/lightbulb.py was added
  /usr/lib/python3.11/site-packages/pygments/styles/__pycache__/lightbulb.cpython-311.pyc was added

--===============2584604203902484509==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.15.1-2.16.1.patch"

RnJvbSAzZDA3NjU0NmI3ZTVmMmI2ZmU5MmY5ZDE1MTVjZWJjMjVmMjcwZjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDY6MTk6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z21lbnRzOiB1cGdyYWRlIDIuMTUuMSAtPiAyLjE2LjEKCi0tLQogLi4uL3tweXRo
b24zLXB5Z21lbnRzXzIuMTUuMS5iYiA9PiBweXRob24zLXB5Z21lbnRzXzIuMTYuMS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWdtZW50c18yLjE1LjEu
YmIgPT4gcHl0aG9uMy1weWdtZW50c18yLjE2LjEuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTUuMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdtZW50c18yLjE2LjEuYmIKc2lt
aWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Z21lbnRzXzIuMTUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTYuMS5iYgppbmRleCBlMGU0NzcxMDBlLi4y
NDBkMDFkMGRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlnbWVudHNfMi4xNS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWdtZW50c18yLjE2LjEuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiQlNE
LTItQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzZhMTNj
OTA1MTRlMjg5OWYxZWJhN2Y0MWMzZWU1OTIiCiAKIGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNf
YnVpbGRfbWV0YQotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhhY2U0ZDNjMWRkNDgxODk0YjIwMDVm
NTYwZWFkMGY5ZjE5ZWU2NGZlOTgzMzY2YmUxYTIxZTE3MWQxMjc3NWMiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMWRhZmYwNDk0ODIwYzY5YmM4OTQxZTQwN2FhMjBmNTc3Mzc0ZWU4ODM2NGVlMTBh
OThmZGJlMGFlY2U5NmUyOSIKIAogREVQRU5EUyArPSAiXAogICAgICAgICAgICAgJHtQWVRIT05f
UE59IFwKLS0gCjIuMzkuMgoK

--===============2584604203902484509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Pygments-2.15.1.dist-info -> /usr/lib/python3.11/site-packages/Pygments-2.16.1.dist-info, added "/usr/lib/python3.11/site-packages/pygments/lexers/graphql.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/asn1.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/ptx.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/dns.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/tls.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/verifpal.py /usr/lib/python3.11/site-packages/pygments/styles/__pycache__/lightbulb.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/openscad.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/ptx.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/yara.py /usr/lib/python3.11/site-packages
 /pygments/lexers/dns.py /usr/lib/python3.11/site-packages/pygments/lexers/asn1.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/yara.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/tls.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/graphql.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/blueprint.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/verifpal.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/bqn.py /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/blueprint.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/bqn.cpython-311.pyc /usr/lib/python3.11/site-packages/pygments/styles/lightbulb.py /usr/lib/python3.11/site-packages/pygments/lexers/openscad.py"
Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.11/site-packages/Pygments-2.15.1.dist-info moved to /usr/lib/python3.11/site-packages/Pygments-2.16.1.dist-info
  /usr/lib/python3.11/site-packages/pygments/lexers/asn1.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/blueprint.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/bqn.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/dns.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/graphql.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/openscad.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/ptx.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/asn1.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/blueprint.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/bqn.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/dns.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/graphql.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/openscad.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/ptx.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/tls.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/verifpal.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/__pycache__/yara.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pygments/lexers/tls.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/verifpal.py was added
  /usr/lib/python3.11/site-packages/pygments/lexers/yara.py was added
  /usr/lib/python3.11/site-packages/pygments/styles/lightbulb.py was added
  /usr/lib/python3.11/site-packages/pygments/styles/__pycache__/lightbulb.cpython-311.pyc was added

--===============2584604203902484509==--

