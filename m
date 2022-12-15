Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3D9C46467
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:34 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.144489.1671136350181511172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P7MG2Se5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185177d0be4-6491f089-2423-4e9f-b168-d7852816b8d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hYgAJPoXhpW9ZpumUY3NGvODuNrndxhwM5HPYWda1/o=;
	b=P7MG2Se5o0ERZSlqy+FiszGyKEisvR90Jc+nblw1CN7TNhIB3cfLcVyJpxuBe1Zh
	6eLEpSjvPSJcIyFvfUMa9N0U7JaEZmo+lFoTEUz4MKomvlggZILE736U8DapvBHSB0w
	Zr99yxOeg5QlilOXdgCSv1MeCPpzVZP64+dXRSUY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hYgAJPoXhpW9ZpumUY3NGvODuNrndxhwM5HPYWda1/o=;
	b=PU4ix1gq9yfODSZovzUNV2MAOilo/eA/BOlAmCFtabIKL1Y4Cm2ah+e5bHfow9pl
	VP1TKIPxtDZwgXM6UXSPZyhWMcRBCGsEeKQ5CXOKtPP+fTu05ZJfY6FL2svn4q/LG/q
	MP8Kt+zs93qWsgJHMCQxNYLymCwd/prMTA30mK9w=
Content-Type: multipart/mixed; boundary="===============0061013476658395957=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.66 FAILED
Message-ID: <01010185177d0be4-6491f089-2423-4e9f-b168-d7852816b8d4-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:29 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174623

