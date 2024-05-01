Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0D4C2BA2B
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1096.1714579215359261225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=efnOLWTE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3LzKb4yV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f34e295d0-f9142f59-289a-426f-abfb-f535c8690fed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wc9i7eorYoYmY2cPUgU6MiK4WBSvagRwO7dArLnvOVk=;
	b=efnOLWTEErRlKixzXOg0g0mUtVtL2fsrzJhBd0TOGn5c2QvRVa9H/hbGCQI8O2Qn
	ZqoZTGxy+WQ3Xgadr7Qu5+Z0wOhfNfg+FPHBDh20GR6V7VCkhbp5Y2V1OLOwySSms4M
	m65LX5UBWA+0o6oYptnBPWI11+ruzPl81e/ysA7I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wc9i7eorYoYmY2cPUgU6MiK4WBSvagRwO7dArLnvOVk=;
	b=3LzKb4yVkHqVaAVL96ju/phaBu6ageftF1vi5udBs2n/uuiFHHqHpusYWtadcbJL
	gnbUkT/URiizcY9N+VSlVxV84w04vkgRjFLl70cHXa8X1zpPtwJiLYb2rUmGAw93lmu
	KOh1DQqOg/VkFodmFbcRwX3pV/aKZR56tm5moDkM=
Content-Type: multipart/mixed; boundary="===============5001776258646469183=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.19 SUCCEEDED
Message-ID: <0101018f34e295d0-f9142f59-289a-426f-abfb-f535c8690fed-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198833

--===============5001776258646469183==
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
From cb63bad3db64e0c14ceebd4949341a147f699193 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 10:06:12 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.18 -> 0.3.19

