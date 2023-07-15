Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C834C25B5B
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5962.1689456456636641169
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LYvXNRkW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101895b73b1c6-391b1b75-6f40-466e-8e88-8d5930a919b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PzRBvQa+WQh71SkyJUURQ/Pu+299Tea1X1pVWAB0e8A=;
	b=LYvXNRkWiZI3iWBdXeVuQC0G8wDFFf5U/SyRAJZe6O45iaob15jWhikz2fMuM1lG
	4M86dN400gh2deqRZf6At9gA7B/5HzObNEKA6D9rySQnljMVqwn26Jc8/g4+8z33m59
	55nrc3ooCxAMX5ywqYPFCE+tARHzfBTeLZ4nI3NM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PzRBvQa+WQh71SkyJUURQ/Pu+299Tea1X1pVWAB0e8A=;
	b=eIXshIce+y8sZcnSKyynl8JTyOaSbXgTiXAOHSsE3W8sXLG5umTcZ9z5uLobrS5T
	9zsVbPPf73CfACydtgr3eC9rP//QkRv+bfLbSjyaFWXh3t8mf/9vmQSx6lyei+/vi3P
	JSXX3rs9ZinYwmg0hXP+z+04bZUPA8b2noK1INRU=
Content-Type: multipart/mixed; boundary="===============7332912633511893503=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwebp: upgrading to 1.3.1 SUCCEEDED
Message-ID: <010101895b73b1c6-391b1b75-6f40-466e-8e88-8d5930a919b4-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184384

--===============7332912633511893503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwebp* to *1.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwebp-upgrade-1.3.0-1.3.1.patch
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
From ac93ffed66948c914d829c2ff9d3f079cc75dd39 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 19:49:16 +0000
Subject: [PATCH] libwebp: upgrade 1.3.0 -> 1.3.1

