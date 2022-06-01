Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81542CCA483
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.674.1654100324702716353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BCv4OMPg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010181200fee89-5a162732-7ea7-448e-a80e-7f2a0a6c0566-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EEjYEmEPrNCG2sMb8wdyaEC5IveIX61Ct0XEy3Hfvxo=;
	b=BCv4OMPgmMst332P5PHygavhSID/nW0HuI+TAPxaueFtTw9foDHbouoM3BTRx7Rt
	DP6PpcDbkdO05glDJYFJ2AZt6VTXW+y5oclgjQZtnDXMxK7c4xjGl2Eyx09lfLlVzAs
	DJ3MYLExGhGlau0jXkVEaHjXa4gfogu6WmStsXyA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EEjYEmEPrNCG2sMb8wdyaEC5IveIX61Ct0XEy3Hfvxo=;
	b=TlGYurT5qMm3fBI0KXDd4XaD38cqXiwtHt/XADwb8HPOXJ/NX+bzeIHK0erzdSF1
	co+//WGYD/CzBlsO6HP54hTS4GEAcA+t2+FoWBOJTY/QgIfFiUka1QLWpOLZS65npeI
	XcioZ4KoXBU/tV1ukG8drSrjNLDk+qkfk52KIUjs=
Content-Type: multipart/mixed; boundary="===============8416060924704301713=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-lib: upgrading to 1.2.7 SUCCEEDED
Message-ID: 
 <01010181200fee89-5a162732-7ea7-448e-a80e-7f2a0a6c0566-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166416

--===============8416060924704301713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-lib* to *1.2.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-lib-upgrade-1.2.6.1-1.2.7.patch
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
--===============8416060924704301713==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-alsa-lib-upgrade-1.2.6.1-1.2.7.patch"

From eeba3f02071905db5711badaa135d1d550a6e4d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 14:25:53 +0000
Subject: [PATCH] alsa-lib: upgrade 1.2.6.1 -> 1.2.7

---
 .../alsa/{alsa-lib_1.2.6.1.bb => alsa-lib_1.2.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.6.1.bb => alsa-lib_1.2.7.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.7.bb
index ca6bedae97..1832ce71a4 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "ad582993d52cdb5fb159a0beab60a6ac57eab0cc1bdf85dc4db6d6197f02333f"
+SRC_URI[sha256sum] = "8814e61f7ec6812c76e23a85cab00e0b0d3bba40816af36b726beb1bc04c74a7"
 
 inherit autotools pkgconfig
 
-- 
2.31.1


--===============8416060924704301713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/alsa-lib/alsa-conf: PV changed from "1.2.6.1" to "1.2.7"
packages/core2-32-poky-linux/alsa-lib/alsa-conf: PKGV changed from 1.2.6.1 [default] to 1.2.7 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-conf: PKGSIZE changed from 154743 to 155351 (+0%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dbg: PV changed from "1.2.6.1" to "1.2.7"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dbg: PKGV changed from 1.2.6.1 [default] to 1.2.7 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dbg: PKGSIZE changed from 2945196 to 2974008 (+1%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dev: PV changed from "1.2.6.1" to "1.2.7"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dev: PKGV changed from 1.2.6.1 [default] to 1.2.7 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dev: PKGSIZE changed from 440502 to 441381 (+0%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib-doc: PV changed from "1.2.6.1" to "1.2.7"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-doc: PKGV changed from 1.2.6.1 [default] to 1.2.7 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-locale: PV changed from "1.2.6.1" to "1.2.7"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-locale: PKGV changed from 1.2.6.1 [default] to 1.2.7 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-src: FILELIST: directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/aserver -> /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/aserver, directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/pcm -> /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/pcm, directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/seq -> /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/seq, directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/rawmidi -> /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/rawmidi, directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src -> /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src, directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/mixer -> /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/mixer, directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/hwdep -> /usr/src/debug/alsa-l
 ib/1.2.7-r0/alsa-lib-1.2.7/src/hwdep, directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/build/include/alsa/sound/uapi -> /usr/src/debug/alsa-lib/1.2.7-r0/build/include/alsa/sound/uapi, directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/topology -> /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/topology, directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/timer -> /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/timer, directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/ucm -> /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/ucm, directory renamed /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/include -> /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/include, removed "/usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/control_remap.c /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/setup.c /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/ctlparse.c /usr/sr
 c/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/control_hw.c /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/control.c /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/hcontrol.c /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/tlv.c /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/namehint.c /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/cards.c /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/control_empty.c /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/control_local.h /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/control_shm.c /usr/src/debug/alsa-lib/1.2.6.1-r0/alsa-lib-1.2.6.1/src/control/control_ext.c", added "/usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/control_ext.c /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/control_remap.c /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/control_empty.c /usr/src/d
 ebug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/control_local.h /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/eld.c /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/control_hw.c /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/hcontrol.c /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/namehint.c /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/tlv.c /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/cards.c /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/control.c /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/ctlparse.c /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/control_shm.c /usr/src/debug/alsa-lib/1.2.7-r0/alsa-lib-1.2.7/src/control/setup.c"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-src: PV changed from "1.2.6.1" to "1.2.7"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-src: PKGV changed from 1.2.6.1 [default] to 1.2.7 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-src: PKGSIZE changed from 3370211 to 3392046 (+1%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib-staticdev: PV changed from "1.2.6.1" to "1.2.7"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-staticdev: PKGV changed from 1.2.6.1 [default] to 1.2.7 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib: PV changed from "1.2.6.1" to "1.2.7"
packages/core2-32-poky-linux/alsa-lib/alsa-lib: PKGV changed from 1.2.6.1 [default] to 1.2.7 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib: PKGSIZE changed from 1193714 to 1206002 (+1%)
packages/core2-32-poky-linux/alsa-lib/alsa-server: PV changed from "1.2.6.1" to "1.2.7"
packages/core2-32-poky-linux/alsa-lib/alsa-server: PKGV changed from 1.2.6.1 [default] to 1.2.7 [default]
packages/core2-32-poky-linux/alsa-lib: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.6.1.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.7.tar.bz2"
packages/core2-32-poky-linux/alsa-lib: PV changed from "1.2.6.1" to "1.2.7"
packages/core2-32-poky-linux/alsa-lib: PKGV changed from 1.2.6.1 [default] to 1.2.7 [default]
packages/core2-32-poky-linux/alsa-lib/libatopology: PV changed from "1.2.6.1" to "1.2.7"
packages/core2-32-poky-linux/alsa-lib/libatopology: PKGV changed from 1.2.6.1 [default] to 1.2.7 [default]

--===============8416060924704301713==--

