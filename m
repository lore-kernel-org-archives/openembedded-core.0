Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id DB1CC6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 13:39:28 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v75so19367547qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 06:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TtmjcVm1Ey0mO17q3ojpCVyqghW82WRZbPHT81WdAF0=;
	b=sLSsyRAXk3zPLnnEqsvVRhErb8UU7XaJjhYWzr7MWx7Kf86iSkGRCeOaF2QuUZtcBv
	0DzOXoMjD8IQw0OO5FnVV5dXM/sM22fctNl0PmKkSUu7I3dG20myOlzonRZjq0PcyNu1
	/QyvXlpfSgAhXYj4Ph8HYV1kKbq0E+A+CDNgluuvroMhpbipXWuml8taFVmPTjk0ZWQc
	qOJTb9V9Wl+VUF3U0HJyKQSoRUydT+n/H3yyZ1jvEDL11QKVvWinB5ene0YzUYj2mW1V
	T/paiDabMmd2Jj7IgIZBp1AonapqxrGc8VpA5JfXAjlpJ3cSB6bYP6womOEwCfaZd1sL
	FHaQ==
X-Gm-Message-State: AN3rC/6g3iUTc+nSmFthoKg8fiAMA/iEuF5t66Ph1A+hD2651MwDfLR8
	T5MjyD9FAulKCQ==
X-Received: by 10.55.79.216 with SMTP id d207mr7960993qkb.298.1492436369747;
	Mon, 17 Apr 2017 06:39:29 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	r24sm7257707qkl.54.2017.04.17.06.39.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Apr 2017 06:39:29 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Apr 2017 09:38:53 -0400
Message-Id: <1492436338-32048-4-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
References: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv2 3/8] bluez5: add PACKAGECONFIG option for midi
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
X-List-Received-Date: Mon, 17 Apr 2017 13:39:29 -0000

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