---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch     | 2 +-
 .../libxmlb/{libxmlb_0.3.18.bb => libxmlb_0.3.19.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.18.bb => libxmlb_0.3.19.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 27081d8749..a811b1bb70 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From 8a1aa4c318b8dbe4c0c2b1c4968f867ea6641b32 Mon Sep 17 00:00:00 2001
+From a99423a8674a6341badc2af3137e37e028b24e82 Mon Sep 17 00:00:00 2001
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


--===============5001776258646469183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: RDEPENDS: removed "libxmlb", added "libxmlb (['>= 0.3.19'])"

--===============5001776258646469183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxmlb: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 1747776 to 1748560 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 352371 to 355313 (+1%)
packages/core2-64-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: RDEPENDS: removed "libxmlb", added "libxmlb (['>= 0.3.19'])"
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PKGSIZE changed from 265318 to 277606 (+5%)
packages/core2-64-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 509106 to 511212 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb-src: FILELIST: removed "/usr/src/debug/libxmlb/0.3.18/src/xb-builder-node-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-fixup-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-node.c /usr/src/debug/libxmlb/0.3.18/src/xb-string-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-node.h /usr/src/debug/libxmlb/0.3.18/src/xb-opcode-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-source-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder.c /usr/src/debug/libxmlb/0.3.18/src/xb-node-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-lzma-decompressor.c /usr/src/debug/libxmlb/0.3.18/src/xb-builder.h /usr/src/debug/libxmlb/0.3.18/src/xb-node-silo.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-source-ctx-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-node.c /usr/src/debug/libxmlb/0.3.18/src/xb-lzma-decompressor.h /usr/src/debug/libxmlb/0.3.18/src/xb-value-bindings-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-node.h /usr/src/
 debug/libxmlb/0.3.18/src/xb-stack.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo-export.c /usr/src/debug/libxmlb/0.3.18/src/xb-builder-source.c /usr/src/debug/libxmlb/0.3.18/src/xb-stack.c /usr/src/debug/libxmlb/0.3.18/src/xb-builder-source.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo-export.h /usr/src/debug/libxmlb/0.3.18/src/xb-zstd-decompressor.c /usr/src/debug/libxmlb/0.3.18/src/xb-tool.c /usr/src/debug/libxmlb/0.3.18/src/xb-builder-source-ctx.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo.h /usr/src/debug/libxmlb/0.3.18/src/xb-zstd-decompressor.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo.c /usr/src/debug/libxmlb/0.3.18/src/xb-builder-source-ctx.c /usr/src/debug/libxmlb/0.3.18/src/xb-query.h /usr/src/debug/libxmlb/0.3.18/src/xb-node-query.h /usr/src/debug/libxmlb/0.3.18/src/xb-node-query.c /usr/src/debug/libxmlb/0.3.18/src/xb-common-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-query.c /usr/src/debug/libxmlb/0.3.18/src/xb-silo-node.h /usr/src/debug/libxmlb/0.3.18/src/xb-value-bindings
 .h /usr/src/debug/libxmlb/0.3.18/src/xb-string.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo-export-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-string.c /usr/src/debug/libxmlb/0.3.18/src/xb-value-bindings.c /usr/src/debug/libxmlb/0.3.18/src/xb-self-test.c /usr/src/debug/libxmlb/0.3.18/src/xb-silo-query.h /usr/src/debug/libxmlb/0.3.18/src/xb-machine-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-builder-fixup.h /usr/src/debug/libxmlb/0.3.18/src/xb-machine.h /usr/src/debug/libxmlb/0.3.18/src/xb-query-context.h /usr/src/debug/libxmlb/0.3.18/src/xb-opcode.c /usr/src/debug/libxmlb/0.3.18/src/xb-machine.c /usr/src/debug/libxmlb/0.3.18/src/xb-silo-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-silo-query.c /usr/src/debug/libxmlb/0.3.18/src/xb-opcode.h /usr/src/debug/libxmlb/0.3.18/src/xb-query-context.c /usr/src/debug/libxmlb/0.3.18/src/xb-builder-fixup.c /usr/src/debug/libxmlb/0.3.18/src/xb-stack-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-query-private.h /usr/src/debug/libxmlb/0.3.18
 /src/xb-silo-query-private.h /usr/src/debug/libxmlb/0.3.18/src/xb-common.c", added "/usr/src/debug/libxmlb/0.3.19/src/xb-builder-node-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-fixup-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-node.c /usr/src/debug/libxmlb/0.3.19/src/xb-string-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-node.h /usr/src/debug/libxmlb/0.3.19/src/xb-opcode-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder.c /usr/src/debug/libxmlb/0.3.19/src/xb-node-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-lzma-decompressor.c /usr/src/debug/libxmlb/0.3.19/src/xb-builder.h /usr/src/debug/libxmlb/0.3.19/src/xb-node-silo.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source-ctx-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-node.c /usr/src/debug/libxmlb/0.3.19/src/xb-lzma-decompressor.h /usr/src/debug/libxmlb/0.3.19/src/xb-value-bindings-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-
 node.h /usr/src/debug/libxmlb/0.3.19/src/xb-stack.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo-export.c /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source.c /usr/src/debug/libxmlb/0.3.19/src/xb-stack.c /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo-export.h /usr/src/debug/libxmlb/0.3.19/src/xb-zstd-decompressor.c /usr/src/debug/libxmlb/0.3.19/src/xb-tool.c /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source-ctx.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo.h /usr/src/debug/libxmlb/0.3.19/src/xb-zstd-decompressor.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo.c /usr/src/debug/libxmlb/0.3.19/src/xb-builder-source-ctx.c /usr/src/debug/libxmlb/0.3.19/src/xb-query.h /usr/src/debug/libxmlb/0.3.19/src/xb-node-query.h /usr/src/debug/libxmlb/0.3.19/src/xb-node-query.c /usr/src/debug/libxmlb/0.3.19/src/xb-common-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-query.c /usr/src/debug/libxmlb/0.3.19/src/xb-silo-node.h /usr/src/debug/libxmlb/0.3.19/src/x
 b-value-bindings.h /usr/src/debug/libxmlb/0.3.19/src/xb-string.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo-export-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-string.c /usr/src/debug/libxmlb/0.3.19/src/xb-value-bindings.c /usr/src/debug/libxmlb/0.3.19/src/xb-self-test.c /usr/src/debug/libxmlb/0.3.19/src/xb-silo-query.h /usr/src/debug/libxmlb/0.3.19/src/xb-machine-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-builder-fixup.h /usr/src/debug/libxmlb/0.3.19/src/xb-machine.h /usr/src/debug/libxmlb/0.3.19/src/xb-query-context.h /usr/src/debug/libxmlb/0.3.19/src/xb-opcode.c /usr/src/debug/libxmlb/0.3.19/src/xb-machine.c /usr/src/debug/libxmlb/0.3.19/src/xb-silo-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo-query.c /usr/src/debug/libxmlb/0.3.19/src/xb-opcode.h /usr/src/debug/libxmlb/0.3.19/src/xb-query-context.c /usr/src/debug/libxmlb/0.3.19/src/xb-builder-fixup.c /usr/src/debug/libxmlb/0.3.19/src/xb-stack-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-query-private.h /usr/src/debu
 g/libxmlb/0.3.19/src/xb-version.h /usr/src/debug/libxmlb/0.3.19/src/xb-silo-query-private.h /usr/src/debug/libxmlb/0.3.19/src/xb-version.c /usr/src/debug/libxmlb/0.3.19/src/xb-common.c"
packages/core2-64-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.18" to "0.3.19"
packages/core2-64-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.18 [default] to 0.3.19 [default]
packages/core2-64-poky-linux/libxmlb/libxmlb: PKGSIZE changed from 195068 to 195324 (+0%)
packages/core2-64-poky-linux/libxmlb/libxmlb: PV changed from "0.3.18" to "0.3.19"

--===============5001776258646469183==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.18-0.3.19.patch"

RnJvbSBjYjYzYmFkM2RiNjRlMGMxNGNlZWJkNDk0OTM0MWExNDdmNjk5MTkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxMDowNjoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbGI6IHVwZ3JhZGUgMC4zLjE4IC0+IDAuMy4xOQoKLS0tCiAuLi4vbGlieG1sYi8wMDAxLXhi
LXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaCAgICAgfCAyICstCiAuLi4v
bGlieG1sYi97bGlieG1sYl8wLjMuMTguYmIgPT4gbGlieG1sYl8wLjMuMTkuYmJ9ICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi97bGlieG1sYl8wLjMuMTguYmIg
PT4gbGlieG1sYl8wLjMuMTkuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdu
b21lL2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NS
Q0RJUi5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1z
ZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2gKaW5kZXggMjcwODFkODc0OS4u
YTgxMWIxYmI3MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1s
Yi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJk
Y29kZS1HX1RFU1RfU1JDRElSLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4YTFhYTRjMzE4
YjhkYmU0YzBjMmIxYzQ5NjhmODY3ZWE2NjQxYjMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBhOTk0MjNhODY3NGE2MzQxYmFkYzJhZjMxMzdlMzdlMDI4YjI0ZTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogRGF0
ZTogU2F0LCAxNiBTZXAgMjAyMyAxNDowMjo1NyArMDIwMAogU3ViamVjdDogW1BBVENIXSB4Yi1z
ZWxmLXRlc3QuYzogaGFyZGNvZGUgR19URVNUX1NSQ0RJUgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMTguYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUv
bGlieG1sYi9saWJ4bWxiXzAuMy4xOS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4xOC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMTkuYmIKaW5kZXggMTBjZWFi
MDcyMS4uZGU4ZDg2MGQwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIv
bGlieG1sYl8wLjMuMTguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1s
Yl8wLjMuMTkuYmIKQEAgLTgsNyArOCw3IEBAIFNSQ19VUkkgPSAiIFwKIAlmaWxlOi8vMDAwMS14
Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggXAogCWZpbGU6Ly9ydW4t
cHRlc3QgXAogIgotU1JDUkVWID0gIjU5Y2YyZTBiZjNjNGQwOTA1YTMyZTMyODI4ZDYxMDA3ODQ5
OTM2MjEiCitTUkNSRVYgPSAiNDM5Mzk1NWZiN2M4YmJjYjZhMmM2NWZmNTRmMTZjMzlkYzE2NWU1
OSIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIERFUEVORFMgPSAiZ2xpYi0yLjAgeHogenN0ZCIK
LS0gCjIuNDQuMAoK

--===============5001776258646469183==--

