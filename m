Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1B6D591C3
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:31 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.4683.1731964636771888298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Y8clEh3n;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wBFuiTfe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010193412323d2-6b3b679e-102c-4f59-97f4-edcd3db0f3a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964642;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ptottuPH8BwBJnY4Zt1nFTbl2UEkWh8CaV6p3wgi0F4=;
	b=Y8clEh3nMiOt53kzOd9zkx/1a8hP/+y93J0ALcPZWNt3j5x9H2La52aEAOKDlFtM
	RC4W2wP5BA/j24/sRL2zXUXjYIafd+iDtL/4ZL8+MbsU0HvpfY1lltAE9ShqgLdeu6y
	MMoXWLnbeTbv7wjD90V8pOecJOq9adrXjOGexM8w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964642;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ptottuPH8BwBJnY4Zt1nFTbl2UEkWh8CaV6p3wgi0F4=;
	b=wBFuiTfekwYTK4P/bQzBWVPGBA/pyirdhpXG0fNSgM+KSRhwDmR7PLO+RQNcljRh
	Md77OuaSPQFJTpnVM5eE1e1QHZmlUupqL/yN3HRc4YgLqwLk5Tj45Qp3j1Mwb8Bf1IC
	o5G+rYul8oAd1lKTaR0FaG2pLm29xbv7KBtuQmjI=
Content-Type: multipart/mixed; boundary="===============8557976855182658529=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.45.0 SUCCEEDED
Message-ID: <01010193412323d2-6b3b679e-102c-4f59-97f4-edcd3db0f3a4-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207298

--===============8557976855182658529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wheel* to *0.45.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wheel-upgrade-0.44.0-0.45.0.patch
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
From 6647f8f69a04ca6d145759cd72da2a40bb7707b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 03:52:28 +0000
Subject: [PATCH] python3-wheel: upgrade 0.44.0 -> 0.45.0

---
 .../python/{python3-wheel_0.44.0.bb => python3-wheel_0.45.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.44.0.bb => python3-wheel_0.45.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.44.0.bb b/meta/recipes-devtools/python/python3-wheel_0.45.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.44.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.45.0.bb
index 1e7e0f27c6..5b7f600557 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.44.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.45.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "a29c3f2817e95ab89aa4660681ad547c0e9547f20e75b0562fe7723c9a2a9d49"
+SRC_URI[sha256sum] = "a57353941a3183b3d5365346b567a260a0602a0f8a635926a7dede41b94c674a"
 
 inherit python_flit_core pypi
 
-- 
2.44.1


--===============8557976855182658529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-wheel/python3-wheel: FILELIST: directory renamed /usr/lib/python3.13/site-packages/wheel-0.44.0.dist-info -> /usr/lib/python3.13/site-packages/wheel-0.45.0.dist-info, added "/usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE.APACHE /usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE /usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE.BSD"
Changes to packages/core2-64-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.13/site-packages/wheel-0.44.0.dist-info moved to /usr/lib/python3.13/site-packages/wheel-0.45.0.dist-info
  /usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE was added
  /usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE.APACHE was added
  /usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE.BSD was added

--===============8557976855182658529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-wheel: PKGV changed from 0.44.0 [default] to 0.45.0 [default]
packages/core2-64-poky-linux/python3-wheel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.44.0.tar.gz;downloadfilename=wheel-0.44.0.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.45.0.tar.gz;downloadfilename=wheel-0.45.0.tar.gz"
packages/core2-64-poky-linux/python3-wheel: PV changed from "0.44.0" to "0.45.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dbg: PKGV changed from 0.44.0 [default] to 0.45.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dbg: PV changed from "0.44.0" to "0.45.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dev: PKGV changed from 0.44.0 [default] to 0.45.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dev: PV changed from "0.44.0" to "0.45.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-doc: PKGV changed from 0.44.0 [default] to 0.45.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-doc: PV changed from "0.44.0" to "0.45.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-locale: PKGV changed from 0.44.0 [default] to 0.45.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-locale: PV changed from "0.44.0" to "0.45.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-src: PKGV changed from 0.44.0 [default] to 0.45.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-src: PV changed from "0.44.0" to "0.45.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-staticdev: PKGV changed from 0.44.0 [default] to 0.45.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-staticdev: PV changed from "0.44.0" to "0.45.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PKGV changed from 0.44.0 [default] to 0.45.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PKGSIZE changed from 454903 to 476362 (+5%)
packages/core2-64-poky-linux/python3-wheel/python3-wheel: FILELIST: directory renamed /usr/lib/python3.13/site-packages/wheel-0.44.0.dist-info -> /usr/lib/python3.13/site-packages/wheel-0.45.0.dist-info, added "/usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE.BSD /usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE /usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE.APACHE"
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PV changed from "0.44.0" to "0.45.0"
Changes to packages/core2-64-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.13/site-packages/wheel-0.44.0.dist-info moved to /usr/lib/python3.13/site-packages/wheel-0.45.0.dist-info
  /usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE was added
  /usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE.APACHE was added
  /usr/lib/python3.13/site-packages/wheel/vendored/packaging/LICENSE.BSD was added

--===============8557976855182658529==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wheel-upgrade-0.44.0-0.45.0.patch"

RnJvbSA2NjQ3ZjhmNjlhMDRjYTZkMTQ1NzU5Y2Q3MmRhMmE0MGJiNzcwN2IzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDM6NTI6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdoZWVsOiB1cGdyYWRlIDAuNDQuMCAtPiAwLjQ1LjAKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy13aGVlbF8wLjQ0LjAuYmIgPT4gcHl0aG9uMy13aGVlbF8wLjQ1LjAuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13aGVlbF8wLjQ0LjAuYmIgPT4g
cHl0aG9uMy13aGVlbF8wLjQ1LjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDQuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQ1LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVs
XzAuNDQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXdoZWVsXzAuNDUuMC5iYgppbmRleCAxZTdlMGYyN2M2Li41YjdmNjAwNTU3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxfMC40NC4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQ1LjAuYmIK
QEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJNSVQi
CiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9N2ZmYjBkYjA0NTI3
Y2ZlMzgwZTRmMjcyNmJkMDVlYmYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMjljM2YyODE3
ZTk1YWI4OWFhNDY2MDY4MWFkNTQ3YzBlOTU0N2YyMGU3NWIwNTYyZmU3NzIzYzlhMmE5ZDQ5Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImE1NzM1Mzk0MWEzMTgzYjNkNTM2NTM0NmI1NjdhMjYwYTA2
MDJhMGY4YTYzNTkyNmE3ZGVkZTQxYjk0YzY3NGEiCiAKIGluaGVyaXQgcHl0aG9uX2ZsaXRfY29y
ZSBweXBpCiAKLS0gCjIuNDQuMQoK

--===============8557976855182658529==--

