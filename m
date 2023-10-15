Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B649C04FED
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:25 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.102657.1697399113108952111
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TgD2JGRx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H2Ki9Ujv;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b34df020f-26f4122e-5fad-4a26-9b0a-eba704b7a19a-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PzyZLzqZqBGxkdwXfR5MRvp0F2UMqi/AgNpD5OH0P7o=;
	b=TgD2JGRxZY4VHPH6dvbGc21vDuLWKDL+N640PpL3HlxH1JjTJp1xPlIvQP0VDgLQ
	9WABaCSpwwRR5AwEsKfLgNsspc90eXQjpT3+x++RGFtFWbelwqQup0CutNcfeKNZx9Y
	IKOS9AHDArEtfYjobIVCVI6YW0NFzw4H/QmnirjQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PzyZLzqZqBGxkdwXfR5MRvp0F2UMqi/AgNpD5OH0P7o=;
	b=H2Ki9UjvEqqBZv3Pv6q3KsNqVhAYUmvFNYoVkHlYi5hE+bi02a9JmvCG5ACMKX/O
	THQB2kwqxRhkM5c9WZUnLiva9bqt1BQ6eGcIN9zvc54ZP+mdrAIMPmySy38/JA1S5Yk
	yecXehqbqnrMS8hMHpIch/LxcSVnkta4HqHFcCi4=
Content-Type: multipart/mixed; boundary="===============2560026276137233686=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.70 SUCCEEDED
Message-ID: <0101018b34df020f-26f4122e-5fad-4a26-9b0a-eba704b7a19a-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189161

--===============2560026276137233686==
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
From 1af3cf3e4620a1d1cb3f067989b67fb1a2cf7664 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 07:09:47 +0000
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


