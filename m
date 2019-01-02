Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 787C76BC15
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:36:24 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y126so15400433pfb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MIifrje/ZF/Z/Q/OOW4MfdOlCreEKS87YhnhmSCzaKE=;
	b=nBfV3n235SVXc31Dglm/o7c9jajb8NtdwQxFQ5SP+o+kjQDA2CSs+6ri3/rwtOGLsw
	8Sv+gy0OaM4kwRQLaEdnY7EPWiZh3l5EbFZemixgmoADdlGLplfutKkHPKmxvU4XmyGg
	6eGh9ptFpaMMQ8/uB5eQ4259fXx25OKN+t5zG1dnh0u8wL5S/o6hF9ksP2Tg5KPnCNGP
	Wi5kTBV7PrrIm5PovPereOJrjdZv0HUxR+OOAsLeWewnw4tbV7uiNPzY3jSE4hgkXHKa
	zRs4Z7PU86W6w8MHDguWE/oCPH3xFkawFX/rtOAK8jSZF0J5jihIEAL4He6e7HwBwPC0
	p43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MIifrje/ZF/Z/Q/OOW4MfdOlCreEKS87YhnhmSCzaKE=;
	b=F2PWcOIB6Kxu8d4AW1NAn+/9oHJEGqH8/Uw9ymgd/wHhm6TRIh01ylhyel666qPHbz
	Q5a5QueJde8brr65GbGRr5SgIsbzZ46sUa9u6sP0MwIIt0zNxiTOlLKHoGNqHn6UyvnG
	zZboQrEHE1CKMKAkbSLfC4d+GKCf4VW5kn+zNCBIApczYrujjwyScECPHRpe0PIV/4/s
	4udoCJsMmVxV3zXmLk4LmHsjRoq4iLw7hNQyXqrh+0YRpb2DhvtnkKve0IVn8GlbLKgh
	PCDDBONhoO2+csHqIlsuoBkuhBMBEcPXbs/N1mbg1BLwT4czKdv5OhLcfe93H1L3P9w/
	1wyA==
X-Gm-Message-State: AJcUukccmSFn2lQ0Yk5Nj6Mw5RFBmLfXJ/5A4yP5ZFfD7gWh2zI11kah
	Vn07e1ssVHRaUkrID+rnL1ZKAel5
X-Google-Smtp-Source: ALg8bN5h7qksxZqa/FGb8xDleFyI3OxaEG42uYho1jTWWbe7fvzZbvRBn1Ro5BhVOu9VicbfLuyxcA==
X-Received: by 2002:a63:bc02:: with SMTP id q2mr14162784pge.116.1546446985596; 
	Wed, 02 Jan 2019 08:36:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:b176:14d6:5577:24f])
	by smtp.gmail.com with ESMTPSA id
	v89sm62973472pfj.164.2019.01.02.08.36.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Jan 2019 08:36:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 08:36:17 -0800
Message-Id: <1546446977-27510-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
References: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 8/8] netbase: update to 5.5
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
X-List-Received-Date: Wed, 02 Jan 2019 16:36:24 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/netbase/{netbase_5.4.bb => netbase_5.5.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/netbase/{netbase_5.4.bb => netbase_5.5.bb} (76%)

diff --git a/meta/recipes-core/netbase/netbase_5.4.bb b/meta/recipes-core/netbase/netbase_5.5.bb
similarity index 76%
rename from meta/recipes-core/netbase/netbase_5.4.bb
rename to meta/recipes-core/netbase/netbase_5.5.bb
index 5ab0c58..2061f86 100644
--- a/meta/recipes-core/netbase/netbase_5.4.bb
+++ b/meta/recipes-core/netbase/netbase_5.5.bb
@@ -6,12 +6,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20170112T093812Z/pool/main/n/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz \
            file://netbase-add-rpcbind-as-an-alias-to-sunrpc.patch \
            file://hosts"
 
-SRC_URI[md5sum] = "117cb70c55ef3c1c002f127812b114c1"
-SRC_URI[sha256sum] = "66ff73d2d162e2d49db43988d8b8cd328cf7fffca042db73397f14c71825e80d"
+SRC_URI[md5sum] = "15f2d9b3783802f7f48f6734b6540ac4"
+SRC_URI[sha256sum] = "309bddc69a43b98e5a450992b70cdfc0e3d1afb9107bc631d04b0714be98f88b"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
-- 
2.7.4


