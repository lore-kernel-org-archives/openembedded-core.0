Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5506C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 21:32:25 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.web10.502.1654032737137953402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 14:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.194,
 mailfrom: marcel@ziswiler.com)
Received: from toolbox.int.toradex.com ([81.221.243.92]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1M2fop-1nwyPt2K3L-004Fsc;
 Tue, 31 May 2022 23:32:10 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [oe-core][PATCH v3 1/2] alsa-plugins: fix libavtp vs. avtp
 packageconfig
Date: Tue, 31 May 2022 23:32:05 +0200
Message-Id: <20220531213206.7119-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K6R/LUGBB6t+4bYLJv4IOz5WuOM95Q/OK6lMcuR5bWDdGZt+W8p
 HFaUAaUuInpu6NfNq2AacNEO/T9puQzBgGY597AT6CtqUYxh1nXsZp4fq6z/Iwq2fAnvUre
 Pcsq8WqcYvQAeSCqEoL+F5COD13Ue4GHS3mGxLdt1k9r9a20Dkl9u6R67R7RA6FDGsSYf3L
 ZaaqWPYNItp86V+MZAvmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eCw3HWVdygc=:IqQ4dEUxu9Gd/OlWU/RS3b
 vppi/uH08Fy2D4WHBV/RqIqD8S2Gu7w6HUtSbSJUWh56KasFjfXlVWVyP35an5z635fHNXM/j
 RuMkq/FWsBQPRuFK4DObwgz50n0gbnb7aZLTcc7JKmCyytjeAZUo7Fr/DbWnHNJTNCGK1n58a
 dfcPx8Z2ZULCylpaoBhAUKZTItU2pNeqBVLjC42djx5GbW8OobSmczc9M+NV4d4yCXZrRpt7o
 qdc1n8IJh+qWXaKgt3gewyX0n7hXghcHGbIRccwu5OvqIsrQ0x36DIZKhPi+l+57yD6GmciNm
 3peLyzk93AxGQbWmy9fSDZNmZOKaf8scHC+Df2zbx5JUB0ViRVa2uiqY4EUaYK5CPs522uCt+
 /vBji8HflBW7x2p8wR+74rLZLUsUyAObtSWqQPk9Q/XjrOdXrSOV/soL6S/eSKBzM4uPL+9hQ
 eggYJVInnJjqMavj3dLu2P6Jt7PoNBMFFheEXDfwrEs+3tCqX4GlAvmzp7xm9H3PkwLTfQioh
 koN+cdxifmPDNAAKahzMT+XADYIji5p2meeSTiRplDft2IRLC2vTFDdfz4RA3OWH1Rq/6Jxzi
 6wyS3D7YOnc8PByZXmzn0KJwZdjYNi9UYFCr7ry0w5evqeiVNExEaMdT1pqeoGU8fq6A3ZlQV
 L+fBIks7NKxWHA2wK1hEeUS23cJxal33va0V/bw8DLqcnMWss7J+7rlvbS3lt+2K525/YfKVu
 5eZ5Gpf0qcNRHIlGse10xBaCQsJBRu8S48jzlA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 21:32:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166337

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Fix PACKAGECONFIG to refer to libavtp instead of avtp as this is what
the project and everything is really called everywhere.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v3:
- New patch.

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


