Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7988CD47CD3
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1472.1768526746499768659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Il5A79fQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fnGzNfnV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019bc46890ad-4f6fd6fc-1377-431c-9019-150c16f187ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=41qpvgz17jvSQ+QQbh0tK+6XQu+5GvjnmMKmnWp/yK8=;
	b=Il5A79fQQaFNYNvH7wAnN3lGv8sAjx9hSZBjCFwIWmETGByhZsNxFGvLZ/UJJGr1
	uP0xEDh6v9rtQeypo3StZam19MVHDxeDOzy5JbY5tn+9NR+XD+hy4Hhnp0toOHz85e5
	kwbI/mdE1E2wdjbdcQIE+XCyjfT2puCUSuW7ED2A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=41qpvgz17jvSQ+QQbh0tK+6XQu+5GvjnmMKmnWp/yK8=;
	b=fnGzNfnV5HtVmCUuHPOulcifDmk4w2ynOImo4IgTF1bD5kj4IuiYcK78wgIi+2Jg
	8GlPQglnFF72VL5YpL1ZgV2JCPr0V5dg6gGJLh3m2LuqjLM2Vb+Bzch7/x3oCXS3huZ
	D+n5yYl/aCOsp5EvRTDtL6FtbWeaylSfvkN2rJkE=
Content-Type: multipart/mixed; boundary="===============3678074391003641445=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.150.2 SUCCEEDED
Message-ID: <0101019bc46890ad-4f6fd6fc-1377-431c-9019-150c16f187ba-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229459

--===============3678074391003641445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.150.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.149.0-6.150.2.patch
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
From deba29517b4e3902b65b0390743495134faae65a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 20:50:46 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.149.0 -> 6.150.2

---
 ...hon3-hypothesis_6.149.0.bb => python3-hypothesis_6.150.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.149.0.bb => python3-hypothesis_6.150.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.150.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.150.2.bb
index 7f72029d23..53df016f6b 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.149.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.150.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "27afa07824fbb7785369dfae8e2574ec2ae0b1bdce50f3a327dfc069b79b0a44"
+SRC_URI[sha256sum] = "deb043c41c53eaf0955f4a08739c2a34c3d8040ee3d9a2da0aa5470122979f75"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============3678074391003641445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.149.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/hypothesis-6.150.2.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.149.0.dist-info -> /usr/lib/python3.13/site-packages/hypothesis-6.150.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.149.0.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.150.2.dist-info

--===============3678074391003641445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.149.0.tar.gz;downloadfilename=hypothesis-6.149.0.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.150.2.tar.gz;downloadfilename=hypothesis-6.150.2.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.149.0" to "6.150.2"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.149.0 [default] to 6.150.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.149.0" to "6.150.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.149.0 [default] to 6.150.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.149.0" to "6.150.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.149.0 [default] to 6.150.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.149.0" to "6.150.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.149.0 [default] to 6.150.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.149.0" to "6.150.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.149.0 [default] to 6.150.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.149.0" to "6.150.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.149.0 [default] to 6.150.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.149.0" to "6.150.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.149.0 [default] to 6.150.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.149.0" to "6.150.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.149.0 [default] to 6.150.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3616711 to 3624579 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.149.0" to "6.150.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.149.0.dist-info -> /usr/lib/python3.13/site-packages/hypothesis-6.150.2.dist-info, directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.149.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/hypothesis-6.150.2.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.149.0 [default] to 6.150.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.149.0.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.150.2.dist-info

--===============3678074391003641445==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.149.0-6.150.2.patch"

RnJvbSBkZWJhMjk1MTdiNGUzOTAyYjY1YjAzOTA3NDM0OTUxMzRmYWFlNjVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjA6NTA6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNDkuMCAtPiA2LjE1MC4yCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE0OS4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1MC4yLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE0OS4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1MC4yLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTQ5LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE1MC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTQ5LjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTUwLjIu
YmIKaW5kZXggN2Y3MjAyOWQyMy4uNTNkZjAxNmY2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNDkuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE1MC4yLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyN2FmYTA3ODI0ZmJiNzc4NTM2OWRmYWU4
ZTI1NzRlYzJhZTBiMWJkY2U1MGYzYTMyN2RmYzA2OWI3OWIwYTQ0IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImRlYjA0M2M0MWM1M2VhZjA5NTVmNGEwODczOWMyYTM0YzNkODA0MGVlM2Q5YTJkYTBh
YTU0NzAxMjI5NzlmNzUiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============3678074391003641445==--

