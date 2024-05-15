Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D40C25B7E
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1261.1715794339650830824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=h37r8piK;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IySN9M5U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f7d4fe2e9-de8be4bd-76f3-4236-b77d-a832785885a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U1MEAR251p4j9fjxIW2gaw2TY33MRPMVEY0QxRx2UrY=;
	b=h37r8piKEiMVn2DZ5wV2bv9WURw5N1uztXTXohAO+f/Mjazpawwi20Hnoj0E2F0J
	q6OvL3LByzQ6u0yeBRQUM4lxyAgNOFR7pNCinhUnAqr5HNQlwDull6CST/Wh3G+/da+
	2eoEsaXUdn5cJaIADXToC5HUF5jXRv2oK6ZVZMLA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U1MEAR251p4j9fjxIW2gaw2TY33MRPMVEY0QxRx2UrY=;
	b=IySN9M5UKFnYSgg5alZ9CmUIC5Bf732D8qNrtulAwyTtDGJ25uxYEbGsdvN0tT3C
	1qOAhrt3eGrSQYwGAQoGfAgOStLEXqbqAd4qTaSQdv1Y2R8szVjKNbcIEmPgrow4s2r
	Meelji+g1tIiHVxyQnygOjn+1hwjXgMzNIzKFzFw=
Content-Type: multipart/mixed; boundary="===============7982270639538817901=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.19 SUCCEEDED
Message-ID: <0101018f7d4fe2e9-de8be4bd-76f3-4236-b77d-a832785885a2-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199391

--===============7982270639538817901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxmlb* to *0.3.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.18-0.3.19.patch
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
From 743a030fd3c0445fadb8bddbcda3c3d4eec5beb9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 13:00:41 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.18 -> 0.3.19

