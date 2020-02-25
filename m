Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B995616B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z12so280285wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CXeu+WgZN97VV447Qwpmtbb+d7uUv5BHQ4Gz9OhhwLQ=;
	b=AeqbBIQW2SN7OzEHPlsdpoWrbXd9nFHnERjjfJyXNSWFbml2GeJZABK72kovd+lkw7
	PK2ogZYkLsolLHdRUvuRHSktsumIZYumP+UWk5jLGELyYT+0RvvCpRRKHdQkQrR4jGAl
	9Bpklz4lsPMXcpurTT3tjDZllY9HXDxGNDGjvRmEkcDw+1XuKypfg8dOVLqtIjY28yA2
	K/mIEk1aQUsOmfw43mA+5P8lpxd/ErM0+lcxq4uNEP1BK0Dkbnin2Cpt/N5Z43OSNckp
	TtjYwnRZxzaX6HSM75fYs78C5Qf5lgNpjrODlyTQRS3VbwDrHsSKvMxG9U3WbTPrMo0J
	zhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CXeu+WgZN97VV447Qwpmtbb+d7uUv5BHQ4Gz9OhhwLQ=;
	b=jPc+0Ab5Py0DIThnxzbxbrRCWmV8rrjOpYl/KUCDqRvnqHBUFrAM7FNL9Nnt+EMvt7
	7Px9ar2Dkw24EF0i7oukTbTUuinrgBw1tA7AFFBCNrh44F47Zi1NeKKI545ra4rsLZtw
	aTvxdoRadSLCAg/rnApvAnoFgCeN6IAIrQNwNHpZi8VuOQbYBmQmC1B4wh09c87ihogB
	94chAqDyeSZgLEOfmmNkMJNSS26EgABdW/GIqoCuMsA1L7/pT6jZI0uK+vyDraEWYKwB
	IiAxxISP1i5pgWaTgdxL0+2Zp14dDU4xhl/JU1NlouaA/6zIdI91+SvvYnfazyjmgg0T
	ENUg==
X-Gm-Message-State: APjAAAWXnap5r2f3ignkoe8Lx6UQA9D0XbrbbNxNavbmuSNfWzNvnqiQ
	oKbFD3fA5UWjBZfnOq4LDLLONbG1
X-Google-Smtp-Source: APXvYqzET/13K4E2+lYGVdlbjE1ch4Pfu6eQQzbLW/y63JEPo3lK3V78DQjyGcogy3xC5PkI4KpHFg==
X-Received: by 2002:a05:600c:2481:: with SMTP id
	1mr603223wms.120.1582656851531; 
	Tue, 25 Feb 2020 10:54:11 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:30 +0100
Message-Id: <20200225185335.19326-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] unifdef: upgrade 2.11 -> 2.12
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
X-List-Received-Date: Tue, 25 Feb 2020 18:54:11 -0000
Content-Transfer-Encoding: 8bit

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../unifdef/{unifdef_2.11.bb => unifdef_2.12.bb}         | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/unifdef/{unifdef_2.11.bb => unifdef_2.12.bb} (53%)

diff --git a/meta/recipes-devtools/unifdef/unifdef_2.11.bb b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
similarity index 53%
rename from meta/recipes-devtools/unifdef/unifdef_2.11.bb
rename to meta/recipes-devtools/unifdef/unifdef_2.12.bb
index 1ffc11e76b..22b10ba234 100644
--- a/meta/recipes-devtools/unifdef/unifdef_2.11.bb
+++ b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
@@ -3,12 +3,13 @@ SECTION = "devel"
 LICENSE = "BSD-2-Clause"
 HOMEPAGE = "http://dotat.at/prog/unifdef/"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=78fc6c2c1dc4f18c891ed5b7a469fe32 \
-                    file://unifdef.c;endline=32;md5=aaec84d8b68d8b6dea71f45e9949ebfe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3498caf346f6b77934882101749ada23 \
+                    file://unifdef.c;endline=32;md5=6f4ee8085d6e6ab0f7cb4390e1a9c497 \
+                    "
 
 SRC_URI = "http://dotat.at/prog/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "337053fd8a7d9ab3adf5e50f88af95b7"
-SRC_URI[sha256sum] = "828ffc270ac262b88fe011136acef2780c05b0dc3c5435d005651740788d4537"
+SRC_URI[md5sum] = "ae8c0b3b4c43c1f6bc5f32412a820818"
+SRC_URI[sha256sum] = "43ce0f02ecdcdc723b2475575563ddb192e988c886d368260bc0a63aee3ac400"
 
 UPSTREAM_CHECK_REGEX = "unifdef-(?P<pver>((\d+\.*)+)(?![a-f0-9]{6,})).tar"
 
-- 
2.25.0


