Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id A496C77A49
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:48:57 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a19so8078593qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 07:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TtmjcVm1Ey0mO17q3ojpCVyqghW82WRZbPHT81WdAF0=;
	b=uHkRcnRTEco/7pwTk5oVnu6h71NeQV/eNMgXHt+58Bucyea4P+EvjxT9mhnybHNtxG
	45ClvtqaNDeCjTasSx9as6aDktNS42+tJJ2FLcYIQiLzorLA8FETfQI5dH9hyfs5jwzz
	Xh/2dEABPBgZffkQoWMbT40uUoASWDxVkYigpjR2m9p8vb122OxguQ6Tlu79cG1Wr0Ah
	fJgMFxsYq7Piujv5pTIwxfO4gHfvdUGm6k89hNe/6o77VAAWMgjkL+Zs26h7I2DzIoct
	QGsjrX9YVBJr4C/fQO9ICO97hHiun11P8vp/5qwVx3F06I+aE9vEz+iYQHzchNXnPdQl
	j+Kg==
X-Gm-Message-State: AN3rC/5zJJLp4qEcVsIphttYkCJPrks9rJgbVzKJIz6j6oVOfmrNk+Rp
	ZATD/jPCWPNkuxYv
X-Received: by 10.55.197.92 with SMTP id p89mr28675068qki.34.1493131738466;
	Tue, 25 Apr 2017 07:48:58 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	s10sm15188330qke.53.2017.04.25.07.48.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Apr 2017 07:48:57 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 10:48:36 -0400
Message-Id: <1493131720-19456-4-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
References: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv4 3/7] bluez5: add PACKAGECONFIG option for midi
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
X-List-Received-Date: Tue, 25 Apr 2017 14:48:58 -0000

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 4244fc8..687656e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -16,6 +16,7 @@ PACKAGECONFIG ??= "obex-profiles readline"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
 PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
 PACKAGECONFIG[testing] = "--enable-testing,--disable-testing"
+PACKAGECONFIG[midi] = "--enable-midi,--disable-midi,alsa-lib"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
-- 
2.7.4


