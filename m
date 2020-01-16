Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 005487F939
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:57 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id a6so1667657pjh.2
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=anN+W5XKY2+0W/FOiGyuTlgkMT33YAgdbNPFpteW0ew=;
	b=rGioswR3D8pOLW2ES3Cki5nE+2Z5bzHDsCM6ixgtHDhcliGkT6IJriYc+fBUbUErFa
	SrXHg1ihenviq/iib3oqsY6ewpQej4yfkiLdJoFAcTFP2GEicqWaFqwsNU86WzrBBt+V
	Sb0uGaf6OhdVuY9cNF0UpimRGUHsAPrAyIC1iO4VFi63ZCulKO4sow8b5ftovPtcH/tV
	XRbkkt82AqJvSoglowflgXLewjZ2L/VlstKdz/MsJIwkiKECKzA8GrUeel7xJYSBMJYf
	ncdq3Zx22JDXRKZlSf6m1E4MWr0CBzYBXVe4Jgph2C6q+SRx+KzVvdyOX7sqHKJrNm2x
	mkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=anN+W5XKY2+0W/FOiGyuTlgkMT33YAgdbNPFpteW0ew=;
	b=AHvOYEek7wmXl6GHZL1wrA9FaHxb0C8N20B9i3JiQC8Fr8402hHXDh0Yl+pEsVN1W7
	2gmXKBtJ5uKHxwMOR3L3KaNTM0VqTMfoFyGBH/w4vthY2jWANLZEHNhBE1n3/s68dwwJ
	fee6Mnva8nRPGhGfmwMgEiVQ7oYD4/9t7yyVrpOFZbroy0C8gMCZRFh02flobBpV6CO1
	KNio2S+YVC3UXEgduzqywaIrYanrKC1vgekhYzcq9jyImNJmEeSgxaziEMYSLn3OKsIs
	MEVF9UjX3194RmefSDogoP6q7P79gNdZsLEdusQ2YvIbFINYNg5BYEss6yi/bGkyvOz9
	ga7Q==
X-Gm-Message-State: APjAAAUZJpumR5ro777KRLPPFLOeaq8BFhWWS/VbSwnCP5RH54UACLDD
	3NA/+wVS2bWtgwynvh6xzGIWCROI
X-Google-Smtp-Source: APXvYqwtJEuelsqm07Q+D6GP4REPS4zpSNqwvhHbpIUXNVDpo6YtZzhpabfC628aR6tZSXqzG8c4RQ==
X-Received: by 2002:a17:902:bd41:: with SMTP id
	b1mr33237906plx.82.1579188059062; 
	Thu, 16 Jan 2020 07:20:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.58
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:23 -0800
Message-Id: <5fbf5eead50ab5a8cbacf277ddfff2eeca26f738.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 14/32] webkitgtk: set CVE_PRODUCT
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:58 -0000

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


