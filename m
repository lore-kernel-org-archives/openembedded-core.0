Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9BB7606A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 12:49:50 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id r125-v6so4760731wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fj2Eg7ULIK0ly1ZoeG9UwUExXVSwdOGYgIPP+mhpzqs=;
	b=VYjTtRyAmONKOSBmxeIx4HY/AOutY6cQLr4XmtTV11WR9l5psJ6sADW1yfzyJYT0eC
	oizJf21PwmumE4lgvcl7FuKlg9LmzMjPqpRzbehXi3fbk0UVsirMEF4g5UniKi6Ohcpq
	nmeyCn3OEuBOQ2k93kjIcQKTcCbofupFiqJ+wZE0FPdb65YiuooqhoEJb4Ti1ylPZ/GL
	C1wc2TvclLB5RxxQgnu4VG7ZFZWeuAQ1MQIlf8N3jz063ZvSdRO8MvjIiNp+Et/JKoLV
	FlAv6IFY8I5HzRh2Sqwtnn2Per2nN/f9Ler0htcMrYzaETmALtoUGZXGxFJzqIsrXKj2
	xDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fj2Eg7ULIK0ly1ZoeG9UwUExXVSwdOGYgIPP+mhpzqs=;
	b=f9CaP4u8anE/T3SEUUkjRlrGNvg3NgMj6lZ3/VmbIKTB9h6xgc6357+9biuLBDz35y
	7+kk3NC+LzmpL4H1A17SneSo7bh02TVO5WE+SRziXoOrhpVk7XehUNumkbiA98yucq4w
	NCog2QiGB5lwwT9vHhc71vTaVDCDTbpH7pha27tA71Re3bjXxQOGuE+xkID2IJwFTVQk
	89fRqqn3n1do8GSNXuwlLV4CkhcC5Ns52k/2zMAzZLRofot0bUOdYPcXFJS+6hFxXFMT
	uSgl68uI7M8k/pm2tLW5eoi7azbObadn3zvDfXodFPUyJwHDDlwjARMf6vjTvvYq21PP
	2NCw==
X-Gm-Message-State: APt69E0+Z7XLLhUS6upnCEZnKnbtHLmVNh+tf0oTzmWX5xzfGN9mWbce
	75nCAVqzlkybi+aav0xIne1eSrRz
X-Google-Smtp-Source: ADUXVKLLKW5cKY1Kx/A6jRijJvcokcAy0o8PHgGCtQvH5MnKA7SZx5rLSmG9uSaljQJyd0TFmk5wSg==
X-Received: by 2002:a1c:7204:: with SMTP id
	n4-v6mr11499965wmc.138.1528202991484; 
	Tue, 05 Jun 2018 05:49:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l5-v6sm31056419wrn.92.2018.06.05.05.49.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 05:49:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jun 2018 13:49:45 +0100
Message-Id: <20180605124945.15313-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180605124945.15313-1-ross.burton@intel.com>
References: <20180605124945.15313-1-ross.burton@intel.com>
Subject: [PATCH 3/3] packagegroup-self-hosted: remove libsdl
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
X-List-Received-Date: Tue, 05 Jun 2018 12:49:51 -0000

By default we now build our own libSDL, so don't ship libsdl in the self-hosted group.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index f1273e8a171..28f06d9c5aa 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -188,8 +188,6 @@ RDEPENDS_packagegroup-self-hosted-graphics = "\
     libgl-dev \
     libglu \
     libglu-dev \
-    libsdl \
-    libsdl-dev \
     libx11-dev \
     adwaita-icon-theme \
     xdg-utils \
-- 
2.11.0