--===============2560026276137233686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGSIZE changed from 27571028 to 27629328 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-dev: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-dev: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-doc: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-doc: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-locale: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-locale: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-obex: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-obex: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGSIZE changed from 4918723 to 4922819 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGSIZE changed from 8107931 to 8140346 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-src: FILELIST: directory renamed /usr/src/debug/bluez5/5.69-r0/plugins -> /usr/src/debug/bluez5/5.70-r0/plugins, directory renamed /usr/src/debug/bluez5/5.69-r0/tools -> /usr/src/debug/bluez5/5.70-r0/tools, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/battery -> /usr/src/debug/bluez5/5.70-r0/profiles/battery, directory renamed /usr/src/debug/bluez5/5.69-r0/gdbus -> /usr/src/debug/bluez5/5.70-r0/gdbus, directory renamed /usr/src/debug/bluez5/5.69-r0/attrib -> /usr/src/debug/bluez5/5.70-r0/attrib, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/input -> /usr/src/debug/bluez5/5.70-r0/profiles/input, directory renamed /usr/src/debug/bluez5/5.69-r0/obexd/client -> /usr/src/debug/bluez5/5.70-r0/obexd/client, directory renamed /usr/src/debug/bluez5/5.69-r0/monitor -> /usr/src/debug/bluez5/5.70-r0/monitor, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/network -> /usr/src/debug/bluez5/5.70-r0/profiles/network, director
 y renamed /usr/src/debug/bluez5/5.69-r0/android -> /usr/src/debug/bluez5/5.70-r0/android, directory renamed /usr/src/debug/bluez5/5.69-r0/obexd/src -> /usr/src/debug/bluez5/5.70-r0/obexd/src, directory renamed /usr/src/debug/bluez5/5.69-r0/src -> /usr/src/debug/bluez5/5.70-r0/src, directory renamed /usr/src/debug/bluez5/5.69-r0/lib -> /usr/src/debug/bluez5/5.70-r0/lib, directory renamed /usr/src/debug/bluez5/5.69-r0/btio -> /usr/src/debug/bluez5/5.70-r0/btio, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/gap -> /usr/src/debug/bluez5/5.70-r0/profiles/gap, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/iap -> /usr/src/debug/bluez5/5.70-r0/profiles/iap, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/health -> /usr/src/debug/bluez5/5.70-r0/profiles/health, directory renamed /usr/src/debug/bluez5/5.69-r0/tools/parser -> /usr/src/debug/bluez5/5.70-r0/tools/parser, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/deviceinfo -> /usr/src/debug/bluez5/5.
 70-r0/profiles/deviceinfo, directory renamed /usr/src/debug/bluez5/5.69-r0/profiles/scanparam -> /usr/src/debug/bluez5/5.70-r0/profiles/scanparam, directory renamed /usr/src/debug/bluez5/5.69-r0/obexd/plugins -> /usr/src/debug/bluez5/5.70-r0/obexd/plugins, directory renamed /usr/src/debug/bluez5/5.69-r0/gobex -> /usr/src/debug/bluez5/5.70-r0/gobex, directory renamed /usr/src/debug/bluez5/5.69-r0/unit -> /usr/src/debug/bluez5/5.70-r0/unit, directory renamed /usr/src/debug/bluez5/5.69-r0/client -> /usr/src/debug/bluez5/5.70-r0/client, removed "/usr/src/debug/bluez5/5.69-r0/src/shared/mainloop-notify.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/source.c /usr/src/debug/bluez5/5.69-r0/src/shared/uhid.c /usr/src/debug/bluez5/5.69-r0/src/shared/mainloop-notify.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/source.h /usr/src/debug/bluez5/5.69-r0/src/shared/uhid.h /usr/src/debug/bluez5/5.69-r0/src/shared/tty.h /usr/src/debug/bluez5/5.69-r0/src/shared/mainloop-glib.c /usr/src/debug/bluez5/5
 .69-r0/src/shared/tester.h /usr/src/debug/bluez5/5.69-r0/src/shared/tester.c /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-server.h /usr/src/debug/bluez5/5.69-r0/src/shared/ascs.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/a2dp-codecs.h /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-server.c /usr/src/debug/bluez5/5.69-r0/src/shared/att-types.h /usr/src/debug/bluez5/5.69-r0/src/shared/btsnoop.h /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-client.h /usr/src/debug/bluez5/5.69-r0/src/shared/ringbuf.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/transport.c /usr/src/debug/bluez5/5.69-r0/src/shared/timeout.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/transport.h /usr/src/debug/bluez5/5.69-r0/src/shared/btsnoop.c /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-client.c /usr/src/debug/bluez5/5.69-r0/src/shared/ringbuf.c /usr/src/debug/bluez5/5.69-r0/src/shared/util.c /usr/src/debug/bluez5/5.69-r0/src/shared/shell.c /usr/src/debug/bluez5/5.69-r0/src/shared/util.h /usr/src/debug/bluez5/5.69
 -r0/src/shared/shell.h /usr/src/debug/bluez5/5.69-r0/src/shared/io-mainloop.c /usr/src/debug/bluez5/5.69-r0/src/shared/mgmt.c /usr/src/debug/bluez5/5.69-r0/src/shared/mgmt.h /usr/src/debug/bluez5/5.69-r0/src/shared/bap.h /usr/src/debug/bluez5/5.69-r0/src/shared/bap.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/bap.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/mcp.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/vcp.c /usr/src/debug/bluez5/5.69-r0/src/shared/att.h /usr/src/debug/bluez5/5.69-r0/src/shared/att.c /usr/src/debug/bluez5/5.69-r0/src/shared/io.h /usr/src/debug/bluez5/5.69-r0/src/shared/mainloop.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/media.h /usr/src/debug/bluez5/5.69-r0/src/shared/mainloop.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/media.c /usr/src/debug/bluez5/5.69-r0/src/shared/timeout-mainloop.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/avctp.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/avdtp.c /usr/src/debug/bluez5/5.69-r0/src/shared/crypto.h /usr/src/d
 ebug/bluez5/5.69-r0/profiles/audio/avctp.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/avdtp.h /usr/src/debug/bluez5/5.69-r0/src/shared/crypto.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/a2dp.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/csip.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/a2dp.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/player.c /usr/src/debug/bluez5/5.69-r0/src/shared/queue.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/control.h /usr/src/debug/bluez5/5.69-r0/src/shared/ecc.c /usr/src/debug/bluez5/5.69-r0/src/shared/queue.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/player.h /usr/src/debug/bluez5/5.69-r0/src/shared/ecc.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/control.c /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-db.h /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-db.c /usr/src/debug/bluez5/5.69-r0/src/shared/io-glib.c /usr/src/debug/bluez5/5.69-r0/src/shared/csip.h /usr/src/debug/bluez5/5.69-r0/src/shared/csip.c /usr/src/debug/bluez5/5.69-r0/profil
 es/audio/avrcp.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/avrcp.c /usr/src/debug/bluez5/5.69-r0/src/shared/bass.h /usr/src/debug/bluez5/5.69-r0/src/shared/hfp.c /usr/src/debug/bluez5/5.69-r0/src/shared/hfp.h /usr/src/debug/bluez5/5.69-r0/src/shared/bass.c /usr/src/debug/bluez5/5.69-r0/src/shared/timeout-glib.c /usr/src/debug/bluez5/5.69-r0/src/shared/vcp.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/bass.c /usr/src/debug/bluez5/5.69-r0/src/shared/vcp.c /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-helpers.c /usr/src/debug/bluez5/5.69-r0/src/shared/hci.c /usr/src/debug/bluez5/5.69-r0/src/shared/gatt-helpers.h /usr/src/debug/bluez5/5.69-r0/src/shared/hci.h /usr/src/debug/bluez5/5.69-r0/profiles/audio/sink.c /usr/src/debug/bluez5/5.69-r0/src/shared/mcp.c /usr/src/debug/bluez5/5.69-r0/profiles/audio/sink.h /usr/src/debug/bluez5/5.69-r0/src/shared/mcp.h /usr/src/debug/bluez5/5.69-r0/src/shared/log.h /usr/src/debug/bluez5/5.69-r0/src/shared/log.c /usr/src/debug/bluez5/5.69-r0/src/sha
 red/ad.c /usr/src/debug/bluez5/5.69-r0/src/shared/ad.h", added "/usr/src/debug/bluez5/5.70-r0/src/shared/mainloop-glib.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/bap.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/mcp.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/vcp.c /usr/src/debug/bluez5/5.70-r0/src/shared/timeout-mainloop.c /usr/src/debug/bluez5/5.70-r0/src/shared/mgmt.c /usr/src/debug/bluez5/5.70-r0/src/shared/mgmt.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/avctp.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/avdtp.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/avctp.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/avdtp.h /usr/src/debug/bluez5/5.70-r0/src/shared/io.h /usr/src/debug/bluez5/5.70-r0/src/shared/timeout-glib.c /usr/src/debug/bluez5/5.70-r0/src/shared/uhid.c /usr/src/debug/bluez5/5.70-r0/src/shared/mcp.h /usr/src/debug/bluez5/5.70-r0/src/shared/uhid.h /usr/src/debug/bluez5/5.70-r0/src/shared/mcp.c /usr/src/debug/bluez5/5.70-r0/src/shared/crypto.c /usr/src/debu
 g/bluez5/5.70-r0/src/shared/btsnoop.c /usr/src/debug/bluez5/5.70-r0/src/shared/ringbuf.c /usr/src/debug/bluez5/5.70-r0/src/shared/crypto.h /usr/src/debug/bluez5/5.70-r0/src/shared/timeout.h /usr/src/debug/bluez5/5.70-r0/src/shared/btsnoop.h /usr/src/debug/bluez5/5.70-r0/src/shared/ringbuf.h /usr/src/debug/bluez5/5.70-r0/src/shared/mainloop.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/a2dp.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/csip.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/avrcp.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/micp.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/avrcp.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/a2dp.h /usr/src/debug/bluez5/5.70-r0/src/shared/mainloop.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/bass.c /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-helpers.c /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-helpers.h /usr/src/debug/bluez5/5.70-r0/src/shared/bass.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/source.h /usr/src/debug/bluez5
 /5.70-r0/src/shared/hfp.h /usr/src/debug/bluez5/5.70-r0/src/shared/tty.h /usr/src/debug/bluez5/5.70-r0/src/shared/bass.c /usr/src/debug/bluez5/5.70-r0/src/shared/hfp.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/source.c /usr/src/debug/bluez5/5.70-r0/src/shared/micp.c /usr/src/debug/bluez5/5.70-r0/src/shared/micp.h /usr/src/debug/bluez5/5.70-r0/src/shared/shell.h /usr/src/debug/bluez5/5.70-r0/src/shared/shell.c /usr/src/debug/bluez5/5.70-r0/src/shared/ascs.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/sink.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/sink.h /usr/src/debug/bluez5/5.70-r0/src/shared/bap.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/transport.h /usr/src/debug/bluez5/5.70-r0/src/shared/log.h /usr/src/debug/bluez5/5.70-r0/src/shared/bap.c /usr/src/debug/bluez5/5.70-r0/src/shared/log.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/transport.c /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-server.c /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-server.h /usr/src/debug/bl
 uez5/5.70-r0/src/shared/queue.c /usr/src/debug/bluez5/5.70-r0/src/shared/att.c /usr/src/debug/bluez5/5.70-r0/src/shared/queue.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/player.h /usr/src/debug/bluez5/5.70-r0/profiles/audio/player.c /usr/src/debug/bluez5/5.70-r0/src/shared/att-types.h /usr/src/debug/bluez5/5.70-r0/src/shared/hci.c /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-client.h /usr/src/debug/bluez5/5.70-r0/src/shared/hci.h /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-client.c /usr/src/debug/bluez5/5.70-r0/src/shared/tester.c /usr/src/debug/bluez5/5.70-r0/src/shared/ad.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/media.h /usr/src/debug/bluez5/5.70-r0/src/shared/tester.h /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-db.c /usr/src/debug/bluez5/5.70-r0/src/shared/io-glib.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/media.c /usr/src/debug/bluez5/5.70-r0/src/shared/ad.h /usr/src/debug/bluez5/5.70-r0/src/shared/gatt-db.h /usr/src/debug/bluez5/5.70-r0/src/shared/ecc.h /usr/s
 rc/debug/bluez5/5.70-r0/src/shared/ecc.c /usr/src/debug/bluez5/5.70-r0/src/shared/mainloop-notify.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/a2dp-codecs.h /usr/src/debug/bluez5/5.70-r0/src/shared/mainloop-notify.h /usr/src/debug/bluez5/5.70-r0/src/shared/csip.c /usr/src/debug/bluez5/5.70-r0/src/shared/csip.h /usr/src/debug/bluez5/5.70-r0/src/shared/io-mainloop.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/control.h /usr/src/debug/bluez5/5.70-r0/src/shared/att.h /usr/src/debug/bluez5/5.70-r0/src/shared/vcp.c /usr/src/debug/bluez5/5.70-r0/src/shared/util.c /usr/src/debug/bluez5/5.70-r0/profiles/audio/control.c /usr/src/debug/bluez5/5.70-r0/src/shared/util.h /usr/src/debug/bluez5/5.70-r0/src/shared/vcp.h"
