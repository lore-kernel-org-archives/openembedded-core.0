Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 40AB56013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 17:26:27 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c184so46318292wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 09:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OcoLMuYUqjqwPPmMMATXycFsbzt3kdN9DIY1hGQP80I=;
	b=MAzs2TNpPomrZHmUe8XjCrc9TK0GZR44L9Bs9J39xteg0yhb6gFq6NT2l0mQhRKOxe
	KjNFC4b4b7qzsWToQRSMT5J480lqGxczmpd5F+vkUSn5XtCSgVWUAaBjFwqcti/J4PvF
	VoUM/fkEzSSaxCQl9erb7xo9SsKMvYjVxuWlSRMpkdfOHbXBx5XTvphVcaDnW/yBgBzM
	RTxUhBjj0aO78RVdATHEfkttntBI2TXF99K3cu9oGiTfwj2dW/wHmlQqeKNZyinnKAmx
	4AgbsnSwScSL2/DM0q0p8Vf8iaT9mbuV0l/yXW1BLYnDnWRCpYDkiKP4Z8h/qZoITagt
	OIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OcoLMuYUqjqwPPmMMATXycFsbzt3kdN9DIY1hGQP80I=;
	b=Q9EP41kx3Bz3/Kf9S1HGGqw9MX/HKkPev+lbm/3vb78Cumk72YDk6fLgwnphNLG/h7
	5d2eU2sM1JoQwP6uHkS8ckJJqTdQTzE2IfFnYM3o/zep8ZlmVIPCon5V/XZQ+YjxQoMl
	AyPjN7PtLM6PsYxTG68D+IgzsWjqP7DbOV+tjIBXV/VwAX4LW8CXiubtdo895f1uzfbe
	VeLKiOf1W59asuwrxY0Fqj+waqU0XSYZ1xuN7oIPBNLxFkbRbvLd6e4C3NfasVaWIccD
	ZaP7oX7WrykxOTXHWgQ2CZZGpvQ77mLVc5Y6VlM8W3SVcZziSsP0C052Qyxct9Kw7bFR
	DTIQ==
X-Gm-Message-State: ABUngvcAWp1vLGwNQVY9j8vO53xSvm39k4kdIx2aVbxozUn+LrVo/HLqrtzUByqw2WnSWDfA
X-Received: by 10.28.113.218 with SMTP id d87mr1361074wmi.111.1478712388427;
	Wed, 09 Nov 2016 09:26:28 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c133sm1368906wme.12.2016.11.09.09.26.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Nov 2016 09:26:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2016 17:26:26 +0000
Message-Id: <1478712386-6773-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] glib-networking: remove intltool dependency
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
X-List-Received-Date: Wed, 09 Nov 2016 17:26:29 -0000

glib-networking 2.50 moved away from intltool to modern gettext, so remove the build dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.50.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.50.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.50.0.bb
index 0baaffd..2782bd9 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.50.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.50.0.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "libs"
-DEPENDS = "glib-2.0 intltool-native"
+DEPENDS = "glib-2.0"
 
 SRC_URI[archive.md5sum] = "4d06d0224646f274918b1cb6da9a07f6"
 SRC_URI[archive.sha256sum] = "3f1a442f3c2a734946983532ce59ed49120319fdb10c938447c373d5e5286bee"
-- 
2.8.1


