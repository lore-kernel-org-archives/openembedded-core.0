Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B771CD12AC
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:15 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.44902.1711995070983551044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Eh8T3ejS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SA9PHFng;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9adba7c1-2d49349f-c9fb-4c2d-9262-3f84d756366e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995070;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=4L/+6gdU0pCT1d+h5swmhnYFMf0FBrwpUueoovoOyQE=;
	b=Eh8T3ejScPKGNOY2Q93fW8dATDRIXolyx7jEds2tNDlpzDIVDVeVmY1MEk9A0Bbc
	t1D/MLd/+PRkHn78zLcckFq8FmzAMAo0ntoHzaXeTvWt4MCyxfytrHwiSnDgMy/Trjw
	Oh6e/CugiMivT1J4vs6OPGrTH5CP0y4tEj2nvTV4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995070;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=4L/+6gdU0pCT1d+h5swmhnYFMf0FBrwpUueoovoOyQE=;
	b=SA9PHFngRgxKJV3wi+vRXTA3nfrfCyVDX2VgU/Q+rprbU7IThZzJNVq7ncCGmLz+
	Qbc8iGaR0Wu3torxOGDoj/Ar/Slv7LKvcPp/LE4SEYDFS+T9QxGRCH2FUZk8zvnTDQz
	QJoC7F6V9spBgAzifM2K4KyArLU0nqWmFGDfCbDE=
Content-Type: multipart/mixed; boundary="===============3721909374996922584=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libassuan: upgrading to 2.5.7 SUCCEEDED
Message-ID: <0101018e9adba7c1-2d49349f-c9fb-4c2d-9262-3f84d756366e-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197822

--===============3721909374996922584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libassuan* to *2.5.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libassuan-upgrade-2.5.6-2.5.7.patch
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
From 469ab65aaafe78de1bf7a74bcb2e2b5cf5529627 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 17:30:01 +0000
Subject: [PATCH] libassuan: upgrade 2.5.6 -> 2.5.7

---
 .../libassuan/libassuan-add-pkgconfig-support.patch       | 8 +++++---
 .../libassuan/{libassuan_2.5.6.bb => libassuan_2.5.7.bb}  | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.6.bb => libassuan_2.5.7.bb} (93%)

diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
index fe811254d3..85a3b7df53 100644
--- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
@@ -1,3 +1,8 @@
+From 20fb872cba52e832f59ee5e381b850b8b100a161 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 22 May 2014 10:50:00 +0100
+Subject: [PATCH] libassuan: Improve pkgconfig support
+
 Add pkgconfig support to libassuan.
 This patch is rejected by upstream for the reason below:
 They think pkgconfig adds no portability and maintaining them is not worthwhile.
@@ -130,6 +135,3 @@ index df50484..380a48a 100644
      ifelse([$3], , :, [$3])
    fi
    AC_SUBST(LIBASSUAN_CFLAGS)
--- 
-2.25.1
-
diff --git a/meta/recipes-support/libassuan/libassuan_2.5.6.bb b/meta/recipes-support/libassuan/libassuan_2.5.7.bb
similarity index 93%
rename from meta/recipes-support/libassuan/libassuan_2.5.6.bb
rename to meta/recipes-support/libassuan/libassuan_2.5.7.bb
index 7e899e7399..d1e622635f 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.6.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.7.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[sha256sum] = "e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426"
+SRC_URI[sha256sum] = "0103081ffc27838a2e50479153ca105e873d3d65d8a9593282e9c94c7e6afb76"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.42.0


--===============3721909374996922584==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libassuan-upgrade-2.5.6-2.5.7.patch"