--===============0061013476658395957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.66* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.65-5.66.patch
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
--===============0061013476658395957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bluez5/bluez5-dbg: FILELIST: removed "/usr/lib/.debug/libbluetooth.so.3.19.7", added "/usr/lib/.debug/libbluetooth.so.3.19.8 /usr/lib/bluez5/ptest/unit/.debug/test-tester"
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGSIZE changed from 25036248 to 25619976 (+2%)
packages/core2-32-poky-linux/bluez5/bluez5-dev: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-dev: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-doc: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-doc: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-locale: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-locale: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGSIZE changed from 4570904 to 4580344 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-obex: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-obex: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-ptest: FILELIST: added "/usr/lib/bluez5/ptest/unit/test-tester"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGSIZE changed from 3881951 to 4002451 (+3%)
packages/core2-32-poky-linux/bluez5/bluez5-src: FILELIST: directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/gap -> /usr/src/debug/bluez5/5.66-r0/profiles/gap, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/iap -> /usr/src/debug/bluez5/5.66-r0/profiles/iap, directory renamed /usr/src/debug/bluez5/5.65-r0/obexd/client -> /usr/src/debug/bluez5/5.66-r0/obexd/client, directory renamed /usr/src/debug/bluez5/5.65-r0/plugins -> /usr/src/debug/bluez5/5.66-r0/plugins, directory renamed /usr/src/debug/bluez5/5.65-r0/btio -> /usr/src/debug/bluez5/5.66-r0/btio, directory renamed /usr/src/debug/bluez5/5.65-r0/tools -> /usr/src/debug/bluez5/5.66-r0/tools, directory renamed /usr/src/debug/bluez5/5.65-r0/attrib -> /usr/src/debug/bluez5/5.66-r0/attrib, directory renamed /usr/src/debug/bluez5/5.65-r0/obexd/plugins -> /usr/src/debug/bluez5/5.66-r0/obexd/plugins, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/battery -> /usr/src/debug/bluez5/5.66-r0/profiles/battery, directory 
 renamed /usr/src/debug/bluez5/5.65-r0/profiles/input -> /usr/src/debug/bluez5/5.66-r0/profiles/input, directory renamed /usr/src/debug/bluez5/5.65-r0/android -> /usr/src/debug/bluez5/5.66-r0/android, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/network -> /usr/src/debug/bluez5/5.66-r0/profiles/network, directory renamed /usr/src/debug/bluez5/5.65-r0/gobex -> /usr/src/debug/bluez5/5.66-r0/gobex, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/scanparam -> /usr/src/debug/bluez5/5.66-r0/profiles/scanparam, directory renamed /usr/src/debug/bluez5/5.65-r0/client -> /usr/src/debug/bluez5/5.66-r0/client, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/health -> /usr/src/debug/bluez5/5.66-r0/profiles/health, directory renamed /usr/src/debug/bluez5/5.65-r0/src -> /usr/src/debug/bluez5/5.66-r0/src, directory renamed /usr/src/debug/bluez5/5.65-r0/lib -> /usr/src/debug/bluez5/5.66-r0/lib, directory renamed /usr/src/debug/bluez5/5.65-r0/monitor -> /usr/src/debug/blu
 ez5/5.66-r0/monitor, directory renamed /usr/src/debug/bluez5/5.65-r0/gdbus -> /usr/src/debug/bluez5/5.66-r0/gdbus, directory renamed /usr/src/debug/bluez5/5.65-r0/profiles/deviceinfo -> /usr/src/debug/bluez5/5.66-r0/profiles/deviceinfo, directory renamed /usr/src/debug/bluez5/5.65-r0/tools/parser -> /usr/src/debug/bluez5/5.66-r0/tools/parser, directory renamed /usr/src/debug/bluez5/5.65-r0/obexd/src -> /usr/src/debug/bluez5/5.66-r0/obexd/src, removed "/usr/src/debug/bluez5/5.65-r0/unit/test-uuid.c /usr/src/debug/bluez5/5.65-r0/src/shared/crypto.h /usr/src/debug/bluez5/5.65-r0/src/shared/mainloop.c /usr/src/debug/bluez5/5.65-r0/unit/test-avdtp.c /usr/src/debug/bluez5/5.65-r0/unit/test-avctp.c /usr/src/debug/bluez5/5.65-r0/src/shared/mainloop.h /usr/src/debug/bluez5/5.65-r0/src/shared/crypto.c /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-db.h /usr/src/debug/bluez5/5.65-r0/unit/test-avrcp.c /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-db.c /usr/src/debug/bluez5/5.65-r0/src/shared/io-
 glib.c /usr/src/debug/bluez5/5.65-r0/unit/test-lib.c /usr/src/debug/bluez5/5.65-r0/src/shared/uhid.h /usr/src/debug/bluez5/5.65-r0/unit/test-gdbus-client.c /usr/src/debug/bluez5/5.65-r0/src/shared/uhid.c /usr/src/debug/bluez5/5.65-r0/src/shared/shell.c /usr/src/debug/bluez5/5.65-r0/src/shared/shell.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/a2dp.h /usr/src/debug/bluez5/5.65-r0/src/shared/mainloop-glib.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/a2dp.c /usr/src/debug/bluez5/5.65-r0/src/shared/timeout-glib.c /usr/src/debug/bluez5/5.65-r0/src/shared/att-types.h /usr/src/debug/bluez5/5.65-r0/src/shared/io.h /usr/src/debug/bluez5/5.65-r0/unit/test-gobex-header.c /usr/src/debug/bluez5/5.65-r0/unit/test-crc.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/source.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/media.c /usr/src/debug/bluez5/5.65-r0/unit/test-gattrib.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/media.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/source.h /usr/src/debug
 /bluez5/5.65-r0/unit/test-crypto.c /usr/src/debug/bluez5/5.65-r0/src/shared/ecc.c /usr/src/debug/bluez5/5.65-r0/src/shared/ecc.h /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-client.c /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-client.h /usr/src/debug/bluez5/5.65-r0/src/shared/io-mainloop.c /usr/src/debug/bluez5/5.65-r0/unit/test-textfile.c /usr/src/debug/bluez5/5.65-r0/src/shared/queue.h /usr/src/debug/bluez5/5.65-r0/src/shared/queue.c /usr/src/debug/bluez5/5.65-r0/unit/test-gobex-apparam.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/player.c /usr/src/debug/bluez5/5.65-r0/unit/test-ecc.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/player.h /usr/src/debug/bluez5/5.65-r0/unit/test-hog.c /usr/src/debug/bluez5/5.65-r0/src/shared/mainloop-notify.h /usr/src/debug/bluez5/5.65-r0/src/shared/tty.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/avrcp.h /usr/src/debug/bluez5/5.65-r0/src/shared/tester.h /usr/src/debug/bluez5/5.65-r0/src/shared/timeout-mainloop.c /usr/src/debug/bluez5/5.65-r0
 /profiles/audio/avrcp.c /usr/src/debug/bluez5/5.65-r0/src/shared/mainloop-notify.c /usr/src/debug/bluez5/5.65-r0/src/shared/tester.c /usr/src/debug/bluez5/5.65-r0/unit/test-gobex.c /usr/src/debug/bluez5/5.65-r0/src/shared/btsnoop.h /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-server.h /usr/src/debug/bluez5/5.65-r0/src/shared/ringbuf.h /usr/src/debug/bluez5/5.65-r0/src/shared/timeout.h /usr/src/debug/bluez5/5.65-r0/unit/test-sdp.c /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-server.c /usr/src/debug/bluez5/5.65-r0/src/shared/btsnoop.c /usr/src/debug/bluez5/5.65-r0/src/shared/ringbuf.c /usr/src/debug/bluez5/5.65-r0/unit/test-queue.c /usr/src/debug/bluez5/5.65-r0/unit/test-gatt.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/transport.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/transport.h /usr/src/debug/bluez5/5.65-r0/src/shared/hfp.c /usr/src/debug/bluez5/5.65-r0/src/shared/hfp.h /usr/src/debug/bluez5/5.65-r0/unit/test-eir.c /usr/src/debug/bluez5/5.65-r0/unit/test-hfp.c /usr/src/d
 ebug/bluez5/5.65-r0/src/shared/mgmt.h /usr/src/debug/bluez5/5.65-r0/src/shared/mgmt.c /usr/src/debug/bluez5/5.65-r0/unit/test-mgmt.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/a2dp-codecs.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/avctp.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/avdtp.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/avctp.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/avdtp.c /usr/src/debug/bluez5/5.65-r0/src/shared/ad.h /usr/src/debug/bluez5/5.65-r0/src/shared/hci.h /usr/src/debug/bluez5/5.65-r0/unit/test-ringbuf.c /usr/src/debug/bluez5/5.65-r0/src/shared/ad.c /usr/src/debug/bluez5/5.65-r0/src/shared/hci.c /usr/src/debug/bluez5/5.65-r0/src/shared/log.c /usr/src/debug/bluez5/5.65-r0/unit/test-gobex-packet.c /usr/src/debug/bluez5/5.65-r0/unit/util.h /usr/src/debug/bluez5/5.65-r0/src/shared/log.h /usr/src/debug/bluez5/5.65-r0/unit/test-uhid.c /usr/src/debug/bluez5/5.65-r0/unit/util.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/sink.h /usr/src/debug/bluez5/5.6
 5-r0/profiles/audio/sink.c /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-helpers.h /usr/src/debug/bluez5/5.65-r0/unit/test-gobex-transfer.c /usr/src/debug/bluez5/5.65-r0/src/shared/gatt-helpers.c /usr/src/debug/bluez5/5.65-r0/src/shared/util.h /usr/src/debug/bluez5/5.65-r0/profiles/audio/control.c /usr/src/debug/bluez5/5.65-r0/src/shared/util.c /usr/src/debug/bluez5/5.65-r0/profiles/audio/control.h /usr/src/debug/bluez5/5.65-r0/src/shared/att.c /usr/src/debug/bluez5/5.65-r0/src/shared/att.h", added "/usr/src/debug/bluez5/5.66-r0/unit/test-hog.c /usr/src/debug/bluez5/5.66-r0/src/shared/mainloop-notify.h /usr/src/debug/bluez5/5.66-r0/src/shared/tty.h /usr/src/debug/bluez5/5.66-r0/src/shared/tester.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/avrcp.h /usr/src/debug/bluez5/5.66-r0/src/shared/timeout-mainloop.c /usr/src/debug/bluez5/5.66-r0/src/shared/tester.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/avrcp.c /usr/src/debug/bluez5/5.66-r0/src/shared/mainloop-notify.c /usr/src/debug/
 bluez5/5.66-r0/unit/test-gobex.c /usr/src/debug/bluez5/5.66-r0/src/shared/btsnoop.h /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-server.h /usr/src/debug/bluez5/5.66-r0/src/shared/ringbuf.h /usr/src/debug/bluez5/5.66-r0/src/shared/timeout.h /usr/src/debug/bluez5/5.66-r0/unit/test-sdp.c /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-server.c /usr/src/debug/bluez5/5.66-r0/src/shared/ringbuf.c /usr/src/debug/bluez5/5.66-r0/src/shared/btsnoop.c /usr/src/debug/bluez5/5.66-r0/unit/test-queue.c /usr/src/debug/bluez5/5.66-r0/unit/test-gatt.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/transport.c /usr/src/debug/bluez5/5.66-r0/src/shared/bap.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/transport.h /usr/src/debug/bluez5/5.66-r0/src/shared/bap.h /usr/src/debug/bluez5/5.66-r0/src/shared/hfp.c /usr/src/debug/bluez5/5.66-r0/src/shared/hfp.h /usr/src/debug/bluez5/5.66-r0/unit/test-eir.c /usr/src/debug/bluez5/5.66-r0/unit/test-hfp.c /usr/src/debug/bluez5/5.66-r0/src/shared/mgmt.h /usr/src/debug/b
 luez5/5.66-r0/src/shared/mgmt.c /usr/src/debug/bluez5/5.66-r0/unit/test-mgmt.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/a2dp-codecs.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/avctp.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/avdtp.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/avctp.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/avdtp.c /usr/src/debug/bluez5/5.66-r0/src/shared/ad.h /usr/src/debug/bluez5/5.66-r0/src/shared/hci.h /usr/src/debug/bluez5/5.66-r0/unit/test-ringbuf.c /usr/src/debug/bluez5/5.66-r0/src/shared/ad.c /usr/src/debug/bluez5/5.66-r0/src/shared/hci.c /usr/src/debug/bluez5/5.66-r0/src/shared/log.c /usr/src/debug/bluez5/5.66-r0/unit/test-tester.c /usr/src/debug/bluez5/5.66-r0/unit/test-gobex-packet.c /usr/src/debug/bluez5/5.66-r0/unit/util.h /usr/src/debug/bluez5/5.66-r0/src/shared/log.h /usr/src/debug/bluez5/5.66-r0/unit/test-uhid.c /usr/src/debug/bluez5/5.66-r0/unit/util.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/sink.h /usr/src/debug/bluez5/5.66-r0/
 profiles/audio/sink.c /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-helpers.h /usr/src/debug/bluez5/5.66-r0/unit/test-gobex-transfer.c /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-helpers.c /usr/src/debug/bluez5/5.66-r0/src/shared/util.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/control.c /usr/src/debug/bluez5/5.66-r0/src/shared/util.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/control.h /usr/src/debug/bluez5/5.66-r0/src/shared/ascs.h /usr/src/debug/bluez5/5.66-r0/src/shared/att.c /usr/src/debug/bluez5/5.66-r0/src/shared/att.h /usr/src/debug/bluez5/5.66-r0/unit/test-uuid.c /usr/src/debug/bluez5/5.66-r0/src/shared/crypto.h /usr/src/debug/bluez5/5.66-r0/src/shared/mainloop.c /usr/src/debug/bluez5/5.66-r0/unit/test-avdtp.c /usr/src/debug/bluez5/5.66-r0/unit/test-avctp.c /usr/src/debug/bluez5/5.66-r0/src/shared/mainloop.h /usr/src/debug/bluez5/5.66-r0/src/shared/crypto.c /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-db.h /usr/src/debug/bluez5/5.66-r0/unit/test-avrcp.c /usr/src/deb
 ug/bluez5/5.66-r0/src/shared/io-glib.c /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-db.c /usr/src/debug/bluez5/5.66-r0/unit/test-lib.c /usr/src/debug/bluez5/5.66-r0/src/shared/uhid.h /usr/src/debug/bluez5/5.66-r0/unit/test-gdbus-client.c /usr/src/debug/bluez5/5.66-r0/src/shared/uhid.c /usr/src/debug/bluez5/5.66-r0/src/shared/shell.c /usr/src/debug/bluez5/5.66-r0/src/shared/shell.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/a2dp.h /usr/src/debug/bluez5/5.66-r0/src/shared/mainloop-glib.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/a2dp.c /usr/src/debug/bluez5/5.66-r0/src/shared/timeout-glib.c /usr/src/debug/bluez5/5.66-r0/src/shared/att-types.h /usr/src/debug/bluez5/5.66-r0/src/shared/io.h /usr/src/debug/bluez5/5.66-r0/unit/test-gobex-header.c /usr/src/debug/bluez5/5.66-r0/unit/test-crc.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/source.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/media.c /usr/src/debug/bluez5/5.66-r0/unit/test-gattrib.c /usr/src/debug/bluez5/5.66-r0/profiles
 /audio/media.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/source.h /usr/src/debug/bluez5/5.66-r0/profiles/audio/mcp.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/bap.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/vcp.c /usr/src/debug/bluez5/5.66-r0/unit/test-crypto.c /usr/src/debug/bluez5/5.66-r0/src/shared/mcp.c /usr/src/debug/bluez5/5.66-r0/src/shared/ecc.c /usr/src/debug/bluez5/5.66-r0/src/shared/mcp.h /usr/src/debug/bluez5/5.66-r0/src/shared/ecc.h /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-client.c /usr/src/debug/bluez5/5.66-r0/src/shared/vcp.h /usr/src/debug/bluez5/5.66-r0/src/shared/gatt-client.h /usr/src/debug/bluez5/5.66-r0/src/shared/vcp.c /usr/src/debug/bluez5/5.66-r0/src/shared/io-mainloop.c /usr/src/debug/bluez5/5.66-r0/unit/test-textfile.c /usr/src/debug/bluez5/5.66-r0/src/shared/queue.h /usr/src/debug/bluez5/5.66-r0/src/shared/queue.c /usr/src/debug/bluez5/5.66-r0/unit/test-gobex-apparam.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/player.c /usr/src/debug/bluez
 5/5.66-r0/unit/test-ecc.c /usr/src/debug/bluez5/5.66-r0/profiles/audio/player.h"
