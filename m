Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD9E7719F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 20:57:17 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id zv1so18245885obb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 12:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0p8Y2vMNjYKit6L7U2yWmT0WGJV2LX1Nm/1QIpzNNKY=;
	b=mVapOL8frwgOxEUs2EGyrcsARa8y6JmnkHuoD0GM5jSpGakP+KK5X7kMYcF/zsXKWJ
	AWHocOjHr4eOoDAVm1de51ivfhPZgVIHl7QD75qKKDOKpGKYjzmxhNIiuB5a/V8aTegV
	H3sTptZYZP1fu+ZzaQo8JlwawpKjK8PLoTahwRfOSOuPHCl+8gA4XwER4m+w72lI18fh
	sJxQdff3mwIiqHiCB+ix2ciKlg6My+ELjXOX6cI40EhDS02bVjkJf12FNvO2QmwKx4gR
	NmM8vXJrvXGk1TBvk1XmDq/gGKXHTw7vUTV/X0JS7CM2UGmhjR5foS3XZH0QG+a8qpBr
	WLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0p8Y2vMNjYKit6L7U2yWmT0WGJV2LX1Nm/1QIpzNNKY=;
	b=KSNMVvQpxE2IwI0xPl8SERerqpT/MpH/KfpOZmhzyOGdp56CC/W5PSurLcM3dsqlgg
	FGaoSXL2tM24AJC1LpsrYUniJzAVKCLwjHjjZ7pcuX2mEDnGFzr3Fjh+QCuzXXrBgLyE
	MIEaSLtMmL7PmjAwHdmmHvbxlcjP++cIKMVitjRyT/Z149kw238OB6bt8YzoJ++hRyfC
	qfDmwPDmRkdc2WXyvMZBgV55K4kCqWSgv1kwTuC1shHxdz/8zg1/JRVIKsIL/nLO0JEX
	bOPsb9FVT1IRu+e4hsItz8VIHvWVTq70oLdnCqFMcy825JWAjG4oo6W0GZ+/J1g8EVQu
	NKxg==
X-Gm-Message-State: AG10YOQX3JhMzqXo93oYhNi/n2h9N+lsZXBy+XEQlsjk2seBfNNsHmj3yQHzARcVx3oPSw==
X-Received: by 10.60.81.103 with SMTP id z7mr24513275oex.59.1453928238425;
	Wed, 27 Jan 2016 12:57:18 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm3716459oiw.16.2016.01.27.12.57.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 12:57:17 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 12:57:00 -0800
Message-Id: <1453928220-30191-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] pango.inc: drop obsolete dependency on qemu-native
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
X-List-Received-Date: Wed, 27 Jan 2016 20:57:19 -0000

The dependency on qemu-native was removed during the update to 1.38.1:

  http://git.openembedded.org/openembedded-core/commit/?id=9a86d2a876f5cce9c2825f8fd5bf5dc9aaf9d7a1

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/pango/pango.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 3d5ae36..ede1150 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.0+"
 
 X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo harfbuzz qemu-native"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo harfbuzz"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-xft,--without-xft,${X11DEPENDS}"
@@ -18,7 +18,7 @@ PACKAGECONFIG[x11] = "--with-xft,--without-xft,${X11DEPENDS}"
 BBCLASSEXTEND = "native"
 DEPENDS_class-native = "glib-2.0-native cairo-native harfbuzz-native"
 
-inherit gnomebase gtk-doc qemu ptest-gnome upstream-version-is-even
+inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even
 
 EXTRA_AUTORECONF = ""
 
-- 
1.9.1


