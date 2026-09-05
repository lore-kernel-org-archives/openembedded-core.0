Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD9CC79F95
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 06:28:40 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3416.1788589715343453452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 23:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g/WSi0e6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=g+V9nFDe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0704137a0-89698f1a-1f9c-4cdb-8bf4-55df2880f88c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788589717;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=xHLGmtdutWylv7FqYMQozkMb9VUMMwa7t5nmQdUU7lo=;
	b=g/WSi0e6j55Q9k44bVxo9FPOZJeFkG5kF3AMWNQHjUeAtU0Bf6qmqPW8zEvsz7aE
	3vbGwCAmuO95wkOpscg6MuMpFWlji8A2h7aATq21098R2TaziFfI/skj+yjOEZlQwlI
	8YgYEwBpIn6rZ4SuIlzMmSsq5OfOteIrMqdy9jCY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788589717;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=xHLGmtdutWylv7FqYMQozkMb9VUMMwa7t5nmQdUU7lo=;
	b=g+V9nFDefb0jbw3vCswlFfnYPgDtc8+uktVzzt/ELxSkes3oNWvzsi2ToLCZFPfv
	H67/fu2v+dRWHG2yQHf/UrsslNgYPcegob8jqULO9qrACj6FMXwG2gJRqeF3NMSoOwT
	1cGskL7n6xa8WZpn8W67wMrjRkjH/uEZ5Q4y0rRM=
Content-Type: multipart/mixed; boundary="===============5381132512336290848=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] taglib: upgrading to 2.3.2 SUCCEEDED
Message-ID: <010101a0704137a0-89698f1a-1f9c-4cdb-8bf4-55df2880f88c-000000@us-west-2.amazonses.com>
Date: Sat, 5 Sep 2026 06:28:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 06:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245139

--===============5381132512336290848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *taglib* to *2.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-taglib-upgrade-2.3.1-2.3.2.patch
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
From ea32581e8dc27750a31f167a93717b1094a9554a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 5 Sep 2026 06:28:28 +0000
Subject: [PATCH] taglib: upgrade 2.3.1 -> 2.3.2

Source: CHANGELOG.md

TagLib 2.3.2 (Sep 5, 2026)
==========================

 * MP3: Fix parsing of per-frame unsynchronized ID3v2 frames.
 * MP3: Accept iTunes ID3 frames with space padded ID3v2.2 ID.
 * MP4: More tolerant handling of `covr` atom with wrong flags.
 * MP4: Support additional codecs (AC3, DTS, EAC3, FLAC, Opus).
 * Ogg: Support Vorbis comments from a multiplexed stream.
 * WMA: Improve property interface for ASF files.
 * RIFF: Support RF64 and BW64 64-bit extensions.
 * Matroska: Fix file scanning with fast read style.
 * Matroska: Load attachment data lazily on demand.
 * Matroska: Read the segment title without audio properties.
 * Verify values parsed from files to prevent resource exhaustion, denial of
   service attacks and out of range conversions by crafted input for various
   file formats (AIFF, APE, DSDIFF, FLAC, MP3, MP4, MPC, Matroska, Ogg, SHN,
   WMA, XM).
 * Fix data races in lazily initialized shared caches, test thread safety.
 * Use `Requires.private` for zlib with `pkg-config`.
