Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AC0C54E6A
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2092.1706810404757314788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HF6eEvdM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RbicYDSN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d65d3f2f3-a36561f2-d55c-442e-8198-89d59023c262-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UQW67cndcUVoH1WUvXWCr8pT9/ZUU4HeEWv/k0H8xdg=;
	b=HF6eEvdMfa9OHrdxjRKz6abq3ramSY351W9HK5ZUQ+9xIu+Gf2DSiT3HgV1BURWi
	pSgjWkG97ELMWxl4aNR9H/XwLz/Jw91HY8pPrscQDSpaBKC9/PJx9imkrwECX6laEQV
	DuTV6hdu74zwGjTvlEt01kwMGCB2aYSEPPcBazeY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UQW67cndcUVoH1WUvXWCr8pT9/ZUU4HeEWv/k0H8xdg=;
	b=RbicYDSNYpcgDUx5DGHEfHn8TtjDMRdRPchb6oAUIn7+/x4dZl1hYZrkhSH80Vvd
	5INVjpaB5G9VgsYDVilcV2sIRALk1fjSlSlFNIgjvjVPBuuElP6KGQFbuz+9TWsz3br
	uDmFpMScDL3ECa2W90fB3sGkx5jDGkE9FB989jUo=
Content-Type: multipart/mixed; boundary="===============0669848568191458292=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-devhelp: upgrading to 1.0.6 SUCCEEDED
Message-ID: <0101018d65d3f2f3-a36561f2-d55c-442e-8198-89d59023c262-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194636

--===============0669848568191458292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-devhelp* to *1.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-devhelp-upgrade-1.0.5-1.0.6.patch
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
From 7d1ace644439d5f0508e25652f9e3639354dc487 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 08:26:38 +0000
Subject: [PATCH] python3-sphinxcontrib-devhelp: upgrade 1.0.5 -> 1.0.6

---
 ...-devhelp_1.0.5.bb => python3-sphinxcontrib-devhelp_1.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-devhelp_1.0.5.bb => python3-sphinxcontrib-devhelp_1.0.6.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
index 47934bd6f5..dd7ba3dc95 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd30d9972a142c857a80c9f312e92b93"
 
-SRC_URI[sha256sum] = "63b41e0d38207ca40ebbeabcf4d8e51f76c03e78cd61abe118cf4435c73d4212"
+SRC_URI[sha256sum] = "9893fd3f90506bc4b97bdb977ceb8fbd823989f4316b28c3841ec128544372d3"
 
 PYPI_PACKAGE = "sphinxcontrib-devhelp"
 
-- 
2.42.0


--===============0669848568191458292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp (sysroot):
  /usr/lib/python3.12/site-packages/sphinxcontrib_devhelp-1.0.5.dist-info moved to /usr/lib/python3.12/site-packages/sphinxcontrib_devhelp-1.0.6.dist-info

--===============0669848568191458292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib_devhelp-1.0.5.tar.gz;downloadfilename=sphinxcontrib_devhelp-1.0.5.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib_devhelp-1.0.6.tar.gz;downloadfilename=sphinxcontrib_devhelp-1.0.6.tar.gz"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-dbg: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-dbg: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-dev: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-dev: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-doc: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-doc: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-locale: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-locale: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-src: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-src: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-staticdev: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-staticdev: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp: PKGSIZE changed from 125538 to 125686 (+0%)
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp (sysroot):
  /usr/lib/python3.12/site-packages/sphinxcontrib_devhelp-1.0.5.dist-info moved to /usr/lib/python3.12/site-packages/sphinxcontrib_devhelp-1.0.6.dist-info

--===============0669848568191458292==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-devhelp-upgrade-1.0.5-1.0.6.patch"

RnJvbSA3ZDFhY2U2NDQ0MzlkNWYwNTA4ZTI1NjUyZjllMzYzOTM1NGRjNDg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwODoyNjozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54Y29udHJpYi1kZXZoZWxwOiB1cGdyYWRlIDEuMC41IC0+IDEuMC42CgotLS0K
IC4uLi1kZXZoZWxwXzEuMC41LmJiID0+IHB5dGhvbjMtc3BoaW54Y29udHJpYi1kZXZoZWxwXzEu
MC42LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54
Y29udHJpYi1kZXZoZWxwXzEuMC41LmJiID0+IHB5dGhvbjMtc3BoaW54Y29udHJpYi1kZXZoZWxw
XzEuMC42LmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1zcGhpbnhjb250cmliLWRldmhlbHBfMS4wLjUuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1kZXZoZWxwXzEuMC42LmJiCnNp
bWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1zcGhpbnhjb250cmliLWRldmhlbHBfMS4wLjUuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWRldmhlbHBfMS4w
LjYuYmIKaW5kZXggNDc5MzRiZDZmNS4uZGQ3YmEzZGM5NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItZGV2aGVscF8xLjAuNS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJp
Yi1kZXZoZWxwXzEuMC42LmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3d3
dy5zcGhpbngtZG9jLm9yZyIKIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZmQzMGQ5OTcyYTE0MmM4NTdhODBjOWYzMTJlOTJi
OTMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2M2I0MWUwZDM4MjA3Y2E0MGViYmVhYmNmNGQ4
ZTUxZjc2YzAzZTc4Y2Q2MWFiZTExOGNmNDQzNWM3M2Q0MjEyIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjk4OTNmZDNmOTA1MDZiYzRiOTdiZGI5NzdjZWI4ZmJkODIzOTg5ZjQzMTZiMjhjMzg0MWVj
MTI4NTQ0MzcyZDMiCiAKIFBZUElfUEFDS0FHRSA9ICJzcGhpbnhjb250cmliLWRldmhlbHAiCiAK
LS0gCjIuNDIuMAoK

--===============0669848568191458292==--

