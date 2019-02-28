Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3DA7CC08
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:15:15 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c13so6607161wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xb5CLjvh8ml8GIA2rox5/zvO5LISReUMACvsyRUhahM=;
	b=Vb0t2y6nxOOX/gnKvaNNCxQqg1L+yH+52a006Oi5ufIU4hVqkvM7N2s5ySW68WapFt
	rpK8be0LtVvcPrBnOG7f0rDGqrMGtDa/0VIHUZNLfyQIi6OIP4xqKXzdxxIo2dYvEirG
	whSZZnk5gF+HozZCOI5AX+0WyMDscjMkH7MgM438hrgPn/lorru533KX0mhx8xT+jRwh
	IZ153A6ZhWeo8ck9jYOVjAww8gIYrJgVAkK2sDQQy7bVbWUGrg3jOYu8txWMPWlLpfS6
	4sOdCCy1yACmnXGAr9Hnfzw7LeDLlo5/ifqHozX/XnOnB/t5nX8Nxbt8UhtivO80/KvD
	IbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xb5CLjvh8ml8GIA2rox5/zvO5LISReUMACvsyRUhahM=;
	b=CxdtHTmmj1y2rgwDXZ4eTROCRvC5zZV/jUUiyVb5QSLEaJTBID+N3/CA8bHCC5nV3E
	1z+3XYpKa2gkJ5A6ZMFIjfryy/wdcBJeabGIdfzqNy4D7lkNnkaJ5qVAwxndUbQL5xV+
	gb83qy1J6J+zDmkKeubsTDcq7QGKVJBDRnGuzVVKqIP7oowzSeqru2QTE/i4aHvMsRtT
	5unlEGe2lLYfbaMgWofPV2BwWhE9cKBjRzMMm0qkTf50zo9Cozw6Znsz7Jx8D83ChmYb
	Aa3NOhl55c0J42y/w3r6LA9LK3WlGBOYEhVFi47o26/8gmMVE13FHVlKNBOxBiWPcugR
	sIHQ==
X-Gm-Message-State: AHQUAua1G0Zv/0+uIhw5/5IB0T8iXdbnkfwg9/ymHuZKx0JWvApIDZky
	JhM1fgvMyhVABwSQIWfSANcSbmod
X-Google-Smtp-Source: APXvYqwKrhMrxFQFCX2sTXSaZ3fPwb/6dTeL7MaRZWA+s3+m+9RejucE3LKVnVJHc61MA6CkbY133Q==
X-Received: by 2002:a1c:9e97:: with SMTP id h145mr2799361wme.147.1551359716040;
	Thu, 28 Feb 2019 05:15:16 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c17sm13644910wrs.17.2019.02.28.05.15.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 05:15:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 14:15:03 +0100
Message-Id: <20190228131510.43557-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/8] qemu: remove glx/virgl/gtk options from darwin/mingw targets
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
X-List-Received-Date: Thu, 28 Feb 2019 13:15:15 -0000

As they are not supported, and would lead to build failures.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ebee2974d2f..985289f5426 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -122,9 +122,9 @@ make_qemu_wrapper() {
         done
 }
 
-# Disable kvm on targets that do not support it
-PACKAGECONFIG_remove_darwin = "kvm"
-PACKAGECONFIG_remove_mingw32 = "kvm"
+# Disable kvm/virgl/mesa on targets that do not support it
+PACKAGECONFIG_remove_darwin = "kvm virglrenderer glx gtk+"
+PACKAGECONFIG_remove_mingw32 = "kvm virglrenderer glx gtk+"
 
 PACKAGECONFIG[sdl] = "--enable-sdl --with-sdlabi=2.0,--disable-sdl,libsdl2"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
-- 
2.17.1


