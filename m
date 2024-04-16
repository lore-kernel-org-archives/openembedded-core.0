Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20204C25B78
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:09 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.13446.1713248040139167736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MtT04xvs;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Fi9ZV4K1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018ee58a72a3-348c193a-7b80-4b7d-9f11-29e1540423b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GZvysJJeEcZy4cqMezre74eE973ga9oYI+88O6cpfSo=;
	b=MtT04xvs+mxRhLauFxMzxwonJHPaNHFkOF/6c+emo0FIoC1lcYU4NmeCRqmnQ7/Z
	EDWGvDVeCCIZm/79C/UsirXILnp9bJpnWr++o/thp5AaPv/kye1Ahki6dNISJ5v/Ef+
	U5fiHI6mJED2BBOr29hUwOYly1XLJ2W3gRaXA20I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GZvysJJeEcZy4cqMezre74eE973ga9oYI+88O6cpfSo=;
	b=Fi9ZV4K1M5Ri8ZA63yTa094lct0Mfe52B7H0PnCgPdk7Rf8r9zSP8kW9r5oLpy2J
	j4dmVpgrFq7/8wfN1o3BB48XNG4QxeMNIGNs8F+adLttTwmM7o4tMwjoaDSF0KtQf+d
	1FltWhCneKujqsv3HSWlHV5kgdpU8Gl48/n2gonI=
Content-Type: multipart/mixed; boundary="===============4380286021934299552=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.43.0 SUCCEEDED
Message-ID: <0101018ee58a72a3-348c193a-7b80-4b7d-9f11-29e1540423b3-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198312

--===============4380286021934299552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wheel* to *0.43.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wheel-upgrade-0.42.0-0.43.0.patch
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
From eab5c3c9e78f14fa3d4b130b07bdfb8ae3640982 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 20:15:56 +0000
Subject: [PATCH] python3-wheel: upgrade 0.42.0 -> 0.43.0

---
 .../python/{python3-wheel_0.42.0.bb => python3-wheel_0.43.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.42.0.bb => python3-wheel_0.43.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb b/meta/recipes-devtools/python/python3-wheel_0.43.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.42.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.43.0.bb
index 807888e6c0..ba309ae5fc 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.43.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "c45be39f7882c9d34243236f2d63cbd58039e360f85d0913425fbd7ceea617a8"
+SRC_URI[sha256sum] = "465ef92c69fa5c5da2d1cf8ac40559a8c940886afcef87dcf14b9470862f1d85"
 
 inherit python_flit_core pypi
 
-- 
2.42.0


--===============4380286021934299552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.12/site-packages/wheel-0.42.0.dist-info moved to /usr/lib/python3.12/site-packages/wheel-0.43.0.dist-info

--===============4380286021934299552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-wheel: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.42.0.tar.gz;downloadfilename=wheel-0.42.0.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.43.0.tar.gz;downloadfilename=wheel-0.43.0.tar.gz"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dbg: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dbg: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dev: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dev: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-doc: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-doc: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-locale: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-locale: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-src: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-src: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-staticdev: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-staticdev: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PKGSIZE changed from 444459 to 447007 (+1%)
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PV changed from "0.42.0" to "0.43.0"
Changes to packages/core2-64-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.12/site-packages/wheel-0.42.0.dist-info moved to /usr/lib/python3.12/site-packages/wheel-0.43.0.dist-info

--===============4380286021934299552==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wheel-upgrade-0.42.0-0.43.0.patch"

RnJvbSBlYWI1YzNjOWU3OGYxNGZhM2Q0YjEzMGIwN2JkZmI4YWUzNjQwOTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjA6MTU6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdoZWVsOiB1cGdyYWRlIDAuNDIuMCAtPiAwLjQzLjAKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy13aGVlbF8wLjQyLjAuYmIgPT4gcHl0aG9uMy13aGVlbF8wLjQzLjAuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13aGVlbF8wLjQyLjAuYmIgPT4g
cHl0aG9uMy13aGVlbF8wLjQzLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDIuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQzLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVs
XzAuNDIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXdoZWVsXzAuNDMuMC5iYgppbmRleCA4MDc4ODhlNmMwLi5iYTMwOWFlNWZjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxfMC40Mi4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQzLjAuYmIK
QEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJNSVQi
CiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9N2ZmYjBkYjA0NTI3
Y2ZlMzgwZTRmMjcyNmJkMDVlYmYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNDViZTM5Zjc4
ODJjOWQzNDI0MzIzNmYyZDYzY2JkNTgwMzllMzYwZjg1ZDA5MTM0MjVmYmQ3Y2VlYTYxN2E4Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ2NWVmOTJjNjlmYTVjNWRhMmQxY2Y4YWM0MDU1OWE4Yzk0
MDg4NmFmY2VmODdkY2YxNGI5NDcwODYyZjFkODUiCiAKIGluaGVyaXQgcHl0aG9uX2ZsaXRfY29y
ZSBweXBpCiAKLS0gCjIuNDIuMAoK

--===============4380286021934299552==--

