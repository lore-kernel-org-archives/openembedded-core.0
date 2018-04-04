Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 926B17485B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:30 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 91-v6so11766353pld.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=A+On4OKukAaJOsREr9KQVM4TLovEZ8VP9sGWw5mmTrM=;
	b=btViCuVFMV8H+A+08AnA3r1TfBhaxpI5nl8fJTQ22Nwl41T+P6KzDm9uQwhqRCdkNH
	97XZsuxKneN5cGia0AkiDAq1zJxUDikx1GNKUj01K/k/YezyygVJ8nXP4vWX0OohJhfa
	vIuY5KeSY410jc1bsz4oUFbtaR/atai+xpLHlMM5+qq3ena+YEK4CQESc0HnX1u+j314
	C8FhM1ueL+4WNx9SDh2dTLOorLkAEj3qbCYcIdDMb0Orq5YW369iAK2Q6fJyd39AVgjC
	8RIXdd5BwUDrowBkEBcVAw3+XfE9H9qw7fBDdFwEnNdfx51u1brVl3cVWfb5PxqnaAuE
	Jd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=A+On4OKukAaJOsREr9KQVM4TLovEZ8VP9sGWw5mmTrM=;
	b=fE37n3nUiMtKbkDJ/jNR1PRpz1tnm0IVSAePh5vD9PzRkJz7j0GFGPCKKPHQSzIvTM
	mgZH5cm04FUHTfElwzw4nr+N+G7GcAYwDlELFzfBaEBLhJNoDsiiyUuS7OziCH+oIRh9
	/Tq0eoWWLB4BvoSZ1FFCE70Ullb9s9rtK3nzVSZQFBqiRO++YTsRz89QTyaP6490XQHR
	VGped0mO4aiJgMA+QWT8c1qtNz1jWJ3G8KClrO/2f82+j6PfWiHmcBhS+j8kMCmtGdzk
	LMNLfCMqdmLmsfcCanuzgF0Sun0gzt/iwE9ZT62stsT7Mg1NRbABDTID5fk8IHO+IfUv
	C92g==
X-Gm-Message-State: AElRT7Gaau/7pXfPo6XBi13rCCfE6DlAeOYReGGI30wIsCRH8V9An6p6
	iYVUQYHvSXWXrlR4jJneir6cPQ==
X-Google-Smtp-Source: AIpwx4/AsY6WvZdEahRA45mAJiTsS4MkJaR2cZl5M3khQ/BrQWsjV2hOLB9m6Zp0Svyt//YtD23Fog==
X-Received: by 2002:a17:902:8d97:: with SMTP id
	v23-v6mr16225012plo.285.1522806571836; 
	Tue, 03 Apr 2018 18:49:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:07 -0700
Message-Id: <51d4861ef9b725b6afd7e2c6cff3c326705f2a99.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 08/21] xeyes: update to 1.1.2
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:30 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-graphics/xorg-app/{xeyes_1.1.1.bb => xeyes_1.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xeyes_1.1.1.bb => xeyes_1.1.2.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb b/meta/recipes-graphics/xorg-app/xeyes_1.1.2.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
rename to meta/recipes-graphics/xorg-app/xeyes_1.1.2.bb
index 84d0cb8..06885f8 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.1.2.bb
@@ -8,7 +8,7 @@ PE = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3ea51b365051ac32d1813a7dbaa4bfc6"
 
-SRC_URI[md5sum] = "a3035dcecdbdb89e864177c080924981"
-SRC_URI[sha256sum] = "975e98680cd59e1f9439016386609546ed08c284d0f05a95276f96aca6e8a521"
+SRC_URI[md5sum] = "6f0543ec84283df5743eeafc173bea4a"
+SRC_URI[sha256sum] = "57bcec0d2d167af9e5d44d0dbd74c6d7c0f0591cd0608952b23c749fdd910553"
 
 DEPENDS += "libxau libxt libxext libxmu libxrender"
-- 
2.7.4


