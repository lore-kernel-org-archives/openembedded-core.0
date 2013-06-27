Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 24E626A8D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 16:44:29 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id m6so832568wiv.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 09:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=h+25NG5in9u3IilZBzJ/ETLwbpxSmInp2Bpd51lAUPY=;
	b=nuVghUFTCJBQIh6aQbPGaVC8igwV3xj89WVFXrDed+i9a42H2QtfRmSyazxA3udo9i
	Dvqs/IiTFv0krX7AUB+vcfSgBV1vlDL2b6oMvGGDZ9eojV1dHkLbZdtNhc1sKITTduBT
	SSc54WCCSVWqUYChLTV9exAUROOjByU3BipO8Q/OPuI+RnG1EdzhMyiL754APecSST5e
	f+i+e7UwAUIBca/xG+xnoX4d5vVycA6dpBGhUkyTsKhrwZ2r5rohILvejvNGTmxRDeZE
	15xIaHrQ9BNP59w8MJ5ACsGCIzDlyexECLAErIWMbzSJFrk7CG+xlssnLHO8evmhHK2v
	/w0w==
X-Received: by 10.180.108.129 with SMTP id hk1mr5008512wib.56.1372351470838;
	Thu, 27 Jun 2013 09:44:30 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j20sm4719162wie.7.2013.06.27.09.44.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 09:44:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2013 17:40:50 +0100
Message-Id: <1372351251-13677-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372351251-13677-1-git-send-email-ross.burton@intel.com>
References: <1372351251-13677-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmI4HIyfPh1gJn0lEIF688Hi6qDuOPhPtRDxVFo91JKWM8hJeyMmQAYnny2Hep7cnmNN2So
Subject: [PATCH 2/3] clutter: enable EGL backend by default
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
X-List-Received-Date: Thu, 27 Jun 2013 16:44:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index edc6081..a73f359 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -35,7 +35,8 @@ PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,${E
 PACKAGECONFIG[wayland-compositor] = "--enable-wayland-compositor,--disable-wayland-compositor,wayland"
 
 # Default configuration, distros might want to override
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+PACKAGECONFIG ??= "egl \
+                   ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'glx x11', '', d)}"
 
 FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
-- 
1.7.10.4