packages/core2-32-poky-linux/bluez5/bluez5-src: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGSIZE changed from 7449597 to 7760525 (+4%)
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PKGSIZE changed from 176705 to 177385 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5: FILELIST: removed "/usr/lib/libbluetooth.so.3.19.7", added "/usr/lib/libbluetooth.so.3.19.8"
packages/core2-32-poky-linux/bluez5/bluez5: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5/bluez5: PKGV changed from 5.65 [default] to 5.66 [default]
packages/core2-32-poky-linux/bluez5/bluez5: PKGSIZE changed from 5502284 to 5685780 (+3%)
packages/core2-32-poky-linux/bluez5: SRC_URI changed from "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.65.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch" to "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.66.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch"
packages/core2-32-poky-linux/bluez5: PV changed from "5.65" to "5.66"
packages/core2-32-poky-linux/bluez5: PKGV changed from 5.65 [default] to 5.66 [default]
Changes to packages/core2-32-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.7 to libbluetooth.so.3.19.8
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.7 to libbluetooth.so.3.19.8
  /usr/lib/libbluetooth.so.3.19.7 moved to /usr/lib/libbluetooth.so.3.19.8

--===============0061013476658395957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1673 targets, 49 skipped, 0 masked, 0 errors.
Removing 92 recipes from the core2-32 sysroot...done.
Removing 91 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 357 Local 31 Mirrors 0 Missed 326 Current 205 (8% match, 41% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 528 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 243 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 251 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_fetch)
NOTE: Running task 269 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: Running task 366 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: Running task 377 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 392 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_fetch)
NOTE: Running task 393 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 397 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_fetch)
NOTE: Running task 398 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: Running task 446 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Started
NOTE: Running task 506 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 529 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 554 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_unpack)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: Running task 567 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: Running task 613 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 614 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 615 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_fetch)
NOTE: Running task 616 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: Running task 617 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_fetch)
NOTE: Running task 618 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 619 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_fetch)
NOTE: Running task 620 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: Running task 621 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 675 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: Running task 677 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 681 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 682 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: Running task 692 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_fetch)
NOTE: Running task 693 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_fetch)
NOTE: Running task 694 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_fetch)
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: Running task 701 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 708 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: Running task 709 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 711 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 712 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_write_config)
NOTE: Running task 713 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 714 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 715 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 716 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 720 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_fetch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Started
NOTE: Running task 724 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: Running task 733 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: Running task 736 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 738 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 742 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 747 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 750 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 751 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: Running task 753 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 754 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_fetch)
NOTE: Running task 776 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 777 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: Running task 778 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 801 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: Running task 803 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 804 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_unpack)
NOTE: Running task 805 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: Running task 806 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: Running task 809 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 812 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 813 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 814 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 815 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_fetch: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 816 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_unpack)
NOTE: recipe xz-5.2.9-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 535 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: Running task 817 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_unpack)
NOTE: recipe libpcre2-10.41-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: Running task 818 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_patch)
NOTE: Running task 819 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_unpack)
NOTE: Running task 820 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: Running task 821 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: Running task 822 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_unpack)
NOTE: Running task 823 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: Running task 824 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_unpack)
NOTE: Running task 825 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: Running task 826 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 827 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.41-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: Running task 828 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: Running task 829 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 830 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 831 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_unpack)
NOTE: Running task 832 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 833 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Succeeded
NOTE: Running task 834 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: Running setscene task 537 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: Running task 836 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Started
NOTE: Running task 837 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_unpack)
NOTE: Running task 838 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 839 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 840 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: Running task 842 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: Running task 843 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 844 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: Running task 845 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: Running task 846 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_unpack)
NOTE: Running task 847 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_write_config: Succeeded
NOTE: Running task 848 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 849 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: Running task 850 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 851 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_unpack)
NOTE: recipe zlib-1.2.13-r0: task do_patch: Started
NOTE: Running task 853 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Started
NOTE: Running task 854 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: Running task 855 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: Running task 856 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_patch)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: Running task 857 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: Running task 858 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 859 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 860 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_unpack)
NOTE: Running task 861 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_fetch)
NOTE: Running task 865 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 867 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 868 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 869 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: recipe xz-5.2.9-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: Running task 870 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: Running task 871 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe libpcre2-10.41-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 872 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: Running task 873 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: Running task 874 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: Running task 875 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe libx11-1_1.8.1-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe xz-5.2.9-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: Running task 876 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_patch)
NOTE: Running task 877 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: Running task 878 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: Running task 879 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 880 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: Running setscene task 539 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 881 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: Running task 882 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe python3-3.11.0-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: Running task 883 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 884 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_fetch)
NOTE: Running task 892 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: Running task 893 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_unpack)
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 894 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: Running task 895 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 896 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: Running task 897 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: Running task 898 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_patch: Started
NOTE: Running task 899 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: Running task 900 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xz-5.2.9-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 901 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: Running task 902 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_patch)
NOTE: Running task 903 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: Running task 904 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 905 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 540 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: Running task 907 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 908 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 909 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 910 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 911 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: Running task 912 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 913 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: Running task 914 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 915 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_patch: Succeeded
NOTE: Running task 916 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 917 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running task 918 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: Running task 919 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 920 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe xz-5.2.9-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: Running task 921 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_fetch: Succeeded
NOTE: Running task 922 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 923 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: Running task 924 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 925 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_patch)
NOTE: Running task 926 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 927 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 928 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: Running task 929 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: Running task 930 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.41-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: Running task 937 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 938 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: Running task 939 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 543 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: Running task 940 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 941 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 942 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 943 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_patch)
NOTE: Running task 944 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 945 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_patch)
NOTE: Running task 946 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_patch)
NOTE: Running task 947 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 948 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 949 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 950 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 951 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 952 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 953 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 954 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 955 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 956 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.41-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 967 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Started
NOTE: Running task 968 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe openssl-3.0.7-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 969 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 970 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.4-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 971 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.41-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 973 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 975 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_patch: Started
NOTE: Running setscene task 546 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 547 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 981 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 982 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_patch)
NOTE: Running task 983 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: Running task 984 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_deploy_source_date_epoch)
NOTE: Running task 985 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_patch: Succeeded
NOTE: Running task 986 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_unpack: Succeeded
NOTE: Running task 987 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 988 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 989 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_fetch)
NOTE: Running task 990 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_unpack)
NOTE: Running task 991 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 992 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 993 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: Running task 994 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: Running task 995 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_patch: Succeeded
NOTE: Running task 998 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 999 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1005 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 1006 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1007 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1008 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_fetch)
NOTE: Running task 1009 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1012 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_patch: Succeeded
NOTE: Running task 1013 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1014 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1015 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 1016 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 1017 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 1018 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: Running task 1025 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1026 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_patch)
NOTE: Running task 1027 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1028 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1039 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1047 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1048 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1052 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: Running task 1053 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: Running task 1054 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_patch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1055 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Succeeded
NOTE: Running task 1059 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 1060 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_fetch)
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1080 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_unpack)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: Running task 1082 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1101 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 1102 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_write_config)
NOTE: Running task 1103 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 1104 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1105 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: Running task 1106 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1107 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: Running task 1108 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1109 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Started
NOTE: Running setscene task 556 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1124 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_generate_toolchain_file)
NOTE: Running task 1125 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.66-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: Running task 1126 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: recipe libcap-2.66-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1127 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpcre2-10.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe bash-5.2.9-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_patch: Succeeded
NOTE: Running task 1128 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: Running task 1129 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1130 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb:do_fetch)
NOTE: Running task 1133 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1134 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1135 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_unpack)
NOTE: Running task 1136 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: Running task 1137 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe mesa-2_22.2.3-r0: task do_write_config: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 1138 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: Running task 1139 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Succeeded
NOTE: Running task 1140 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: Running task 1141 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_fetch)
NOTE: Running task 1142 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1145 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb:do_write_config)
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1147 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: Running task 1149 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_unpack: Started
NOTE: Running task 1150 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_fetch)
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1151 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running task 1152 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: Running task 1153 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: Running task 1154 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: recipe libcap-2.66-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: Running task 1155 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: Running task 1158 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_write_config)
NOTE: Running task 1159 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_write_config)
NOTE: Running task 1160 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.21.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: Running task 1161 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: Running task 1196 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1197 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1198 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.9-r0: task do_unpack: Started
NOTE: Running task 1199 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1200 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_patch)
NOTE: Running task 1201 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Started
NOTE: Running task 1202 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe python3-pycairo-1.21.0-r0: task do_write_config: Started
NOTE: Running task 1203 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_patch)
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: Running task 1204 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: recipe psmisc-23.5-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 1205 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 1206 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_unpack)
NOTE: Running task 1207 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_unpack)
NOTE: recipe make-4.4-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Started
NOTE: Running task 1208 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.21.0-r0: task do_write_config: Succeeded
NOTE: Running task 1209 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe make-4.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.66-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1210 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1211 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: Running task 1212 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe psmisc-23.5-r0: task do_fetch: Succeeded
NOTE: Running task 1213 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.21.0-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 1214 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycairo-1.21.0-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 1215 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1216 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_patch)
NOTE: Running task 1217 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_unpack: Succeeded
NOTE: Running task 1218 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: Running task 1219 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1220 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: Running task 1221 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: Running task 1222 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_patch)
NOTE: Running task 1223 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: Running task 1224 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe make-4.4-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1225 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_patch)
NOTE: Running task 1226 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe make-4.4-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Succeeded
NOTE: Running task 1227 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1228 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1229 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1230 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1231 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1232 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1233 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: Running task 1234 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: Running task 1235 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_patch)
NOTE: Running task 1236 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Running task 1237 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: Running task 1238 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb:do_patch)
NOTE: Running task 1239 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1240 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch)
NOTE: Running task 1241 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_patch: Started
NOTE: Running task 1242 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_unpack)
NOTE: Running task 1243 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 1244 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 1245 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_patch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe freetype-2.12.1-r0: task do_patch: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Started
NOTE: Running task 1246 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.9-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1247 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_generate_toolchain_file)
NOTE: Running task 1248 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1249 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 559 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.66-r0: task do_patch: Started
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.21.0-r0: task do_patch: Started
NOTE: recipe python3-3.11.0-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Started
NOTE: recipe psmisc-23.5-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe make-4.4-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: Running task 1260 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1261 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: Running task 1262 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1263 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycairo-1.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1264 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: Running task 1265 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1266 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: Running task 1267 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_lic)
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1268 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.66-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1269 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1270 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe make-4.4-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.66-r0: task do_populate_lic: Started
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1271 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycairo-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1272 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1273 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 560 of 562 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1282 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1285 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1286 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.66-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_lic unihash changed to 202e168ea3fa0e88b5715b9a7153ac8a8246df3ccbd7317c6190d0b5bc5b5ce7
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1287 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1288 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_patch)
NOTE: recipe python3-pycairo-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygobject-3.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1289 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_patch: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1290 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_patch: Succeeded
NOTE: Running task 1291 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1292 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1339 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1340 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1341 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1346 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1347 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1352 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1353 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1354 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.2.3-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: Running task 1355 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1356 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1357 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe mesa-2_22.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1358 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_configure)
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1359 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: Running task 1360 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_configure)
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1361 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_configure)
NOTE: recipe zlib-1.2.13-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1362 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1363 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1364 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_configure)
NOTE: Running task 1365 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1366 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1367 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1368 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_compile)
NOTE: recipe python3-3.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1369 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_configure: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: Running task 1370 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_compile: Started
NOTE: recipe python3-3.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_configure: Succeeded
NOTE: Running task 1371 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_compile: Succeeded
NOTE: Running task 1372 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_configure_ptest_base)
NOTE: Running task 1373 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_configure_ptest_base: Started
NOTE: Running task 1374 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_install: Started
NOTE: recipe zlib-1.2.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1375 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_compile)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: recipe zlib-1.2.13-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Succeeded
NOTE: Running task 1376 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot)
NOTE: Running task 1377 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: Running task 1378 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 1379 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_populate_sysroot)
NOTE: Running task 1380 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_package)
NOTE: Running task 1381 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1382 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1383 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_compile: Succeeded
NOTE: Running task 1384 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_compile_ptest_base)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1385 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe zlib-1.2.13-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.2.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1386 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_install)
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: Running task 1387 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1388 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe openssl-3.0.7-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe zlib-1.2.13-r0: task do_install: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 1389 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: Running task 1390 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe zlib-1.2.13-r0: task do_install: Succeeded
NOTE: Running task 1391 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_install_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1392 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure_ptest_base)
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: recipe zlib-1.2.13-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1393 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile)
NOTE: recipe zlib-1.2.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1394 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot)
NOTE: Running task 1395 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 1396 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_compile: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Running task 1397 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_package: Succeeded
NOTE: Running task 1398 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_packagedata)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1399 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata: Started
NOTE: Running task 1400 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1401 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: Running task 1402 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1403 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: Running task 1404 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: Running task 1405 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1406 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1407 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1408 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_install: Succeeded
NOTE: Running task 1409 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1410 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot)
NOTE: Running task 1411 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1412 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_compile)
NOTE: recipe libtool-cross-2.4.7-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Succeeded
NOTE: Running task 1413 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata)
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1414 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1415 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1416 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1417 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1418 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile)
NOTE: recipe libtool-cross-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1419 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_install)
NOTE: recipe openssl-3.0.7-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_install: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1420 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1421 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1422 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1425 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1426 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1427 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1428 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1429 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1430 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1431 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1432 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1433 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1434 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1435 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1436 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1437 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1438 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1439 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1440 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe flex-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1441 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1442 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flex-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1443 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1444 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure)
NOTE: Running task 1445 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_configure)
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: Running task 1447 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_configure)
NOTE: recipe cracklib-2.9.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1448 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_configure)
NOTE: recipe libcap-ng-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1449 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_configure)
NOTE: Running task 1450 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_configure)
NOTE: recipe xz-5.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1451 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_configure)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1453 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1454 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_configure)
NOTE: Running task 1455 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: Running task 1456 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure)
NOTE: recipe make-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_configure: Started
NOTE: Running task 1457 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe gdbm-1.23-r0: task do_configure: Started
NOTE: Running task 1458 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_configure)
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Started
NOTE: Running task 1459 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_configure)
NOTE: Running task 1460 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: Running task 1461 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: recipe cracklib-2.9.8-r0: task do_configure: Started
NOTE: Running task 1462 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: Running task 1463 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_configure: Started
NOTE: recipe xz-5.2.9-r0: task do_configure: Started
NOTE: Running task 1464 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: Running task 1465 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: recipe libpng-1.6.39-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe make-4.4-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: Running task 1466 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: Running task 1467 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: Running task 1468 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_configure: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1471 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1472 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1473 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1474 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_install)
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Started
NOTE: Running task 1475 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1476 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1477 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1478 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1480 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1481 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1482 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1483 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1484 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_install)
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Succeeded
NOTE: Running task 1485 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot)
NOTE: Running task 1486 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1487 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1488 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_configure)
NOTE: Running task 1489 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1490 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_compile: Succeeded
NOTE: Running task 1491 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: Running task 1492 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1493 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: Running task 1494 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot)
NOTE: recipe bash-completion-2.11-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1495 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1496 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: Running task 1497 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1498 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1499 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: Running task 1500 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1501 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: Running task 1502 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1503 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1505 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1507 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_compile)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1508 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1509 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1510 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe libpng-1.6.39-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_compile)
NOTE: recipe libpng-1.6.39-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1512 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe cracklib-2.9.8-r0: task do_configure: Succeeded
NOTE: Running task 1513 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_compile)
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1514 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: Running task 1515 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_configure_ptest_base)
NOTE: recipe cracklib-2.9.8-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1516 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1517 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1518 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 1519 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_compile)
NOTE: recipe libcap-ng-0.8.3-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1520 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1521 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_install)
NOTE: recipe make-4.4-r0: task do_configure: Succeeded
NOTE: Running task 1522 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_compile)
NOTE: recipe libpcre2-10.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-2.9.8-r0: task do_compile: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Started
NOTE: recipe openssl-3.0.7-r0: task do_compile: Succeeded
NOTE: recipe make-4.4-r0: task do_compile: Started
NOTE: Running task 1523 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_install)
NOTE: Running task 1524 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre2-10.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_install: Started
NOTE: Running task 1525 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1526 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1527 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install)
NOTE: recipe libpcre2-10.41-r0: task do_configure: Started
NOTE: recipe openssl-3.0.7-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_compile_ptest_base)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1530 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_install: Succeeded
NOTE: Running task 1531 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1532 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: Running task 1533 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot)
NOTE: Running task 1534 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1536 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: Running task 1537 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_install)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1538 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1539 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1540 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_install: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1541 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_configure: Succeeded
NOTE: Running task 1542 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure_ptest_base)
NOTE: recipe make-4.4-r0: task do_compile: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Started
NOTE: Running task 1543 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe make-4.4-r0: task do_install: Started
NOTE: Running task 1544 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1545 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1546 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot)
NOTE: Running task 1547 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe gdbm-1.23-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_install: Succeeded
NOTE: Running task 1548 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot)
NOTE: Running task 1549 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: recipe libpng-1.6.39-r0: task do_compile: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot: Started
NOTE: Running task 1550 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: recipe libpng-1.6.39-r0: task do_install: Started
NOTE: recipe cracklib-2.9.8-r0: task do_install: Succeeded
NOTE: Running task 1551 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot)
NOTE: Running task 1552 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1553 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot: Started
NOTE: Running task 1554 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe cracklib-2.9.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1555 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe libpng-1.6.39-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: Running task 1556 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot)
NOTE: Running task 1557 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_compile)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_package: Started
NOTE: recipe libffi-3.4.4-r0: task do_compile: Started
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1559 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe make-4.4-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1560 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package)
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe make-4.4-r0: task do_package: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1561 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1562 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1563 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_configure)
NOTE: recipe freetype-2.12.1-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1564 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_install)
NOTE: recipe libffi-3.4.4-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_compile: Succeeded
NOTE: Running task 1565 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 1566 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_configure: Succeeded
NOTE: Running task 1567 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_configure_ptest_base)
NOTE: recipe flex-2.6.4-r0: task do_configure_ptest_base: Started
NOTE: recipe flex-2.6.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1568 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_compile)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_compile: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 1570 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1571 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Running task 1572 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata)
NOTE: Running task 1573 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata)
NOTE: recipe gdbm-1.23-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.39-r0: task do_package: Succeeded
NOTE: Running task 1574 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 1575 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_compile)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Started
NOTE: recipe make-4.4-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1576 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_compile)
NOTE: Running task 1577 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata)
NOTE: recipe make-4.4-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 1578 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata: Started
NOTE: recipe make-4.4-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_compile)
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Succeeded
NOTE: Running task 1581 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package)
NOTE: Running task 1583 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1584 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_install)
NOTE: recipe xz-5.2.9-r0: task do_compile: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_install: Succeeded
NOTE: Running task 1585 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Started
NOTE: Running task 1586 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install_ptest_base)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1587 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot)
NOTE: Running task 1588 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1589 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: Running task 1590 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_compile_ptest_base)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1592 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1594 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_configure)
NOTE: recipe libxcb-1.15-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 1596 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Succeeded
NOTE: Running task 1597 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata)
NOTE: recipe libpcre2-10.41-r0: task do_configure: Succeeded
NOTE: Running task 1598 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Started
NOTE: Running task 1599 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.41-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1600 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_configure)
NOTE: recipe xz-5.2.9-r0: task do_compile: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_install)
NOTE: Running task 1602 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe xz-5.2.9-r0: task do_install: Started
NOTE: recipe freetype-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1603 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_compile: Started
NOTE: Running task 1604 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Started
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 1605 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: Running task 1606 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1608 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure_ptest_base)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1609 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot)
NOTE: Running task 1610 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1611 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_compile: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Running task 1612 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata)
NOTE: recipe gdbm-1.23-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1613 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_install)
NOTE: recipe xz-5.2.9-r0: task do_install: Succeeded
NOTE: Running task 1614 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot)
NOTE: Running task 1615 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_package)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.2.9-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1616 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1617 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 1618 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_compile: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Started
NOTE: Running task 1619 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile_ptest_base)
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1620 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1621 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_configure: Succeeded
NOTE: Running task 1622 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_compile: Started
NOTE: Running task 1623 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1624 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1625 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Succeeded
NOTE: Running task 1626 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install)
NOTE: Running task 1627 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Started
NOTE: recipe acl-2.3.1-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1628 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_configure)
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1629 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_compile: Succeeded
NOTE: Running task 1630 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_install)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_install: Started
NOTE: recipe freetype-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1631 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_install: Succeeded
NOTE: Running task 1632 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1633 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot)
NOTE: Running task 1634 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_install: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 1635 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 1636 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: Running task 1637 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe freetype-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 1638 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 1639 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_package)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Succeeded
NOTE: Running task 1640 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_install)
NOTE: recipe xz-5.2.9-r0: task do_package: Succeeded
NOTE: Running task 1641 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata)
NOTE: recipe libdrm-2.4.114-r0: task do_install: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1642 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_configure: Succeeded
NOTE: Running task 1643 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1644 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_install: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_compile: Started
NOTE: Running task 1645 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata)
NOTE: Running task 1646 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot)
NOTE: Running task 1647 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_package)
NOTE: recipe libpcre2-10.41-r0: task do_compile: Succeeded
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: Running task 1648 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_install)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.114-r0: task do_package: Started
NOTE: recipe libpcre2-10.41-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.41-r0: task do_install: Succeeded
NOTE: Running task 1649 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_populate_sysroot)
NOTE: Running task 1650 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_package)
NOTE: recipe libpcre2-10.41-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.41-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Running task 1651 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata)
NOTE: recipe freetype-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 1652 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata)
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1653 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre2-10.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1654 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_configure: Succeeded
NOTE: Running task 1655 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_compile)
NOTE: recipe libxcb-1.15-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.114-r0: task do_package: Succeeded
NOTE: Running task 1656 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1657 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.41-r0: task do_package: Succeeded
NOTE: Running task 1658 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: recipe libpcre2-10.41-r0: task do_packagedata: Started
NOTE: Running task 1659 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot)
NOTE: Running task 1660 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe libpcre2-10.41-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1661 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1662 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1663 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 1664 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1665 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_install)
NOTE: recipe libxcb-1.15-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Running task 1666 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata)
NOTE: recipe sed-4.9-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: Running task 1667 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_packagedata: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1668 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1669 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 1670 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_install: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_compile: Succeeded
NOTE: Running task 1671 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot)
NOTE: Running task 1672 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_install)
NOTE: Running task 1673 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 1674 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: Running task 1675 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1676 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1677 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_configure)
NOTE: recipe libx11-1_1.8.1-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: Running task 1678 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Running task 1679 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: Running task 1680 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot)
NOTE: Running task 1681 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Succeeded
NOTE: Running task 1682 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata)
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_install: Succeeded
NOTE: Running task 1683 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot)
NOTE: Running task 1684 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_package)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata)
NOTE: recipe icu-72-1-r0: task do_packagedata: Started
NOTE: recipe icu-72-1-r0: task do_packagedata: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1686 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1687 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1688 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1689 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_configure)
NOTE: recipe bash-5.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1690 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_configure)
NOTE: Running task 1691 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_configure)
NOTE: recipe readline-8.2-r0: task do_configure: Started
NOTE: recipe psmisc-23.5-r0: task do_configure: Started
NOTE: recipe bash-5.2.9-r0: task do_configure: Started
NOTE: recipe openssl-3.0.7-r0: task do_install: Succeeded
NOTE: Running task 1692 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1693 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_compile)
NOTE: recipe libx11-1_1.8.1-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1694 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_install)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_install: Succeeded
NOTE: Running task 1695 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot)
NOTE: Running task 1696 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_package)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1697 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot)
NOTE: Running task 1698 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_package)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package: Succeeded
NOTE: Running task 1699 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Started
NOTE: recipe readline-8.2-r0: task do_configure: Succeeded
NOTE: Running task 1700 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_compile)
NOTE: recipe readline-8.2-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe readline-8.2-r0: task do_compile: Succeeded
NOTE: Running task 1701 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_install)
NOTE: recipe readline-8.2-r0: task do_install: Started
NOTE: recipe readline-8.2-r0: task do_install: Succeeded
NOTE: Running task 1702 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1703 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1704 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_configure)
NOTE: recipe python3-3.11.0-r0: task do_configure: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_package: Succeeded
NOTE: Running task 1705 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Succeeded
NOTE: Running task 1706 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1707 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_install)
NOTE: recipe libx11-1_1.8.1-r0: task do_install: Started
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Running task 1708 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata)
NOTE: recipe readline-8.2-r0: task do_packagedata: Started
NOTE: recipe readline-8.2-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_configure: Succeeded
NOTE: Running task 1709 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.9-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1710 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_compile)
NOTE: recipe bash-5.2.9-r0: task do_compile: Started
NOTE: recipe psmisc-23.5-r0: task do_configure: Succeeded
NOTE: Running task 1711 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_compile)
NOTE: recipe libx11-1_1.8.1-r0: task do_install: Succeeded
NOTE: Running task 1712 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot)
NOTE: Running task 1713 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_package)
NOTE: recipe psmisc-23.5-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1714 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1715 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1716 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1717 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.5-r0: task do_compile: Succeeded
NOTE: Running task 1718 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_install)
NOTE: recipe psmisc-23.5-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1719 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1720 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1721 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: Running task 1722 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe psmisc-23.5-r0: task do_install: Succeeded
NOTE: Running task 1723 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_package)
NOTE: recipe psmisc-23.5-r0: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1724 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_install)
NOTE: recipe flex-2.6.4-r0: task do_install: Started
NOTE: recipe flex-2.6.4-r0: task do_install: Succeeded
NOTE: Running task 1725 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_install_ptest_base)
NOTE: recipe flex-2.6.4-r0: task do_install_ptest_base: Started
NOTE: recipe psmisc-23.5-r0: task do_package: Succeeded
NOTE: Running task 1726 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_packagedata)
NOTE: recipe psmisc-23.5-r0: task do_packagedata: Started
NOTE: recipe bash-5.2.9-r0: task do_compile: Succeeded
NOTE: Running task 1727 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_compile_ptest_base)
NOTE: recipe flex-2.6.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1728 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot)
NOTE: Running task 1729 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: recipe bash-5.2.9-r0: task do_compile_ptest_base: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: recipe psmisc-23.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1730 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1731 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.1-r0: task do_package: Succeeded
NOTE: Running task 1732 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1733 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: recipe bash-5.2.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1734 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_install)
NOTE: recipe bash-5.2.9-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1735 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: Running task 1736 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: Running task 1737 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_compile)
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1739 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1741 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1742 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1743 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1744 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1745 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: Running task 1746 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1747 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1748 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1749 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1750 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1751 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: Running task 1752 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: recipe bash-5.2.9-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: Running task 1753 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_install_ptest_base)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_install_ptest_base: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1754 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1755 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1756 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1757 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1758 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1759 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1760 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: Running task 1761 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1762 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1763 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_package)
NOTE: recipe bash-5.2.9-r0: task do_package: Started
NOTE: recipe python3-3.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1764 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1765 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_compile)
NOTE: recipe python3-3.11.0-r0: task do_compile: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1766 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1767 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1768 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1769 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1770 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 1771 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_package: Succeeded
NOTE: Running task 1772 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_packagedata)
NOTE: recipe bash-5.2.9-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1773 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe bash-5.2.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1774 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1775 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1776 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1777 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1779 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1780 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 1781 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1782 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1783 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_configure)
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1784 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: Running task 1785 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1786 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_compile_ptest_base)
NOTE: recipe python3-3.11.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.11.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1787 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_install)
NOTE: recipe python3-3.11.0-r0: task do_install: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Succeeded
NOTE: Running task 1788 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1789 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1790 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_install)
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1791 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1792 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1793 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1794 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1796 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1797 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1798 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1799 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1800 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1801 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.66-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.66-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1802 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_configure)
NOTE: recipe libcap-2.66-r0: task do_configure: Started
NOTE: recipe shadow-4.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1803 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_configure)
NOTE: recipe util-linux-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1804 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_configure)
NOTE: recipe libcap-2.66-r0: task do_configure: Succeeded
NOTE: Running task 1805 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_compile)
NOTE: recipe shadow-4.13-r0: task do_configure: Started
NOTE: recipe libcap-2.66-r0: task do_compile: Started
NOTE: recipe util-linux-2.38.1-r0: task do_configure: Started
NOTE: recipe libcap-2.66-r0: task do_compile: Succeeded
NOTE: Running task 1806 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_install)
NOTE: recipe libcap-2.66-r0: task do_install: Started
NOTE: recipe libcap-2.66-r0: task do_install: Succeeded
NOTE: Running task 1807 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot)
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1808 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1809 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Running task 1810 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1811 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_package)
NOTE: recipe libcap-2.66-r0: task do_package: Started
NOTE: recipe libcap-2.66-r0: task do_package: Succeeded
NOTE: Running task 1812 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata)
NOTE: recipe libcap-2.66-r0: task do_packagedata: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata: Succeeded
NOTE: recipe shadow-4.13-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_compile)
NOTE: recipe shadow-4.13-r0: task do_compile: Started
NOTE: recipe shadow-4.13-r0: task do_compile: Succeeded
NOTE: Running task 1814 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_install)
NOTE: recipe shadow-4.13-r0: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_install: Succeeded
NOTE: Running task 1815 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot)
NOTE: Running task 1816 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.13-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_configure: Succeeded
NOTE: Running task 1817 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.38.1-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.38.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1818 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_compile)
NOTE: recipe util-linux-2.38.1-r0: task do_compile: Started
NOTE: recipe shadow-4.13-r0: task do_package: Succeeded
NOTE: Running task 1819 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata)
NOTE: recipe shadow-4.13-r0: task do_packagedata: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_compile: Succeeded
NOTE: Running task 1820 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.38.1-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.38.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1821 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_install)
NOTE: recipe util-linux-2.38.1-r0: task do_install: Started
NOTE: recipe python3-3.11.0-r0: task do_install: Succeeded
NOTE: Running task 1822 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_install_ptest_base)
NOTE: recipe python3-3.11.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.11.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1823 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot)
NOTE: Running task 1824 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-3.11.0-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_install: Succeeded
NOTE: Running task 1825 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.38.1-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.38.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1826 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 1827 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1828 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1829 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1830 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1831 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1832 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1833 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_configure)
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Started
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1834 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_configure: Started
NOTE: recipe libxml2-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1835 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_configure)
NOTE: recipe libxml2-2.10.3-r0: task do_configure: Started
NOTE: recipe libxml2-2.10.3-r0: task do_configure: Succeeded
NOTE: Running task 1836 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.10.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.10.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1837 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_compile)
NOTE: recipe libxml2-2.10.3-r0: task do_compile: Started
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: Running task 1838 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_compile)
NOTE: recipe eudev-3.2.11-r0: task do_compile: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Succeeded
NOTE: Running task 1839 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_compile)
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Started
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: Running task 1840 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1841 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile)
NOTE: recipe coreutils-9.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_configure: Succeeded
NOTE: Running task 1842 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1843 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_compile: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_install)
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Started
NOTE: recipe eudev-3.2.11-r0: task do_compile: Succeeded
NOTE: Running task 1845 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_install)
NOTE: recipe python3-3.11.0-r0: task do_package: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_install: Started
NOTE: Running task 1846 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata)
NOTE: recipe python3-3.11.0-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Succeeded
NOTE: Running task 1847 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_install: Succeeded
NOTE: Running task 1848 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_install: Succeeded
NOTE: Running task 1849 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1850 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_package)
NOTE: Running task 1851 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_package)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.10.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.10.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1853 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_install)
NOTE: recipe libxml2-2.10.3-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_package: Succeeded
NOTE: Running task 1854 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.10.3-r0: task do_install: Succeeded
NOTE: Running task 1855 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_compile: Succeeded
NOTE: Running task 1856 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.10.3-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1857 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install)
NOTE: recipe eudev-3.2.11-r0: task do_package: Succeeded
NOTE: Running task 1858 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_install: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1860 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_compile: Succeeded
NOTE: Running task 1861 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1862 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_install: Succeeded
NOTE: Running task 1863 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1864 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_populate_sysroot)
NOTE: Running task 1865 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1866 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1867 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1868 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1869 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1870 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1871 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure)
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: recipe dbus-1.14.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1873 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1874 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.10.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1875 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot)
NOTE: Running task 1876 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package)
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.10.3-r0: task do_package: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1877 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1878 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1879 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1880 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe wayland-1.21.0-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Running task 1881 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1882 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm)
NOTE: recipe wayland-1.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1883 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1884 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile)
NOTE: recipe wayland-1.21.0-r0: task do_compile: Started
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: Running task 1885 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1886 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1887 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install)
NOTE: recipe wayland-1.21.0-r0: task do_install: Started
NOTE: recipe wayland-1.21.0-r0: task do_install: Succeeded
NOTE: Running task 1888 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1889 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1890 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1891 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_package: Succeeded
NOTE: Running task 1892 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_configure: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata: Started
NOTE: Running task 1893 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1894 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 1895 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_install)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_install: Succeeded
NOTE: Running task 1897 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_populate_sysroot)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1898 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_configure: Succeeded
NOTE: Running task 1899 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1900 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile)
NOTE: recipe dbus-1.14.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1901 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe mesa-2_22.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1902 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1903 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1904 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1905 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_package: Succeeded
NOTE: Running task 1906 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1907 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile: Succeeded
NOTE: Running task 1908 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1909 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install)
NOTE: recipe dbus-1.14.4-r0: task do_install: Started
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: Running task 1910 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1911 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_package)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_install: Succeeded
NOTE: Running task 1912 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_compile)
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1914 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot)
NOTE: Running task 1915 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_package)
NOTE: recipe mesa-2_22.2.3-r0: task do_compile: Started
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1916 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dbus-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1917 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_configure)
NOTE: recipe python3-dbus-1.3.2-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_package: Succeeded
NOTE: Running task 1918 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: Running task 1919 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_install: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1920 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_compile)
NOTE: recipe python3-dbus-1.3.2-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1921 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_install)
NOTE: recipe python3-dbus-1.3.2-r0: task do_install: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_install: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_install: Succeeded
NOTE: Running task 1922 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot)
NOTE: Running task 1923 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_package)
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_package: Started
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1924 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.4-r0: task do_package: Succeeded
NOTE: Running task 1925 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1926 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package)
NOTE: Running task 1927 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_package_write_rpm)
NOTE: recipe python3-dbus-1.3.2-r0: task do_package: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1928 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe dbus-1.14.4-r0: task do_package_write_rpm: Started
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1929 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_packagedata)
NOTE: recipe python3-dbus-1.3.2-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.3-r0: task do_package: Succeeded
NOTE: Running task 1930 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata)
NOTE: recipe python3-dbus-1.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1931 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package_write_rpm)
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: Running task 1932 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_compile)
NOTE: recipe dbus-1.14.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_compile: Started
NOTE: recipe libical-3.0.16-r0: task do_compile: Succeeded
NOTE: Running task 1933 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_install)
NOTE: recipe libical-3.0.16-r0: task do_install: Started
NOTE: recipe libical-3.0.16-r0: task do_install: Succeeded
NOTE: Running task 1934 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot)
NOTE: Running task 1935 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_package)
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_package: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1936 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.66-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.66-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1937 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_configure)
NOTE: recipe bluez5-5.66-r0: task do_configure: Started
NOTE: recipe libical-3.0.16-r0: task do_package: Succeeded
NOTE: Running task 1938 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata)
NOTE: recipe libical-3.0.16-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1939 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_install)
NOTE: recipe mesa-2_22.2.3-r0: task do_install: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_install: Succeeded
NOTE: Running task 1940 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_populate_sysroot)
NOTE: Running task 1941 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_package)
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_package: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1942 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1943 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.66-r0: task do_configure: Succeeded
NOTE: Running task 1944 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.66-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.66-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1945 of 1974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_compile)
NOTE: recipe bluez5-5.66-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-musl', 'i686-linux-musl', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/bluetooth.h lib/bluetooth/bluetooth.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/hci.h lib/bluetooth/hci.h
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/hci_lib.h lib/bluetooth/hci_lib.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/sco.h lib/bluetooth/sco.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/l2cap.h lib/bluetooth/l2cap.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/sdp.h lib/bluetooth/sdp.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/sdp_lib.h lib/bluetooth/sdp_lib.h
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/rfcomm.h lib/bluetooth/rfcomm.h
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p ell
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/bnep.h lib/bluetooth/bnep.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/cmtp.h lib/bluetooth/cmtp.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66/lib/hidp.h lib/bluetooth/hidp.h
| for f in  ; do \
| 	if [ ! -f $f ] ; then \
| 		ln -s -t ell -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build/../bluez-5.66/../ell/$f ; \
| 	fi \
| done > ell/shared
| ../bluez-5.66/src/genbuiltin hostname wiimote autopair policy    a2dp avrcp network input hog  gap scanparam deviceinfo  battery bap mcp vcp > src/builtin.h
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p obexd/src/
| ../bluez-5.66/obexd/src/genbuiltin filesystem bluetooth  opp ftp irmc pbap mas mns > obexd/src/builtin.h
| make --no-print-directory all-am
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-queue.lo `test -f 'src/shared/queue.c' || echo '../bluez-5.66/'`src/shared/queue.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-util.lo `test -f 'src/shared/util.c' || echo '../bluez-5.66/'`src/shared/util.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-mgmt.lo `test -f 'src/shared/mgmt.c' || echo '../bluez-5.66/'`src/shared/mgmt.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-crypto.lo `test -f 'src/shared/crypto.c' || echo '../bluez-5.66/'`src/shared/crypto.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-ecc.lo `test -f 'src/shared/ecc.c' || echo '../bluez-5.66/'`src/shared/ecc.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-ringbuf.lo `test -f 'src/shared/ringbuf.c' || echo '../bluez-5.66/'`src/shared/ringbuf.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-hci.lo `test -f 'src/shared/hci.c' || echo '../bluez-5.66/'`src/shared/hci.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-hci-crypto.lo `test -f 'src/shared/hci-crypto.c' || echo '../bluez-5.66/'`src/shared/hci-crypto.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-hfp.lo `test -f 'src/shared/hfp.c' || echo '../bluez-5.66/'`src/shared/hfp.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-uhid.lo `test -f 'src/shared/uhid.c' || echo '../bluez-5.66/'`src/shared/uhid.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-pcap.lo `test -f 'src/shared/pcap.c' || echo '../bluez-5.66/'`src/shared/pcap.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-btsnoop.lo `test -f 'src/shared/btsnoop.c' || echo '../bluez-5.66/'`src/shared/btsnoop.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-ad.lo `test -f 'src/shared/ad.c' || echo '../bluez-5.66/'`src/shared/ad.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-att.lo `test -f 'src/shared/att.c' || echo '../bluez-5.66/'`src/shared/att.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-gatt-helpers.lo `test -f 'src/shared/gatt-helpers.c' || echo '../bluez-5.66/'`src/shared/gatt-helpers.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-gatt-client.lo `test -f 'src/shared/gatt-client.c' || echo '../bluez-5.66/'`src/shared/gatt-client.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-gatt-server.lo `test -f 'src/shared/gatt-server.c' || echo '../bluez-5.66/'`src/shared/gatt-server.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-gatt-db.lo `test -f 'src/shared/gatt-db.c' || echo '../bluez-5.66/'`src/shared/gatt-db.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-gap.lo `test -f 'src/shared/gap.c' || echo '../bluez-5.66/'`src/shared/gap.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-log.lo `test -f 'src/shared/log.c' || echo '../bluez-5.66/'`src/shared/log.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-bap.lo `test -f 'src/shared/bap.c' || echo '../bluez-5.66/'`src/shared/bap.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-mcp.lo `test -f 'src/shared/mcp.c' || echo '../bluez-5.66/'`src/shared/mcp.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-vcp.lo `test -f 'src/shared/vcp.c' || echo '../bluez-5.66/'`src/shared/vcp.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-shell.lo `test -f 'src/shared/shell.c' || echo '../bluez-5.66/'`src/shared/shell.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-io-mainloop.lo `test -f 'src/shared/io-mainloop.c' || echo '../bluez-5.66/'`src/shared/io-mainloop.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-timeout-mainloop.lo `test -f 'src/shared/timeout-mainloop.c' || echo '../bluez-5.66/'`src/shared/timeout-mainloop.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-mainloop.lo `test -f 'src/shared/mainloop.c' || echo '../bluez-5.66/'`src/shared/mainloop.c
| /bin/bash ./libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unu
 sed-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/shared/libshared_mainloop_la-mainloop-notify.lo `test -f 'src/shared/mainloop-notify.c' || echo '../bluez-5.66/'`src/shared/mainloop-notify.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/oui.o ../bluez-5.66/src/oui.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/sdp-xml.o ../bluez-5.66/src/sdp-xml.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/bneptest.o ../bluez-5.66/tools/bneptest.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/mcaptest.o ../bluez-5.66/tools/mcaptest.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/cltest.o ../bluez-5.66/tools/cltest.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/oobtest.o ../bluez-5.66/tools/oobtest.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/advtest.o ../bluez-5.66/tools/advtest.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/seq2bseq.o ../bluez-5.66/tools/seq2bseq.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/nokfw.o ../bluez-5.66/tools/nokfw.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/rtlfw.o ../bluez-5.66/tools/rtlfw.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/bcmfw.o ../bluez-5.66/tools/bcmfw.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/create-image.o ../bluez-5.66/tools/create-image.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/eddystone.o ../bluez-5.66/tools/eddystone.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/ibeacon.o ../bluez-5.66/tools/ibeacon.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/btgatt-client.o ../bluez-5.66/tools/btgatt-client.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o src/uuid-helper.o ../bluez-5.66/src/uuid-helper.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/btgatt-server.o ../bluez-5.66/tools/btgatt-server.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/test-runner.o ../bluez-5.66/tools/test-runner.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/check-selftest.o ../bluez-5.66/tools/check-selftest.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/gatt-service.o ../bluez-5.66/tools/gatt-service.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/btmgmt.o ../bluez-5.66/tools/btmgmt.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/obex-client-tool.o ../bluez-5.66/tools/obex-client-tool.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/obex-server-tool.o ../bluez-5.66/tools/obex-server-tool.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/bluetooth-player.o ../bluez-5.66/tools/bluetooth-player.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib  -fPIC      -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/rec
 ipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o tools/obexctl.o ../bluez-5.66/tools/obexctl.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/gap.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-gap.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/mgmt.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-mgmt.o
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"    -fPIC      -
 O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/
 auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/network/bluetoothd-manager.o `test -f 'profiles/network/manager.c' || echo '../bluez-5.66/'`profiles/network/manager.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/ringbuf.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-ringbuf.o
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"    -fPIC      -
 O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/
 auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/network/bluetoothd-bnep.o `test -f 'profiles/network/bnep.c' || echo '../bluez-5.66/'`profiles/network/bnep.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/hfp.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-hfp.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/gatt-server.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-gatt-server.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/bap.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-bap.o
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"    -fPIC      -
 O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/
 auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/network/bluetoothd-server.o `test -f 'profiles/network/server.c' || echo '../bluez-5.66/'`profiles/network/server.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"    -fPIC      -
 O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/
 auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/network/bluetoothd-connection.o `test -f 'profiles/network/connection.c' || echo '../bluez-5.66/'`profiles/network/connection.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/att.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-att.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/hci.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-hci.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/hci-crypto.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-hci-crypto.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/vcp.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-vcp.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/uhid.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-uhid.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/btsnoop.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-btsnoop.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/mainloop-notify.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-mainloop-notify.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/util.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-util.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/crypto.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-crypto.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/ad.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-ad.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/ecc.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-ecc.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/gatt-client.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-gatt-client.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/timeout-mainloop.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-timeout-mainloop.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/queue.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-queue.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/pcap.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-pcap.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/gatt-db.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-gatt-db.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/shell.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-shell.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/io-mainloop.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-io-mainloop.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/gatt-helpers.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-gatt-helpers.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/log.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-log.o
