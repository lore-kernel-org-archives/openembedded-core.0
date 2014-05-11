Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f169.google.com (unknown [209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2A01F60167
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 May 2014 06:47:55 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ij19so7476732vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 23:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tNRDMlLkNNJj/4akBRNpR+DS53J2C1keNUGJeM6ttrg=;
	b=iw2D9FspN9GwZqjlI0IaA2D3Fcz/pb9r5kJ8lu2w68BH0hhGUVbmOn9ZzMUK7WKelf
	xN/lGWztWnBQrFifG74TqWuR7X5D4JqvF3ssd2VqAaLY7wH03DPtVjft05e5anfj5mjM
	3f71mIf0RPueUAja6JT20TcEKa1K3yQrse/0NWdgFseE9TlCxCwmYAkcWa6RxAnZS1eX
	vLxTj+s859sXHCgg1sXcJ159GFZnV1yZ1QWbEgTWwdY+Xx64Ae0cQg/MRnwZhcJ7OHUh
	LRQKbZSQMlJyN8Sjm//RseUEmd7gPwJm2rlsWal5rQVX7fo82DBSNOj15Nh5ngxI1fzv
	/U5w==
X-Received: by 10.58.220.161 with SMTP id px1mr17112402vec.13.1399790876663;
	Sat, 10 May 2014 23:47:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	c7sm9976414vei.16.2014.05.10.23.47.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 May 2014 23:47:55 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 May 2014 08:48:10 +0200
Message-Id: <1399790890-32695-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399790890-32695-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399790890-32695-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] gstreamer1.0-plugins-good: add libxfixes and libxdamange to x11 depends
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
X-List-Received-Date: Sun, 11 May 2014 06:47:56 -0000

* fixes following issue in test-dependencies report:
  gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc/latest lost dependency on  libxdamage

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 5e313ef..b73bcd0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -14,7 +14,7 @@ PACKAGECONFIG ??= " \
     orc cairo flac gdk-pixbuf jpeg libpng soup speex taglib \
     "
 
-X11DEPENDS = "virtual/libx11 libsm libxrender"
+X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
 X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
 X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
 PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
-- 
1.9.2


