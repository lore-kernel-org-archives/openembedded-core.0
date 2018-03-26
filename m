Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id CACBB78752
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:20 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g8so7334086pgv.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+/EyLfF7Yi+TiLwqhrGFpOf2qhXjA8e8OJ3DuAc49ME=;
	b=b6F9K6yfsfADL1bsTFbIc6Qiqhm6k4Y1HNYyXE6lXZ5maSgwrzsMW014tGjZ4toI69
	FwoJixWiHmTSW6QeGzKe+M9nNCwZ/BOb6FsOwRZ+Pq7uG3s2cIJw5ltmIC5shoNCKXvl
	MiTLum7NFc75jzJ4ZcCtoqbWcDSC5gCusJ/prBn8EIrBzaX6q92HsCVwcxZ5IGnPXR0Q
	oMqKb0gnI7ERhp8z14YJ+ZuZ74w8pFFJk/Tgvhw7+VgrPceFyAtE9uyDOJzlrq6mp/7H
	rjj2oIxhLycSrmkoYMM25hK60CGzVe82l2m9pVzLXVCgU+7GQSIPEr8I5XvRBGev0MR+
	e5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+/EyLfF7Yi+TiLwqhrGFpOf2qhXjA8e8OJ3DuAc49ME=;
	b=uH3un2XbFD08TEXMUyYzcvZpvrtsfJ1PQqqDZm13ea4NJTedezzf5VHKqySYwPZxjq
	nfkGNZj2Jl6l/hr0ZFyBWpyWxDVDftvlARyjvL6uRrq6Fyf0n9MMD8d0DOTRoXGidUqK
	AoLDudu3QV+2VZc8cAgTRWXPoYr7lnpkYefgpDL0SvSq53wD0pz9RFFcuTX6nlQVjEEl
	8zAa2WHCCGh5IiruLTUc5olAtrc0Glb/PkzW09fTY+4qQaionUROgr25vfY6BLWlQdty
	pITJv2a35qSVmIlVJMB1CcVL9iHrMdB7TK4TEM/dMW4vYpbT91LUA6p9KVjDyjx2R6Zj
	I3Bg==
X-Gm-Message-State: AElRT7FJqKJuohkD1G/39jb8RK1Eqd/MRvOW4wd3DycdaI65uSQ8TrEZ
	SK/fntvVR3BTu5kF0LPzvEU=
X-Google-Smtp-Source: AG47ELuImvXLipnNRMnoCwKjhDkvPW1aVS0k4831XuilMGNHLT0vDw749g2IR5X8HatSWA59yWY4/w==
X-Received: by 10.98.31.86 with SMTP id f83mr23481814pff.196.1522074681978;
	Mon, 26 Mar 2018 07:31:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:10 -0700
Message-Id: <a337d41ea8d4747a3adf64d790b0476da01fb9ac.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 07/21] xinit: update to 1.4.0
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:21 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-graphics/xorg-app/{xinit_1.3.4.bb => xinit_1.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.4.bb => xinit_1.4.0.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.4.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.0.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-app/xinit_1.3.4.bb
rename to meta/recipes-graphics/xorg-app/xinit_1.4.0.bb
index 9318518..dc2a06b 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.0.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18f01e7b39807bebe2b8df101a039b68"
 
 PE = "1"
 
-SRC_URI[md5sum] = "4e928452dfaf73851413a2d8b8c76388"
-SRC_URI[sha256sum] = "75d88d7397a07e01db253163b7c7a00b249b3d30e99489f2734cac9a0c7902b3"
+SRC_URI[md5sum] = "2da154b2f80ca9637b1a17b13af0880c"
+SRC_URI[sha256sum] = "230835eef2f5978a1e1344928168119373f6df1d0a32c09515e545721ee582ef"
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
-- 
2.7.4


