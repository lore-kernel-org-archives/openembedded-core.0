Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47130D60072
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.4683.1731964636771888298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=K1YWVnqR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=M4y0uJjP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019341230c35-87f7779e-4596-45a3-870c-9058b31d27c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O5CJKqfxyVCMYDYZ2/JHI+l7HfZBnY6VgD0sP17argc=;
	b=K1YWVnqRT2KWyIyQCoemVXHO9VzFbceVYPSFTIPRTKRhthjk5u1iEB02GkzVp40l
	GVBG9bjBfZLWbO90zBezsa9eXlIWTZ0baidzI32PPLK845Jd/5+1A0SLDk5EwTIhnx3
	Vqgyl7fKr7MnObP4ZBVwcKje2kxmXWllVJdcfTiU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O5CJKqfxyVCMYDYZ2/JHI+l7HfZBnY6VgD0sP17argc=;
	b=M4y0uJjP3XLbe8bGJ6AWYo/0fEUcN91kEsu7tp5Dc7EF+pVZeIQpqWF/Bql211z7
	MDt7jSiuxgaNG2fwKFaEiBrMaTbAMvUqrnl0VVTfxJ+DDOb1DLCRpao8m2uKYf0ImkB
	iyOaS+YsEXQFDHdsmgcBSnFrXeJ3/FB8N/fx9CgM=
Content-Type: multipart/mixed; boundary="===============5427371452332294398=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-psutil: upgrading to 6.1.0 SUCCEEDED
Message-ID: <0101019341230c35-87f7779e-4596-45a3-870c-9058b31d27c1-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207290

--===============5427371452332294398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-psutil* to *6.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-psutil-upgrade-6.0.0-6.1.0.patch
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
From f3f2523469e94331a269aa1696970378c0929321 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 01:39:40 +0000
Subject: [PATCH] python3-psutil: upgrade 6.0.0 -> 6.1.0

---
 .../python/{python3-psutil_6.0.0.bb => python3-psutil_6.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_6.0.0.bb => python3-psutil_6.1.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_6.0.0.bb b/meta/recipes-devtools/python/python3-psutil_6.1.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_6.0.0.bb
rename to meta/recipes-devtools/python/python3-psutil_6.1.0.bb
index 787bc61e89..bbff7f3fe5 100644
--- a/meta/recipes-devtools/python/python3-psutil_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-psutil_6.1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "8faae4f310b6d969fa26ca0545338b21f73c6b15db7c4a8d934a5482faa818f2"
+SRC_URI[sha256sum] = "353815f59a7f64cdaca1c0307ee13558a0512f6db064e92fe833784f08539c7a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.44.1


--===============5427371452332294398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-psutil/python3-psutil-tests: FILELIST: removed "/usr/lib/python3.13/site-packages/psutil/tests/__pycache__/runner.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/runner.py"
Changes to packages/core2-64-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.13/site-packages/psutil-6.0.0.dist-info moved to /usr/lib/python3.13/site-packages/psutil-6.1.0.dist-info
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/runner.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/runner.py was removed

--===============5427371452332294398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-psutil: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/psutil/psutil-6.0.0.tar.gz;downloadfilename=psutil-6.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/psutil/psutil-6.1.0.tar.gz;downloadfilename=psutil-6.1.0.tar.gz"
packages/core2-64-poky-linux/python3-psutil: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-64-poky-linux/python3-psutil: PV changed from "6.0.0" to "6.1.0"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-dbg: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-dbg: PKGSIZE changed from 129744 to 129776 (+0%)
packages/core2-64-poky-linux/python3-psutil/python3-psutil-dbg: PV changed from "6.0.0" to "6.1.0"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-dev: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-dev: PV changed from "6.0.0" to "6.1.0"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-doc: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-doc: PV changed from "6.0.0" to "6.1.0"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-locale: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-locale: PV changed from "6.0.0" to "6.1.0"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-src: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-src: PKGSIZE changed from 65320 to 65543 (+0%)
packages/core2-64-poky-linux/python3-psutil/python3-psutil-src: PV changed from "6.0.0" to "6.1.0"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-staticdev: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-staticdev: PV changed from "6.0.0" to "6.1.0"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-tests: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil-tests: PKGSIZE changed from 1276221 to 1243999 (-3%)
packages/core2-64-poky-linux/python3-psutil/python3-psutil-tests: PV changed from "6.0.0" to "6.1.0"
packages/core2-64-poky-linux/python3-psutil/python3-psutil-tests: FILELIST: removed "/usr/lib/python3.13/site-packages/psutil/tests/__pycache__/runner.cpython-313.pyc /usr/lib/python3.13/site-packages/psutil/tests/runner.py"
packages/core2-64-poky-linux/python3-psutil/python3-psutil: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-64-poky-linux/python3-psutil/python3-psutil: PKGSIZE changed from 840913 to 844005 (+0%)
packages/core2-64-poky-linux/python3-psutil/python3-psutil: PV changed from "6.0.0" to "6.1.0"
Changes to packages/core2-64-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.13/site-packages/psutil-6.0.0.dist-info moved to /usr/lib/python3.13/site-packages/psutil-6.1.0.dist-info
  /usr/lib/python3.13/site-packages/psutil/tests/__pycache__/runner.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/psutil/tests/runner.py was removed

--===============5427371452332294398==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-psutil-upgrade-6.0.0-6.1.0.patch"

RnJvbSBmM2YyNTIzNDY5ZTk0MzMxYTI2OWFhMTY5Njk3MDM3OGMwOTI5MzIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDE6Mzk6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBzdXRpbDogdXBncmFkZSA2LjAuMCAtPiA2LjEuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXBzdXRpbF82LjAuMC5iYiA9PiBweXRob24zLXBzdXRpbF82LjEuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBzdXRpbF82LjAuMC5iYiA9PiBw
eXRob24zLXBzdXRpbF82LjEuMC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzYuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF82LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkw
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGls
XzYuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHN1dGlsXzYuMS4wLmJiCmluZGV4IDc4N2JjNjFlODkuLmJiZmY3ZjNmZTUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxfNi4wLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF82LjEuMC5iYgpA
QCAtMyw3ICszLDcgQEAgTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT1hOWM3MjExM2E4NDNkMGQ3MzJhMGFjMWMyMDBkODFiMSIK
IEhPTUVQQUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9wc3V0aWwvIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiOGZhYWU0ZjMxMGI2ZDk2OWZhMjZjYTA1NDUzMzhiMjFmNzNjNmIxNWRi
N2M0YThkOTM0YTU0ODJmYWE4MThmMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzNTM4MTVmNTlh
N2Y2NGNkYWNhMWMwMzA3ZWUxMzU1OGEwNTEyZjZkYjA2NGU5MmZlODMzNzg0ZjA4NTM5YzdhIgog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0tIAoyLjQ0LjEK
Cg==

--===============5427371452332294398==--