---
 .../webp/files/CVE-2023-1999.patch            | 55 -------------------
 .../{libwebp_1.3.0.bb => libwebp_1.3.1.bb}    |  6 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
 rename meta/recipes-multimedia/webp/{libwebp_1.3.0.bb => libwebp_1.3.1.bb} (93%)

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch b/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
deleted file mode 100644
index d293ab93ab..0000000000
--- a/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From a486d800b60d0af4cc0836bf7ed8f21e12974129 Mon Sep 17 00:00:00 2001
-From: James Zern <jzern@google.com>
-Date: Wed, 22 Feb 2023 22:15:47 -0800
-Subject: [PATCH] EncodeAlphaInternal: clear result->bw on error
-
-This avoids a double free should the function fail prior to
-VP8BitWriterInit() and a previous trial result's buffer carried over.
-Previously in ApplyFiltersAndEncode() trial.bw (with a previous
-iteration's buffer) would be freed, followed by best.bw pointing to the
-same buffer.
-
-Since:
-187d379d add a fallback to ALPHA_NO_COMPRESSION
-
-In addition, check the return value of VP8BitWriterInit() in this
-function.
-
-Bug: webp:603
-Change-Id: Ic258381ee26c8c16bc211d157c8153831c8c6910
-
-CVE: CVE-2023-1999
-Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/a486d800b60d0af4cc0836bf7ed8f21e12974129]
-Signed-off-by: Nikhil R <nikhil.r@kpit.com>
----
- src/enc/alpha_enc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/enc/alpha_enc.c b/src/enc/alpha_enc.c
-index f7c02690e3..7d205586fe 100644
---- a/src/enc/alpha_enc.c
-+++ b/src/enc/alpha_enc.c
-@@ -13,6 +13,7 @@
- 
- #include <assert.h>
- #include <stdlib.h>
-+#include <string.h>
- 
- #include "src/enc/vp8i_enc.h"
- #include "src/dsp/dsp.h"
-@@ -148,6 +149,7 @@ static int EncodeAlphaInternal(const uint8_t* const data, int width, int height,
-       }
-     } else {
-       VP8LBitWriterWipeOut(&tmp_bw);
-+      memset(&result->bw, 0, sizeof(result->bw));
-       return 0;
-     }
-   }
-@@ -162,7 +164,7 @@ static int EncodeAlphaInternal(const uint8_t* const data, int width, int height,
-   header = method | (filter << 2);
-   if (reduce_levels) header |= ALPHA_PREPROCESSED_LEVELS << 4;
- 
--  VP8BitWriterInit(&result->bw, ALPHA_HEADER_LEN + output_size);
-+  if (!VP8BitWriterInit(&result->bw, ALPHA_HEADER_LEN + output_size)) ok = 0;
-   ok = ok && VP8BitWriterAppend(&result->bw, &header, ALPHA_HEADER_LEN);
-   ok = ok && VP8BitWriterAppend(&result->bw, output, output_size);
diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.0.bb b/meta/recipes-multimedia/webp/libwebp_1.3.1.bb
similarity index 93%
rename from meta/recipes-multimedia/webp/libwebp_1.3.0.bb
rename to meta/recipes-multimedia/webp/libwebp_1.3.1.bb
index 7ca67e44fb..b9e763b08e 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.3.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.3.1.bb
@@ -14,14 +14,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "64ac4614db292ae8c5aa26de0295bf1623dbb3985054cb656c55e67431def17c"
+SRC_URI[sha256sum] = "b3779627c2dfd31e3d8c4485962c2efe17785ef975e2be5c8c0c9e6cd3c4ef66"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-SRC_URI += " \
-    file://CVE-2023-1999.patch \
-"
-
 EXTRA_OECONF = " \
     --disable-wic \
     --enable-libwebpmux \
-- 
2.39.2


--===============7332912633511893503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libwebp: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/libwebp: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/libwebp: SRC_URI changed from "http://downloads.webmproject.org/releases/webp/libwebp-1.3.0.tar.gz file://CVE-2023-1999.patch" to "http://downloads.webmproject.org/releases/webp/libwebp-1.3.1.tar.gz"
packages/core2-32-poky-linux/libwebp/libwebp-bin: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/libwebp/libwebp-bin: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/libwebp/libwebp-bin: PKGSIZE changed from 179320 to 183416 (+2%)
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/libwebp/libwebp-dbg: FILELIST: removed "/usr/lib/.debug/libsharpyuv.so.0.0.0 /usr/lib/.debug/libwebpdemux.so.2.0.12 /usr/lib/.debug/libwebpmux.so.3.0.11 /usr/lib/.debug/libwebp.so.7.1.6", added "/usr/lib/.debug/libwebpdemux.so.2.0.13 /usr/lib/.debug/libsharpyuv.so.0.0.1 /usr/lib/.debug/libwebp.so.7.1.7 /usr/lib/.debug/libwebpmux.so.3.0.12"
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PKGSIZE changed from 3233768 to 3242368 (+0%)
packages/core2-32-poky-linux/libwebp/libwebp-dev: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/libwebp/libwebp-dev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/libwebp/libwebp-dev: PKGSIZE changed from 103055 to 103150 (+0%)
packages/core2-32-poky-linux/libwebp/libwebp-doc: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/libwebp/libwebp-doc: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/libwebp/libwebp-doc: PKGSIZE changed from 29848 to 30446 (+2%)
packages/core2-32-poky-linux/libwebp/libwebp-gif2webp: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/libwebp/libwebp-gif2webp: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/libwebp/libwebp-locale: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/libwebp/libwebp-locale: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/libwebp/libwebp-src: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/libwebp/libwebp-src: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/libwebp/libwebp-src: PKGSIZE changed from 2899151 to 2908610 (+0%)
packages/core2-32-poky-linux/libwebp/libwebp-staticdev: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/libwebp/libwebp-staticdev: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
packages/core2-32-poky-linux/libwebp/libwebp: PV changed from "1.3.0" to "1.3.1"
packages/core2-32-poky-linux/libwebp/libwebp: FILELIST: removed "/usr/lib/libwebpmux.so.3.0.11 /usr/lib/libsharpyuv.so.0.0.0 /usr/lib/libwebp.so.7.1.6 /usr/lib/libwebpdemux.so.2.0.12", added "/usr/lib/libsharpyuv.so.0.0.1 /usr/lib/libwebpmux.so.3.0.12 /usr/lib/libwebp.so.7.1.7 /usr/lib/libwebpdemux.so.2.0.13"
packages/core2-32-poky-linux/libwebp/libwebp: PKGV changed from 1.3.0 [default] to 1.3.1 [default]
Changes to packages/core2-32-poky-linux/libwebp (sysroot):
  /usr/lib/libsharpyuv.so.0 changed symlink target from libsharpyuv.so.0.0.0 to libsharpyuv.so.0.0.1
  /usr/lib/libsharpyuv.so changed symlink target from libsharpyuv.so.0.0.0 to libsharpyuv.so.0.0.1
  /usr/lib/libwebpdemux.so.2 changed symlink target from libwebpdemux.so.2.0.12 to libwebpdemux.so.2.0.13
  /usr/lib/libwebpdemux.so changed symlink target from libwebpdemux.so.2.0.12 to libwebpdemux.so.2.0.13
  /usr/lib/libwebpmux.so.3 changed symlink target from libwebpmux.so.3.0.11 to libwebpmux.so.3.0.12
  /usr/lib/libwebpmux.so changed symlink target from libwebpmux.so.3.0.11 to libwebpmux.so.3.0.12
  /usr/lib/libwebp.so.7 changed symlink target from libwebp.so.7.1.6 to libwebp.so.7.1.7
  /usr/lib/libwebp.so changed symlink target from libwebp.so.7.1.6 to libwebp.so.7.1.7
  /usr/lib/libsharpyuv.so.0.0.0 moved to /usr/lib/libsharpyuv.so.0.0.1
  /usr/lib/libwebpdemux.so.2.0.12 moved to /usr/lib/libwebpdemux.so.2.0.13
  /usr/lib/libwebpmux.so.3.0.11 moved to /usr/lib/libwebpmux.so.3.0.12
  /usr/lib/libwebp.so.7.1.6 moved to /usr/lib/libwebp.so.7.1.7

--===============7332912633511893503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libwebp/libwebp: FILELIST: removed "/usr/lib/libwebpdemux.so.2.0.12 /usr/lib/libwebp.so.7.1.6 /usr/lib/libwebpmux.so.3.0.11 /usr/lib/libsharpyuv.so.0.0.0", added "/usr/lib/libwebpmux.so.3.0.12 /usr/lib/libsharpyuv.so.0.0.1 /usr/lib/libwebp.so.7.1.7 /usr/lib/libwebpdemux.so.2.0.13"
Changes to packages/core2-32-poky-linux/libwebp (sysroot):
  /usr/lib/libsharpyuv.so.0 changed symlink target from libsharpyuv.so.0.0.0 to libsharpyuv.so.0.0.1
  /usr/lib/libsharpyuv.so changed symlink target from libsharpyuv.so.0.0.0 to libsharpyuv.so.0.0.1
  /usr/lib/libwebpdemux.so.2 changed symlink target from libwebpdemux.so.2.0.12 to libwebpdemux.so.2.0.13
  /usr/lib/libwebpdemux.so changed symlink target from libwebpdemux.so.2.0.12 to libwebpdemux.so.2.0.13
  /usr/lib/libwebpmux.so.3 changed symlink target from libwebpmux.so.3.0.11 to libwebpmux.so.3.0.12
  /usr/lib/libwebpmux.so changed symlink target from libwebpmux.so.3.0.11 to libwebpmux.so.3.0.12
  /usr/lib/libwebp.so.7 changed symlink target from libwebp.so.7.1.6 to libwebp.so.7.1.7
  /usr/lib/libwebp.so changed symlink target from libwebp.so.7.1.6 to libwebp.so.7.1.7
  /usr/lib/libsharpyuv.so.0.0.0 moved to /usr/lib/libsharpyuv.so.0.0.1
  /usr/lib/libwebpdemux.so.2.0.12 moved to /usr/lib/libwebpdemux.so.2.0.13
  /usr/lib/libwebpmux.so.3.0.11 moved to /usr/lib/libwebpmux.so.3.0.12
  /usr/lib/libwebp.so.7.1.6 moved to /usr/lib/libwebp.so.7.1.7

--===============7332912633511893503==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libwebp-upgrade-1.3.0-1.3.1.patch"

RnJvbSBhYzkzZmZlZDY2OTQ4YzkxNGQ4MjljMmZmOWQzZjA3OWNjNzVkZDM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTk6NDk6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ3ZWJwOiB1cGdyYWRlIDEuMy4wIC0+IDEuMy4xCgotLS0KIC4uLi93ZWJwL2ZpbGVzL0NWRS0y
MDIzLTE5OTkucGF0Y2ggICAgICAgICAgICB8IDU1IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi97
bGlid2VicF8xLjMuMC5iYiA9PiBsaWJ3ZWJwXzEuMy4xLmJifSAgICB8ICA2ICstCiAyIGZpbGVz
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS93ZWJwL2ZpbGVzL0NWRS0yMDIzLTE5OTkucGF0
Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS93ZWJwL3tsaWJ3ZWJwXzEuMy4wLmJi
ID0+IGxpYndlYnBfMS4zLjEuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvd2VicC9maWxlcy9DVkUtMjAyMy0xOTk5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvd2VicC9maWxlcy9DVkUtMjAyMy0xOTk5LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCBkMjkzYWI5M2FiLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL3dlYnAvZmlsZXMvQ1ZFLTIwMjMtMTk5OS5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDU1ICswLDAgQEAKLUZyb20gYTQ4NmQ4MDBiNjBkMGFmNGNjMDgzNmJmN2VkOGYyMWUxMjk3
NDEyOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEphbWVzIFplcm4gPGp6ZXJuQGdv
b2dsZS5jb20+Ci1EYXRlOiBXZWQsIDIyIEZlYiAyMDIzIDIyOjE1OjQ3IC0wODAwCi1TdWJqZWN0
OiBbUEFUQ0hdIEVuY29kZUFscGhhSW50ZXJuYWw6IGNsZWFyIHJlc3VsdC0+Yncgb24gZXJyb3IK
LQotVGhpcyBhdm9pZHMgYSBkb3VibGUgZnJlZSBzaG91bGQgdGhlIGZ1bmN0aW9uIGZhaWwgcHJp
b3IgdG8KLVZQOEJpdFdyaXRlckluaXQoKSBhbmQgYSBwcmV2aW91cyB0cmlhbCByZXN1bHQncyBi
dWZmZXIgY2FycmllZCBvdmVyLgotUHJldmlvdXNseSBpbiBBcHBseUZpbHRlcnNBbmRFbmNvZGUo
KSB0cmlhbC5idyAod2l0aCBhIHByZXZpb3VzCi1pdGVyYXRpb24ncyBidWZmZXIpIHdvdWxkIGJl
IGZyZWVkLCBmb2xsb3dlZCBieSBiZXN0LmJ3IHBvaW50aW5nIHRvIHRoZQotc2FtZSBidWZmZXIu
Ci0KLVNpbmNlOgotMTg3ZDM3OWQgYWRkIGEgZmFsbGJhY2sgdG8gQUxQSEFfTk9fQ09NUFJFU1NJ
T04KLQotSW4gYWRkaXRpb24sIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgb2YgVlA4Qml0V3JpdGVy
SW5pdCgpIGluIHRoaXMKLWZ1bmN0aW9uLgotCi1CdWc6IHdlYnA6NjAzCi1DaGFuZ2UtSWQ6IElj
MjU4MzgxZWUyNmM4YzE2YmMyMTFkMTU3YzgxNTM4MzFjOGM2OTEwCi0KLUNWRTogQ1ZFLTIwMjMt
MTk5OQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3dlYm1w
cm9qZWN0L2xpYndlYnAvY29tbWl0L2E0ODZkODAwYjYwZDBhZjRjYzA4MzZiZjdlZDhmMjFlMTI5
NzQxMjldCi1TaWduZWQtb2ZmLWJ5OiBOaWtoaWwgUiA8bmlraGlsLnJAa3BpdC5jb20+Ci0tLS0K
LSBzcmMvZW5jL2FscGhhX2VuYy5jIHwgNCArKystCi0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2VuYy9hbHBoYV9lbmMu
YyBiL3NyYy9lbmMvYWxwaGFfZW5jLmMKLWluZGV4IGY3YzAyNjkwZTMuLjdkMjA1NTg2ZmUgMTAw
NjQ0Ci0tLS0gYS9zcmMvZW5jL2FscGhhX2VuYy5jCi0rKysgYi9zcmMvZW5jL2FscGhhX2VuYy5j
Ci1AQCAtMTMsNiArMTMsNyBAQAotIAotICNpbmNsdWRlIDxhc3NlcnQuaD4KLSAjaW5jbHVkZSA8
c3RkbGliLmg+Ci0rI2luY2x1ZGUgPHN0cmluZy5oPgotIAotICNpbmNsdWRlICJzcmMvZW5jL3Zw
OGlfZW5jLmgiCi0gI2luY2x1ZGUgInNyYy9kc3AvZHNwLmgiCi1AQCAtMTQ4LDYgKzE0OSw3IEBA
IHN0YXRpYyBpbnQgRW5jb2RlQWxwaGFJbnRlcm5hbChjb25zdCB1aW50OF90KiBjb25zdCBkYXRh
LCBpbnQgd2lkdGgsIGludCBoZWlnaHQsCi0gICAgICAgfQotICAgICB9IGVsc2UgewotICAgICAg
IFZQOExCaXRXcml0ZXJXaXBlT3V0KCZ0bXBfYncpOwotKyAgICAgIG1lbXNldCgmcmVzdWx0LT5i
dywgMCwgc2l6ZW9mKHJlc3VsdC0+YncpKTsKLSAgICAgICByZXR1cm4gMDsKLSAgICAgfQotICAg
fQotQEAgLTE2Miw3ICsxNjQsNyBAQCBzdGF0aWMgaW50IEVuY29kZUFscGhhSW50ZXJuYWwoY29u
c3QgdWludDhfdCogY29uc3QgZGF0YSwgaW50IHdpZHRoLCBpbnQgaGVpZ2h0LAotICAgaGVhZGVy
ID0gbWV0aG9kIHwgKGZpbHRlciA8PCAyKTsKLSAgIGlmIChyZWR1Y2VfbGV2ZWxzKSBoZWFkZXIg
fD0gQUxQSEFfUFJFUFJPQ0VTU0VEX0xFVkVMUyA8PCA0OwotIAotLSAgVlA4Qml0V3JpdGVySW5p
dCgmcmVzdWx0LT5idywgQUxQSEFfSEVBREVSX0xFTiArIG91dHB1dF9zaXplKTsKLSsgIGlmICgh
VlA4Qml0V3JpdGVySW5pdCgmcmVzdWx0LT5idywgQUxQSEFfSEVBREVSX0xFTiArIG91dHB1dF9z
aXplKSkgb2sgPSAwOwotICAgb2sgPSBvayAmJiBWUDhCaXRXcml0ZXJBcHBlbmQoJnJlc3VsdC0+
YncsICZoZWFkZXIsIEFMUEhBX0hFQURFUl9MRU4pOwotICAgb2sgPSBvayAmJiBWUDhCaXRXcml0
ZXJBcHBlbmQoJnJlc3VsdC0+YncsIG91dHB1dCwgb3V0cHV0X3NpemUpOwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvd2VicC9saWJ3ZWJwXzEuMy4wLmJiIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvd2VicC9saWJ3ZWJwXzEuMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3dlYnAvbGlid2VicF8xLjMuMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvd2VicC9saWJ3ZWJwXzEuMy4xLmJi
CmluZGV4IDdjYTY3ZTQ0ZmIuLmI5ZTc2M2IwOGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL3dlYnAvbGlid2VicF8xLjMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS93ZWJwL2xpYndlYnBfMS4zLjEuYmIKQEAgLTE0LDE0ICsxNCwxMCBAQCBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT02ZThkZWU5MzJjMjZmMmRhYjUwM2FiZjcwYzk2
ZDhiYiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9QQVRFTlRTO21kNT1jNjkyNmQwY2Iw
N2QyOTZmODg2YWI2ZTBjYzVhODViNyIKIAogU1JDX1VSSSA9ICJodHRwOi8vZG93bmxvYWRzLndl
Ym1wcm9qZWN0Lm9yZy9yZWxlYXNlcy93ZWJwLyR7QlB9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI2NGFjNDYxNGRiMjkyYWU4YzVhYTI2ZGUwMjk1YmYxNjIzZGJiMzk4NTA1NGNiNjU2
YzU1ZTY3NDMxZGVmMTdjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIzNzc5NjI3YzJkZmQzMWUz
ZDhjNDQ4NTk2MmMyZWZlMTc3ODVlZjk3NWUyYmU1YzhjMGM5ZTZjZDNjNGVmNjYiCiAKIFVQU1RS
RUFNX0NIRUNLX1VSSSA9ICJodHRwOi8vZG93bmxvYWRzLndlYm1wcm9qZWN0Lm9yZy9yZWxlYXNl
cy93ZWJwL2luZGV4Lmh0bWwiCiAKLVNSQ19VUkkgKz0gIiBcCi0gICAgZmlsZTovL0NWRS0yMDIz
LTE5OTkucGF0Y2ggXAotIgotCiBFWFRSQV9PRUNPTkYgPSAiIFwKICAgICAtLWRpc2FibGUtd2lj
IFwKICAgICAtLWVuYWJsZS1saWJ3ZWJwbXV4IFwKLS0gCjIuMzkuMgoK

--===============7332912633511893503==--

