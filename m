Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944F0C44506
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:49:33 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8002.1783669770371886145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VMtN4EK0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Sir/LS8r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f4b00c482-153c74b9-015a-4a1f-95c4-20c22880ef9f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783669769;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fKIwDh8y4pUY4UF9XQkqHvKNqWb7kiNLiDx6R8cWb8M=;
	b=VMtN4EK0Lhdc42F9gpVfmfwU8uwptrEV7BCVc9odcQ0qoVHAtmzicCPZlUwVu1cu
	7DruvNBfCSID0CuZQZLuQR194qd8YjgKjbPGN46g15uqDjyAmMZYppeI8Wax2Lo6vio
	eC37orfwCW+txBo9cYfGdVfvkhDfkZeb8Max69Nk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783669769;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fKIwDh8y4pUY4UF9XQkqHvKNqWb7kiNLiDx6R8cWb8M=;
	b=Sir/LS8rWfg/6lPdg4Zb7ky0j20kEFNmAyLHfbU7PnjaBP8Uj2EMzOQLD+XMTwat
	C5gSI4YaBMLJlvhdbQJagcPQ2bSSydxJk5tpVrW7hiZh7KqBOGmZykB9tuNo6yzmvgP
	Q2cn65Q9FpvcjR4AgI9ZE41b39Hih/31zhTFDA6Y=
Content-Type: multipart/mixed; boundary="===============8142415738877377629=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fontconfig: upgrading to 2.18.2 SUCCEEDED
Message-ID: <0101019f4b00c482-153c74b9-015a-4a1f-95c4-20c22880ef9f-000000@us-west-2.amazonses.com>
Date: Fri, 10 Jul 2026 07:49:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.10-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240610

--===============8142415738877377629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fontconfig* to *2.18.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fontconfig-upgrade-2.18.1-2.18.2.patch
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
From e682b0135c55725d27864c31ce9769a9d09e8123 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 10 Jul 2026 06:18:57 +0000
Subject: [PATCH] fontconfig: upgrade 2.18.1 -> 2.18.2

