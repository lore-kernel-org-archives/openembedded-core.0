Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E594678687
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 13:44:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g75so3658760wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 05:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=YL86+NltbDmpzCt0haBpZ4bN3+Y08zrCcdH4NBAqW28=;
	b=efky/MGFGdAP3PbkpBy/g2D//6WdYcGicT3TyDYxM3hq/JIQyocB8UsLLCnCRJq9BV
	mR7NGZWLtMgmGJ5kiwnKLQ2ibDYmwWnrtsoH1N0LB1npNY/gkVKefhGS93T2uAAug3gX
	PHeu64YAAhHyU+DCAMgOrEWQdR8sRThfELL52I/UHTP6VO6KZtkEli5QQmZWQHpLtzOk
	G+53GpLRD+B0oJ+1mgqgEEzUJ5GzlvYA9JL2ofwsMPK1ejE/Z2+LipcGklAOYA1fHA6q
	GnIqMHpfkSpmQDzzUSzaXlebtKWB6Qva8OlufEw8WpfZr1nFR+e0Lx1GJwfziEM3KaQ0
	kp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YL86+NltbDmpzCt0haBpZ4bN3+Y08zrCcdH4NBAqW28=;
	b=ckYKZXkqZXn6L3NRvu81sMTEhaHGMDu1ACNlnylr18S5xhYx6wsl+Q9OXK4bDv5Pr1
	85R6R572vmjt+cW9neeistZReKPO7touPK633t7pEEimam6ayBn1Vmo8qooGj5izukKJ
	ac4feBroNpbQ2EZS9L78eaN1y48aHVbpPyHIF6yrR1CQp0nz36LasVbQYY3eLxX8ISE7
	QlWA3JaQ0mz5evL6I/NNs6slvRcmJe0jxdA6J4j0HNOGZTKYHYD+uOKu78SN9qXQUyP8
	E2zfTpo+CvzyvHhD4naAXSwivEKBAymoi06k/LBscHiyyuLHX3ljR8yDToyffiXD54Gq
	LOeA==
X-Gm-Message-State: AKGB3mI+WGFGZcwqY8gxKGZHrNu61/PSL06lCEjKJ8rQfwPla4uAhfFb
	75S2s+lDxuiYcdJEv/WqKnsjgFmI
X-Google-Smtp-Source: AGs4zMbCdCVGcQHPYJA8TDmjKLQprKpXL3UfFWwbG8u30wxaQfOabJjNfmaKx7Ve6DKPpYu/OFYdsw==
X-Received: by 10.28.211.211 with SMTP id k202mr1170521wmg.113.1512135885391; 
	Fri, 01 Dec 2017 05:44:45 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 189sm1260563wmu.3.2017.12.01.05.44.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 05:44:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Dec 2017 13:44:41 +0000
Message-Id: <20171201134441.28470-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] xserver-xf86-config: remove last trace of 10-preload-modules.conf
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
X-List-Received-Date: Fri, 01 Dec 2017 13:44:45 -0000

This file has been removed but the CONFFILES assignment for it wasn't.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 4c442bc7123..5420b7d23e5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -10,7 +10,6 @@ SRC_URI = "file://xorg.conf"
 S = "${WORKDIR}"
 
 CONFFILES_${PN} = "${sysconfdir}/X11/xorg.conf"
-CONFFILES_${PN}_append_libc-musl = " ${sysconfdir}/X11/xorg.conf.d/10-preload-modules.conf"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 ALLOW_EMPTY_${PN} = "1"
-- 
2.11.0


