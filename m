Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D3DC48BC3
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:00 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.88287.1705340030380468216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d8/Pq2NA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GpdDULAm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d0e2fcb40-7d7741d4-e7cb-48d5-b753-17fb578bbe87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A0OahbtsP0ihlaemEYOb4GUbLGrGN2fY7KdKx4iTFKI=;
	b=d8/Pq2NAMfExvVyESERFPJd5IBZkFqrvlc6bSOi0p/FZqJuLqABB8IbxW6c3zZIQ
	oaHKf+RrdGeG27AqUTT28+CGEzRG9jWqaMXkYgcGdVDiyr1zdFlE1olWsk9lbr91dn1
	ELX1EUCHtM7WD10u7ExA2/i8KJrYO59eWk/Nmyt8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A0OahbtsP0ihlaemEYOb4GUbLGrGN2fY7KdKx4iTFKI=;
	b=GpdDULAmqXWKYlZajjf9Q2sYdbtZRsXrloujZVh5aR/PTDw7RNA8j3vbbgJ2CpcF
	2usTDH/Gsj1vYpX9SPKWIxEpYLfm3LbxVrI4wBcIt35N6un9nAVwG6/LSLlH9QhWuTK
	hssT9V/G3ZPv7Wn4KPb3Lr3M71Dxaj+hlX1ehIYc=
Content-Type: multipart/mixed; boundary="===============1593861721796787528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-qthelp: upgrading to 1.0.7 SUCCEEDED
Message-ID: <0101018d0e2fcb40-7d7741d4-e7cb-48d5-b753-17fb578bbe87-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193735

--===============1593861721796787528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-qthelp* to *1.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-qthelp-upgrade-1.0.6-1.0.7.patch
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
From e6d9b0a10d3034e45156d590812f52d0ca4e680f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 08:12:25 +0000
Subject: [PATCH] python3-sphinxcontrib-qthelp: upgrade 1.0.6 -> 1.0.7

---
 ...ib-qthelp_1.0.6.bb => python3-sphinxcontrib-qthelp_1.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-qthelp_1.0.6.bb => python3-sphinxcontrib-qthelp_1.0.7.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
index 3538b063d6..b24f7f8e6f 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f7a83b72ea86d04827575ec0b63430eb"
 
-SRC_URI[sha256sum] = "62b9d1a186ab7f5ee3356d906f648cacb7a6bdb94d201ee7adf26db55092982d"
+SRC_URI[sha256sum] = "053dedc38823a80a7209a80860b16b722e9e0209e32fea98c90e4e6624588ed6"
 
 PYPI_PACKAGE = "sphinxcontrib-qthelp"
 
-- 
2.42.0


--===============1593861721796787528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp (sysroot):
  /usr/lib/python3.11/site-packages/sphinxcontrib_qthelp-1.0.6.dist-info moved to /usr/lib/python3.11/site-packages/sphinxcontrib_qthelp-1.0.7.dist-info

--===============1593861721796787528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-qthelp/sphinxcontrib_qthelp-1.0.6.tar.gz;downloadfilename=sphinxcontrib_qthelp-1.0.6.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-qthelp/sphinxcontrib_qthelp-1.0.7.tar.gz;downloadfilename=sphinxcontrib_qthelp-1.0.7.tar.gz"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-dbg: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-dbg: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-dev: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-dev: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-doc: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-doc: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-locale: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-locale: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-src: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-src: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-staticdev: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp-staticdev: PV changed from "1.0.6" to "1.0.7"
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp: PKGSIZE changed from 161351 to 161515 (+0%)
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp/python3-sphinxcontrib-qthelp: PV changed from "1.0.6" to "1.0.7"
Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-qthelp (sysroot):
  /usr/lib/python3.11/site-packages/sphinxcontrib_qthelp-1.0.6.dist-info moved to /usr/lib/python3.11/site-packages/sphinxcontrib_qthelp-1.0.7.dist-info

--===============1593861721796787528==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-qthelp-upgrade-1.0.6-1.0.7.patch"

RnJvbSBlNmQ5YjBhMTBkMzAzNGU0NTE1NmQ1OTA4MTJmNTJkMGNhNGU2ODBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDg6MTI6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueGNvbnRyaWItcXRoZWxwOiB1cGdyYWRlIDEuMC42IC0+IDEuMC43CgotLS0K
IC4uLmliLXF0aGVscF8xLjAuNi5iYiA9PiBweXRob24zLXNwaGlueGNvbnRyaWItcXRoZWxwXzEu
MC43LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54
Y29udHJpYi1xdGhlbHBfMS4wLjYuYmIgPT4gcHl0aG9uMy1zcGhpbnhjb250cmliLXF0aGVscF8x
LjAuNy5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc3BoaW54Y29udHJpYi1xdGhlbHBfMS4wLjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1xdGhlbHBfMS4wLjcuYmIKc2ltaWxh
cml0eSBpbmRleCA4MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNwaGlueGNvbnRyaWItcXRoZWxwXzEuMC42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1xdGhlbHBfMS4wLjcuYmIK
aW5kZXggMzUzOGIwNjNkNi4uYjI0ZjdmOGU2ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItcXRoZWxwXzEuMC42LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLXF0aGVs
cF8xLjAuNy5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2JhYmVsLmVkZ2V3
YWxsLm9yZy8iCiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PWY3YTgzYjcyZWE4NmQwNDgyNzU3NWVjMGI2MzQzMGViIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNjJiOWQxYTE4NmFiN2Y1ZWUzMzU2ZDkwNmY2NDhjYWNiN2E2
YmRiOTRkMjAxZWU3YWRmMjZkYjU1MDkyOTgyZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwNTNk
ZWRjMzg4MjNhODBhNzIwOWE4MDg2MGIxNmI3MjJlOWUwMjA5ZTMyZmVhOThjOTBlNGU2NjI0NTg4
ZWQ2IgogCiBQWVBJX1BBQ0tBR0UgPSAic3BoaW54Y29udHJpYi1xdGhlbHAiCiAKLS0gCjIuNDIu
MAoK

--===============1593861721796787528==--

