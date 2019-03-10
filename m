Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA1E7CE6C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:45 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id m2so2220434pgl.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ngNmhlz4CRMcS5inI4jUBp6Qe5cqpI2yGmCeG2UuHi0=;
	b=kv4PQSF/CCV6Z9aBt9DpwQWwj/GjuPklS5V8gSKToszzIyA91PyeYMha/23/v82F67
	Enfg6Qso0+SuyLNRw98vcY4RQhdueBhzFX/VhRQ5dKzCg4jWy0lv6l8csxvNh2jaZ1G9
	U6P8tDviKx2O+VdTD9pue1ne9wbffrat0irzoYcDZrKFEgqHBGCdvL77feyO5b5wQHJP
	61Pwmb07m4zEMgkBRDBeEkVXWazhQ6YbIcRsMEz8oUi+u50m/LuJWkE+YRWY41bKchC2
	Flm7BZgOGDWZa9U3gAYYRxO2OwTSUQgOe1QKPORn5z+gznp6tBjy7WaDnewyH/j6WRzB
	35bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ngNmhlz4CRMcS5inI4jUBp6Qe5cqpI2yGmCeG2UuHi0=;
	b=RL2K0F2F8bMNU6BiJniM3jqhjPW7SiZCg4rmxAVRRGtOQP9wLsQgnvaSSmCYuC75Ow
	mjCOt5ICGt/kqcl1SGxFhp30pfwLcAQ67Kv66sTMGnp29TvunS4WwcBfCdxc2DDghHE8
	L4/HRELetwWZu3YvYZIgrWI2VOQUIQ2IjNe6RghTy8TFepbD1yY/2jcStLUsPJWNzpq7
	TsjFAe54Xzvmr0OX+l5Rs3kpY2iNMucewus/VV5K3Ic5I3udS8Qy77SxDlNmU9aJTAXL
	4/wIrXTGuW3ZyK/HPAqrr/Hvb+jKxIzQCA/vwR7XgRpfN7OxnM0xTgx5pRky2h54uC2a
	bIQw==
X-Gm-Message-State: APjAAAX/jKGI15jrIuJf74SIVYuVJ38mncM339iNQd7NYocdybGywH1T
	OGfNmrVENeJYvucuunslNe1eVcaU
X-Google-Smtp-Source: APXvYqxzajFWbVXCfdaKwfk/0vwrG2QonifcJWcjqvb15iY1iekxzQSM7CCjewAuNI6qp/2F3ldCbA==
X-Received: by 2002:a17:902:7082:: with SMTP id
	z2mr29129797plk.251.1552241266341; 
	Sun, 10 Mar 2019 11:07:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:33 -0700
Message-Id: <1552241263-26116-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 02/12] libxkbcommon: update to 0.8.4
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:45 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{libxkbcommon_0.8.3.bb => libxkbcommon_0.8.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.8.3.bb => libxkbcommon_0.8.4.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.3.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.3.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
index ff0f069..8fcae12 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8225a206e00c4146d2e06f5e688b28e7"
-SRC_URI[sha256sum] = "b855c629849a97ab9835a4ad99d6b749a636f70d38a03f070c6ef72024825540"
+SRC_URI[md5sum] = "3c4409058dfd203f641a563358e0187d"
+SRC_URI[sha256sum] = "60ddcff932b7fd352752d51a5c4f04f3d0403230a584df9a2e0d5ed87c486c8b"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.7.4


