Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id B8890719DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 00:19:39 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id xy5so41544013wjc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 16:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3DKbz6lu3APpgifpukQFCMqIv7xCMCedv65FI5BZ8g4=;
	b=BBElGAQXT72KllBEJwY3Ml3+ZOITuG4Azg9h17vd6oaLvRYfGpZPjn0RC0RWEFx7gP
	Mqn0UdsSMX3/rfQxg531DGO/wiTpZBjbmOi9+VYftaSPWsT+PsgmcR4iPMba9ICvfjQn
	m2b9yX7CK6kexI597XHcmY1bpU88a75Z9UfDKsGt4A6hLmeINVpTC05d9gale8/RjwgF
	P4q9AXn1A1GckRZ+lgTKyMOP+ij4VwDVCR+a6Y+jAUqVcZMsMobJ3KcfLwnmUDPNZe8Q
	ZBV30U42Tfsq2RZASLZ5YhHMRz0S0szxq/JcU5AtThggAZrnDKDyJWb/NiJ8sFWXIteA
	TfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3DKbz6lu3APpgifpukQFCMqIv7xCMCedv65FI5BZ8g4=;
	b=QxhnYDZGVkgkpL+w1/EvrqnYCi4bpMCS74pUa80lhpU44arPH+ks2/ll71lHEBJmWG
	Jr1meLld8nn2296SzggwLZur40B26gsGAAPGLxqX2Kj8R9p3Q24dhHjYM1EsYhNKoeTE
	Zur4pcQbUQb9XgEqLwFSmfm+eSLwOuWjgRrgy8KCjUJZgQV/yWdvvls0wk/b1smgGDBc
	FWugFtTAq7Ee18Biq5PEceFnuRknUTsM1sU8bnLdhJCagvevcSRRdFik4f+fN9xU+vtw
	DSCcaZFSgePoldTD4XDsIgjXsNhhqkOIpCo1d6H182DqLSwkE7OBWK17+1hgf4oG7vCF
	25uA==
X-Gm-Message-State: AKaTC03ysHbsnoN35DnA+Xf1oRjd23YdxHiGi4/FKEVAey1NOIkFeVwoSnEMpBgjGyPP0g==
X-Received: by 10.194.106.41 with SMTP id gr9mr61156265wjb.202.1480983580840; 
	Mon, 05 Dec 2016 16:19:40 -0800 (PST)
Received: from localhost.localdomain (p579F7D52.dip0.t-ipconnect.de.
	[87.159.125.82]) by smtp.googlemail.com with ESMTPSA id
	u18sm1150972wmd.1.2016.12.05.16.19.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 16:19:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 01:19:20 +0100
Message-Id: <1480983561-11437-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] libsdl2: add wayland--protocols to to depends of PACKAGECONFIG[wayland]
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
X-List-Received-Date: Tue, 06 Dec 2016 00:19:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
index b104a43..bb75316 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
@@ -54,7 +54,7 @@ PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,vi
 PACKAGECONFIG[opengl]     = "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
 PACKAGECONFIG[tslib]      = "--enable-input-tslib,--disable-input-tslib,tslib"
-PACKAGECONFIG[wayland]    = "--enable-video-wayland,--disable-video-wayland,wayland libxkbcommon"
+PACKAGECONFIG[wayland]    = "--enable-video-wayland,--disable-video-wayland,wayland wayland-protocols libxkbcommon"
 PACKAGECONFIG[x11]        = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
-- 
2.5.5