| ../bluez-5.66/src/shared/util.c: In function 'util_debug_va':
| ../bluez-5.66/src/shared/util.c:68:18: error: 'MAX_INPUT' undeclared (first use in this function)
|    68 |         char str[MAX_INPUT];
|       |                  ^~~~~~~~~
| ../bluez-5.66/src/shared/util.c:68:18: note: each undeclared identifier is reported only once for each function it appears in
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66   -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -DBLUETOOTH_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/bluetooth/plugins"\"    -fPIC      -
 O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/
 auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot-native=  -DFIRMWARE_DIR=\"/lib/firmware\" -c -o profiles/input/bluetoothd-suspend-none.o `test -f 'profiles/input/suspend-none.c' || echo '../bluez-5.66/'`profiles/input/suspend-none.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/mcp.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-mcp.o
| make[1]: *** [Makefile:8102: src/shared/libshared_mainloop_la-util.lo] Error 1
| make[1]: *** Waiting for unfinished jobs....
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../bluez-5.66 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot/usr/lib/glib-2.0/include -I./lib -fPIC -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/bluez-5.66=/usr/src/debug/bluez5/5.66-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/build=/usr/src/debug/bluez5/5.66-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/
 recipe-sysroot-native= -DFIRMWARE_DIR=\"/lib/firmware\" -c ../bluez-5.66/src/shared/mainloop.c  -fPIC -DPIC -o src/shared/.libs/libshared_mainloop_la-mainloop.o
