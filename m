Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5066C596
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:41:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id 96so9712158wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XXCcEOtgdGkSQu0xo6IJKoiKE7Pr70TU+vs2/QlK5bg=;
	b=DbA8sApnAywPXacxxxOtJQ5krtlLOHj311VxmnCX7PHfrh8W4wy6R2Wn98IYoV9TtO
	2lnHM/KdDJCsfL9+88SOxTEB/VduR1PyyZtxQljEtGq+/cqjeY/gr8sJ4/XH2a9tIP/l
	hzsNhOxCILyawdrgPwGBMyOQXSYID1c0Y+OBoZTiNwHyI49ZpnvE0sJz0N08zYK59LZ9
	PNtC6yGKGjMFAtZTJUbYEbBKKwdv52/ZvL1f3VFjUqCIxPiIvqbxtb2qRp3iBLwQU15d
	KTauVvw9g6MNY4JXmXzsM8wKkPRjc2rsoKsbv6NiVI8pexpSvyVFLFm/AQs7kuy2SOB3
	IHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XXCcEOtgdGkSQu0xo6IJKoiKE7Pr70TU+vs2/QlK5bg=;
	b=B5Oxa5GF/BslYIMtR2vYdIzBgSvzVhnlQo2uoq8QOwJRu8viW8jUJZP6Fhxt3q9a98
	qJzHtt4lbbAh6vS6KWzqMgPQzizpZ8jjiScHistE94sPYC5RsKvIlBR0kNu4LAWHTyKH
	I9TUWN8DCITR5x7Q/r7NLDITqmvo9M8yJjCnRWF59XMel99eDJEVnFd0FQMK8nvVsxKr
	LpDSqqCfGdIgXHEd1ar8LgIRYJORT24nZyiJMSFEaXkWTCWfK8Tx+XZGWceHdCbeYuuT
	CA2YYm2uUXrR3GaMZcfOGStkjBi5wOw3hOEGvf9whO4W/2jbOronUTGop5MHOAmrTVan
	f2fw==
X-Gm-Message-State: AA+aEWYA8UyAEs2m9cqIoJus470iUp3h/W6dvznOrLD+3XSu+GlUdYad
	tZVsJuBkkKS0dIkiV67ejgLje3rg
X-Google-Smtp-Source: AFSGD/UA3ZFSkV2eTeVqousrIEuP8OHKp25zz8CpxxG+vz+494NCmrRLicxi3fEyjQ1S+l+q0DGTug==
X-Received: by 2002:adf:f807:: with SMTP id s7mr10882753wrp.173.1542901318700; 
	Thu, 22 Nov 2018 07:41:58 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:41:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:30 +0100
Message-Id: <20181122154136.121480-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/16] webkitgtk: update to 2.22.4
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
X-List-Received-Date: Thu, 22 Nov 2018 15:41:58 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkit/{webkitgtk_2.22.3.bb => webkitgtk_2.22.4.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.22.3.bb => webkitgtk_2.22.4.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.22.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.22.4.bb
index d06d2a1a69a..60f1b3ea5d6 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.22.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://detect-gstreamer-gl.patch \
            "
 
-SRC_URI[md5sum] = "6dae6837c884a25413fb1d4527c9894a"
-SRC_URI[sha256sum] = "9dfd542902953be9af8ff32bd37fe662ca3d75f7348514ebac15c6252a6ccd72"
+SRC_URI[md5sum] = "9f08d09cfc21c761a431a545549f301a"
+SRC_URI[sha256sum] = "fab5be2883802352ae0e735dd1eff4bc18abaff7ac78689cec72eb2f611943b8"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.17.1


