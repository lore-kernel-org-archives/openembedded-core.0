Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id D6CD661992
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 23:00:08 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y5so2436287pfb.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bkKRYgQ8UWoMtZ2OXgPm+wDydc8aHLebJIhFD2HZPkY=;
	b=s1Knu9ALW1X7n3QXq6MTsxintFTS0vyF9IFThLX3SqtcAO3Pj9EONY7JZ/kNOqSN7i
	uZdvMi7fbQeKYh8r4x/SquCwoOvgRX1DnBsYczXXXQ4yi5twS0JejNXd9SEnx+XXzAHP
	2Xct31IgcqBZccSnvQSnxGM8daUYTJ03dwLmrDZwuTEs65va5HeydS/AEpWwgN+81hxh
	mpsDcNdDSDE4yWBx2YXj4uXNKc3rhOcHfIZn/BMT8iVvvBY6WCwz9+QXATCtbA9MWBxi
	9vYlj8iql/Z769HXPzkNsAE+uRDWVb3F1k+aLEYdGxcVI02C5fkWfWuM1aJlrmSz7WwY
	I7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=bkKRYgQ8UWoMtZ2OXgPm+wDydc8aHLebJIhFD2HZPkY=;
	b=GFRIDzaRo4wbtG+1828KUeUHNK7H00ykA/Sj73Hx+H7/qkGvqjOnck6ClUZ6N0cI0W
	D5hb2jw28qr7MOkfEayY3YcBpSVXI3OI1RPQttEb7YLSPZfxZKsRQc47dsUrqvdFcSiG
	r5joTblJR+zvPCzt1nQohR0Y7GWXerdTyaJhtBOeW5bifHC4SDGkSihtVA1ydn0/MAur
	ng3XH1/jCz9uVTvrEnl/CWK2X/LO9WKvZSL5GDS2ITjthZLg+bCE6LQ6bi8gSYGswrAx
	ycErO4QlZD+ml9KbMl7ekpLWmHwpk4CwSMQtUjPouriMTF6/pfZPj3LfHMHCfWIIkrIy
	OTzA==
X-Gm-Message-State: APjAAAXUw+SuMah6hc17aJGOa9KhQaMOmaEURPsUcK8dNeP/CaxAnw/T
	iscn8gHpijIFEamtrS0fAsnMbYfn
X-Google-Smtp-Source: APXvYqwbUu25Mu9nN8yJ01UWzY5BgCMJMl/EGAALmzc8tuZ59dT908MwXKO2drmfdOriCVERm/EaBw==
X-Received: by 2002:a63:e008:: with SMTP id e8mr6680774pgh.256.1582930809477; 
	Fri, 28 Feb 2020 15:00:09 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id e9sm3636470pjt.16.2020.02.28.15.00.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 15:00:09 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 2961C2A053D; Fri, 28 Feb 2020 15:00:08 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 15:00:06 -0800
Message-Id: <20200228230006.28594-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] xorgproto: move pc files to libdir
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
X-List-Received-Date: Fri, 28 Feb 2020 23:00:08 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

We fixed this two years go:
http://lists.openembedded.org/pipermail/openembedded-core/2018-June/151922.html

However xorgproto moved to meson and uses pkgconfig module to generate the .pc
which does not provide a method of omitting the libdir, which now means any
pc generated from meson using the module will always be mulitlib incompatible.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb
index fb3f3aed3d..c0785ccd64 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb
@@ -19,6 +19,8 @@ inherit meson
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[legacy] = "-Dlegacy=true,-Dlegacy=false"
 
+# Datadir only used to install pc files, $datadir/pkgconfig
+datadir="${libdir}"
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
2.20.1


