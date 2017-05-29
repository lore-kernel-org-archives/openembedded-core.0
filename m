Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0242A77FA2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 09:04:51 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id c13so45630422qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=eGjQeFSPUM18m6vsFx+UsEMbL20fCp9kwKnGrtvvjZ0=;
	b=LRfiuzmoQL1w/cM9knpK1bSc6mItwSZM4X2UJz6zoktHWo77V93VrTFdotoTOpk2KS
	aVrQxevVjNgiDVY2Tq64Vn8/GVbnRF4IrYp53PlTqGorHycdST1IsFKgUAHvKI1SoS40
	NG0P8WIr9nZ/UO0+OFrCjmdqajwzAx/86vx8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eGjQeFSPUM18m6vsFx+UsEMbL20fCp9kwKnGrtvvjZ0=;
	b=a7SpuFJ5grFBiGRV5QarFOmbMWdwclAv1WIfK30z2yUVbryOYQdog9b833N2OdOPsl
	zeaaTonrRZ166SsUYcISupiUQf+WQNN584+W1aS63fUIH8FtWOK+cNC0KjdIX5c+CtY+
	7zNMWBp1atYAitfeKb7QMAhJH7svgb0+DSYI1yNWd157qpC/FxcbGuhe1x0pidS4MVC2
	7NQG5lyXUtnpdlO1DJn6TY/RqwMEGvO8q3E5dr6xyjqqBluP30V6JydA/dcqyPQLW0nR
	1SnKpp1/cgaQ0kuQUSm12hz0kA588ysR7VmQeLchlORtmngFgYRCeotX4B7plwJv0u3p
	k5hg==
X-Gm-Message-State: AODbwcDV/Fd04yKVui3KUDJat6aVamDpqKf8SxdkMQqExW1pJ6E0m42R
	rDaj5XAXz58oJHZcyEIE7g==
X-Received: by 10.237.60.150 with SMTP id d22mr17713161qtf.126.1496048692855; 
	Mon, 29 May 2017 02:04:52 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	w12sm6017694qth.42.2017.05.29.02.04.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 May 2017 02:04:52 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 11:04:46 +0200
Message-Id: <20170529090446.28930-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] libdrm: upgrade to 2.4.81
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
X-List-Received-Date: Mon, 29 May 2017 09:04:52 -0000

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/drm/{libdrm_2.4.80.bb => libdrm_2.4.81.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.80.bb => libdrm_2.4.81.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.80.bb b/meta/recipes-graphics/drm/libdrm_2.4.81.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.80.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.81.bb
index 063381f178..9181340a6c 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.80.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.81.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "4867866477f228973a64e68051ca9c66"
-SRC_URI[sha256sum] = "a82a519601e9cdfad795e760807eb07ac8913b225e25fc8fe9bc03e3be6549f1"
+SRC_URI[md5sum] = "d04f3567f0a812188d06f860fded5ab7"
+SRC_URI[sha256sum] = "8cc05c195ac8708199979a94c4e4d1a928c14ec338ecbcb38ead09f54dae11ae"
 
 inherit autotools pkgconfig manpages
 
-- 
2.11.0


