Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0E19D916EB
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:17 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a6so2871409plm.3
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BWaXmWn1PW11ILg39p91rcgZ2o8GIPw13VEUya+mPgs=;
	b=VZHMMBvNS71h7cyv0EVlZn4MJCriWIIwVMBsW0QtJ2tAYeB84XsXuiE7BrIqOuB/NK
	2EBtCb1boAVMZ7afB+vlN3etycV45QyNBHUd+XEjhg8EYopARq7iGeMdidi1SHgy8Vyc
	hpaMVrMwxkKtGWh+5cUcwy0KxYHFm+KehLIbkM930z40OUGZzPwa1MQNYyfAmtjUuqSY
	HFMD6fo4i9u7NVxRih7IPpGT+1Ng8J1NS9VURP2e8hH8G7MFjVBmXHNNXIpmZe6kuDx0
	bx2XxBQMlop7XYQYvzvPbJZTIYdbzwcYn8lR0SpfHpYHoZA77pJwe5VxCkHdESsoJgoF
	DzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BWaXmWn1PW11ILg39p91rcgZ2o8GIPw13VEUya+mPgs=;
	b=PWUMlTBsMWTq76W3hcrV+S83taFjbEUau2fCIdv6rGsBXhY5Rav/pER+PKMey5EEbB
	XGReTtDINoObT5IvcKcbdIdvmmFkfGYWzPWBPccSROJA0Hy3wSlvZmaFvb0py/bI34Vv
	qxM0C6C8YQqIyH69xFPuESVmapwrR/dNDGG21t4XSTmMlOE5oBWzCteFYt9p/mDxIxYb
	a2QgxbD9zkOIXwfwfrhDx2WwSDGC4RKaAHddn2JF4OqB9tb52nc0p3BX1Ng/ceJJ0N3J
	zlqs8nrQq7fXviT+tOnQOb4tS0od/bUZcg6qax+R2FdtaKVxDabebvit4Sij2nAljsgi
	sDXA==
X-Gm-Message-State: APjAAAWkubxOGU+Jf6u2luexRc64QkTEh42/cjlNSe9UqzLci3s79Y83
	VbEHu+ozk+YAjP97ojS/BA9H8vpk
X-Google-Smtp-Source: APXvYqzyLyH9MMuDw5MZw/g7oBbKKoeiyXG2b3raK8hO/YLG5aJjRkQbJ8/XSZUSjlOHQO1PJ+SkEA==
X-Received: by 2002:a17:902:121:: with SMTP id 30mr7720542plb.4.1580055919061; 
	Sun, 26 Jan 2020 08:25:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.18
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:53 -0800
Message-Id: <9b92d5fbfdcf48a17efdd8c1edda4ad26def017f.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 28/29] populate_sdk_ext.bbclass: No longer needed to clean away conf/sanity_info
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:18 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Since the sanity_info file has moved from the conf directory to the
cache directory, there is no longer any need to clean it away
explicitly in clean_esdk_builddir() since the whole cache directory is
already cleaned away anyway.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40c30990e1be72130819c040fe471e2bdc0c6e7d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 800e1175d7..f845f7d47d 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -121,7 +121,7 @@ SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME') or d.getVar('DISTR
 def clean_esdk_builddir(d, sdkbasepath):
     """Clean up traces of the fake build for create_filtered_tasklist()"""
     import shutil
-    cleanpaths = 'cache conf/sanity_info tmp'.split()
+    cleanpaths = ['cache', 'tmp']
     for pth in cleanpaths:
         fullpth = os.path.join(sdkbasepath, pth)
         if os.path.isdir(fullpth):
-- 
2.17.1


