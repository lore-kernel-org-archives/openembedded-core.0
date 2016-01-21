Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id C070E731FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:44:18 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id oj9so1833749obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zaRuu+BY1vLft8l+RlXe2KISx7lTgAg1iCcLeCBGqXA=;
	b=esCUJgB3uYGNYuKDD/C45xTqSTHmJKGDqFP+7DGy6PWBnQornQ8T0qSU//xynseCuc
	ieGL9kOHHaNB5P5zcvbhmgniyzUJzkd8WKe7l/V3OYL2UDaVeNmD7XiRB4f3WKzkp+wG
	S2aan/WuBYpSzslqp+oXB4aW5FgRV/qz7durQ2dIbUVPPWUGluwjdlhmj6gMPMTzk/fZ
	oHByUZnqClyAxk5GUdEtByCASphpMsRa2IndEHrXv7gpmJfp7t2vJQe4nV319MsYSixK
	o89KxDgeS0kdvLWm/EJxA8q43MQ4jjf8uPugaXyfG6ROGvMfU5PduDjTgRvSX1QoElrh
	8bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zaRuu+BY1vLft8l+RlXe2KISx7lTgAg1iCcLeCBGqXA=;
	b=Znxt4qH3wWPH67EpQtfcFfZiVfVDw6MbGmLIDlcipFfIkJocnlL3MGMl2Xb5BfPBMW
	9+1Ir5uGKy4+uR6SW7Mpa0gpqKEKzEVSuyuQe50Sc/4Cw1n4dFb1Z1egLFhxGgAvMJqR
	6Mh/SOsCW3MPY4MDI9AaQMKrkgH21LoJserCA5ye1YTmng8cizjc/G93A0aDbiy8145K
	uNpMT+4xV+bMK+s1I2ofVbegwMSVVc2uDnD0VbakNfFK9ESXM1XWH74iEyEV/RH6JCB8
	w76QErsubaUdCgMVZjKAqBgFPSyBKzXuKHFSIIiGDWINH4VMg7ckmyzjBUgws7NQhrhv
	o6nw==
X-Gm-Message-State: ALoCoQmg4fs4JCYwlN6PtPDwLqrWZBiNi7cDh9FECGM5eWRu8g0fHZCCOiza7FlCIdOqLuFhwoxB/qh20YGDodlZ4iw94ksBjg==
X-Received: by 10.182.133.37 with SMTP id oz5mr30507738obb.16.1453344259711;
	Wed, 20 Jan 2016 18:44:19 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.44.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:44:18 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:22 -0800
Message-Id: <1453344203-7118-25-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 24/25] gstreamer1.0-plugins-ugly: update git recipe to 1.7.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jan 2016 02:44:19 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb            | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index 5d710f0..f99b300 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -5,14 +5,19 @@ include gstreamer1.0-plugins-ugly.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly"
+SRC_URI = " \
+    git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly;name=base \
+    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+"
 
-SRCREV = "06b8ac10cee85c5c304ca320997aa8f44295a66f"
+PV = "1.7.1+git${SRCPV}"
+
+SRCREV_base = "c9c37983babad909d01c1c4c417d42a0cf252c1d"
+SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
-	cd ${S}
-	./autogen.sh --noconfigure
-	cd ${B}
+	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


