Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6251A75402
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:10:15 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id c10-v6so8525085pgu.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 21:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8fTLaRUT+I9YZUkP5hVef2vrcUoHnSlf26SIyl5Alss=;
	b=qKWmnVJ2tDIfFV9h8qTFZKqwbjGZHYfHLHdSKxqPkUYqVs8V8m8JmkIUt7ytcrmyP6
	8MJ1kZM7zs+0dS+GzJcVpllPpJ+sacdb1Pq+jHg/lgHHOxu6NegfqfRfkKcBLyojQDTw
	KJJSjtKjxYEToJ04Yw9SBMw9aG6pSKo2IJi4JxscxQILWXWp3sW/1Mb9IHAe9kePaMxF
	GBtpfGc2SR0fhE14Vkem63XthuiFbAG1UqRmG3oxcG1obVM9kOb8VG/6zYuL4JKXVbNk
	bAZbtRXuOp2DmbsDOP6pvugz+8+ewTFB3WFK3zpabBHhxCH/sGtYXhgrtwcWfYEle1bL
	WH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8fTLaRUT+I9YZUkP5hVef2vrcUoHnSlf26SIyl5Alss=;
	b=KqH7zyboa+q2Hme6JZXFx5mbLIOsJk4tJgQ9oZHbqih73lUep5fpZMEHsxxjBMQjR0
	WmACeHp1RjexWHYI80qSC3W5NuddxW9rxgDQJxtnQaZHmQMROECQLUykY+ahV3wu/qbb
	wt6Vikrzyz/GtppqDw7WGqyqXy+N06CFjyRPlfBwLSTmXPnaECeP+EN1m1YXfWP3Co6P
	mJC6559NU76+88qH9m45lhFws9mHXI2CawkWdr+pj0PWgzzltyGvX8ChUKVvPfrH11F6
	K3tJjKiHSWGvBA95G1ephN065ECbyAyazTrQRKFfomQJQGlZe+WD1kvddPcu80j2i1KN
	YWUA==
X-Gm-Message-State: APt69E29GY9+64YYUldB2StrCr2eceqnag303tr8SysCceDSuA+G9UXS
	qBg0JkrR1+r/N5voCxj/ms8P3w==
X-Google-Smtp-Source: ADUXVKLDuUbI3OqQEikhMRQFyyVL+j1yIb1vVYl52hqc0UZC6saOspKvoOK6Rn/uNs0EryKkDEMCzg==
X-Received: by 2002:a62:4e07:: with SMTP id
	c7-v6mr16379770pfb.149.1529381416529; 
	Mon, 18 Jun 2018 21:10:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:59dc:e6d2:872c:4e7f])
	by smtp.gmail.com with ESMTPSA id
	f3-v6sm23326731pfn.149.2018.06.18.21.10.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jun 2018 21:10:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 21:10:09 -0700
Message-Id: <1529381411-5045-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
References: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 4/6] xf86-video-vmware: update to 13.3.0
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
X-List-Received-Date: Tue, 19 Jun 2018 04:10:15 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{xf86-video-vmware_13.2.1.bb => xf86-video-vmware_13.3.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_13.2.1.bb => xf86-video-vmware_13.3.0.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.2.1.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.3.0.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.2.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.3.0.bb
index 0b63bbc..41612b7 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.2.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.3.0.bb
@@ -10,8 +10,8 @@ DEPENDS += "virtual/libx11 xorgproto libpciaccess"
 
 SRC_URI += "file://0002-add-option-for-vmwgfx.patch"
 
-SRC_URI[md5sum] = "4c3912e4d8947f6c2fc1ee9e2f211d74"
-SRC_URI[sha256sum] = "e2f7f7101fba7f53b268e7a25908babbf155b3984fb5268b3d244eb6c11bf62b"
+SRC_URI[md5sum] = "08d66d062055080ff699ab4869726ea2"
+SRC_URI[sha256sum] = "47971924659e51666a757269ad941a059ef5afe7a47b5101c174a6022ac4066c"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
-- 
2.7.4


