Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3E51960B05
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 13:23:57 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so2997532wib.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 06:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=t2Diuon6hU6bbWgwNypTszW2iDytBAfMLEX4B5Oi+o4=;
	b=ABNKIbXGI2cz+YANLVJoig/kYezsDbZbrE719cRoujAV5nycU9pIjIKiG7yVtPV6xi
	06A34OLzRbGz6ivsORilrjuW2H0LEQW3yNVhzai3aeyDm13arhqzwFwV1gEkj+3Go3IM
	+5o3rfMZGw7Gz/HvlD3gvD9AT3iQRm7ZX/yWYS904/VmJ814ErMWLRtib1pmZ1TWHdKH
	HaIxniakQubaz0xkLnQxhFQNAPOFQLn3EfYKvJtJ7xkn2cv7/9BJGIcw6JtyW7NBQxG6
	Xmc7cczqKJjyMwcJdr1L8AGqDcELZ0C/jTHdRXuJEurbSd3kRDLiyM04R9rba3ElGuyU
	FBlQ==
X-Received: by 10.194.78.4 with SMTP id x4mr46235806wjw.44.1407677037931;
	Sun, 10 Aug 2014 06:23:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k6sm32098076wjq.5.2014.08.10.06.23.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 06:23:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 15:24:27 +0200
Message-Id: <1407677067-17116-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] directfb: add PACKAGECONFIG for webp
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
X-List-Received-Date: Sun, 10 Aug 2014 13:24:00 -0000

* fixes floating dependency:
  directfb-1.7.4: directfb rdepends on libwebp, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 3dd0a5b..669c0ff 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -27,6 +27,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[jpeg2000] = "--enable-jpeg2000,--disable-jpeg2000,jasper"
 PACKAGECONFIG[drmkms] = "--enable-drmkms,--disable-drmkms,libdrm"
 PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
+PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 
 EXTRA_OECONF = "\
   --with-gfxdrivers=none \
-- 
2.0.4


