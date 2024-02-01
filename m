Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE6BC54E60
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2092.1706810404757314788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OG0kJzxJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PLoz3i4j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d65d3f325-8788f4fd-3057-41c6-8692-b97714c428ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t0nSvP4U4JgrdCp5tB8iPy4KOEiojFE333PnNa5CaOg=;
	b=OG0kJzxJ5I3DNvrazdcvBltKNXyRv9Pi3bPWtAFc7DTAnC76ZjkWul+ZSzkui6R6
	WS+kDhADEfEOBNveoS60a/wxLgLLuVBb/kaZ2FULgCqIP50ZmrMgmpb2gsOE5uNWvJO
	o+rdyWal6SNcRHTksusfR+jWOvXGhPhi7B/jaYGc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t0nSvP4U4JgrdCp5tB8iPy4KOEiojFE333PnNa5CaOg=;
	b=PLoz3i4jb62BrJjb1j8iDjPCpBSA5X38LfeK9WYCqTv7bsoAtjgZUS2VxYq8ApyY
	MWPBbe8utAoDkEwdzsfGnRNh864IG+iFIeq/dsPih3dT8GLXpBBuvppBveMz3ku7zli
	djIstA0dVH3N5J3jfj5DbYmMs52WqQzt+YU7/my4=
Content-Type: multipart/mixed; boundary="===============6090283576227504837=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-applehelp: upgrading to 1.0.8 SUCCEEDED
Message-ID: <0101018d65d3f325-8788f4fd-3057-41c6-8692-b97714c428ee-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194644

--===============6090283576227504837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-applehelp* to *1.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-applehelp-upgrade-1.0.7-1.0.8.patch
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
From 7e4aebf42fd8948e6903c8a9d6f0a1a42e778c6f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 08:23:19 +0000
Subject: [PATCH] python3-sphinxcontrib-applehelp: upgrade 1.0.7 -> 1.0.8

---
 ...lehelp_1.0.7.bb => python3-sphinxcontrib-applehelp_1.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-applehelp_1.0.7.bb => python3-sphinxcontrib-applehelp_1.0.8.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb
index ec3670641d..6ea7c516d5 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.7.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7715857042d4c8c0105999ca0c072c5"
 
-SRC_URI[sha256sum] = "39fdc8d762d33b01a7d8f026a3b7d71563ea3b72787d5f00ad8465bd9d6dfbfa"
+SRC_URI[sha256sum] = "c40a4f96f3776c4393d933412053962fac2b84f4c99a7982ba42e09576a70619"
 
 inherit pypi python_flit_core
 
-- 
2.42.0


--===============6090283576227504837==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-applehelp-upgrade-1.0.7-1.0.8.patch"

RnJvbSA3ZTRhZWJmNDJmZDg5NDhlNjkwM2M4YTlkNmYwYTFhNDJlNzc4YzZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwODoyMzoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54Y29udHJpYi1hcHBsZWhlbHA6IHVwZ3JhZGUgMS4wLjcgLT4gMS4wLjgKCi0t
LQogLi4ubGVoZWxwXzEuMC43LmJiID0+IHB5dGhvbjMtc3BoaW54Y29udHJpYi1hcHBsZWhlbHBf
MS4wLjguYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zcGhp
bnhjb250cmliLWFwcGxlaGVscF8xLjAuNy5iYiA9PiBweXRob24zLXNwaGlueGNvbnRyaWItYXBw
bGVoZWxwXzEuMC44LmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWFwcGxlaGVscF8xLjAuNy5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWFwcGxlaGVscF8x
LjAuOC5iYgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1hcHBsZWhlbHBfMS4wLjcuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmli
LWFwcGxlaGVscF8xLjAuOC5iYgppbmRleCBlYzM2NzA2NDFkLi42ZWE3YzUxNmQ1IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1h
cHBsZWhlbHBfMS4wLjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNwaGlueGNvbnRyaWItYXBwbGVoZWxwXzEuMC44LmJiCkBAIC0zLDcgKzMsNyBAQCBIT01F
UEFHRSA9ICJodHRwczovL3d3dy5zcGhpbngtZG9jLm9yZyIKIExJQ0VOU0UgPSAiQlNELTItQ2xh
dXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9Yzc3MTU4NTcwNDJk
NGM4YzAxMDU5OTljYTBjMDcyYzUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzOWZkYzhkNzYy
ZDMzYjAxYTdkOGYwMjZhM2I3ZDcxNTYzZWEzYjcyNzg3ZDVmMDBhZDg0NjViZDlkNmRmYmZhIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImM0MGE0Zjk2ZjM3NzZjNDM5M2Q5MzM0MTIwNTM5NjJmYWMy
Yjg0ZjRjOTlhNzk4MmJhNDJlMDk1NzZhNzA2MTkiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxp
dF9jb3JlCiAKLS0gCjIuNDIuMAoK

--===============6090283576227504837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp (sysroot):
  /usr/lib/python3.12/site-packages/sphinxcontrib_applehelp-1.0.7.dist-info moved to /usr/lib/python3.12/site-packages/sphinxcontrib_applehelp-1.0.8.dist-info

--===============6090283576227504837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-applehelp/sphinxcontrib_applehelp-1.0.7.tar.gz;downloadfilename=sphinxcontrib_applehelp-1.0.7.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-applehelp/sphinxcontrib_applehelp-1.0.8.tar.gz;downloadfilename=sphinxcontrib_applehelp-1.0.8.tar.gz"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-dbg: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-dbg: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-dev: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-dev: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-doc: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-doc: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-locale: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-locale: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-src: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-src: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-staticdev: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp-staticdev: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp: PV changed from "1.0.7" to "1.0.8"
packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp/python3-sphinxcontrib-applehelp: PKGSIZE changed from 256304 to 256454 (+0%)
Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-applehelp (sysroot):
  /usr/lib/python3.12/site-packages/sphinxcontrib_applehelp-1.0.7.dist-info moved to /usr/lib/python3.12/site-packages/sphinxcontrib_applehelp-1.0.8.dist-info

--===============6090283576227504837==--

