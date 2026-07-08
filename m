Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D49C44507
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:42:17 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2328.1783489329721327206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FhuApWCf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pJ3bTCCQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f403f7603-bff684b3-8023-40f6-a642-62a7e9daaf92-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783489328;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=tPrdoiOWQRgQoyWWuuPsGi63vjrDLK7YpfmaeQo/wi0=;
	b=FhuApWCf9lXwfv6omKyekoqpAFItxorED8eth7FdNfCOucbdhDk2lsmfVWcpI9cu
	Zqj2q+KYhCcVYdJz/FVp+Iz8alo6HiyjXTdiNZaHOatgUleZcdliKmQYakdDoZWOs+w
	g+UCaL/zZdJET2/EdH5ZYCDpXhNNQ80IchqVtJic=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783489328;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=tPrdoiOWQRgQoyWWuuPsGi63vjrDLK7YpfmaeQo/wi0=;
	b=pJ3bTCCQ6H6sb2Xb6zeaXq/pjwkHBnSPSvcwNvpGx2fHqKsg//LvhQ6yiZ/gzBW8
	PWLYfswb40dVqoCidvj8IUVsSzZsTTdeFyqh72YeNGaCKbg/jKXTRTsYGAM2zkEV+8g
	h5M46pNFHNIAqyHZaSLPAXJmOKCBQ/WgtrSt5Ryo=
Content-Type: multipart/mixed; boundary="===============5967743965657129617=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxfont2: upgrading to 2.0.8 SUCCEEDED
Message-ID: <0101019f403f7603-bff684b3-8023-40f6-a642-62a7e9daaf92-000000@us-west-2.amazonses.com>
Date: Wed, 8 Jul 2026 05:42:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.08-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240425

--===============5967743965657129617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxfont2* to *2.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxfont2-upgrade-2.0.7-2.0.8.patch
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
From 54bb2ba669c26975fcab4b118cb4210a9d2bb0bf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 8 Jul 2026 05:08:29 +0000
Subject: [PATCH] libxfont2: upgrade 2.0.7 -> 2.0.8