| make: *** [Makefile:4468: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.3869696:184 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.3869696, line 184
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.3869696, line 168
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.3869696, line 163
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.3869696, line 158
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.3869696, line 153
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.3869696, line 197
NOTE: recipe bluez5-5.66-r0: task do_compile: Failed
NOTE: recipe mesa-2_22.2.3-r0: task do_package: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1945 tasks of which 994 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.66-r0 do_compile: oe_runmake failed
ERROR: bluez5-5.66-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/run.do_compile.3869696', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/bluez5/5.66-r0/temp/log.do_compile.3869696
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_compile) failed with exit code '1'

--===============0061013476658395957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bluez5/bluez5-ptest: FILELIST: added "/usr/lib/bluez5/ptest/unit/test-tester"
packages/core2-32-poky-linux/bluez5/bluez5: FILELIST: removed "/usr/lib/libbluetooth.so.3.19.7", added "/usr/lib/libbluetooth.so.3.19.8"
Changes to packages/core2-32-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.7 to libbluetooth.so.3.19.8
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.7 to libbluetooth.so.3.19.8
  /usr/lib/libbluetooth.so.3.19.7 moved to /usr/lib/libbluetooth.so.3.19.8

--===============0061013476658395957==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.65-5.66.patch"

RnJvbSAzNzZhMTM5NWJlMTdhMTU2MjRhYmExMjc3NzI3ZjY0MGQxMzRiMThiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMDc6NDU6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
bHVlejU6IHVwZ3JhZGUgNS42NSAtPiA1LjY2CgotLS0KIC4uLi9ibHVlejUve2JsdWV6NV81LjY1
LmJiID0+IGJsdWV6NV81LjY2LmJifSAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L3tibHVlejVfNS42NS5iYiA9PiBibHVlejVfNS42Ni5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVl
ejVfNS42NS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjY2
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjY1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JsdWV6NS9ibHVlejVfNS42Ni5iYgppbmRleCA0YzE1YWViNDZkLi4yMjA4YjczMGIw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS42
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS42Ni5i
YgpAQCAtMSw2ICsxLDYgQEAKIHJlcXVpcmUgYmx1ZXo1LmluYwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMjU2NWE0ZDQ4MzU0YjU3NmU2YWQ5MmUyNWI1NGVkNjY4MDgyOTY1ODFjOGFiYjgwNTg3
MDUxZjk5OTNkOTZkNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzOWZlYTY0YjU5MGM5NDkyOTg0
YTBjMjdhODlmYzIwM2UxY2RjNzQ4NjYwODZlZmI4ZjQ2OTg2NzdhYjJiNTc0IgogCiAjIFRoZXNl
IGlzc3VlcyBoYXZlIGtlcm5lbCBmaXhlcyByYXRoZXIgdGhhbiBibHVleiBmaXhlcyBzbyBleGNs
dWRlIGhlcmUKIENWRV9DSEVDS19JR05PUkUgKz0gIkNWRS0yMDIwLTEyMzUyIENWRS0yMDIwLTI0
NDkwIgotLSAKMi4zNy4zCgo=

--===============0061013476658395957==--

