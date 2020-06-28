Received: from out28-4.mail.aliyun.com (out28-4.mail.aliyun.com [115.124.28.4])
 by mx.groups.io with SMTP id smtpd.web11.22305.1593315217141995098
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 20:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: eswin.com, ip: 115.124.28.4, mailfrom: maochenxi@eswin.com)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3069555|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00420236-0.000684784-0.995113;FP=10263199896761130275|5|1|2|0|-1|-1|-1;HT=e01l07381;MF=maochenxi@eswin.com;NM=1;PH=DS;RN=3;RT=3;SR=0;TI=SMTPD_---.HtjKPsg_1593315209;
Received: from localhost.localdomain(mailfrom:maochenxi@eswin.com fp:SMTPD_---.HtjKPsg_1593315209)
          by smtp.aliyun-inc.com(10.194.99.21);
          Sun, 28 Jun 2020 11:33:34 +0800
From: "Chenxi Mao" <maochenxi@eswin.com>
To: openembedded-core@lists.openembedded.org
Cc: chenxi.mao2013@gmail.com,
	Chenxi Mao <maochenxi@eswin.com>
Subject: [PATCH] [dunfell][master]: don't select vulkan if directfb enabled.
Date: Sun, 28 Jun 2020 11:33:28 +0800
Message-Id: <20200628033328.653958-2-maochenxi@eswin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200628033328.653958-1-maochenxi@eswin.com>
References: <20200628033328.653958-1-maochenxi@eswin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vulkan didn't support directfb at all.
So remove this configuration if directfb enabled.

Change-Id: Ia0af5d944e858fbb99a07fcd5f10ab831a93b2d0
Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
index 7a227fed51..aee001e641 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
@@ -24,7 +24,7 @@ inherit gobject-introspection
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
     bz2 closedcaption curl dash dtls hls rsvg sbc smoothstreaming sndfile \
-- 
2.25.1

