Return-Path: <akuster808@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id B17A86FF5D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 13:33:38 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id k129so2285435iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hYIZY4NdGEY6WpeoI/uDx7domto8gVJLHMvKorIxCd8=;
	b=lmsoSWFtWiq2vENT8bI+Eu9HNMLs172ey3l8Bg7Lm6yMwsHpbNNjZ3iQN8MXptAwTq
	2GgLEBIGjmm7P5X4K2Zzg8DXY/iMmgLulZbFMYhUq2XoCTDrm4QzCkdx4wwh6J0QGMlQ
	3oHHhpK0t40bdYtPLtQ6sVPXG7ioN9be1FOJwiSAt7NLVjRqV771rzexwBM8izFjZZP0
	R90o7PRc5+xats7VsP+Oo45U2qlL/jnm0JMYulMl+V5oO7i4JLSplA6AOptKGdhk60nA
	p0FL1L+i7LH44Z5EetDJw7fzcVLCI4NziOnZHBgYKO2YU/TeFjuodVNAPeSDbKO/ZPxX
	pRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hYIZY4NdGEY6WpeoI/uDx7domto8gVJLHMvKorIxCd8=;
	b=Uga7anUUx38AJVaVc8LDK0EFSSfKaQzvOXYFrRsOX2zZNeMfbjZyJT+rOtRewYgw82
	HpxRhTvbCflqni4HsN11garOekz25FYMMNv1ZPHFi/LcXc5/tmdoffZZqR1gH/pXJI83
	J0tIAumIEewTsWQYnz6dH9JQ395fWs+b/sFnhCci/2m24zxwY/wjpuIKef5XU57JTwQj
	blh5uB4S7JkSadTfz9F/cBV0c/NymCXxW92drEJUtP61rAK4vDZtJG3zq+2ICxG736fm
	sw85cBn15ZdrZJwal3qjkaKOAGIVhqKAjwetO8I/7w02kRbGHm+0Ljc0fpqVl5IYpQaR
	0YXA==
X-Gm-Message-State: AOPr4FVNrwARNozYRj7OdmWgJ8d9NrZhorqAw1GXRRRtfyNNLuCtQ+Lhq2aV0IS+bhOVKA==
X-Received: by 10.107.182.138 with SMTP id g132mr3299433iof.27.1462282419132; 
	Tue, 03 May 2016 06:33:39 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	n97sm2016212ioi.41.2016.05.03.06.33.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 May 2016 06:33:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 06:33:36 -0700
Message-Id: <1462282416-7192-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Master][krogoth][PATCH] librsvg: Security fixes via update to 2.40.15
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
X-List-Received-Date: Tue, 03 May 2016 13:33:40 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-4347 librsvg2: DoS parsing SVGs with circular definitions in certain rsvg_cairo_*() functions

CVE-2016-4348 librsvg2: DoS parsing SVGs with circular definitions _rsvg_css_normalize_font_size() function

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-gnome/librsvg/{librsvg_2.40.13.bb => librsvg_2.40.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.13.bb => librsvg_2.40.15.bb} (91%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.13.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.15.bb
similarity index 91%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.13.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.15.bb
index 2ac52f7..caa6a24 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.13.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.15.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig gnomebase gtk-doc pixbufcache upstream-version-is-ev
 
 SRC_URI += "file://gtk-option.patch"
 
-SRC_URI[archive.md5sum] = "ad03780e12c56e52474d8edf86976c73"
-SRC_URI[archive.sha256sum] = "4d6ea93ec05f5dabe7262d711d246a0a99b2311e215360dd3dcabd6afe3b9804"
+SRC_URI[archive.md5sum] = "3a66ab5b4fe1fb43b471708e4ff39a0e"
+SRC_URI[archive.sha256sum] = "d9cac4a123eec6e553a26e120979bab7425def9ae7ce7c079eba5e4a45db05f4"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-- 
2.3.5


