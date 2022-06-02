Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BCBC43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 09:48:29 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by mx.groups.io with SMTP id smtpd.web09.4723.1654163303654719920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 02:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.196,
 mailfrom: marcel@ziswiler.com)
Received: from toolbox.int.toradex.com ([81.221.243.92]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1N2ma8-1nmlph1ZYi-0133lY;
 Thu, 02 Jun 2022 11:48:13 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.oss.09@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Peter Bergin <peter@berginkonsult.se>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [oe-core][PATCH v4] alsa-plugins: fix libavtp vs. avtp packageconfig
Date: Thu,  2 Jun 2022 11:48:09 +0200
Message-Id: <20220602094809.303981-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:v2gt6jMT5hprM4U33m/dcdKyRbZIs6u4NDE1LTvouKWRk5Is0gc
 TWU7/fEGhUazlvbNs5Uwx0/0fkd/8FwH/EzKKWd8NXwYM+QKcCgSz3FJhHbrjCoAPFLR7QU
 la1XdrjX9K7zYK47vrywvnztO9tx9xHJ1fGDoI9Mdiq+HfUUI8dz6W7ui6tTfTKSB9l/A6E
 fbAPJsdcH1IlAqLylxOlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w+pTsE28IBE=:IrCye/cdnNV6Dg6H17JIz8
 +1f9uhXSz3uWjcNFH/NFyhQZWTFJnClp/jawZX6gta7/+S1BDBbtPlkIBTDjw6DoeuI2LVcMq
 7xfs7juKSUSCras4F0yO/HA57umdI4XTpaqTBlMKUaaaZo/8vClcQsMonhFTDfGn22wOr+CMS
 Fa9By1PoE+q6WrsTmDZt9yf//JTTjKP1XH9HNEXg1a6ckUxoUtnBFsPlylMU7ob4EOKWz7wkH
 XHUaimydplJYM+XIkpXIkf61PgDHWyPxCIXEFBzQv+VWVd7HWEHtOnUk+lYSTsIvt8sptrlU7
 O1ww0KjC5bKFL6exIS6jEuXnBYe90m9Dn6fk4UNSIpHsvgHO6yNitntS1qFVpD5X2N72WymFK
 AuSJYglWXP86FIMp67wjBQJinyb107FSFkAv9VgOQnaiMCNPqqZjnFdWC2B8vwm3pcFPBzCyl
 jySnZGtEpjYSwxPZyyK7Xefoi7tTwWNiAAFgS3VLeY4Q6j2LyN2cVcUkajE+AXWfR/UWjrPQw
 NX65unKKcBEbW5Ib1Nswi1Q+yByg4TVxcAkBqx7KK5mVH+p372idEPVvyszZxbGxboVdsCGNC
 fdpVlt7YpzWy3kR7BK9rnq/fYk7B+JdibU149vjzOUySTFvna64Xob/fM7gxuMK7xcziN4Nw3
 qBeUc+HIJib+YGBTypjIS2zyehdirJ1QrdEU2kjWBJKZoPgHL+z7caeP/jXwHG7jSC9hDvp10
 VFjeDNFfW27zKfJrxr24gOGnlK0Qh6dVRHeVnSFBqtNVGvnpigzooTDb+XE=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 09:48:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166469

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Fix PACKAGECONFIG to refer to libavtp instead of avtp as this is what
the project and everything is really called everywhere.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---
Resurrect from mailing list [1] as this is still not upstream.
End-to-end tested on Verdin iMX8M Plus.
Will talk about it at the Embedded World Conference in the TSN & Linux
track later this month [2].

[1] https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/
[2] https://events.weka-fachmedien.de/embedded-world-conference/program/
[3] https://lore.kernel.org/all/20220602094056.303118-1-marcel@ziswiler.com/

Changes in v4:
- Dropped libavtp recipe. Will add it to meta-openembedded instead [3].

Changes in v3:
- New patch.
[libavtp]
- Rename recipe to officially released PV of 0.2.0.
- Drop PROVIDES of avtp which just works around alsa-plugins refering to
  it as such instead of libavtp. Will update PACKAGECONFIG in
  alsa-plugins instead.

Changes in v2:
[libavtp]
- Updated SRC_URI specifying mandatory protocol as https.
- Updated SRCREV to latest.

 meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
index c435f61d4c..560fd80f0b 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
@@ -34,7 +34,7 @@ PACKAGECONFIG ??= "\
         speexdsp \
         ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
 "
-PACKAGECONFIG[aaf] = "--enable-aaf,--disable-aaf,avtp"
+PACKAGECONFIG[aaf] = "--enable-aaf,--disable-aaf,libavtp"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[libav] = "--enable-libav,--disable-libav,libav"
 PACKAGECONFIG[maemo-plugin] = "--enable-maemo-plugin,--disable-maemo-plugin"
-- 
2.36.1


