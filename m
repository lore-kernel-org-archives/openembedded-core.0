Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57CBC32795
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.13470.1713248052687708924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=H/G66659;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zHCgmZsc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58aa3af-1c3fb701-42e2-44a4-847d-375c64a67f47-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248052;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=i6buFZjCXPmxIrHv7rewZU/9oy/O9hyFBar3RcH+uzk=;
	b=H/G66659Q8tMphB399p40dB/EsfdNhzuzGIQPvGD8i1sEkXF73IcLrbcL7gQUmZ0
	KcWMV0MGPAv7cnrNYeEm+XMPV0G6XhbNm9GPCFd9T1d4fEaYvPX95wuDE08Xq858/Rh
	IZ/z8h0fsU1vYsnKN7KYlPZ/fOYL/7tSpmQA6lJI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248052;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=i6buFZjCXPmxIrHv7rewZU/9oy/O9hyFBar3RcH+uzk=;
	b=zHCgmZscUcMk1k8i4Rnx9NFw8NjlxIk5kSV9sTvng/Q1OdZigLsdxyZPq4EgazFk
	+3nEfMdW1dY8fZyTbzbYHE0sQ5tThaEEHaAhXgg5vNWcorvUjEVVJrhnWGztTDjPR0G
	vYzhicpJOB8j1hDXpctYAdCElDoHiHgzf+GVxdAw=
Content-Type: multipart/mixed; boundary="===============8464200137850366231=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libassuan: upgrading to 2.5.7 SUCCEEDED
Message-ID: <0101018ee58aa3af-1c3fb701-42e2-44a4-847d-375c64a67f47-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198420

--===============8464200137850366231==
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
From 8b7e19ccd4ed6327f6b0880097f154a1af14479f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 05:24:22 +0000
Subject: [PATCH] libassuan: upgrade 2.5.6 -> 2.5.7

---
 .../libassuan/libassuan-add-pkgconfig-support.patch       | 8 +++++---
 .../libassuan/{libassuan_2.5.6.bb => libassuan_2.5.7.bb}  | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.6.bb => libassuan_2.5.7.bb} (93%)

diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
index fe811254d3..287a415cd6 100644
--- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
@@ -1,3 +1,8 @@
+From 27b8cc86b5f06fd0ff568d68733a984c6c52bcee Mon Sep 17 00:00:00 2001
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


--===============8464200137850366231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libassuan/libassuan: FILELIST: removed "/usr/lib/libassuan.so.0.8.6", added "/usr/lib/libassuan.so.0.8.7"
Changes to packages/core2-64-poky-linux/libassuan (sysroot):
  /usr/lib/libassuan.so.0 changed symlink target from libassuan.so.0.8.6 to libassuan.so.0.8.7
  /usr/lib/libassuan.so changed symlink target from libassuan.so.0.8.6 to libassuan.so.0.8.7
  /usr/lib/libassuan.so.0.8.6 moved to /usr/lib/libassuan.so.0.8.7

--===============8464200137850366231==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libassuan-upgrade-2.5.6-2.5.7.patch"

