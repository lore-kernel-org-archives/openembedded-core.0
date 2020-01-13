Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id CAF427FCBB
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:42 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id bg7so4417596pjb.5
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=anN+W5XKY2+0W/FOiGyuTlgkMT33YAgdbNPFpteW0ew=;
	b=SZBuEMQXOBIZ1kx+brrOhwHqc8fAXaMy+qko9uoud05551tw8Fv0x0/HAWvJ/dDo3Y
	jCka25KY+Uo1sZwIA8NKLxJrRIKdxZA1j0MpX3jX1g44xiJ/Zr6hr+PrksUuMK71FkRu
	n45FKlx2YkWVjUr6K+HB/8Kw+NflIPfHnEnBdzY52noHpmS+ic6Wbr5z1F20SNe2cRJE
	YPlQore2CQdFOg5X2u2t38Q8+lb8cqfl/pYNzpTo6va7RBhcHRD800xTLmWiRt8DRxfE
	EOIq0LGiZdZmFdYTvVewgjDHT0LZcKID+tD2w3AqydhfbyKvBYCYRX1SEEyWTuYw4UhG
	d2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=anN+W5XKY2+0W/FOiGyuTlgkMT33YAgdbNPFpteW0ew=;
	b=r+XcJU55Pi3i2i8WJJSalfqcaTMJigXHPGVRAURtkxey/Rw7eiONiUulSHhyp+3U56
	rygv88ctw3l1I2e7O4K+xpoRVSluSfmbRCpvDb47EhppWdNjZL62lWMi/Gw/GNYXbYf4
	BkBEtDzQ0HUAZUFdLt17nj1wm9xHkbT4yoAMp5Zr4Dj45v4rVlUMz0Ygq8KEpIV071tb
	IMk2qNeoz1ShWxZarh+oqAM6v1Drf4gNhj7pYJ7YdfD3iYyY8/xBjeQOJDFPnXbGWjHs
	LozFPoMGjCgbbnBGRGyNypqRmazcuM5GqgYmwZKI/XHyD8VRN7sqWaZGanDhhPHg6Jro
	JoDQ==
X-Gm-Message-State: APjAAAVEcmDc1NIjnzm9ykNcPK2Wm2OFCfNW1rb6SuDrWzESL6rKBLOa
	5QieXKgYv8PuOAaBzr+rSozMLTX3
X-Google-Smtp-Source: APXvYqxBVRBgr8032jWFd7ym/YlTcIZuY3FwC0Kn5QgU99C+nm69izXjDbZL85PUphhMMKGb8pmhCw==
X-Received: by 2002:a17:902:b614:: with SMTP id
	b20mr20530654pls.20.1578929443781; 
	Mon, 13 Jan 2020 07:30:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:09 -0800
Message-Id: <5fbf5eead50ab5a8cbacf277ddfff2eeca26f738.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 10/28] webkitgtk: set CVE_PRODUCT
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:43 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.22.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb
index 301bf10cea..26e673cbcb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb
@@ -30,6 +30,8 @@ inherit cmake pkgconfig gobject-introspection perlnative distro_features_check u
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
+CVE_PRODUCT = "webkitgtk webkitgtk\+"
+
 DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
 	   pango icu bison-native gawk intltool-native libwebp \
-- 
2.17.1