RnJvbSA0NjlhYjY1YWFhZmU3OGRlMWJmN2E3NGJjYjJlMmI1Y2Y1NTI5NjI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNzozMDowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmFzc3VhbjogdXBncmFkZSAyLjUuNiAtPiAyLjUuNwoKLS0tCiAuLi4vbGliYXNzdWFuL2xpYmFz
c3Vhbi1hZGQtcGtnY29uZmlnLXN1cHBvcnQucGF0Y2ggICAgICAgfCA4ICsrKysrLS0tCiAuLi4v
bGliYXNzdWFuL3tsaWJhc3N1YW5fMi41LjYuYmIgPT4gbGliYXNzdWFuXzIuNS43LmJifSAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJhc3N1YW4ve2xpYmFzc3Vhbl8yLjUuNi5iYiA9
PiBsaWJhc3N1YW5fMi41LjcuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliYXNzdWFuL2xpYmFzc3Vhbi9saWJhc3N1YW4tYWRkLXBrZ2NvbmZpZy1zdXBwb3J0
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYXNzdWFuL2xpYmFzc3Vhbi9saWJhc3N1
YW4tYWRkLXBrZ2NvbmZpZy1zdXBwb3J0LnBhdGNoCmluZGV4IGZlODExMjU0ZDMuLjg1YTNiN2Rm
NTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmFzc3Vhbi9saWJhc3N1YW4v
bGliYXNzdWFuLWFkZC1wa2djb25maWctc3VwcG9ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJhc3N1YW4vbGliYXNzdWFuL2xpYmFzc3Vhbi1hZGQtcGtnY29uZmlnLXN1cHBv
cnQucGF0Y2gKQEAgLTEsMyArMSw4IEBACitGcm9tIDIwZmI4NzJjYmE1MmU4MzJmNTllZTVlMzgx
Yjg1MGI4YjEwMGExNjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBDaGVuIFFpIDxR
aS5DaGVuQHdpbmRyaXZlci5jb20+CitEYXRlOiBUaHUsIDIyIE1heSAyMDE0IDEwOjUwOjAwICsw
MTAwCitTdWJqZWN0OiBbUEFUQ0hdIGxpYmFzc3VhbjogSW1wcm92ZSBwa2djb25maWcgc3VwcG9y
dAorCiBBZGQgcGtnY29uZmlnIHN1cHBvcnQgdG8gbGliYXNzdWFuLgogVGhpcyBwYXRjaCBpcyBy
ZWplY3RlZCBieSB1cHN0cmVhbSBmb3IgdGhlIHJlYXNvbiBiZWxvdzoKIFRoZXkgdGhpbmsgcGtn
Y29uZmlnIGFkZHMgbm8gcG9ydGFiaWxpdHkgYW5kIG1haW50YWluaW5nIHRoZW0gaXMgbm90IHdv
cnRod2hpbGUuCkBAIC0xMzAsNiArMTM1LDMgQEAgaW5kZXggZGY1MDQ4NC4uMzgwYTQ4YSAxMDA2
NDQKICAgICAgaWZlbHNlKFskM10sICwgOiwgWyQzXSkKICAgIGZpCiAgICBBQ19TVUJTVChMSUJB
U1NVQU5fQ0ZMQUdTKQotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliYXNzdWFuL2xpYmFzc3Vhbl8yLjUuNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmFzc3Vhbi9saWJhc3N1YW5fMi41LjcuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYXNzdWFuL2xpYmFzc3Vhbl8yLjUuNi5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYXNzdWFuL2xpYmFzc3Vhbl8yLjUuNy5i
YgppbmRleCA3ZTg5OWU3Mzk5Li5kMWU2MjI2MzVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJhc3N1YW4vbGliYXNzdWFuXzIuNS42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmFzc3Vhbi9saWJhc3N1YW5fMi41LjcuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JD
X1VSSSA9ICIke0dOVVBHX01JUlJPUn0vbGliYXNzdWFuL2xpYmFzc3Vhbi0ke1BWfS50YXIuYnoy
IFwKICAgICAgICAgICAgZmlsZTovL2xpYmFzc3Vhbi1hZGQtcGtnY29uZmlnLXN1cHBvcnQucGF0
Y2ggXAogICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU5ZmQyNzIxOGQ1Mzk0
OTA0ZTRlMzk3ODhmOWIxNzQyNzExYzNlNmI0MTY4OWEzMWFhMzM4MGJkNWFhNGY0MjYiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMDEwMzA4MWZmYzI3ODM4YTJlNTA0NzkxNTNjYTEwNWU4NzNkM2Q2
NWQ4YTk1OTMyODJlOWM5NGM3ZTZhZmI3NiIKIAogQklOQ09ORklHID0gIiR7YmluZGlyfS9saWJh
c3N1YW4tY29uZmlnIgogCi0tIAoyLjQyLjAKCg==