---
 .../fontconfig/fontconfig/revert-static-pkgconfig.patch   | 8 ++++++++
 .../{fontconfig_2.18.1.bb => fontconfig_2.18.2.bb}        | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.18.1.bb => fontconfig_2.18.2.bb} (96%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
index 30d6423037..4337da724f 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
@@ -1,3 +1,8 @@
+From 1de775180219a57c85a0cdcc62fc6482ef8e581e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Apr 2015 20:35:32 -0700
+Subject: [PATCH] fontconfig: Fix pkgconfig file generation to not have
+
 Revert part of http://cgit.freedesktop.org/fontconfig/commit/fontconfig.pc.in?id=338ffe6b886ad4ba86ff471cb59c4a5e5ffbe408
 We really dont do static linking so its not going to cause issues for us but as such this is harming us by adding absolute
 paths into -I options into fontconfig.pc which is them prepended with sysroot when read back by cross pkg-config and
@@ -7,6 +12,9 @@ gently refuses and rightly so.
 
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ fontconfig.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/fontconfig.pc.in b/fontconfig.pc.in
 index 61b35fb..5bc9bab 100644
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
similarity index 96%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
index 76b2652738..d2b6050081 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
@@ -23,7 +23,7 @@ DEPENDS = "expat freetype zlib gperf-native util-linux"
 SRC_URI = "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/${PV}/fontconfig-${PV}.tar.xz \
            file://revert-static-pkgconfig.patch \
            "
-SRC_URI[sha256sum] = "2300f3dbfa7253b3a44f4feecdbc8dfa45dde5dc2cfb71fceaf31f394cb41031"
+SRC_URI[sha256sum] = "cf8e6576ef0484c15079bdaf77cd9c51c464df5365814ada4d3ee7331ea31eb5"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/fontconfig/fontconfig/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============8142415738877377629==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fontconfig-upgrade-2.18.1-2.18.2.patch"

RnJvbSBlNjgyYjAxMzVjNTU3MjVkMjc4NjRjMzFjZTk3NjlhOWQwOWU4MTIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTAgSnVsIDIwMjYgMDY6MTg6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
b250Y29uZmlnOiB1cGdyYWRlIDIuMTguMSAtPiAyLjE4LjIKCi0tLQogLi4uL2ZvbnRjb25maWcv
Zm9udGNvbmZpZy9yZXZlcnQtc3RhdGljLXBrZ2NvbmZpZy5wYXRjaCAgIHwgOCArKysrKysrKwog
Li4uL3tmb250Y29uZmlnXzIuMTguMS5iYiA9PiBmb250Y29uZmlnXzIuMTguMi5iYn0gICAgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy97Zm9udGNvbmZpZ18yLjE4
LjEuYmIgPT4gZm9udGNvbmZpZ18yLjE4LjIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZy9yZXZlcnQtc3RhdGljLXBrZ2Nv
bmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25maWcv
cmV2ZXJ0LXN0YXRpYy1wa2djb25maWcucGF0Y2gKaW5kZXggMzBkNjQyMzAzNy4uNDMzN2RhNzI0
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZp
Zy9yZXZlcnQtc3RhdGljLXBrZ2NvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvZm9udGNvbmZpZy9mb250Y29uZmlnL3JldmVydC1zdGF0aWMtcGtnY29uZmlnLnBhdGNoCkBA
IC0xLDMgKzEsOCBAQAorRnJvbSAxZGU3NzUxODAyMTlhNTdjODVhMGNkY2M2MmZjNjQ4MmVmOGU1
ODFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KK0RhdGU6IFRodSwgMjMgQXByIDIwMTUgMjA6MzU6MzIgLTA3MDAKK1N1YmplY3Q6
IFtQQVRDSF0gZm9udGNvbmZpZzogRml4IHBrZ2NvbmZpZyBmaWxlIGdlbmVyYXRpb24gdG8gbm90
IGhhdmUKKwogUmV2ZXJ0IHBhcnQgb2YgaHR0cDovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2ZvbnRj
b25maWcvY29tbWl0L2ZvbnRjb25maWcucGMuaW4/aWQ9MzM4ZmZlNmI4ODZhZDRiYTg2ZmY0NzFj
YjU5YzRhNWU1ZmZiZTQwOAogV2UgcmVhbGx5IGRvbnQgZG8gc3RhdGljIGxpbmtpbmcgc28gaXRz
IG5vdCBnb2luZyB0byBjYXVzZSBpc3N1ZXMgZm9yIHVzIGJ1dCBhcyBzdWNoIHRoaXMgaXMgaGFy
bWluZyB1cyBieSBhZGRpbmcgYWJzb2x1dGUKIHBhdGhzIGludG8gLUkgb3B0aW9ucyBpbnRvIGZv
bnRjb25maWcucGMgd2hpY2ggaXMgdGhlbSBwcmVwZW5kZWQgd2l0aCBzeXNyb290IHdoZW4gcmVh
ZCBiYWNrIGJ5IGNyb3NzIHBrZy1jb25maWcgYW5kCkBAIC03LDYgKzEyLDkgQEAgZ2VudGx5IHJl
ZnVzZXMgYW5kIHJpZ2h0bHkgc28uCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBb
T0UtU3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgorLS0tCisgZm9udGNvbmZpZy5wYy5pbiB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2ZvbnRjb25maWcucGMuaW4g
Yi9mb250Y29uZmlnLnBjLmluCiBpbmRleCA2MWIzNWZiLi41YmM5YmFiIDEwMDY0NApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE4LjEu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmlnXzIuMTguMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
Zm9udGNvbmZpZy9mb250Y29uZmlnXzIuMTguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE4LjIuYmIKaW5kZXggNzZiMjY1MjczOC4u
ZDJiNjA1MDA4MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcv
Zm9udGNvbmZpZ18yLjE4LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25m
aWcvZm9udGNvbmZpZ18yLjE4LjIuYmIKQEAgLTIzLDcgKzIzLDcgQEAgREVQRU5EUyA9ICJleHBh
dCBmcmVldHlwZSB6bGliIGdwZXJmLW5hdGl2ZSB1dGlsLWxpbnV4IgogU1JDX1VSSSA9ICJodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvYXBpL3Y0L3Byb2plY3RzLzg5MC9wYWNrYWdlcy9n
ZW5lcmljL2ZvbnRjb25maWcvJHtQVn0vZm9udGNvbmZpZy0ke1BWfS50YXIueHogXAogICAgICAg
ICAgICBmaWxlOi8vcmV2ZXJ0LXN0YXRpYy1wa2djb25maWcucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjMwMGYzZGJmYTcyNTNiM2E0NGY0ZmVlY2RiYzhkZmE0
NWRkZTVkYzJjZmI3MWZjZWFmMzFmMzk0Y2I0MTAzMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJj
ZjhlNjU3NmVmMDQ4NGMxNTA3OWJkYWY3N2NkOWM1MWM0NjRkZjUzNjU4MTRhZGE0ZDNlZTczMzFl
YTMxZWI1IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2ZvbnRjb25maWcvZm9udGNvbmZpZy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19SRUdF
WCA9ICJyZWxlYXNlcy8oP1A8cHZlcj4uKykiCi0tIAoyLjQ3LjEKCg==

--===============8142415738877377629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PKGSIZE changed from 524736 to 643819 (+23%)

--===============8142415738877377629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PKGV changed from 2.18.1 [default] to 2.18.2 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PKGSIZE changed from 2621792 to 2843752 (+8%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PV changed from "2.18.1" to "2.18.2"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PKGV changed from 2.18.1 [default] to 2.18.2 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PKGSIZE changed from 44798 to 45176 (+1%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PV changed from "2.18.1" to "2.18.2"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-doc: PKGV changed from 2.18.1 [default] to 2.18.2 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-doc: PV changed from "2.18.1" to "2.18.2"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-ka: PKGV changed from 2.18.1 [default] to 2.18.2 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-ka: PV changed from "2.18.1" to "2.18.2"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-zh-cn: PKGV changed from 2.18.1 [default] to 2.18.2 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-zh-cn: PV changed from "2.18.1" to "2.18.2"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: FILELIST: directory renamed /usr/src/debug/fontconfig/2.18.1/fc-pattern -> /usr/src/debug/fontconfig/2.18.2/fc-pattern, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-lang -> /usr/src/debug/fontconfig/2.18.2/fc-lang, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-query -> /usr/src/debug/fontconfig/2.18.2/fc-query, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-const -> /usr/src/debug/fontconfig/2.18.2/fc-const, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-cat -> /usr/src/debug/fontconfig/2.18.2/fc-cat, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-conflist -> /usr/src/debug/fontconfig/2.18.2/fc-conflist, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-list -> /usr/src/debug/fontconfig/2.18.2/fc-list, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-scan -> /usr/src/debug/fontconfig/2.18.2/fc-scan, directory renamed /usr/src/debug/fontconfig/2.18.1/fontconfig -> /usr/src/debug/fon
 tconfig/2.18.2/fontconfig, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-genconf -> /usr/src/debug/fontconfig/2.18.2/fc-genconf, directory renamed /usr/src/debug/fontconfig/2.18.1 -> /usr/src/debug/fontconfig/2.18.2, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-case -> /usr/src/debug/fontconfig/2.18.2/fc-case, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-match -> /usr/src/debug/fontconfig/2.18.2/fc-match, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-cache -> /usr/src/debug/fontconfig/2.18.2/fc-cache, directory renamed /usr/src/debug/fontconfig/2.18.1/fc-validate -> /usr/src/debug/fontconfig/2.18.2/fc-validate, removed "/usr/src/debug/fontconfig/2.18.1/src/fcpat.c /usr/src/debug/fontconfig/2.18.1/src/fcfreetype.c /usr/src/debug/fontconfig/2.18.1/src/fcptrlist.c /usr/src/debug/fontconfig/2.18.1/src/fccharset.c /usr/src/debug/fontconfig/2.18.1/src/fcformat.c /usr/src/debug/fontconfig/2.18.1/src/fcdbg.c /usr/src/debug/fontconfig/2.18.1/src/fcdefault.c 
 /usr/src/debug/fontconfig/2.18.1/src/fcmutex.h /usr/src/debug/fontconfig/2.18.1/src/fcfs.c /usr/src/debug/fontconfig/2.18.1/src/fcobjshash.gperf /usr/src/debug/fontconfig/2.18.1/src/fcconffile.c /usr/src/debug/fontconfig/2.18.1/src/fcobjs.c /usr/src/debug/fontconfig/2.18.1/src/fcrange.c /usr/src/debug/fontconfig/2.18.1/src/fcname.c /usr/src/debug/fontconfig/2.18.1/src/fcstat.c /usr/src/debug/fontconfig/2.18.1/src/fcweight.c /usr/src/debug/fontconfig/2.18.1/src/fcatomic.h /usr/src/debug/fontconfig/2.18.1/src/fccache.c /usr/src/debug/fontconfig/2.18.1/src/fcatomic.c /usr/src/debug/fontconfig/2.18.1/src/fclist.c /usr/src/debug/fontconfig/2.18.1/src/fcmatch.c /usr/src/debug/fontconfig/2.18.1/src/fcmd5.h /usr/src/debug/fontconfig/2.18.1/src/fcserialize.c /usr/src/debug/fontconfig/2.18.1/src/ftglue.c /usr/src/debug/fontconfig/2.18.1/src/fccompat.c /usr/src/debug/fontconfig/2.18.1/src/fcinit.c /usr/src/debug/fontconfig/2.18.1/src/ftglue.h /usr/src/debug/fontconfig/2.18.1/src/fcfoundry.h /u
 sr/src/debug/fontconfig/2.18.1/src/fcstr.c /usr/src/debug/fontconfig/2.18.1/src/fcint.h /usr/src/debug/fontconfig/2.18.1/src/fcmatrix.c /usr/src/debug/fontconfig/2.18.1/src/fcdir.c /usr/src/debug/fontconfig/2.18.1/src/fchash.c /usr/src/debug/fontconfig/2.18.1/src/fccfg.c /usr/src/debug/fontconfig/2.18.1/src/fclang.c /usr/src/debug/fontconfig/2.18.1/src/fcxml.c", added "/usr/src/debug/fontconfig/2.18.2/src/fcpat.c /usr/src/debug/fontconfig/2.18.2/src/fcfreetype.c /usr/src/debug/fontconfig/2.18.2/src/fcptrlist.c /usr/src/debug/fontconfig/2.18.2/src/fccharset.c /usr/src/debug/fontconfig/2.18.2/src/fcformat.c /usr/src/debug/fontconfig/2.18.2/src/fcdbg.c /usr/src/debug/fontconfig/2.18.2/src/fcdefault.c /usr/src/debug/fontconfig/2.18.2/src/fcmutex.h /usr/src/debug/fontconfig/2.18.2/src/fcfs.c /usr/src/debug/fontconfig/2.18.2/src/fcobjshash.gperf /usr/src/debug/fontconfig/2.18.2/src/fcconffile.c /usr/src/debug/fontconfig/2.18.2/src/fcobjs.c /usr/src/debug/fontconfig/2.18.2/src/fcrange.c /u
 sr/src/debug/fontconfig/2.18.2/src/fcname.c /usr/src/debug/fontconfig/2.18.2/src/fcstat.c /usr/src/debug/fontconfig/2.18.2/fc-genericfamily/fcgenericfamily.gperf /usr/src/debug/fontconfig/2.18.2/src/fcweight.c /usr/src/debug/fontconfig/2.18.2/src/fcatomic.h /usr/src/debug/fontconfig/2.18.2/src/fccache.c /usr/src/debug/fontconfig/2.18.2/src/fcatomic.c /usr/src/debug/fontconfig/2.18.2/src/fclist.c /usr/src/debug/fontconfig/2.18.2/src/fcmatch.c /usr/src/debug/fontconfig/2.18.2/src/fcmd5.h /usr/src/debug/fontconfig/2.18.2/src/fcserialize.c /usr/src/debug/fontconfig/2.18.2/src/ftglue.c /usr/src/debug/fontconfig/2.18.2/src/fccompat.c /usr/src/debug/fontconfig/2.18.2/src/fcinit.c /usr/src/debug/fontconfig/2.18.2/src/ftglue.h /usr/src/debug/fontconfig/2.18.2/src/fcfoundry.h /usr/src/debug/fontconfig/2.18.2/src/fcstr.c /usr/src/debug/fontconfig/2.18.2/src/fcint.h /usr/src/debug/fontconfig/2.18.2/src/fcgenericalias.c /usr/src/debug/fontconfig/2.18.2/src/fcmatrix.c /usr/src/debug/fontconfig/2.
 18.2/src/fcdir.c /usr/src/debug/fontconfig/2.18.2/src/fchash.c /usr/src/debug/fontconfig/2.18.2/src/fccfg.c /usr/src/debug/fontconfig/2.18.2/src/fclang.c /usr/src/debug/fontconfig/2.18.2/src/fcxml.c"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PKGV changed from 2.18.1 [default] to 2.18.2 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PKGSIZE changed from 1065533 to 1104491 (+4%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PV changed from "2.18.1" to "2.18.2"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-staticdev: PKGV changed from 2.18.1 [default] to 2.18.2 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-staticdev: PV changed from "2.18.1" to "2.18.2"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PKGV changed from 2.18.1 [default] to 2.18.2 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PV changed from "2.18.1" to "2.18.2"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PKGV changed from 2.18.1 [default] to 2.18.2 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PKGSIZE changed from 524736 to 643819 (+23%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PV changed from "2.18.1" to "2.18.2"
packages/x86-64-v3-poky-linux/fontconfig: SRC_URI changed from "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.1/fontconfig-2.18.1.tar.xz file://revert-static-pkgconfig.patch" to "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.2/fontconfig-2.18.2.tar.xz file://revert-static-pkgconfig.patch"
packages/x86-64-v3-poky-linux/fontconfig: PKGV changed from 2.18.1 [default] to 2.18.2 [default]
packages/x86-64-v3-poky-linux/fontconfig: PV changed from "2.18.1" to "2.18.2"

--===============8142415738877377629==--

