Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id CF73F71A62
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:42:03 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id b126so592445070oia.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4y6avLjaeAnZts0rR/tnum3RMsbMZ+RBAZRxxfBrt+Y=;
	b=hQ9r3NrG4cDNMSFZ5Hh7ycl9mm6lhwPCq42bo6ZQ4R/WA3FNBr+hb2uLB3aCwon39A
	viZj6hM2O4MUqYwv0Ts9vf/SnJCQZixP1a3UZE1X79CBhTDwIJMPoK3sZAgsI6wroJpW
	eITor+KSg6JLwBFySh51Wai15BQ+JvOEBDTjUOtCS2bcxYwVdtxSj1WXfBMK7eMdhIMh
	8hm6BVJh0+JSpXihBgyO4pMZyvBty3WuzUfwAldzVBHNIjW7RyTNKpeZQW6XPWU1RAzp
	Xsl1A4QQ74vdIcF+Zc6WWRK7G3TQ8soMN6l1UQ6SNFBkWQfm1u70dD9pQh1uqn8n2pv5
	xL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4y6avLjaeAnZts0rR/tnum3RMsbMZ+RBAZRxxfBrt+Y=;
	b=TyCna9Xmqce2lt0+bdqAUhRWOYf5QIOIplJcxCPVFIjs9YmplORm9Uhozc08LBn42H
	FnBDlugEDTINVtLWkckEy1C9INfmy0RPkn5onZGLoCEf+AcXWkoVkXKD7L1BOM+P8IUM
	yNUXjkj6hHmsky6jnSn3/lqTZ71rFWSgg54d4PDDKGtKAiEPDnAXGTZ/JWZRpnlAkbt7
	5/llnDptIlzQspiWZfGyCWQhkq3idVztUqtQT0eqGGU2xgoWdH/9ByXn9Z725suzf+YP
	BXOknX7TgKIok7B8LzPsiecomZuhW4+qXTD3/g7Xcu8ePRVVjCrhMB8hHCDFigDtmSC5
	WulA==
X-Gm-Message-State: AIkVDXKNkhbuLM3BPT2SoQZH6jJ/CuSrqjQJXcCp7QK8jnauoM9qigaZ+o+f+0LAXUiQzw==
X-Received: by 10.202.181.70 with SMTP id e67mr30744060oif.3.1483645323971;
	Thu, 05 Jan 2017 11:42:03 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	o133sm18121294oia.11.2017.01.05.11.42.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:42:02 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:41:59 -0700
Message-Id: <1483645319-29257-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] webkitgtk: add missing python-native dep
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
X-List-Received-Date: Thu, 05 Jan 2017 19:42:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

Since we can't inherit pythonnative, we need this dep explicitly.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.14.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
index 46b5468..3059e17 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
@@ -40,6 +40,7 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
 	   pango icu bison-native gawk intltool-native libwebp \
 	   atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora libvorbis libxcomposite libxtst \
 	   ruby-native libnotify gstreamer1.0-plugins-bad \
+	   python-native \
           "
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
-- 
2.8.0


