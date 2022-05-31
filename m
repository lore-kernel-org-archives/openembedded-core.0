Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C6CC433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 16:14:48 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 by mx.groups.io with SMTP id smtpd.web08.51490.1654013683831654371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 09:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.197,
 mailfrom: marcel@ziswiler.com)
Received: from toolbox.toradex.int ([31.10.206.125]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0LvlwQ-1nk76338vc-017SUC;
 Tue, 31 May 2022 18:14:40 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [oe-core][PATCH v1] gstreamer1.0-plugins-bad: add avtp packageconfig
Date: Tue, 31 May 2022 18:14:33 +0200
Message-Id: <20220531161433.684189-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mPglcQF28DZQ5A2F5gScIFNNIbSUOVKQNGjO4QKYkKXuAd0+FKP
 sGTJF/5hY1r8WpXsNxHs5y5W++3D44K5OJ48TAdt0RiKWjt59koYEtRywk5Y2+CsaW3DtRN
 r8Y3pMvIpCoEk2qrwAOXEhS5IV8iIlioZHBK1da4+YsVyGgB8EbJ/oMWfg9tCzwZBsb1+5Y
 nLy9+A2AbBh8WUtvjAG5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:diSuYu0203k=:Fehm6xKMzyygoBveG+Dbrs
 thg3QyZ78lofRAQIaTCyUD3h7jc1Y0x45N+K8C59F9gjt+0yMF7a7GoQeelXAUUzoAf0OxCpH
 Wo+iwUFKH7cDytsUxzVUx233ECtSjegIGLE6ckG6g0G8X9tPi05qMC1XnmuT8+HhJ7YYOi4J7
 SE11F2f6K9APmjnBKJ1sajBe08rSXwu00q+ZSqCzIuD4tE2yRi70Wa52aJB1JG/vI9PXYxXXO
 +fZo5m/u/SCEvZ/ud+vJ9ZNUXRbPyXp9siLohzqVmdAWHd0H7xLAheO+7KDLvVPxQg3I0ZTHn
 wMmszi3C0dYA+aXpHb2mawtsHTY9w9UDVGglnqwUWHRkLT0/OAoEfVlU+2B+N3l7oF7jP8s5T
 QiNaZA6vTvydC73PcVFXr4tgjtyN8ID7/I42rKS8/2kdXFw6jMfHKLO/yPQ95NtgSrpOt97eV
 n30IiHk1Vgwy/ysk2PHtOiUeX9BJlYeWGt1c9kgOkz1vhgGP1UROFZe7A+oFinUtfm8y9FiFg
 tMrHWBRPc7ehlerpXOdmdUfPLkNHIPTGDoYvp5UOJyhnquwEUl2CvjveP9XhdmFClzXeccJVZ
 HbP8TOqzf4ReotWkbohx9hFoXF+D+a+601BgB3OcNJFAraRnjf8Dr9REKM+7ObggBjmmorkGt
 Z/1q98ny48XC9sxzN865iQGTLKAB8YxipI1iZzn6RZy1H3UNAyjrGpRR65zgdaCfa0eJOeqOI
 MAeAdX6uc8vvktsLCQI7d6ZWxjope+J5BSkRow==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 16:14:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166322

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add avtp resp. libavtp PACKAGECONFIG. This allows building them
GStreamer Audio Video Transport Protocol (AVTP) Plugins.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---
End-to-end tested on Verdin iMX8M Plus.
Will talk about it at the Embedded World Conference in the TSN & Linux
track next month [1].

[1] https://events.weka-fachmedien.de/embedded-world-conference/program/

 .../gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
index bb33e3822e..53c78d4366 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
@@ -35,6 +35,7 @@ PACKAGECONFIG ??= " \
 
 PACKAGECONFIG[aom]             = "-Daom=enabled,-Daom=disabled,aom"
 PACKAGECONFIG[assrender]       = "-Dassrender=enabled,-Dassrender=disabled,libass"
+PACKAGECONFIG[avtp]            = "-Davtp=enabled,-Davtp=disabled,libavtp"
 PACKAGECONFIG[bluez]           = "-Dbluez=enabled,-Dbluez=disabled,bluez5"
 PACKAGECONFIG[bz2]             = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
 PACKAGECONFIG[closedcaption]   = "-Dclosedcaption=enabled,-Dclosedcaption=disabled,pango cairo"
@@ -112,7 +113,6 @@ EXTRA_OEMESON += " \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
     -Dasio=disabled \
-    -Davtp=disabled \
     -Dbs2b=disabled \
     -Dchromaprint=disabled \
     -Dd3dvideosink=disabled \
-- 
2.36.1


