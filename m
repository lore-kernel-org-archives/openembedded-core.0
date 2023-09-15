Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9714EEE26B
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.29680.1694804394134276405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MNlat9sG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Rhjyk5RX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a9a36bd9f-6e26890b-97c0-4829-8f10-c6f8c611c4dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z1XF1P7udxYHgbHwGesWeLOCTqIr9tPJKOvXUBffVU8=;
	b=MNlat9sGPMpyQO5JM/7EA383rbv/fyWp9rfIB3GBF1GRvHwYSB9ILA2cFVOn9xcM
	suZHEJXmuWyX4u5o4N6FwM+P74EV0y9tzo7IvWkbSjXqmBsRlJKyJXnbbEMaWE7nQe/
	2j+BtY3FBnzfmCeewA4WeunlQF3DONZ9C9LVYA7Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z1XF1P7udxYHgbHwGesWeLOCTqIr9tPJKOvXUBffVU8=;
	b=Rhjyk5RXRbDQMe0pTpnkbIymX6pN23RzrPisj+tTu2yu27s7LEbkQTGgAXYfEk0S
	M9jy0grdfmyKNfFrt30qAbivXSDuNkpFehnOoaVaKHwGbKlFhknRDsWUv95BGNK5MOL
	xyeHZQhk8VcuWbEWjVoEWzJIo2SShwtkJTIryD5I=
Content-Type: multipart/mixed; boundary="===============4737684877601661362=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-libarchive-c: upgrading to 5.0 SUCCEEDED
Message-ID: <0101018a9a36bd9f-6e26890b-97c0-4829-8f10-c6f8c611c4dd-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187711

--===============4737684877601661362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-libarchive-c* to *5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-libarchive-c-upgrade-4.0-5.0.patch
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
From d0893728b8532f23f144d7b2a29a7e07583f984e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 10:12:54 +0000
Subject: [PATCH] python3-libarchive-c: upgrade 4.0 -> 5.0

---
 ...{python3-libarchive-c_4.0.bb => python3-libarchive-c_5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_4.0.bb => python3-libarchive-c_5.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
index 3c6bc1e1ca..5ada76fbf4 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a5b41ade94ba58b198d778e68000f6b7de41da768de7140c984f71d7fa8416e5"
+SRC_URI[sha256sum] = "d673f56673d87ec740d1a328fa205cafad1d60f5daca4685594deb039d32b159"
 
 RDEPENDS:${PN} += "\
   libarchive \
-- 
2.39.2


--===============4737684877601661362==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-libarchive-c-upgrade-4.0-5.0.patch"

RnJvbSBkMDg5MzcyOGI4NTMyZjIzZjE0NGQ3YjJhMjlhN2UwNzU4M2Y5ODRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTA6MTI6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWxpYmFyY2hpdmUtYzogdXBncmFkZSA0LjAgLT4gNS4wCgotLS0KIC4uLntweXRob24z
LWxpYmFyY2hpdmUtY180LjAuYmIgPT4gcHl0aG9uMy1saWJhcmNoaXZlLWNfNS4wLmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbGliYXJjaGl2ZS1jXzQuMC5i
YiA9PiBweXRob24zLWxpYmFyY2hpdmUtY181LjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWxpYmFyY2hpdmUtY180LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGliYXJjaGl2ZS1jXzUuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtbGliYXJjaGl2ZS1jXzQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWxpYmFyY2hpdmUtY181LjAuYmIKaW5kZXggM2M2YmMxZTFj
YS4uNWFkYTc2ZmJmNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWxpYmFyY2hpdmUtY180LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWxpYmFyY2hpdmUtY181LjAuYmIKQEAgLTksNyArOSw3IEBAIFBZUElfUEFD
S0FHRSA9ICJsaWJhcmNoaXZlLWMiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYTViNDFhZGU5NGJhNThiMTk4ZDc3OGU2ODAwMGY2YjdkZTQxZGE3
NjhkZTcxNDBjOTg0ZjcxZDdmYTg0MTZlNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkNjczZjU2
NjczZDg3ZWM3NDBkMWEzMjhmYTIwNWNhZmFkMWQ2MGY1ZGFjYTQ2ODU1OTRkZWIwMzlkMzJiMTU5
IgogCiBSREVQRU5EUzoke1BOfSArPSAiXAogICBsaWJhcmNoaXZlIFwKLS0gCjIuMzkuMgoK

--===============4737684877601661362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-libarchive-c: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-4.0.tar.gz;downloadfilename=libarchive-c-4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.0.tar.gz;downloadfilename=libarchive-c-5.0.tar.gz"
packages/core2-32-poky-linux/python3-libarchive-c: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dbg: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dbg: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dev: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dev: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-doc: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-doc: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-locale: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-locale: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-src: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-src: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-staticdev: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-staticdev: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c: PKGSIZE changed from 120595 to 126818 (+5%)
Changes to packages/core2-32-poky-linux/python3-libarchive-c (sysroot):
  /usr/lib/python3.11/site-packages/libarchive_c-4.0.dist-info moved to /usr/lib/python3.11/site-packages/libarchive_c-5.0.dist-info

--===============4737684877601661362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-libarchive-c (sysroot):
  /usr/lib/python3.11/site-packages/libarchive_c-4.0.dist-info moved to /usr/lib/python3.11/site-packages/libarchive_c-5.0.dist-info

--===============4737684877601661362==--

