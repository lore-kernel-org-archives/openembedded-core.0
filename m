Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 46DA96C2FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 11:12:56 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j10so1521086wru.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 03:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zuoV0O8dB/4M9WF+Y+1/0oGoxVu/UAtmK2NvD5Y4Kfw=;
	b=N3gji9PNbO8Gxb9oLP6NxZyKAahzH1qfMsJK9Fc4gS5fY04pLM7p0JIt2F1SiNxW0G
	1rDkibhCdnn5dc9C5HgH2W4/0jXkov+K86cwedBPF3Tinr3lNbNFpgDqXdlBPTl44I2a
	exmnhQw94DUYvUjQk2IrXpBU8RfMDwNvDUfkWtsMY7JapOezEtTgk+rzQL3XqXk1dpAg
	oM8p/ovwZeoEj8PZrxNQyslUTKa6xmg2ioO93Jn5beWTpnyHlRBJMiOsyZFIZwFtLUI7
	Piq5EMF8f4hWi5oqBPjNe5OLkY/RadX1RFFpsfCLdv25ewUM6bf5Tcfl5JLDXdDQfcEi
	Lqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zuoV0O8dB/4M9WF+Y+1/0oGoxVu/UAtmK2NvD5Y4Kfw=;
	b=oPiCuKScFzR5Wl4561wqyspuv5vkQyM8J0jHzWEyOxblyyWgmsSqNnU0llBtmSVtDq
	aLqk/IZBelz7G7KTuwPOex/F13OkQ50npX+PVxm5WC38qAHRUY2YCPI346zJy1wmc5EX
	DKJNMrMmMKUTL8UKIC5CC/R48sExBQbUvmKtRuEQk3SiKi2xm4H7DKovH1nxIRUikTu9
	2ct5NaaxwidTA2NEMfKVhcvOsWI9Fn+LrFAZECXPNfc93a/DjY/Sqc+//gsDoSU8aFwI
	s3S5XaHfvGRaM55I5X4cm2u/nLnUdKpn5BqnSmlqVAZunaRFwKiJypOOIcP5o9ILjpB/
	Q7yA==
X-Gm-Message-State: AA+aEWbeqRiQHCtDGOlxLeXxB6sIXMg4taB7az2pQnkjyKkp4meWa60f
	CfVdyRsW5Q8XR0BPJne42weAqPrUcJY=
X-Google-Smtp-Source: AFSGD/Wu8m0MoD2oMnomJuqVp8lOkvtTLjSQq1olXi2k4qPLQLklOQwDpcNDdIXgeAOohx9Zu4GulA==
X-Received: by 2002:adf:b253:: with SMTP id y19mr167207wra.184.1542712376830; 
	Tue, 20 Nov 2018 03:12:56 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v62-v6sm24325069wme.3.2018.11.20.03.12.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 03:12:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 11:12:53 +0000
Message-Id: <20181120111253.25370-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181120111253.25370-1-ross.burton@intel.com>
References: <20181120111253.25370-1-ross.burton@intel.com>
Subject: [PATCH 2/2] libinput: 1.12.1 -> 1.12.3
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
X-List-Received-Date: Tue, 20 Nov 2018 11:12:56 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/{libinput_1.12.1.bb => libinput_1.12.3.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.12.1.bb => libinput_1.12.3.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.12.1.bb b/meta/recipes-graphics/wayland/libinput_1.12.3.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.12.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.12.3.bb
index 2cba80f211f..3d1ab59309e 100644
--- a/meta/recipes-graphics/wayland/libinput_1.12.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.12.3.bb
@@ -9,8 +9,8 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "0b6fff34e30cf7aafc33c8f884806960"
-SRC_URI[sha256sum] = "570c48cc7b744b9b4da711ed0c5e8c3de132484684b0c4f0309a9a83df5e8692"
+SRC_URI[md5sum] = "083d6bf311d5e1e3a62440dc634bb8f0"
+SRC_URI[sha256sum] = "f266ff861a2e7a97e1402c4345e3547b900efde68adbd40e56403e2617fee255"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 inherit meson pkgconfig lib_package
-- 
2.11.0


