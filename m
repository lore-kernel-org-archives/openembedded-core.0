Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EFDE748E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.65013.1696183989945169394
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LuKb791t;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CltzZGTL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018aec71b2e1-f0a03a26-4d11-4b8f-851c-6eb6ac9bb5d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SwNM95eEk5/WgDs8uv88PAqz2dV0VhPOfKGp+XjMa8w=;
	b=LuKb791tNZzy5V3h1nljhUVwLBXWsKH4BvS+MEqSIhQhjOzVndcW3kPNOtReHhND
	MpN5I95onAaR7/fQjfFkdOrqb8ydcad5Vlkxk4mrK/oFpJBRPjjuKixqTzlyfyFEqSE
	6rkzRSTemZ/ADJObcr2fZMmko3mcPksYHUlgbnqQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SwNM95eEk5/WgDs8uv88PAqz2dV0VhPOfKGp+XjMa8w=;
	b=CltzZGTL57BoDgRviVhdE/JghPKBvko1GkAhawJWWX1zntdIQfemZzgH7OElixXY
	kXnNBcpkefpU8Wev9z766R2alBKUplTrkdYUXTD31nCf6SCABslHM4THDd5vdXcKFkN
	cQrEOdYKq4XDNFozoMNY8qvUVM92fjQheVyroiIc=
Content-Type: multipart/mixed; boundary="===============2151694379026442716=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.70 SUCCEEDED
Message-ID: <0101018aec71b2e1-f0a03a26-4d11-4b8f-851c-6eb6ac9bb5d8-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188518

--===============2151694379026442716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.70* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.69-5.70.patch
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
From 8036ee09fd583e7cdfefdb2a4720056a920612e4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 07:04:26 +0000
Subject: [PATCH] bluez5: upgrade 5.69 -> 5.70

