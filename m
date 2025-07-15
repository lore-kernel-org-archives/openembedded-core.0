Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB7CCA0ECE
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.12493.1752594941733324220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Pt+qKoSe;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=p/9ay5na;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101980ecc852e-477183f6-0371-41cf-bf82-45ed14b4bb02-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594941;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Mzi48Ao/FwuQjJDwyA42IAywFOhqZ/3FMaaRmegFtlw=;
	b=Pt+qKoSeeuSXr5fRtUO/Wl78dLnavXra9sFftSmLJLcrZeadYBHs5z8LfsQEVlhy
	LaxrZBu9P5AVOxGWlQqyN6oJDathJqLlqL63QWBsb+jWSQf4z6yWi+4KDXZCZKuUMPJ
	jyDbB/XoKvsLmkE2SDl3CfZqZcQnl2Ce7I5zW9ko=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594941;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Mzi48Ao/FwuQjJDwyA42IAywFOhqZ/3FMaaRmegFtlw=;
	b=p/9ay5naNs2Vt0rgela6UaxZAGb7aEfOAS/lriN1reSmoutbVVLgucaIt37JycW1
	uocUKueqeCMsX4wh4p5C9OecvXZ9oGpL619T/mKk/VNp/EEBxrPKzi73o4XV4Y3CQB0
	N6YZ/78ZcSiHHld6So77a/VZ93LKKolu9Hx+12ng=
Content-Type: multipart/mixed; boundary="===============5463299427581691813=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.135.31 SUCCEEDED
Message-ID: <010101980ecc852e-477183f6-0371-41cf-bf82-45ed14b4bb02-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220344

--===============5463299427581691813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.135.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.135.16-6.135.31.patch
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
From 186b36ccebdbf2c96b32773c181fbf3272d95fc3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 10:02:13 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.135.16 -> 6.135.31

---
 ...n3-hypothesis_6.135.16.bb => python3-hypothesis_6.135.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.135.16.bb => python3-hypothesis_6.135.31.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb b/meta/recipes-devtools/python/python3-hypothesis_6.135.31.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.135.31.bb
index c0241b63e4..1460c8188d 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.135.31.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "6131ea0b698e69bad62aae915988b8d00a6ac974351d0830db74c5fffc68c418"
+SRC_URI[sha256sum] = "a759a6010a43424b66b634383a04717a30ed05f553cc51e3b3fe3931faace53a"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============5463299427581691813==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.135.16-6.135.31.patch"

RnJvbSAxODZiMzZjY2ViZGJmMmM5NmIzMjc3M2MxODFmYmYzMjcyZDk1ZmMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTA6MDI6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xMzUuMTYgLT4gNi4xMzUuMzEKCi0tLQogLi4u
bjMtaHlwb3RoZXNpc182LjEzNS4xNi5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi4xMzUuMzEu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTM1LjE2LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjEzNS4zMS5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjEzNS4xNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBv
dGhlc2lzXzYuMTM1LjMxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTM1LjE2LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182
LjEzNS4zMS5iYgppbmRleCBjMDI0MWI2M2U0Li4xNDYwYzgxODhkIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEzNS4xNi5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEz
NS4zMS5iYgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0
X3JsZS5weSBcCiAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjEzMWVhMGI2OThlNjli
YWQ2MmFhZTkxNTk4OGI4ZDAwYTZhYzk3NDM1MWQwODMwZGI3NGM1ZmZmYzY4YzQxOCIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJhNzU5YTYwMTBhNDM0MjRiNjZiNjM0MzgzYTA0NzE3YTMwZWQwNWY1
NTNjYzUxZTNiM2ZlMzkzMWZhYWNlNTNhIgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBw
eXRob24zLWF0dHJzIFwKLS0gCjIuNDcuMQoK

--===============5463299427581691813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.135.16.tar.gz;downloadfilename=hypothesis-6.135.16.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.135.31.tar.gz;downloadfilename=hypothesis-6.135.31.tar.gz file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.135.16 [default] to 6.135.31 [default]
packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.135.16" to "6.135.31"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.135.16 [default] to 6.135.31 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.135.16" to "6.135.31"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.135.16 [default] to 6.135.31 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.135.16" to "6.135.31"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.135.16 [default] to 6.135.31 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.135.16" to "6.135.31"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.135.16 [default] to 6.135.31 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.135.16" to "6.135.31"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.135.16 [default] to 6.135.31 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.135.16" to "6.135.31"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.135.16 [default] to 6.135.31 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.135.16" to "6.135.31"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.135.16 [default] to 6.135.31 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.135.16" to "6.135.31"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3473819 to 3488940 (+0%)
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.135.16 [default] to 6.135.31 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.135.16.dist-info -> /usr/lib/python3.13/site-packages/hypothesis-6.135.31.dist-info, directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.135.16.dist-info/licenses -> /usr/lib/python3.13/site-packages/hypothesis-6.135.31.dist-info/licenses, added "/usr/lib/python3.13/site-packages/hypothesis/utils/__pycache__/threading.cpython-313.pyc /usr/lib/python3.13/site-packages/hypothesis/utils/threading.py"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.135.16" to "6.135.31"
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.135.16.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.135.31.dist-info
  /usr/lib/python3.13/site-packages/hypothesis/utils/__pycache__/threading.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/hypothesis/utils/threading.py was added

--===============5463299427581691813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.135.16.dist-info/licenses -> /usr/lib/python3.13/site-packages/hypothesis-6.135.31.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.135.16.dist-info -> /usr/lib/python3.13/site-packages/hypothesis-6.135.31.dist-info, added "/usr/lib/python3.13/site-packages/hypothesis/utils/__pycache__/threading.cpython-313.pyc /usr/lib/python3.13/site-packages/hypothesis/utils/threading.py"
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.135.16.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.135.31.dist-info
  /usr/lib/python3.13/site-packages/hypothesis/utils/__pycache__/threading.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/hypothesis/utils/threading.py was added

--===============5463299427581691813==--