---
 .../recipes-support/taglib/{taglib_2.3.1.bb => taglib_2.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.3.1.bb => taglib_2.3.2.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.3.1.bb b/meta/recipes-support/taglib/taglib_2.3.2.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.3.1.bb
rename to meta/recipes-support/taglib/taglib_2.3.2.bb
index 0852295650..1156e44e67 100644
--- a/meta/recipes-support/taglib/taglib_2.3.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.3.2.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "a19d90e6fd41d09a0281ec0fe762d51491d7a6ccffc923c4f7868c5e647ca230"
+SRC_URI[sha256sum] = "3ca2d8afaa7f1cf7f6ed10e511ebc368bfacd6dcaa3dbfa690b89e502e8963dc"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.47.1


--===============5381132512336290848==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-taglib-upgrade-2.3.1-2.3.2.patch"

RnJvbSBlYTMyNTgxZThkYzI3NzUwYTMxZjE2N2E5MzcxN2IxMDk0YTk1NTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNSBTZXAgMjAyNiAwNjoyODoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRh
Z2xpYjogdXBncmFkZSAyLjMuMSAtPiAyLjMuMgoKU291cmNlOiBDSEFOR0VMT0cubWQKClRhZ0xp
YiAyLjMuMiAoU2VwIDUsIDIwMjYpCj09PT09PT09PT09PT09PT09PT09PT09PT09CgogKiBNUDM6
IEZpeCBwYXJzaW5nIG9mIHBlci1mcmFtZSB1bnN5bmNocm9uaXplZCBJRDN2MiBmcmFtZXMuCiAq
IE1QMzogQWNjZXB0IGlUdW5lcyBJRDMgZnJhbWVzIHdpdGggc3BhY2UgcGFkZGVkIElEM3YyLjIg
SUQuCiAqIE1QNDogTW9yZSB0b2xlcmFudCBoYW5kbGluZyBvZiBgY292cmAgYXRvbSB3aXRoIHdy
b25nIGZsYWdzLgogKiBNUDQ6IFN1cHBvcnQgYWRkaXRpb25hbCBjb2RlY3MgKEFDMywgRFRTLCBF
QUMzLCBGTEFDLCBPcHVzKS4KICogT2dnOiBTdXBwb3J0IFZvcmJpcyBjb21tZW50cyBmcm9tIGEg
bXVsdGlwbGV4ZWQgc3RyZWFtLgogKiBXTUE6IEltcHJvdmUgcHJvcGVydHkgaW50ZXJmYWNlIGZv
ciBBU0YgZmlsZXMuCiAqIFJJRkY6IFN1cHBvcnQgUkY2NCBhbmQgQlc2NCA2NC1iaXQgZXh0ZW5z
aW9ucy4KICogTWF0cm9za2E6IEZpeCBmaWxlIHNjYW5uaW5nIHdpdGggZmFzdCByZWFkIHN0eWxl
LgogKiBNYXRyb3NrYTogTG9hZCBhdHRhY2htZW50IGRhdGEgbGF6aWx5IG9uIGRlbWFuZC4KICog
TWF0cm9za2E6IFJlYWQgdGhlIHNlZ21lbnQgdGl0bGUgd2l0aG91dCBhdWRpbyBwcm9wZXJ0aWVz
LgogKiBWZXJpZnkgdmFsdWVzIHBhcnNlZCBmcm9tIGZpbGVzIHRvIHByZXZlbnQgcmVzb3VyY2Ug
ZXhoYXVzdGlvbiwgZGVuaWFsIG9mCiAgIHNlcnZpY2UgYXR0YWNrcyBhbmQgb3V0IG9mIHJhbmdl
IGNvbnZlcnNpb25zIGJ5IGNyYWZ0ZWQgaW5wdXQgZm9yIHZhcmlvdXMKICAgZmlsZSBmb3JtYXRz
IChBSUZGLCBBUEUsIERTRElGRiwgRkxBQywgTVAzLCBNUDQsIE1QQywgTWF0cm9za2EsIE9nZywg
U0hOLAogICBXTUEsIFhNKS4KICogRml4IGRhdGEgcmFjZXMgaW4gbGF6aWx5IGluaXRpYWxpemVk
IHNoYXJlZCBjYWNoZXMsIHRlc3QgdGhyZWFkIHNhZmV0eS4KICogVXNlIGBSZXF1aXJlcy5wcml2
YXRlYCBmb3IgemxpYiB3aXRoIGBwa2ctY29uZmlnYC4KLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0
L3RhZ2xpYi97dGFnbGliXzIuMy4xLmJiID0+IHRhZ2xpYl8yLjMuMi5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC90YWdsaWIve3RhZ2xpYl8yLjMuMS5iYiA9PiB0YWdsaWJfMi4zLjIuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3RhZ2xpYl8y
LjMuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4zLjIuYmIKc2lt
aWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGli
L3RhZ2xpYl8yLjMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdGFnbGliL3Rh
Z2xpYl8yLjMuMi5iYgppbmRleCAwODUyMjk1NjUwLi4xMTU2ZTQ0ZTY3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMy4xLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4zLjIuYmIKQEAgLTExLDcgKzExLDcgQEAgREVQ
RU5EUyA9ICJ6bGliIHV0ZmNwcCIKIAogU1JDX1VSSSA9ICJodHRwOi8vdGFnbGliLmdpdGh1Yi5p
by9yZWxlYXNlcy8ke0JQfS50YXIuZ3oiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMTlkOTBl
NmZkNDFkMDlhMDI4MWVjMGZlNzYyZDUxNDkxZDdhNmNjZmZjOTIzYzRmNzg2OGM1ZTY0N2NhMjMw
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNjYTJkOGFmYWE3ZjFjZjdmNmVkMTBlNTExZWJjMzY4
YmZhY2Q2ZGNhYTNkYmZhNjkwYjg5ZTUwMmU4OTYzZGMiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL3RhZ2xpYi5vcmcvIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAidGFnbGliLSg/
UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgotLSAKMi40Ny4xCgo=

--===============5381132512336290848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/taglib: SRC_URI changed from "http://taglib.github.io/releases/taglib-2.3.1.tar.gz" to "http://taglib.github.io/releases/taglib-2.3.2.tar.gz"
packages/x86-64-v3-poky-linux/taglib: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/taglib: PV changed from "2.3.1" to "2.3.2"
Changes to packages/x86-64-v3-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.3.1 to libtag_c.so.2.3.2
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.3.1 to libtag.so.2.3.2
  /usr/lib/libtag_c.so.2.3.1 moved to /usr/lib/libtag_c.so.2.3.2
  /usr/lib/libtag.so.2.3.1 moved to /usr/lib/libtag.so.2.3.2
packages/x86-64-v3-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.3.1", added "/usr/lib/libtag_c.so.2.3.2"
packages/x86-64-v3-poky-linux/taglib/taglib-c: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-c: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: FILELIST: removed "/usr/lib/.debug/libtag_c.so.2.3.1 /usr/lib/.debug/libtag.so.2.3.1", added "/usr/lib/.debug/libtag.so.2.3.2 /usr/lib/.debug/libtag_c.so.2.3.2"
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PKGSIZE changed from 31483792 to 31983904 (+2%)
packages/x86-64-v3-poky-linux/taglib/taglib-dbg: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PKGSIZE changed from 835775 to 840960 (+1%)
packages/x86-64-v3-poky-linux/taglib/taglib-dev: RDEPENDS: added "zlib-dev"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-doc: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-locale: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/taglib/taglib-src: FILELIST: directory renamed /usr/src/debug/taglib/2.3.1/taglib/matroska -> /usr/src/debug/taglib/2.3.2/taglib/matroska, directory renamed /usr/src/debug/taglib/2.3.1/taglib/ogg -> /usr/src/debug/taglib/2.3.2/taglib/ogg, directory renamed /usr/src/debug/taglib/2.3.1/taglib/wavpack -> /usr/src/debug/taglib/2.3.2/taglib/wavpack, directory renamed /usr/src/debug/taglib/2.3.1/taglib/riff/wav -> /usr/src/debug/taglib/2.3.2/taglib/riff/wav, directory renamed /usr/src/debug/taglib/2.3.1/taglib/s3m -> /usr/src/debug/taglib/2.3.2/taglib/s3m, directory renamed /usr/src/debug/taglib/2.3.1/taglib/shorten -> /usr/src/debug/taglib/2.3.2/taglib/shorten, directory renamed /usr/src/debug/taglib/2.3.1/taglib/xm -> /usr/src/debug/taglib/2.3.2/taglib/xm, directory renamed /usr/src/debug/taglib/2.3.1/taglib/dsf -> /usr/src/debug/taglib/2.3.2/taglib/dsf, directory renamed /usr/src/debug/taglib/2.3.1/taglib/mpeg/id3v2 -> /usr/src/debug/taglib/2.3.2/taglib/mpe
 g/id3v2, directory renamed /usr/src/debug/taglib/2.3.1/taglib/mpeg/id3v1 -> /usr/src/debug/taglib/2.3.2/taglib/mpeg/id3v1, directory renamed /usr/src/debug/taglib/2.3.1/taglib/ape -> /usr/src/debug/taglib/2.3.2/taglib/ape, directory renamed /usr/src/debug/taglib/2.3.1/taglib -> /usr/src/debug/taglib/2.3.2/taglib, directory renamed /usr/src/debug/taglib/2.3.1/taglib/mp4 -> /usr/src/debug/taglib/2.3.2/taglib/mp4, directory renamed /usr/src/debug/taglib/2.3.1/taglib/ogg/vorbis -> /usr/src/debug/taglib/2.3.2/taglib/ogg/vorbis, directory renamed /usr/src/debug/taglib/2.3.1/taglib/dsdiff -> /usr/src/debug/taglib/2.3.2/taglib/dsdiff, directory renamed /usr/src/debug/taglib/2.3.1/taglib/mod -> /usr/src/debug/taglib/2.3.2/taglib/mod, directory renamed /usr/src/debug/taglib/2.3.1/taglib/flac -> /usr/src/debug/taglib/2.3.2/taglib/flac, directory renamed /usr/src/debug/taglib/2.3.1/taglib/it -> /usr/src/debug/taglib/2.3.2/taglib/it, directory renamed /usr/src/debug/taglib/2.3.1/taglib/toolkit -
 > /usr/src/debug/taglib/2.3.2/taglib/toolkit, directory renamed /usr/src/debug/taglib/2.3.1/taglib/ogg/speex -> /usr/src/debug/taglib/2.3.2/taglib/ogg/speex, directory renamed /usr/src/debug/taglib/2.3.1/bindings/c -> /usr/src/debug/taglib/2.3.2/bindings/c, directory renamed /usr/src/debug/taglib/2.3.1/taglib/riff -> /usr/src/debug/taglib/2.3.2/taglib/riff, directory renamed /usr/src/debug/taglib/2.3.1/taglib/ogg/opus -> /usr/src/debug/taglib/2.3.2/taglib/ogg/opus, directory renamed /usr/src/debug/taglib/2.3.1/taglib/riff/aiff -> /usr/src/debug/taglib/2.3.2/taglib/riff/aiff, directory renamed /usr/src/debug/taglib/2.3.1/taglib/trueaudio -> /usr/src/debug/taglib/2.3.2/taglib/trueaudio, directory renamed /usr/src/debug/taglib/2.3.1/taglib/mpeg/id3v2/frames -> /usr/src/debug/taglib/2.3.2/taglib/mpeg/id3v2/frames, directory renamed /usr/src/debug/taglib/2.3.1/taglib/asf -> /usr/src/debug/taglib/2.3.2/taglib/asf, directory renamed /usr/src/debug/taglib/2.3.1/taglib/ogg/flac -> /usr/src/d
 ebug/taglib/2.3.2/taglib/ogg/flac, directory renamed /usr/src/debug/taglib/2.3.1/taglib/mpc -> /usr/src/debug/taglib/2.3.2/taglib/mpc, directory renamed /usr/src/debug/taglib/2.3.1/taglib/mpeg -> /usr/src/debug/taglib/2.3.2/taglib/mpeg, removed "/usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmluintelement.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmktracks.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlelement.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlbinaryelement.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlvoidelement.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlstringelement.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlelement.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmkattachments.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmktags.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlutils.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmkchapters.cpp /usr/src/debug/taglib
 /2.3.1/taglib/matroska/ebml/ebmlmkinfo.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlutils.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmktags.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmkinfo.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmluintelement.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmktracks.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmkseekhead.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlstringelement.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlvoidelement.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmasterelement.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmkseekhead.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmksegment.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlfloatelement.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmkchapters.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmkattachments.cpp /usr/src/debug/
 taglib/2.3.1/taglib/matroska/ebml/ebmlfloatelement.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmasterelement.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmkcues.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmksegment.h /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlmkcues.cpp /usr/src/debug/taglib/2.3.1/taglib/matroska/ebml/ebmlbinaryelement.h", added "/usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmluintelement.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmktracks.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlelement.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlbinaryelement.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlvoidelement.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmldeferredbinaryelement.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlstringelement.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlelement.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmkcues
 .cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmkattachments.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmktags.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlutils.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmkchapters.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmkinfo.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlutils.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmktags.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmkinfo.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmluintelement.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmktracks.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmkseekhead.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlstringelement.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlvoidelement.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmasterelement.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmkseekhead.cpp /us
 r/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlfloatelement.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmkattachments.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmkchapters.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmksegment.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlfloatelement.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmasterelement.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmkcues.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlmksegment.h /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmldeferredbinaryelement.cpp /usr/src/debug/taglib/2.3.2/taglib/matroska/ebml/ebmlbinaryelement.h"
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-src: PKGSIZE changed from 2084558 to 2146385 (+3%)
packages/x86-64-v3-poky-linux/taglib/taglib-src: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib-staticdev: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.3.1", added "/usr/lib/libtag.so.2.3.2"
packages/x86-64-v3-poky-linux/taglib/taglib: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/taglib/taglib: PKGSIZE changed from 1632375 to 1677503 (+3%)
packages/x86-64-v3-poky-linux/taglib/taglib: PV changed from "2.3.1" to "2.3.2"

--===============5381132512336290848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="taglib-changelog.txt"

Changelog for taglib: 2.3.1 -> 2.3.2
Source: CHANGELOG.md

TagLib 2.3.2 (Sep 5, 2026)
==========================

 * MP3: Fix parsing of per-frame unsynchronized ID3v2 frames.
 * MP3: Accept iTunes ID3 frames with space padded ID3v2.2 ID.
 * MP4: More tolerant handling of `covr` atom with wrong flags.
 * MP4: Support additional codecs (AC3, DTS, EAC3, FLAC, Opus).
 * Ogg: Support Vorbis comments from a multiplexed stream.
 * WMA: Improve property interface for ASF files.
 * RIFF: Support RF64 and BW64 64-bit extensions.
 * Matroska: Fix file scanning with fast read style.
 * Matroska: Load attachment data lazily on demand.
 * Matroska: Read the segment title without audio properties.
 * Verify values parsed from files to prevent resource exhaustion, denial of
   service attacks and out of range conversions by crafted input for various
   file formats (AIFF, APE, DSDIFF, FLAC, MP3, MP4, MPC, Matroska, Ogg, SHN,
   WMA, XM).
 * Fix data races in lazily initialized shared caches, test thread safety.
 * Use `Requires.private` for zlib with `pkg-config`.

--===============5381132512336290848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/taglib (sysroot):
  /usr/lib/libtag_c.so.2 changed symlink target from libtag_c.so.2.3.1 to libtag_c.so.2.3.2
  /usr/lib/libtag.so.2 changed symlink target from libtag.so.2.3.1 to libtag.so.2.3.2
  /usr/lib/libtag_c.so.2.3.1 moved to /usr/lib/libtag_c.so.2.3.2
  /usr/lib/libtag.so.2.3.1 moved to /usr/lib/libtag.so.2.3.2
packages/x86-64-v3-poky-linux/taglib/taglib-c: FILELIST: removed "/usr/lib/libtag_c.so.2.3.1", added "/usr/lib/libtag_c.so.2.3.2"
packages/x86-64-v3-poky-linux/taglib/taglib-dev: RDEPENDS: added "zlib-dev"
packages/x86-64-v3-poky-linux/taglib/taglib: FILELIST: removed "/usr/lib/libtag.so.2.3.1", added "/usr/lib/libtag.so.2.3.2"

--===============5381132512336290848==--