---
 .../bluez5/{bluez5_5.69.bb => bluez5_5.70.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.69.bb => bluez5_5.70.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.69.bb b/meta/recipes-connectivity/bluez5/bluez5_5.70.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.69.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.70.bb
index 4673000f60..2e3b782e6e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.69.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.70.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "bc5a35ddc7c72d0d3999a0d7b2175c8b7d57ab670774f8b5b4900ff38a2627fc"
+SRC_URI[sha256sum] = "37e372e916955e144cb882f888e4be40898f10ae3b7c213ddcdd55ee9c009278"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.39.2


--===============2151694379026442716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bluez5/bluez5-dbg: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGSIZE changed from 27571028 to 27629328 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-dev: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-dev: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-doc: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-doc: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-locale: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-locale: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-obex: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-obex: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGSIZE changed from 4918723 to 4922819 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-src: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGSIZE changed from 8107931 to 8140346 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-src: FILELIST: directory renamed /usr/src/debug/bluez5/5.69-r0/plugins -> /usr/src/debug/bluez5/5.70-r0/plugins, directory renamed /usr/src/debug/bluez5/5.69-r0/client -> /usr/src/debug/bluez5/5.70-r0/client, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/scanparam -> /usr/src/debug/bluez5/5.70-r0/profiles/scanparam, directory renamed /usr/src/debug/bluez5/5.69-r0/tools -> /usr/src/debug/bluez5/5.70-r0/tools, directory renamed /usr/src/debug/bluez5/5.69-r0/gobex -> /usr/src/debug/bluez5/5.70-r0/gobex, directory renamed /usr/src/debug/bluez5/5.69-r0/gdbus -> /usr/src/debug/bluez5/5.70-r0/gdbus, directory renamed /usr/src/debug/bluez5/5.69-r0/obexd/client -> /usr/src/debug/bluez5/5.70-r0/obexd/client, directory renamed /usr/src/debug/bluez5/5.69-r0/btio -> /usr/src/debug/bluez5/5.70-r0/btio, directory renamed /usr/src/debug/bluez5/5.69-r0/unit -> /usr/src/debug/bluez5/5.70-r0/unit, directory renamed /usr/src/debug/bluez5/5.69-r0/moni
 tor -> /usr/src/debug/bluez5/5.70-r0/monitor, directory renamed /usr/src/debug/bluez5/5.69-r0/lib -> /usr/src/debug/bluez5/5.70-r0/lib, directory renamed /usr/src/debug/bluez5/5.69-r0/src -> /usr/src/debug/bluez5/5.70-r0/src, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/gap -> /usr/src/debug/bluez5/5.70-r0/profiles/gap, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/iap -> /usr/src/debug/bluez5/5.70-r0/profiles/iap, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/network -> /usr/src/debug/bluez5/5.70-r0/profiles/network, directory renamed /usr/src/debug/bluez5/5.69-r0/obexd/plugins -> /usr/src/debug/bluez5/5.70-r0/obexd/plugins, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/battery -> /usr/src/debug/bluez5/5.70-r0/profiles/battery, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/health -> /usr/src/debug/bluez5/5.70-r0/profiles/health, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/input -> /usr/src/debug/bluez5/5.70-r0/pro
 files/input, directory renamed /usr/src/debug/bluez5/5.69-r0/android -> /usr/src/debug/bluez5/5.70-r0/android, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/deviceinfo -> /usr/src/debug/bluez5/5.70-r0/profiles/deviceinfo, directory renamed /usr/src/debug/bluez5/5.69-r0/obexd/src -> /usr/src/debug/bluez5/5.70-r0/obexd/src, directory renamed /usr/src/debug/bluez5/5.69-r0/tools/parser -> /usr/src/debug/bluez5/5.70-r0/tools/parser, directory renamed /usr/src/debug/bluez5/5.69-r0/attrib -> /usr/src/debug/bluez5/5.70-r0/attrib, removed "/usr/src/debug/bluez5/5.69-r0/profiles/audio/media.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/a2dp.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/media.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/csip.c /usr/src/debug/bluez5/5.69-r0/src/shared/mcp.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/a2dp.c /usr/src/debug/bluez5/5.69-r0/src/shared/ecc.h /usr/src/debug/bluez5/5.69-r0/src/shared/bap.c /usr/src/debug/bluez5/5.69-r0/src/shared/hci.h
  /usr/src/debug/bluez5/5.69-r0/src/shared/queue.c /usr/src/debug/bluez5/5.69-r0/src/shared/mcp.h /usr/src/debug/bluez5/5.69-r0/src/shared/hci.c /usr/src/debug/bluez5/5.69-r0/src/shared/queue.h /usr/src/debug/bluez5/5.69-r0/src/shared/bap.h /usr/src/debug/bluez5/5.69-r0/src/shared/ecc.c /usr/src/debug/bluez5/5.69-r0/src/shared/util.c /usr/src/debug/bluez5/5.69-r0/src/shared/io.h /usr/src/debug/bluez5/5.69-r0/src/shared/uhid.c /usr/src/debug/bluez5/5.69-r0/src/shared/crypto.h /usr/src/debug/bluez5/5.69-r0/src/shared/util.h /usr/src/debug/bluez5/5.69-r0/src/shared/crypto.c /usr/src/debug/bluez5/5.69-r0/src/shared/uhid.h /usr/src/debug/bluez5/5.69-r0/src/shared/timeout-mainloop.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/avrcp.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/avrcp.c /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-db.c /usr/src/debug/bluez5/5.69-r0/src/shared/io-glib.c /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-db.h /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-client.
 h /usr/src/debug/bluez5/5.69-r0/src/shared/mainloop.h /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-client.c /usr/src/debug/bluez5/5.69-r0/src/shared/mainloop.c /usr/src/debug/bluez5/5.69-r0/src/shared/mainloop-glib.c /usr/src/debug/bluez5/5.69-r0/src/shared/io-mainloop.c /usr/src/debug/bluez5/5.69-r0/src/shared/timeout-glib.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/player.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/player.c /usr/src/debug/bluez5/5.69-r0/src/shared/ad.c /usr/src/debug/bluez5/5.69-r0/src/shared/hfp.c /usr/src/debug/bluez5/5.69-r0/src/shared/shell.h /usr/src/debug/bluez5/5.69-r0/src/shared/shell.c /usr/src/debug/bluez5/5.69-r0/src/shared/hfp.h /usr/src/debug/bluez5/5.69-r0/src/shared/ad.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/source.h /usr/src/debug/bluez5/5.69-r0/src/shared/vcp.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/source.c /usr/src/debug/bluez5/5.69-r0/src/shared/vcp.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/a2dp-codecs.h /usr/src/debug/
 bluez5/5.69-r0/src/shared/gatt-server.h /usr/src/debug/bluez5/5.69-r0/src/shared/bass.h /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-server.c /usr/src/debug/bluez5/5.69-r0/src/shared/bass.c /usr/src/debug/bluez5/5.69-r0/src/shared/tester.h /usr/src/debug/bluez5/5.69-r0/src/shared/tester.c /usr/src/debug/bluez5/5.69-r0/src/shared/ascs.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/bass.c /usr/src/debug/bluez5/5.69-r0/src/shared/tty.h /usr/src/debug/bluez5/5.69-r0/src/shared/btsnoop.c /usr/src/debug/bluez5/5.69-r0/src/shared/ringbuf.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/avctp.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/avdtp.c /usr/src/debug/bluez5/5.69-r0/src/shared/btsnoop.h /usr/src/debug/bluez5/5.69-r0/src/shared/ringbuf.h /usr/src/debug/bluez5/5.69-r0/src/shared/timeout.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/avctp.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/avdtp.h /usr/src/debug/bluez5/5.69-r0/src/shared/mgmt.h /usr/src/debug/bluez5/5.69-r0/src/shared/log
 .c /usr/src/debug/bluez5/5.69-r0/src/shared/mainloop-notify.c /usr/src/debug/bluez5/5.69-r0/src/shared/log.h /usr/src/debug/bluez5/5.69-r0/src/shared/mgmt.c /usr/src/debug/bluez5/5.69-r0/src/shared/mainloop-notify.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/bap.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/mcp.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/vcp.c /usr/src/debug/bluez5/5.69-r0/src/shared/att.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/control.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/control.c /usr/src/debug/bluez5/5.69-r0/src/shared/att.h /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-helpers.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/transport.h /usr/src/debug/bluez5/5.69-r0/src/shared/csip.c /usr/src/debug/bluez5/5.69-r0/src/shared/att-types.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/transport.c /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-helpers.h /usr/src/debug/bluez5/5.69-r0/src/shared/csip.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/sink
 .c /usr/src/debug/bluez5/5.69-r0/profiles/audio/sink.h", added "/usr/src/debug/bluez5/5.70-r0/profiles/audio/avctp.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/avdtp.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/avctp.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/avdtp.c /usr/src/debug/bluez5/5.70-r0/src/shared/tester.h /usr/src/debug/bluez5/5.70-r0/src/shared/mgmt.c /usr/src/debug/bluez5/5.70-r0/src/shared/tester.c /usr/src/debug/bluez5/5.70-r0/src/shared/mgmt.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/control.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/control.h /usr/src/debug/bluez5/5.70-r0/src/shared/ecc.h /usr/src/debug/bluez5/5.70-r0/src/shared/bap.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/bass.c /usr/src/debug/bluez5/5.70-r0/src/shared/ecc.c /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-server.h /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-server.c /usr/src/debug/bluez5/5.70-r0/src/shared/bap.h /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-db.c /usr/src/debug
 /bluez5/5.70-r0/src/shared/io-glib.c /usr/src/debug/bluez5/5.70-r0/src/shared/vcp.h /usr/src/debug/bluez5/5.70-r0/src/shared/vcp.c /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-db.h /usr/src/debug/bluez5/5.70-r0/src/shared/micp.h /usr/src/debug/bluez5/5.70-r0/src/shared/mainloop-glib.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/sink.h /usr/src/debug/bluez5/5.70-r0/src/shared/mainloop-notify.c /usr/src/debug/bluez5/5.70-r0/src/shared/micp.c /usr/src/debug/bluez5/5.70-r0/src/shared/mainloop-notify.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/sink.c /usr/src/debug/bluez5/5.70-r0/src/shared/io-mainloop.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/avrcp.h /usr/src/debug/bluez5/5.70-r0/src/shared/uhid.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/avrcp.c /usr/src/debug/bluez5/5.70-r0/src/shared/uhid.c /usr/src/debug/bluez5/5.70-r0/src/shared/shell.c /usr/src/debug/bluez5/5.70-r0/src/shared/shell.h /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-client.c /usr/src/debug/bluez5/5.70-r0/
 src/shared/timeout-mainloop.c /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-client.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/a2dp.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/csip.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/micp.c /usr/src/debug/bluez5/5.70-r0/src/shared/hfp.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/a2dp.h /usr/src/debug/bluez5/5.70-r0/src/shared/tty.h /usr/src/debug/bluez5/5.70-r0/src/shared/hfp.h /usr/src/debug/bluez5/5.70-r0/src/shared/csip.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/bap.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/mcp.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/vcp.c /usr/src/debug/bluez5/5.70-r0/src/shared/csip.c /usr/src/debug/bluez5/5.70-r0/src/shared/att-types.h /usr/src/debug/bluez5/5.70-r0/src/shared/io.h /usr/src/debug/bluez5/5.70-r0/src/shared/crypto.h /usr/src/debug/bluez5/5.70-r0/src/shared/crypto.c /usr/src/debug/bluez5/5.70-r0/src/shared/att.c /usr/src/debug/bluez5/5.70-r0/src/shared/mcp.c /usr/src/debug/bluez5
 /5.70-r0/src/shared/mcp.h /usr/src/debug/bluez5/5.70-r0/src/shared/att.h /usr/src/debug/bluez5/5.70-r0/src/shared/btsnoop.c /usr/src/debug/bluez5/5.70-r0/src/shared/ringbuf.c /usr/src/debug/bluez5/5.70-r0/src/shared/util.h /usr/src/debug/bluez5/5.70-r0/src/shared/util.c /usr/src/debug/bluez5/5.70-r0/src/shared/timeout.h /usr/src/debug/bluez5/5.70-r0/src/shared/ringbuf.h /usr/src/debug/bluez5/5.70-r0/src/shared/btsnoop.h /usr/src/debug/bluez5/5.70-r0/src/shared/mainloop.h /usr/src/debug/bluez5/5.70-r0/src/shared/bass.h /usr/src/debug/bluez5/5.70-r0/src/shared/bass.c /usr/src/debug/bluez5/5.70-r0/src/shared/mainloop.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/transport.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/transport.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/media.h /usr/src/debug/bluez5/5.70-r0/src/shared/ascs.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/media.c /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-helpers.h /usr/src/debug/bluez5/5.70-r0/src/shared/log.h /u
 sr/src/debug/bluez5/5.70-r0/src/shared/log.c /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-helpers.c /usr/src/debug/bluez5/5.70-r0/src/shared/ad.c /usr/src/debug/bluez5/5.70-r0/src/shared/ad.h /usr/src/debug/bluez5/5.70-r0/src/shared/timeout-glib.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/a2dp-codecs.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/player.h /usr/src/debug/bluez5/5.70-r0/src/shared/queue.h /usr/src/debug/bluez5/5.70-r0/src/shared/queue.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/player.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/source.c /usr/src/debug/bluez5/5.70-r0/src/shared/hci.c /usr/src/debug/bluez5/5.70-r0/src/shared/hci.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/source.h"
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5: PKGSIZE changed from 6151957 to 6166149 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5: SRC_URI changed from "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.69.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0004-src-shared-util.c-include-linux-limits.h.patch" to "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.70.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0004-src-shared-util.c-include-linux-limits.h.patch"
packages/core2-32-poky-linux/bluez5: PKGV changed from 5.69 [default] to 5.70 [default]

--===============2151694379026442716==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.69-5.70.patch"

RnJvbSA4MDM2ZWUwOWZkNTgzZTdjZGZlZmRiMmE0NzIwMDU2YTkyMDYxMmU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwNzowNDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJs
dWV6NTogdXBncmFkZSA1LjY5IC0+IDUuNzAKCi0tLQogLi4uL2JsdWV6NS97Ymx1ZXo1XzUuNjku
YmIgPT4gYmx1ZXo1XzUuNzAuYmJ9ICAgICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9ibHVlejUve2JsdWV6NV81LjY5LmJiID0+IGJsdWV6NV81LjcwLmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6
NV81LjY5LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1XzUuNzAu
YmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9ibHVlejUvYmx1ZXo1XzUuNjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjcwLmJiCmluZGV4IDQ2NzMwMDBmNjAuLjJlM2I3ODJlNmUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjY5
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjcwLmJi
CkBAIC0xLDYgKzEsNiBAQAogcmVxdWlyZSBibHVlejUuaW5jCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJiYzVhMzVkZGM3YzcyZDBkMzk5OWEwZDdiMjE3NWM4YjdkNTdhYjY3MDc3NGY4YjViNDkw
MGZmMzhhMjYyN2ZjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3ZTM3MmU5MTY5NTVlMTQ0Y2I4
ODJmODg4ZTRiZTQwODk4ZjEwYWUzYjdjMjEzZGRjZGQ1NWVlOWMwMDkyNzgiCiAKIENWRV9TVEFU
VVNbQ1ZFLTIwMjAtMjQ0OTBdID0gImNwZS1pbmNvcnJlY3Q6IFRoaXMgaXNzdWUgaGFzIGtlcm5l
bCBmaXhlcyByYXRoZXIgdGhhbiBibHVleiBmaXhlcyIKIAotLSAKMi4zOS4yCgo=

--===============2151694379026442716==--

