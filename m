Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7567C78093
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 16:34:45 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id bi12so3355608plb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 08:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b+2Jnu3+ten4aWrLJ4QitHl3vQ1spKPMjCzcB+/+5+E=;
	b=MqZS4pfTPd8dfL9rzFtHBNszKtoLDR4aeOPxMDyrrKq4MrHu/Z/7NLW9buwmUWm3W0
	NjB4wpbRwLY/Lk275JjlH5okdZ5Ypd9VbgOhvA26pLI918oaM3S+WWAP6EHFgWcBBYAB
	IGs9tJ1Qwk+7E1iOEaZIxl4mEjpr2G0rs6jQ71ZZMhFRRn1eDGYOD9CD+XXXPGkIdQKX
	5bK+wD7bMGesV7Dgf+ShtysSVU2OGU3UDRE5tdDzk39C3LtL7CSYIDKtCO/5r+3OZTPk
	tL3BRIXPdoB2i9Ipt6kTDzilEyZXi3r1THDwd/wMMbNP2NL8dlzoYJ/ZlUtvYP1qgiLx
	dSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b+2Jnu3+ten4aWrLJ4QitHl3vQ1spKPMjCzcB+/+5+E=;
	b=Rfbr/MaQtI1FRSI1DZdiiKPC8lhIY8i6YjPlEk7+GAy45/S8wz2FtNuFCFCOVjemtx
	vcp8+mpzKa8O/2jDvGhmgAUUj4x+wlr+yZU4g0G1pHyb5TqKJ+ekZcTAXzR9Vy1NTFzx
	fv1BCAv/n5wxP9nT9vTlOryQ47X9uSXGxZhXLw9KXamHK0las5GPRbHgN50+xI7stsLh
	9wx869egTNZPJ9Ct+UJf8IKaVwBy7epU1fDSdO2p3XZ/yYgmYc+TD8S6fIxA0uRfIueB
	flFIYMp/eVCkmZNmXIcGxvKIrfK49N/r5lBs4I+NKTTgVUVXjHTlzb8fLymPfFnI1BGJ
	fk/A==
X-Gm-Message-State: AKGB3mIkYbGtjgfQUa6aYrQMjk/czMO2bOhiprwOfDCHf/c9dAIBsQ4n
	dbO+QTsYhwao2H6tUxHZDXU=
X-Google-Smtp-Source: ACJfBotP3NWpHGq0saZNPZjfEWfM5GL0wINgnTmHMydM2bsxJIYAk0mr/zvGzS6TBHYicILfk/lQmQ==
X-Received: by 10.84.137.1 with SMTP id 1mr4526350plm.333.1513528487175;
	Sun, 17 Dec 2017 08:34:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:35e6:5321:54f2:87e6])
	by smtp.gmail.com with ESMTPSA id
	t202sm18393035pgb.75.2017.12.17.08.34.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Dec 2017 08:34:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Dec 2017 08:34:35 -0800
Message-Id: <d091bd6f34b8ad4445b9383a3410e25a97dba695.1513527416.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513527416.git.akuster@mvista.com>
References: <cover.1513527416.git.akuster@mvista.com>
Subject: [PATCH 6/8] libxcursor: update to 1.1.15 plus sec fixes
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
X-List-Received-Date: Sun, 17 Dec 2017 16:34:45 -0000

From: Armin Kuster <akuster@mvista.com>

This update includes:
CVE-2017-16612
and some clan warning fixes

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/{libxcursor_1.1.14.bb => libxcursor_1.1.15.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.1.14.bb => libxcursor_1.1.15.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.15.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb
rename to meta/recipes-graphics/xorg-lib/libxcursor_1.1.15.bb
index 1762904..dc9af23 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.15.bb
@@ -18,5 +18,5 @@ PE = "1"
 
 XORG_PN = "libXcursor"
 
-SRC_URI[md5sum] = "1e7c17afbbce83e2215917047c57d1b3"
-SRC_URI[sha256sum] = "9bc6acb21ca14da51bda5bc912c8955bc6e5e433f0ab00c5e8bef842596c33df"
+SRC_URI[md5sum] = "58fe3514e1e7135cf364101e714d1a14"
+SRC_URI[sha256sum] = "294e670dd37cd23995e69aae626629d4a2dfe5708851bbc13d032401b7a3df6b"
-- 
2.7.4


