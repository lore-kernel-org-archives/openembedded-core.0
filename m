Return-Path: <steve@sakoman.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD716D2D6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 20:58:36 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kq14so2725800pab.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 12:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X+zroCwdRJ0H3GpNRFHHWwMehtVRJJ8gQmTieAbn9Ho=;
	b=dRtwFReMHxGizScNp/9O/DtYcKm4KYEqurThONcZMdkjEm6QlBVjH2puTA65bE6fIZ
	6bsci2ibuSg75s8Nt5PTIxhxHQ8vNYOyz1lK5nG3xGEjShrPj54etWARt5aWBnkg8MFZ
	zufmYVnl2wC+thFZ3G5FAg1zrSzidN0RwrzIc8OdqKLGaP7vGzkvXQYfxCTfLz5R0iMR
	HlWLK6UbIvAhhLVUixWioDJXJx2nJc0ALv2uedMaNwcecBoxptvI6XnR8X1GZf+B8Qee
	QH7lsog8GOOh3+Vk3Yabc5V8PrP6BHp8Xrq6TR10RyOr8s6kcGRyy/29ALGIJMHMVXOA
	Bf4w==
X-Gm-Message-State: ALoCoQksCARa3uZBiW9GiXC/wvg2dSydC9CO1ZHMoJUuYymS3SfajrSrdyvUWrp2P6Sa/9fKq33s
X-Received: by 10.68.223.131 with SMTP id qu3mr17101237pbc.4.1383944317745;
	Fri, 08 Nov 2013 12:58:37 -0800 (PST)
Received: from localhost.localdomain
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPSA id
	sg1sm14124119pbb.16.2013.11.08.12.58.36 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Nov 2013 12:58:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Nov 2013 12:58:38 -0800
Message-Id: <1383944318-23406-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] wpa-supplicant: enable CONFIG_CTRL_IFACE_DBUS_NEW
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
X-List-Received-Date: Fri, 08 Nov 2013 20:58:37 -0000

Without this option wifi support in connman will fail:

src/technology.c:technology_get() No matching drivers found for wifi

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wpa-supplicant/wpa-supplicant/defconfig-gnutls |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
index 8be4107..92573e2 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
@@ -347,7 +347,7 @@ CONFIG_PEERKEY=y
 
 # Add support for new DBus control interface
 # (fi.w1.hostap.wpa_supplicant1)
-#CONFIG_CTRL_IFACE_DBUS_NEW=y
+CONFIG_CTRL_IFACE_DBUS_NEW=y
 
 # Add introspection support for new DBus control interface
 #CONFIG_CTRL_IFACE_DBUS_INTRO=y
-- 
1.7.9.5


