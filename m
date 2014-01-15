Return-Path: <andrew.mcdermott@linaro.org>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 47C4E6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 23:04:08 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w62so2441164wes.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 15:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HKP9Obq4tjXB499GD/sa+0xwSSrDkfaqStL0aMRS7lQ=;
	b=MN0TVm3uczl2cDrEwKy8vLUw4/3ANFgkN+MSL6NsgaliaH8LFs+5cU2XaFMIti9XTM
	PNXOYyXmBbaKBtAR59dgRkdH6PBz7maeArNN+2Gn/QJByobCcX+rrmpcjHHta6M0EYxq
	HFbSm91KrlX9QQJcOOmIBOd8ADEVD+hcE7MHhxT1w1RSwdq/EmFUK1MABCIWhEzd9r+F
	mcvB04Oz0bmlhKLT+La0n4nC1AYqn23zG1fiDk/TI5s1j3la07MCWtaQU706uH5j7UVP
	XwVjo2POyYe1Zc462yN0831oNNYp1K+oqzdCGVB9NXsHa0uuy93WBCxVAptJCjjkQ0GM
	WsJg==
X-Gm-Message-State: ALoCoQm1QI+iher3P/DDB379qwvJH8ybLJAn3tVgE/Th556ZG30iqYdMQQQDbCAhN9tFSDWYhSqn
X-Received: by 10.194.171.34 with SMTP id ar2mr189175wjc.81.1389827048300;
	Wed, 15 Jan 2014 15:04:08 -0800 (PST)
Received: from spicy.frobware.com
	(host86-156-191-132.range86-156.btcentralplus.com. [86.156.191.132])
	by mx.google.com with ESMTPSA id eh7sm30611924wic.2.2014.01.15.15.04.07
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 Jan 2014 15:04:07 -0800 (PST)
From: Andrew McDermott <andrew.mcdermott@linaro.org>
To: openembedded-core@lists.openembedded.org,
	patches@linaro.org
Date: Wed, 15 Jan 2014 23:03:51 +0000
Message-Id: <1389827031-16929-1-git-send-email-andrew.mcdermott@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] alsa-lib: remove hard-coded /usr/include in dev package
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
X-List-Received-Date: Wed, 15 Jan 2014 23:04:08 -0000

Specify the location of the alsa headers using ${includedir}. Without
this no headers get added to the image when the alsa-lib-dev package is
included.

Signed-off-by: Andrew McDermott <andrew.mcdermott@linaro.org>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
index 910e72d..cbe0448 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
@@ -38,7 +38,7 @@ FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
 FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
-FILES_alsa-dev += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
+FILES_alsa-dev += "${libdir}/pkgconfig/ ${includedir}/alsa ${datadir}/aclocal/*"
 FILES_alsa-conf-base = "\
 ${datadir}/alsa/alsa.conf \
 ${datadir}/alsa/cards/aliases.conf \
-- 
1.7.9.5