packages/core2-32-poky-linux/bluez5/bluez5-src: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5/bluez5: PKGSIZE changed from 6151957 to 6166149 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5/bluez5: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5: PKGV changed from 5.69 [default] to 5.70 [default]
packages/core2-32-poky-linux/bluez5: PV changed from "5.69" to "5.70"
packages/core2-32-poky-linux/bluez5: SRC_URI changed from "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.69.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0004-src-shared-util.c-include-linux-limits.h.patch" to "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.70.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0004-src-shared-util.c-include-linux-limits.h.patch"

--===============2560026276137233686==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.69-5.70.patch"

RnJvbSAxYWYzY2YzZTQ2MjBhMWQxY2IzZjA2Nzk4OWI2N2ZiMWEyY2Y3NjY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDc6MDk6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
bHVlejU6IHVwZ3JhZGUgNS42OSAtPiA1LjcwCgotLS0KIC4uLi9ibHVlejUve2JsdWV6NV81LjY5
LmJiID0+IGJsdWV6NV81LjcwLmJifSAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L3tibHVlejVfNS42OS5iYiA9PiBibHVlejVfNS43MC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVl
ejVfNS42OS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81Ljcw
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjY5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JsdWV6NS9ibHVlejVfNS43MC5iYgppbmRleCA0NjczMDAwZjYwLi4yZTNiNzgyZTZl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS42
OS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS43MC5i
YgpAQCAtMSw2ICsxLDYgQEAKIHJlcXVpcmUgYmx1ZXo1LmluYwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYmM1YTM1ZGRjN2M3MmQwZDM5OTlhMGQ3YjIxNzVjOGI3ZDU3YWI2NzA3NzRmOGI1YjQ5
MDBmZjM4YTI2MjdmYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzN2UzNzJlOTE2OTU1ZTE0NGNi
ODgyZjg4OGU0YmU0MDg5OGYxMGFlM2I3YzIxM2RkY2RkNTVlZTljMDA5Mjc4IgogCiBDVkVfU1RB
VFVTW0NWRS0yMDIwLTI0NDkwXSA9ICJjcGUtaW5jb3JyZWN0OiBUaGlzIGlzc3VlIGhhcyBrZXJu
ZWwgZml4ZXMgcmF0aGVyIHRoYW4gYmx1ZXogZml4ZXMiCiAKLS0gCjIuMzkuMgoK

--===============2560026276137233686==--

