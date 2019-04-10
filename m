Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6507D93E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h4so2876617wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lTPg8spMxyC95URQd1M/tI3TSxXKIkuoiUy3X9abU74=;
	b=Eyddj1IZp7CuL9k4ddMtupRjUyNQmfRvBo5H5scFPVp6Mwyps32DhuQntt78dmiiM0
	3v77dwCctW+rZB5jBqIBk+1hC4KFhfx8MHn45i/R05MQfA1fUY+4yDrj3fL9xotdSk8V
	d35voztWR7M28JXg2KS75RjzVMAlytW+90O6Kk2WAxRrWxyXGEn3mVcpjXCtN54pkYXR
	E4+1A40hV9B2eRZOf1oIq4ORxADxXV59766BQW+ufgt9N8dMwPVDL8KFKHV+WXrImoRr
	b4M57ZeP2CJ3HpYrK1u8zp5RkJaZQhDve6FcI6HxhgdjWToaBYTzPnoIWxijrnKVxohU
	du0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lTPg8spMxyC95URQd1M/tI3TSxXKIkuoiUy3X9abU74=;
	b=gV6G2JU29FlOuZ0TOnG16EQUA2EmlplA7A0bntXADqI5TX1aNNDHsn0OB5BbJam/qq
	juT6OdD6MmVta0iHgzFzN/G01OPbSaZN4HJ9LOti1LflgKaB5XY/Qf9V/IfdbR78Jj/b
	PNjgIpVg23zWe8276t0ffVlA79rJMr+S1K3HwiHHn7l6tUTjEDXKvAWi9ZTWRcPOEqTA
	Y5XEubUIuE0wSQgD5FnzQ3p5NwG0HvGKq3z951T4GE2enL8ojHlJ6/sBfPf6Pqe3l/Qe
	9Ww1Vh6i6SIEqMX+dJFXAgEfuJAGzQfEAjKO/blg2P55LyPjsr+5HBHr+NoitVIvKnmI
	XNNQ==
X-Gm-Message-State: APjAAAV982wSW1IYUO/fPB83aWt6FX5ZyZ9cxuIau/RnEWRE2bZBA5MU
	mObiupE8D+wTv8pIpeq2flDPcBvLgdA=
X-Google-Smtp-Source: APXvYqxKKKcllFT5KhRs+pEA9gQwF38t14MEmdV786GUo87C7IwlIvQ8pJCAIOLIchnDT8KCkChHqA==
X-Received: by 2002:a5d:6101:: with SMTP id v1mr5963203wrt.222.1554901947820; 
	Wed, 10 Apr 2019 06:12:27 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:40 +0530
Message-Id: <30b33d787595b8c3120b73c755a432a0f0f30fa7.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 21/33] wic: Support for changing the imager.
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:27 -0000

From: "Davis, Michael" <michael.davis@essvote.com>

Signed-off-by: Michael Davis <michael.davis@essvote.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/engine.py | 2 +-
 scripts/wic               | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index f0c5ff0..4996bff 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -191,7 +191,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     if not os.path.exists(options.outdir):
         os.makedirs(options.outdir)
 
-    pname = 'direct'
+    pname = options.imager
     plugin_class = PluginMgr.get_plugins('imager').get(pname)
     if not plugin_class:
         raise WicError('Unknown plugin: %s' % pname)
diff --git a/scripts/wic b/scripts/wic
index 7392bc4..37dfe2d 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -362,6 +362,8 @@ def wic_init_parser_create(subparser):
                            "bitbake variables")
     subparser.add_argument("-D", "--debug", dest="debug", action="store_true",
                       default=False, help="output debug information")
+    subparser.add_argument("-i", "--imager", dest="imager",
+                      default="direct", help="the wic imager plugin")
     return
 
 
-- 
2.7.4


