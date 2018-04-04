Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id B1EE07482D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:27 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 91-v6so11766185pld.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5nexabaezKNcnS+TjXgK2DVIIvWyrkGS7ofjUC1azLE=;
	b=kOuArrvwlDavIsx6ljPGLgIILWUmwwC6ITe+5gBIrXwYT/F1d6G7INsqVfgG7kIG9d
	Cb8ks90UyuO5jsgGg/yRiUpYmZMIZK8DIx2QlDxW3ENKCOx37jLiikuZqg7fLMOiPjA+
	82en947fIq/sbNieCZSuvxV9IVeN/ERw/lbRhxeuxf6D88RD86jJHKiMTiXOfvfp+FuG
	qtOJS6wSX++VuBgz7M9S95OyZ7UV80eTtdLqMtoIXk6sZfONwgBncpgyNfU27lbAjm1v
	mSBefksDQHrOKAEtFRMTksInckPjNPo+NHSMbiTOhiJtnOThA2C+Qk4mbXJAScWngVfr
	VIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5nexabaezKNcnS+TjXgK2DVIIvWyrkGS7ofjUC1azLE=;
	b=Cug1HbLyYOmtC99ikduj1Fh4mx2hkdSOZ885tOyis3jX++t1j32I8ogwa1cl0wyICU
	WezfidVwzFY5OafJ+uZKcKzqKGnEYUarRhu1oBbsqc/IF8kbDEjmy6VHx2dL5XKWCNJw
	xtecDxFHhqfjK52geFFnY1OadgRsRllLrlhJYt6QuPvPSeYtYEDwGbEMyc/hxk/JGEbY
	+9fsPnl6/V6plDQ4f+206HemKdlDXdd0epCBH56/2ISdVwpIH2N5uUSa/zgCPRkKF8p0
	Y64lxrYOj1W4zSSHNj/shrOK/mOw/tsIj0/kN5UlvlOCCt7zPbYxLLdazOiWgGnc9wr2
	UnSw==
X-Gm-Message-State: AElRT7E7bqHxFNWiAPMivC3VUsEK/MZSODtpna0k9684xk9ystzMZOVn
	BJq+xojsnXpsRrKDGkyJloeVvg==
X-Google-Smtp-Source: AIpwx4+BPKAWKeAPk1ed66dzDcp4EdGWwT1m3crq72OqnQRieQY5zCnr7/9aqPElTp/kSUn9i6EIzg==
X-Received: by 2002:a17:902:ab85:: with SMTP id
	f5-v6mr16271440plr.380.1522806568274; 
	Tue, 03 Apr 2018 18:49:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:03 -0700
Message-Id: <6ac9c22f00992d0616f05f26052e813557d2cb0a.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 04/21] xkbcomp: update to 1.4.1
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:27 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-app/{xkbcomp_1.4.0.bb => xkbcomp_1.4.1.bb}                 | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.0.bb => xkbcomp_1.4.1.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.0.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.1.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.0.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.1.bb
index c9dc327..c35d5d7 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.1.bb
@@ -9,11 +9,9 @@ be read directly by XKB-capable X servers or utilities."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=08436e4f4476964e2e2dd7e7e41e076a"
 
-PR = "${INC_PR}.0"
-
 DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "cc22b232bc78a303371983e1b48794ab"
-SRC_URI[sha256sum] = "bc69c8748c03c5ad9afdc8dff9db11994dd871b614c65f8940516da6bf61ce6b"
+SRC_URI[md5sum] = "07df9790d30f9a369d20a418af784de0"
+SRC_URI[sha256sum] = "748dc4cf58ac95684106bd9cf163ac6ab7de9a236faec02a6f4d4006d63a5736"
-- 
2.7.4


