Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id CEE607EC9B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 12:35:19 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id n5so14888726ljc.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 04:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+Xe0XbTgCeeQgDwmzBJvPlf/VfmBky/mC8TLROQ/ai4=;
	b=XMq1sX1VYnTlZo5mgJRGv4NqYmXUPEBxwyxcOXF47os4CIfXxQAqZyrS/OcxMKYQ4v
	RsSFknq54mqjLsHgxGhy7e+gk8zz1H+dk5hES74z55JzsKusts9D3/NZHN5E6FFZ9uo9
	8nhU0OHmYZ4Je6cM0uz2CgZZqNf7g22yc5HkybUXKsidMQD6wkvSGZEiMNqV8hL9eOoa
	nsaoyYyRL6pGKY1kNEcyvoKYxYXqzqXCAOOBzOLa8Z1kcm43DjshML7XEWs2EYMzkSCq
	h3VXsXXIKVnYGV1++fW64pcANHLHIh3VDeyZ0ObDlXhbz4ofMXaMy3F12XDeDZY50+pP
	b3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+Xe0XbTgCeeQgDwmzBJvPlf/VfmBky/mC8TLROQ/ai4=;
	b=MhmAOa5OVzbO5fTEoX7yk+ci+I+TFwanhs94Ce5DyGtpHSLBrTiaAmB2+OVd+o3f5X
	Kr5+J3Xa09nI6H2ngqlskWMMZjZM3trtHGlmvq2NeJgOrlJkYKEg8HIi5iCX+M0G6QKf
	c9ZR4ObtL1Sm94u9jVJxK15L2VEjAHyTfLrFZwkF+3dexo6c6AWUoDK8V9FBJDQscexa
	Me8Te8savYTklqoSVSh2XxzNysBbV8G0+8yWXTVTOdYKomXMaQ9bXJqRL1qfGvID5ty9
	g4fpdBqrtdrWIUahMMAGNorMP39EoZL9qMzW/8L7gNkmHkPm11ziLEGVL7B5zWaNAawg
	mk/g==
X-Gm-Message-State: APjAAAW1DejPKcXfuRG8K1wqH3cse6d5zka2rVUD3yzctL2kicaQ2vJG
	JALOogYk2t7gQCFdGiRSF7oyTa4P
X-Google-Smtp-Source: APXvYqyu/u9UQpy9p5zKWpz/IWGFOJiwtDd15UvxF9pnsKIBZEFSY682v+rtoWk0FuoymrbKI1Pb+g==
X-Received: by 2002:a2e:161b:: with SMTP id w27mr1802670ljd.183.1573043720077; 
	Wed, 06 Nov 2019 04:35:20 -0800 (PST)
Received: from manatarms-greyskull.lan.mikrodidakt.se ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	b23sm10309540lfj.49.2019.11.06.04.35.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 04:35:18 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 13:34:58 +0100
Message-Id: <20191106123458.22267-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Romuald Jeanne <romuald.jeanne@st.com>
Subject: [PATCH] rm_work: Promote do_image_qa stamps to setscene versions
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
X-List-Received-Date: Wed, 06 Nov 2019 12:35:20 -0000
Content-Transfer-Encoding: 8bit

[ YOCTO #13212 ]

Suggested-by: Romuald Jeanne <romuald.jeanne@st.com>
Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/rm_work.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index a6bd3f719f..0bbc450100 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -64,6 +64,15 @@ do_rm_work () {
             mv $i `echo $i | sed -e "s#do_image_complete#do_image_complete_setscene#"`
             i=dummy
             ;;
+        *do_image_qa_setscene*)
+            # Ensure we don't 'stack' setscene extensions to this stamp with the section below
+            i=dummy
+            ;;
+        *do_image_qa*)
+            # Promote do_image_qa stamps to setscene versions (ahead of *do_image* below)
+            mv $i `echo $i | sed -e "s#do_image_qa#do_image_qa_setscene#"`
+            i=dummy
+            ;;
         *do_package_write*|*do_rootfs*|*do_image*|*do_bootimg*|*do_write_qemuboot_conf*|*do_build*)
             i=dummy
             ;;
-- 
2.21.0