--===============3721909374996922584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libassuan/libassuan: FILELIST: removed "/usr/lib/libassuan.so.0.8.6", added "/usr/lib/libassuan.so.0.8.7"
Changes to packages/core2-64-poky-linux/libassuan (sysroot):
  /usr/lib/libassuan.so.0 changed symlink target from libassuan.so.0.8.6 to libassuan.so.0.8.7
  /usr/lib/libassuan.so changed symlink target from libassuan.so.0.8.6 to libassuan.so.0.8.7
  /usr/lib/libassuan.so.0.8.6 moved to /usr/lib/libassuan.so.0.8.7

--===============3721909374996922584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libassuan: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.6.tar.bz2 file://libassuan-add-pkgconfig-support.patch" to "https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.7.tar.bz2 file://libassuan-add-pkgconfig-support.patch"
packages/core2-64-poky-linux/libassuan: PKGV changed from 2.5.6 [default] to 2.5.7 [default]
packages/core2-64-poky-linux/libassuan: PV changed from "2.5.6" to "2.5.7"
packages/core2-64-poky-linux/libassuan/libassuan-dbg: FILELIST: removed "/usr/lib/.debug/libassuan.so.0.8.6", added "/usr/lib/.debug/libassuan.so.0.8.7"
packages/core2-64-poky-linux/libassuan/libassuan-dbg: PKGV changed from 2.5.6 [default] to 2.5.7 [default]
packages/core2-64-poky-linux/libassuan/libassuan-dbg: PV changed from "2.5.6" to "2.5.7"
packages/core2-64-poky-linux/libassuan/libassuan-dev: PKGV changed from 2.5.6 [default] to 2.5.7 [default]
packages/core2-64-poky-linux/libassuan/libassuan-dev: PV changed from "2.5.6" to "2.5.7"
packages/core2-64-poky-linux/libassuan/libassuan-doc: PKGSIZE changed from 157500 to 157539 (+0%)
packages/core2-64-poky-linux/libassuan/libassuan-doc: PKGV changed from 2.5.6 [default] to 2.5.7 [default]
packages/core2-64-poky-linux/libassuan/libassuan-doc: PV changed from "2.5.6" to "2.5.7"
packages/core2-64-poky-linux/libassuan/libassuan-locale: PKGV changed from 2.5.6 [default] to 2.5.7 [default]
packages/core2-64-poky-linux/libassuan/libassuan-locale: PV changed from "2.5.6" to "2.5.7"
packages/core2-64-poky-linux/libassuan/libassuan-src: PKGV changed from 2.5.6 [default] to 2.5.7 [default]
packages/core2-64-poky-linux/libassuan/libassuan-src: PV changed from "2.5.6" to "2.5.7"
packages/core2-64-poky-linux/libassuan/libassuan-staticdev: PKGV changed from 2.5.6 [default] to 2.5.7 [default]
packages/core2-64-poky-linux/libassuan/libassuan-staticdev: PV changed from "2.5.6" to "2.5.7"
packages/core2-64-poky-linux/libassuan/libassuan: FILELIST: removed "/usr/lib/libassuan.so.0.8.6", added "/usr/lib/libassuan.so.0.8.7"
packages/core2-64-poky-linux/libassuan/libassuan: PKGV changed from 2.5.6 [default] to 2.5.7 [default]
packages/core2-64-poky-linux/libassuan/libassuan: PV changed from "2.5.6" to "2.5.7"
Changes to packages/core2-64-poky-linux/libassuan (sysroot):
  /usr/lib/libassuan.so.0 changed symlink target from libassuan.so.0.8.6 to libassuan.so.0.8.7
  /usr/lib/libassuan.so changed symlink target from libassuan.so.0.8.6 to libassuan.so.0.8.7
  /usr/lib/libassuan.so.0.8.6 moved to /usr/lib/libassuan.so.0.8.7

--===============3721909374996922584==--