RnJvbSA4YjdlMTljY2Q0ZWQ2MzI3ZjZiMDg4MDA5N2YxNTRhMWFmMTQ0NzlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDU6MjQ6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhc3N1YW46IHVwZ3JhZGUgMi41LjYgLT4gMi41LjcKCi0tLQogLi4uL2xpYmFzc3Vhbi9saWJh
c3N1YW4tYWRkLXBrZ2NvbmZpZy1zdXBwb3J0LnBhdGNoICAgICAgIHwgOCArKysrKy0tLQogLi4u
L2xpYmFzc3Vhbi97bGliYXNzdWFuXzIuNS42LmJiID0+IGxpYmFzc3Vhbl8yLjUuNy5iYn0gIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYXNzdWFuL3tsaWJhc3N1YW5fMi41LjYuYmIg
PT4gbGliYXNzdWFuXzIuNS43LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmFzc3Vhbi9saWJhc3N1YW4vbGliYXNzdWFuLWFkZC1wa2djb25maWctc3VwcG9y
dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmFzc3Vhbi9saWJhc3N1YW4vbGliYXNz
dWFuLWFkZC1wa2djb25maWctc3VwcG9ydC5wYXRjaAppbmRleCBmZTgxMTI1NGQzLi4yODdhNDE1
Y2Q2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJhc3N1YW4vbGliYXNzdWFu
L2xpYmFzc3Vhbi1hZGQtcGtnY29uZmlnLXN1cHBvcnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliYXNzdWFuL2xpYmFzc3Vhbi9saWJhc3N1YW4tYWRkLXBrZ2NvbmZpZy1zdXBw
b3J0LnBhdGNoCkBAIC0xLDMgKzEsOCBAQAorRnJvbSAyN2I4Y2M4NmI1ZjA2ZmQwZmY1NjhkNjg3
MzNhOTg0YzZjNTJiY2VlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQ2hlbiBRaSA8
UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgorRGF0ZTogVGh1LCAyMiBNYXkgMjAxNCAxMDo1MDowMCAr
MDEwMAorU3ViamVjdDogW1BBVENIXSBsaWJhc3N1YW46IEltcHJvdmUgcGtnY29uZmlnIHN1cHBv
cnQKKwogQWRkIHBrZ2NvbmZpZyBzdXBwb3J0IHRvIGxpYmFzc3Vhbi4KIFRoaXMgcGF0Y2ggaXMg
cmVqZWN0ZWQgYnkgdXBzdHJlYW0gZm9yIHRoZSByZWFzb24gYmVsb3c6CiBUaGV5IHRoaW5rIHBr
Z2NvbmZpZyBhZGRzIG5vIHBvcnRhYmlsaXR5IGFuZCBtYWludGFpbmluZyB0aGVtIGlzIG5vdCB3
b3J0aHdoaWxlLgpAQCAtMTMwLDYgKzEzNSwzIEBAIGluZGV4IGRmNTA0ODQuLjM4MGE0OGEgMTAw
NjQ0CiAgICAgIGlmZWxzZShbJDNdLCAsIDosIFskM10pCiAgICBmaQogICAgQUNfU1VCU1QoTElC
QVNTVUFOX0NGTEFHUykKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmFzc3Vhbi9saWJhc3N1YW5fMi41LjYuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJhc3N1YW4vbGliYXNzdWFuXzIuNS43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmFzc3Vhbi9saWJhc3N1YW5fMi41LjYuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmFzc3Vhbi9saWJhc3N1YW5fMi41Ljcu
YmIKaW5kZXggN2U4OTllNzM5OS4uZDFlNjIyNjM1ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliYXNzdWFuL2xpYmFzc3Vhbl8yLjUuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJhc3N1YW4vbGliYXNzdWFuXzIuNS43LmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNS
Q19VUkkgPSAiJHtHTlVQR19NSVJST1J9L2xpYmFzc3Vhbi9saWJhc3N1YW4tJHtQVn0udGFyLmJ6
MiBcCiAgICAgICAgICAgIGZpbGU6Ly9saWJhc3N1YW4tYWRkLXBrZ2NvbmZpZy1zdXBwb3J0LnBh
dGNoIFwKICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlOWZkMjcyMThkNTM5
NDkwNGU0ZTM5Nzg4ZjliMTc0MjcxMWMzZTZiNDE2ODlhMzFhYTMzODBiZDVhYTRmNDI2IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjAxMDMwODFmZmMyNzgzOGEyZTUwNDc5MTUzY2ExMDVlODczZDNk
NjVkOGE5NTkzMjgyZTljOTRjN2U2YWZiNzYiCiAKIEJJTkNPTkZJRyA9ICIke2JpbmRpcn0vbGli
YXNzdWFuLWNvbmZpZyIKIAotLSAKMi40Mi4wCgo=

--===============8464200137850366231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libassuan: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.6.tar.bz2 file://libassuan-add-pkgconfig-support.patch" to "https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.7.tar.bz2 file://libassuan-add-pkgconfig-support.patch"
packages/core2-64-poky-linux/libassuan: PKGV changed from 2.5.6 [default] to 2.5.7 [default]
packages/core2-64-poky-linux/libassuan: PV changed from "2.5.6" to "2.5.7"
packages/core2-64-poky-linux/libassuan/libassuan-dbg: PKGV changed from 2.5.6 [default] to 2.5.7 [default]
packages/core2-64-poky-linux/libassuan/libassuan-dbg: FILELIST: removed "/usr/lib/.debug/libassuan.so.0.8.6", added "/usr/lib/.debug/libassuan.so.0.8.7"
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
packages/core2-64-poky-linux/libassuan/libassuan: PKGV changed from 2.5.6 [default] to 2.5.7 [default]
packages/core2-64-poky-linux/libassuan/libassuan: FILELIST: removed "/usr/lib/libassuan.so.0.8.6", added "/usr/lib/libassuan.so.0.8.7"
packages/core2-64-poky-linux/libassuan/libassuan: PV changed from "2.5.6" to "2.5.7"
Changes to packages/core2-64-poky-linux/libassuan (sysroot):
  /usr/lib/libassuan.so.0 changed symlink target from libassuan.so.0.8.6 to libassuan.so.0.8.7
  /usr/lib/libassuan.so changed symlink target from libassuan.so.0.8.6 to libassuan.so.0.8.7
  /usr/lib/libassuan.so.0.8.6 moved to /usr/lib/libassuan.so.0.8.7

--===============8464200137850366231==--