---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch     | 2 +-
 .../libxmlb/{libxmlb_0.3.18.bb => libxmlb_0.3.19.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.18.bb => libxmlb_0.3.19.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 27081d8749..2502183965 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 8a1aa4c318b8dbe4c0c2b1c4968f867ea6641b32 Mon Sep 17 00:00:00 2001
+From 14c401926084f683fe92be4a25e899ad832b9c6e Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb
index 10ceab0721..de8d860d00 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "59cf2e0bf3c4d0905a32e32828d6100784993621"
+SRCREV = "4393955fb7c8bbcb6a2c65ff54f16c39dc165e59"
 S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 xz zstd"
-- 
2.44.0


--===============7982270639538817901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxmlb: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 1747984 to 1748760 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 352371 to 355313 (+1%)
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: RDEPENDS: removed "libxmlb", added "libxmlb (['>= 0.3.19'])"
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PKGSIZE changed from 265318 to 277606 (+5%)
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 509106 to 511212 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-src: FILELIST: removed "/usr/src/debug/libxmlb/0.3.18/src/xb-builder.h /usr/src/debug/libxmlb/0.3.18/src/xb-machine.h /usr/src/debug/libxmlb/0.3.18/src/xb-query-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-node-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-common.c /usr/src/debug/libxmlb/0.3.18/src/xb-machine.c /usr/src/debug/libxmlb/0.3.18/src/xb-node.c /usr/src/debug/libxmlb/0.3.18/src/xb-builder-node-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder.c /usr/src/debug/libxmlb/0.3.18/src/xb-node.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-node.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-source-ctx-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-string.c /usr/src/debug/libxmlb/0.3.18/src/xb-value-bindings.c /usr/src/debug/libxmlb/0.3.18/src/xb-silo-export-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-value-bindings.h /usr/src/debug/libxmlb/0.3.18/src/xb-string.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-node.c /usr/src/debu
 g/libxmlb/0.3.18/src/xb-builder-source.h /usr/src/debug/libxmlb/0.3.18/src/xb-lzma-decompressor.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo.c /usr/src/debug/libxmlb/0.3.18/src/xb-builder-source.c /usr/src/debug/libxmlb/0.3.18/src/xb-lzma-decompressor.c /usr/src/debug/libxmlb/0.3.18/src/xb-stack.h /usr/src/debug/libxmlb/0.3.18/src/xb-machine-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-opcode.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo-export.c /usr/src/debug/libxmlb/0.3.18/src/xb-silo-node.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-stack.c /usr/src/debug/libxmlb/0.3.18/src/xb-string-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo-export.h /usr/src/debug/libxmlb/0.3.18/src/xb-opcode.c /usr/src/debug/libxmlb/0.3.18/src/xb-query.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-fixup-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-query.c /usr/src/debug/libxmlb/0.3.18/src/xb-value-bindings-pri
 vate.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-source-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-node-query.c /usr/src/debug/libxmlb/0.3.18/src/xb-builder-source-ctx.c /usr/src/debug/libxmlb/0.3.18/src/xb-self-test.c /usr/src/debug/libxmlb/0.3.18/src/xb-stack-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-node-query.h /usr/src/debug/libxmlb/0.3.18/src/xb-tool.c /usr/src/debug/libxmlb/0.3.18/src/xb-builder-source-ctx.h /usr/src/debug/libxmlb/0.3.18/src/xb-zstd-decompressor.h /usr/src/debug/libxmlb/0.3.18/src/xb-opcode-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-fixup.h /usr/src/debug/libxmlb/0.3.18/src/xb-query-context.c /usr/src/debug/libxmlb/0.3.18/src/xb-zstd-decompressor.c /usr/src/debug/libxmlb/0.3.18/src/xb-silo-query-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-query-context.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-fixup.c /usr/src/debug/libxmlb/0.3.18/src/xb-common-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo-query.c /usr/src/debug/libxmlb/0
 .3.18/src/xb-node-silo.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo-query.h", added "/usr/src/debug/libxmlb/0.3.19/src/xb-builder.h /usr/src/debug/libxmlb/0.3.19/src/xb-machine.h /usr/src/debug/libxmlb/0.3.19/src/xb-query-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-node-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-common.c /usr/src/debug/libxmlb/0.3.19/src/xb-machine.c /usr/src/debug/libxmlb/0.3.19/src/xb-node.c /usr/src/debug/libxmlb/0.3.19/src/xb-builder-node-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder.c /usr/src/debug/libxmlb/0.3.19/src/xb-node.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-node.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source-ctx-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-string.c /usr/src/debug/libxmlb/0.3.19/src/xb-value-bindings.c /usr/src/debug/libxmlb/0.3.19/src/xb-silo-export-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-value-bindings.h /usr/src/debug/libxmlb/0.3.19/src/xb-string.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-node
 .c /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source.h /usr/src/debug/libxmlb/0.3.19/src/xb-lzma-decompressor.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo.c /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source.c /usr/src/debug/libxmlb/0.3.19/src/xb-lzma-decompressor.c /usr/src/debug/libxmlb/0.3.19/src/xb-stack.h /usr/src/debug/libxmlb/0.3.19/src/xb-machine-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-opcode.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo-export.c /usr/src/debug/libxmlb/0.3.19/src/xb-silo-node.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-stack.c /usr/src/debug/libxmlb/0.3.19/src/xb-string-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo-export.h /usr/src/debug/libxmlb/0.3.19/src/xb-opcode.c /usr/src/debug/libxmlb/0.3.19/src/xb-query.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-fixup-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-version.c /usr/src/debug/libxmlb/0.3.19/src/xb-
 query.c /usr/src/debug/libxmlb/0.3.19/src/xb-value-bindings-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-version.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-node-query.c /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source-ctx.c /usr/src/debug/libxmlb/0.3.19/src/xb-self-test.c /usr/src/debug/libxmlb/0.3.19/src/xb-stack-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-node-query.h /usr/src/debug/libxmlb/0.3.19/src/xb-tool.c /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source-ctx.h /usr/src/debug/libxmlb/0.3.19/src/xb-zstd-decompressor.h /usr/src/debug/libxmlb/0.3.19/src/xb-opcode-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-fixup.h /usr/src/debug/libxmlb/0.3.19/src/xb-query-context.c /usr/src/debug/libxmlb/0.3.19/src/xb-zstd-decompressor.c /usr/src/debug/libxmlb/0.3.19/src/xb-silo-query-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-query-context.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-fixup.c /usr/src/debug/lib
 xmlb/0.3.19/src/xb-common-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo-query.c /usr/src/debug/libxmlb/0.3.19/src/xb-node-silo.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo-query.h"
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb: PKGSIZE changed from 195068 to 195324 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.18 [default] to 0.3.19 [default]

--===============7982270639538817901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: RDEPENDS: removed "libxmlb", added "libxmlb (['>= 0.3.19'])"

--===============7982270639538817901==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.18-0.3.19.patch"

RnJvbSA3NDNhMDMwZmQzYzA0NDVmYWRiOGJkZGJjZGEzYzNkNGVlYzViZWI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTM6MDA6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWxiOiB1cGdyYWRlIDAuMy4xOCAtPiAwLjMuMTkKCi0tLQogLi4uL2xpYnhtbGIvMDAwMS14
Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggICAgIHwgMiArLQogLi4u
L2xpYnhtbGIve2xpYnhtbGJfMC4zLjE4LmJiID0+IGxpYnhtbGJfMC4zLjE5LmJifSAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIve2xpYnhtbGJfMC4zLjE4LmJi
ID0+IGxpYnhtbGJfMC4zLjE5LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
bm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9T
UkNESVIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAwMDEteGIt
c2VsZnRlc3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElSLnBhdGNoCmluZGV4IDI3MDgxZDg3NDku
LjI1MDIxODM5NjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnht
bGIvMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFy
ZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGExYWE0YzMx
OGI4ZGJlNGMwYzJiMWM0OTY4Zjg2N2VhNjY0MWIzMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMTRjNDAxOTI2MDg0ZjY4M2ZlOTJiZTRhMjVlODk5YWQ4MzJiOWM2ZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KIERh
dGU6IFNhdCwgMTYgU2VwIDIwMjMgMTQ6MDI6NTcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0geGIt
c2VsZi10ZXN0LmM6IGhhcmRjb2RlIEdfVEVTVF9TUkNESVIKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGJfMC4zLjE4LmJiIGIvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYl8wLjMuMTkuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMTguYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGJfMC4zLjE5LmJiCmluZGV4IDEwY2Vh
YjA3MjEuLmRlOGQ4NjBkMDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxi
L2xpYnhtbGJfMC4zLjE4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnht
bGJfMC4zLjE5LmJiCkBAIC04LDcgKzgsNyBAQCBTUkNfVVJJID0gIiBcCiAJZmlsZTovLzAwMDEt
eGItc2VsZnRlc3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElSLnBhdGNoIFwKIAlmaWxlOi8vcnVu
LXB0ZXN0IFwKICIKLVNSQ1JFViA9ICI1OWNmMmUwYmYzYzRkMDkwNWEzMmUzMjgyOGQ2MTAwNzg0
OTkzNjIxIgorU1JDUkVWID0gIjQzOTM5NTVmYjdjOGJiY2I2YTJjNjVmZjU0ZjE2YzM5ZGMxNjVl
NTkiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBERVBFTkRTID0gImdsaWItMi4wIHh6IHpzdGQi
Ci0tIAoyLjQ0LjAKCg==

--===============7982270639538817901==--