---
 .../xorg-lib/{libxfont2_2.0.7.bb => libxfont2_2.0.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.7.bb => libxfont2_2.0.8.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
index bf49d728b9..192c41d41c 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
@@ -15,7 +15,7 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"
+SRC_URI[sha256sum] = "f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.47.1


--===============5967743965657129617==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxfont2-upgrade-2.0.7-2.0.8.patch"

RnJvbSA1NGJiMmJhNjY5YzI2OTc1ZmNhYjRiMTE4Y2I0MjEwYTlkMmJiMGJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOCBKdWwgMjAyNiAwNTowODoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ynhmb250MjogdXBncmFkZSAyLjAuNyAtPiAyLjAuOAoKLS0tCiAuLi4veG9yZy1saWIve2xpYnhm
b250Ml8yLjAuNy5iYiA9PiBsaWJ4Zm9udDJfMi4wLjguYmJ9ICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve2xpYnhmb250Ml8yLjAuNy5iYiA9PiBsaWJ4Zm9udDJf
Mi4wLjguYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
bGliL2xpYnhmb250Ml8yLjAuNy5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4Zm9udDJfMi4wLjguYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhmb250Ml8yLjAuNy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhmb250Ml8yLjAuOC5iYgppbmRleCBiZjQ5
ZDcyOGI5Li4xOTJjNDFkNDFjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1saWIvbGlieGZvbnQyXzIuMC43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWxpYi9saWJ4Zm9udDJfMi4wLjguYmIKQEAgLTE1LDcgKzE1LDcgQEAgWE9SR19QTiA9ICJsaWJY
Zm9udDIiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiOGI3YjgyZmRlYmE0ODc2OWI2OTQzM2U4ZTNmYmI5ODRhNWY2YmYzNjhiMGQ1ZjQ3YWJlZWM0
OWRlM2U1OGVmYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNTU2YzBlMTA5M2E0ZTY5MTFjYzkw
YmM0YjEwNmQyMDE5MDJlZTE4N2ZkNzRhZjIwNmZmMTYyZjdlNmEyNGQ1IgogCiBQQUNLQUdFQ09O
RklHID8/PSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnaXB2NicsIGQp
fSIKIFBBQ0tBR0VDT05GSUdbaXB2Nl0gPSAiLS1lbmFibGUtaXB2NiwtLWRpc2FibGUtaXB2Niwi
Ci0tIAoyLjQ3LjEKCg==

--===============5967743965657129617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxfont2: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/x86-64-v3-poky-linux/libxfont2: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXfont2-2.0.7.tar.xz" to "https://www.x.org/releases//individual/lib/libXfont2-2.0.8.tar.xz"
packages/x86-64-v3-poky-linux/libxfont2: PV changed from "2.0.7" to "2.0.8"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dbg: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dbg: PV changed from "2.0.7" to "2.0.8"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dbg: PKGSIZE changed from 780984 to 782272 (+0%)
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dev: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-dev: PV changed from "2.0.7" to "2.0.8"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-doc: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-doc: PV changed from "2.0.7" to "2.0.8"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-locale: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-locale: PV changed from "2.0.7" to "2.0.8"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: FILELIST: directory renamed /usr/src/debug/libxfont2/2.0.7/src/FreeType -> /usr/src/debug/libxfont2/2.0.8/src/FreeType, directory renamed /usr/src/debug/libxfont2/2.0.7/src/stubs -> /usr/src/debug/libxfont2/2.0.8/src/stubs, directory renamed /usr/src/debug/libxfont2/2.0.7/src/fc -> /usr/src/debug/libxfont2/2.0.8/src/fc, directory renamed /usr/src/debug/libxfont2/2.0.7/src/util -> /usr/src/debug/libxfont2/2.0.8/src/util, directory renamed /usr/src/debug/libxfont2/2.0.7/src/bitmap -> /usr/src/debug/libxfont2/2.0.8/src/bitmap, directory renamed /usr/src/debug/libxfont2/2.0.7/include -> /usr/src/debug/libxfont2/2.0.8/include, directory renamed /usr/src/debug/libxfont2/2.0.7/src/builtins -> /usr/src/debug/libxfont2/2.0.8/src/builtins, directory renamed /usr/src/debug/libxfont2/2.0.7/include/X11/fonts -> /usr/src/debug/libxfont2/2.0.8/include/X11/fonts, removed "/usr/src/debug/libxfont2/2.0.7/src/fontfile/fontdir.c /usr/src/debug/libxf
 ont2/2.0.7/src/fontfile/defaults.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/fontencc.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/bufio.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/decompress.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/fontfile.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/catalogue.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/register.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/dirfile.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/fileio.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/gunzip.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/filewr.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/fontscale.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/bitsource.c /usr/src/debug/libxfont2/2.0.7/src/fontfile/renderers.c", added "/usr/src/debug/libxfont2/2.0.8/src/fontfile/fontdir.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/defaults.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/decompress.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/bufio.c /usr/src/debug/libxfont2
 /2.0.8/src/fontfile/fontfile.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/catalogue.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/register.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/dirfile.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/fileio.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/gunzip.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/filewr.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/fontscale.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/bitsource.c /usr/src/debug/libxfont2/2.0.8/src/fontfile/renderers.c"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: PV changed from "2.0.7" to "2.0.8"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-src: PKGSIZE changed from 793559 to 793993 (+0%)
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-staticdev: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2-staticdev: PV changed from "2.0.7" to "2.0.8"
packages/x86-64-v3-poky-linux/libxfont2/libxfont2: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/x86-64-v3-poky-linux/libxfont2/libxfont2: PV changed from "2.0.7" to "2.0.8"

--===============5967743965657129617==--

