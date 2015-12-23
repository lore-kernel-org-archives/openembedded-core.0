Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 58260607AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 21:22:36 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l126so164668879wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 13:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=q1tfyWVLrlVG0/iUcvXg74ko+1fO7jufkx2xeXo70Pc=;
	b=TNLbUJ5jusM9Zst8ubZx0xnnY4i3qXqhTQRtkR0jW/rS1XRAwKVS84nklSV7Xd80jV
	jhAuWK5DmWDj0SPm8VXyNb47WwrvlSUKd6seXW5vZZUPOTqqV3n6/NASZ/w6+67mtkpU
	s0kgzZ54tA3LGmCpMA9eh5eJMXcmFsiKCaFJLrt2D2vwEqo8GQz6vCA5athCkrQ5YrfV
	durwL3F/nONG1mqNx0XeA8XJOQ8laW1G1nwqI5SoOsqd9zcH4qR8dbAu4epoGDlVc+qK
	xDaTq0oVJgTVHGIPN7/QGoOdRjPeLesfcStaMF6zy0qKWKr7BLt55Zraz5SMCNBjvnHR
	yP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=q1tfyWVLrlVG0/iUcvXg74ko+1fO7jufkx2xeXo70Pc=;
	b=TOTVCDCjUVSyi/ogECX5TQg+tncw4msGxgnrlnj38jnVKaYMlVp/DfGz1fSTc4yrMn
	ZwGyYqVV3v1DQTtniuejZSfz0Cpn2TZqhG8FdBdGuloNWYin5X7dkirt3D5CaOMf7Wf1
	a3uvl8s5uwErYI/58WXtXpLeqP0TIUvaEf5LXOZ+yejq6iVRpJ3TUvuie1X2Yh5gnXNX
	gSXsbOOU3mTgW131F1IB2MHxxbAia++QjR/LQAzIyHtUtAlVYEGbyt7zEUL9w3EcbwOn
	UxKpbMCnWEveSbihrHjO1IbfGRgkQ31zLMLB7fza2+Pb7CAreDeh8iJUDR639qRt0syH
	FtXw==
X-Gm-Message-State: ALoCoQlRbwDEr+egy9k2I+UQM1TRpAJK9YNeBnjicytqlXSs3U9BUmfLtIis282QwcsdWkYOZPpkjZsmMWbMPedpzZGubhhMbg==
X-Received: by 10.194.190.19 with SMTP id gm19mr18717618wjc.77.1450905757000; 
	Wed, 23 Dec 2015 13:22:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l7sm38987813wjx.14.2015.12.23.13.22.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Dec 2015 13:22:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2015 21:22:27 +0000
Message-Id: <1450905747-3900-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] qemu: add PACKAGECONFIG for Nettle crypto support
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
X-List-Received-Date: Wed, 23 Dec 2015 21:22:39 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8b51324..95fe66f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -115,6 +115,7 @@ PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,gcrypt,"
+PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"
 PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
 PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
 PACKAGECONFIG[alsa] = ",,alsa-lib"
-- 
2.6.4


