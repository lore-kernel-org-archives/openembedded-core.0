Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1C67826E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 12:43:15 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x17so760473wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 05:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tH4oyfCO+1uWLawewIyA/vOScY1DbqVX1lR5J6GcGys=;
	b=TtHPycCidOogeNc/yA+KmdguOz0jNzoDtchXVS2gJSkmDt2cZFHWoahCD1RRGWksH5
	3VgOY65ICfPnAl1gru+X2SbQMBA4EmXh2hPTZelxyIIx9Mu5yXMobUfYlUBSh+ZA56L6
	C6aNLnz8bFtS96nWQyyE9OGz6l56tmL3qJj1riDk68ih0gr/fqGzqM2dkGXO/7wfk8Td
	t40lqAlgqW4jJAOIEpp99tMabjxLakIz+h49FYVZvXoz2UY9KsswFpWsp3vnyQIFJagT
	7DjC8t9yii8zaC1FMsNsmz+FKLBTTjTXVwD6AaJ8RPLLZ8+VUrjNO2ydelnWs4pa/8WJ
	XbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tH4oyfCO+1uWLawewIyA/vOScY1DbqVX1lR5J6GcGys=;
	b=FOwinQifbwtwtZH6jWvMZvZ9MFenN3TSm784XQIPlFtUXWzvCAabrY/CXbh3fxmPwP
	OytXxucR0zOM3GtTNutTSL9DEsZ0QDcfN8Koaane7X5bBOuCLKxCnMBxggd8VlZDVg0m
	VmyBDxDVelDvONXKeihLvc9bADuPVTSl/S56A0bwnhmD3TqcFyB0q7JbxgqtRPKuN+9+
	DQewsKs5LJcEu1sN/3c4zNr/tfHsC2SQknlegoRxFehMeps6W+Q5czJDW4ae0OimQahW
	IL7aD8RFXnJxNuc0/krZib5gI8qUPllXgN3/DwZ6XNGAnR1AlKz2O3TQ7H0K1KK4UQW6
	8PAw==
X-Gm-Message-State: AHPjjUikdo9mkRtHDt8LYxqfgnYTTGdlYgOtTpTCosCgZNWP7IcTZMmc
	uhe27+54pGj/VaNPxqE=
X-Google-Smtp-Source: ADKCNb7Pxhnf57x/L0vYr3vu2QXjV62ssbYYwk/hifG3ZWFlEAREIWwy+eGmNW58gyBDVDVrrU2TeQ==
X-Received: by 10.80.174.68 with SMTP id c62mr22332845edd.238.1505738596170;
	Mon, 18 Sep 2017 05:43:16 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58])
	by smtp.gmail.com with ESMTPSA id h56sm4357005ede.1.2017.09.18.05.43.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 05:43:14 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2017 14:43:06 +0200
Message-Id: <1505738586-28217-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] init-ifupdown: RDEPENDS on procps
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
X-List-Received-Date: Mon, 18 Sep 2017 12:43:16 -0000

From: Ming Liu <liu.ming50@gmail.com>

sysctl is being called in /etc/init.d/networking, so it needs RDEPENDS
on procps.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 733ae41..8774386 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -35,7 +35,7 @@ do_install_append_qemuall () {
 }
 
 PACKAGE_ARCH_qemuall = "${MACHINE_ARCH}"
-RDEPENDS_${PN} = "netbase"
+RDEPENDS_${PN} = "netbase procps"
 RCONFLICTS_${PN} = "netbase (< 1:5.0)"
 
 CONFFILES_${PN} = "${sysconfdir}/network/interfaces"
-- 
2.7.4


