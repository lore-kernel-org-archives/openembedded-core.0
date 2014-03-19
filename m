Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id D976B6E8AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 16:24:47 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so23790260ykb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=C21cCEkvXvtUC7pbnM6CFImHMaQAwum1bidbbkbmA+o=;
	b=weIaHFvSqak5QEqcAMRGkKtAoD+dVc+EIjrcMn4DPno+cuS+/KORT7ZrOeI5D0Zq98
	5SU93dfzHfNlPalcKtS3tLnkJ+/iLrtjESx7K18RNtwIUtg4pIFuO6CpYsF7TRk9NrKJ
	FhldN4x3CyCwjeolb7tXAjURW4eLNw4bWm1u/HwJiI/D7dP29aWa/4a5Gu9DhAP+AZI7
	I23PcQyT4CiHhyl6UJqE960bSbAPDR+sGszkns2mDMhhvZXj39+4fPkgVwEXbk4Kj1vD
	2+hmOAHNYYPvzoUhDO+HSez7+cyC6l7QwvNy9ejXKeke7gQ1PFASZ4XANw6LN79m+kWc
	XaWg==
X-Received: by 10.236.99.38 with SMTP id w26mr52283064yhf.18.1395246288244;
	Wed, 19 Mar 2014 09:24:48 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id w8sm44251287yhg.8.2014.03.19.09.24.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Mar 2014 09:24:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 2CBE1198E98E4; Wed, 19 Mar 2014 13:24:43 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Mar 2014 13:24:42 -0300
Message-Id: <1395246282-8546-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1395246282-8546-1-git-send-email-otavio@ossystems.com.br>
References: <1395246282-8546-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/4] cogl-1.0 : Update to 1.16.2 release
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
X-List-Received-Date: Wed, 19 Mar 2014 16:24:50 -0000

From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>

Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../kms-include-stddef.h-before-drm.h.patch                           | 0
 meta/recipes-graphics/cogl/{cogl-1.0_1.16.0.bb => cogl-1.0_1.16.2.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/cogl/{cogl-1.0-1.16.0 => cogl-1.0}/kms-include-stddef.h-before-drm.h.patch (100%)
 rename meta/recipes-graphics/cogl/{cogl-1.0_1.16.0.bb => cogl-1.0_1.16.2.bb} (50%)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0-1.16.0/kms-include-stddef.h-before-drm.h.patch b/meta/recipes-graphics/cogl/cogl-1.0/kms-include-stddef.h-before-drm.h.patch
similarity index 100%
rename from meta/recipes-graphics/cogl/cogl-1.0-1.16.0/kms-include-stddef.h-before-drm.h.patch
rename to meta/recipes-graphics/cogl/cogl-1.0/kms-include-stddef.h-before-drm.h.patch
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.16.2.bb
similarity index 50%
rename from meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb
rename to meta/recipes-graphics/cogl/cogl-1.0_1.16.2.bb
index 0ef9726..521158e 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.16.2.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI += "file://kms-include-stddef.h-before-drm.h.patch"
 
-SRC_URI[archive.md5sum] = "611a61bed04354cbfffa3dc27feb6d4f"
-SRC_URI[archive.sha256sum] = "75c2c4636a050fda7ee8722ce3d9c618b08799ed92bbb72b4fdff3e73b096094"
+SRC_URI[archive.md5sum] = "aaf32bde135cf3815aa3221726bad71e"
+SRC_URI[archive.sha256sum] = "65be91591546ef6fdfec93a71979b2b108eee25edbc20c53190caafc9a92d4e7"
-- 
1.9.0


