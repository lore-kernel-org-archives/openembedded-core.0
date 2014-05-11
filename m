Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f178.google.com (unknown [209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id F00F260167
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 May 2014 06:47:48 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id sa20so7198986veb.23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 23:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hGTXE0SF0VPg3RcFIY3kGmx/ESKknLaqVEKEOVDivvE=;
	b=0yU8vhz/LR8VItTK9u8CtBKYLKPm4JtAtr+Kscs9dtwGZHVPe1L+zEoFd5ClV4YO6b
	os5/OFjQxgPq/CoLxWSc/d/dPOeRVJeX+9RM9YDM/ksT+4wjDG8g3YsQhtO5C7xkw/ZA
	j4kVFpFyszP/zBpScjM8i7BD2C6cGkIFQ6APwwgtZImn1Y0fXzo3o+1I05VhSMGRugcD
	R/vAnHlm8dv+2AdNk3nqMQxUA+WPdg9xwCW5bjTQYM92Bp+Ysf8YUM0clXd4THMTEuMv
	U3DWpSS10bpT4DRw/n4c2fwNiqKDm88d3uYDijN018TWQuxL7QA0jheohI+3v/Rhi1Pe
	z2CA==
X-Received: by 10.220.190.197 with SMTP id dj5mr16742609vcb.19.1399790869601; 
	Sat, 10 May 2014 23:47:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fa8sm9492283vdb.11.2014.05.10.23.47.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 May 2014 23:47:48 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 May 2014 08:48:08 +0200
Message-Id: <1399790890-32695-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH 1/3] gst-plugins-bad: add PACKAGECONFIG for schro, dc1394 and faac
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
X-List-Received-Date: Sun, 11 May 2014 06:47:53 -0000

* resolve following issues from test-dependencies issues:
  gst-plugins-bad/gst-plugins-bad-meta/latest lost dependency on
    gst-plugins-bad-dc1394 gst-plugins-bad-faac gst-plugins-bad-schro
  Found errors:
  gst-plugins-bad/gst-plugins-bad-dc1394/latest doesn't exist
  gst-plugins-bad/gst-plugins-bad-dc1394-dev/latest doesn't exist
  gst-plugins-bad/gst-plugins-bad-faac/latest doesn't exist
  gst-plugins-bad/gst-plugins-bad-faac-dev/latest doesn't exist
  gst-plugins-bad/gst-plugins-bad-schro/latest doesn't exist
  gst-plugins-bad/gst-plugins-bad-schro-dev/latest doesn't exist

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index a26acef..2ecdcf2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -34,6 +34,9 @@ PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
 PACKAGECONFIG[vp8] = "--enable-vp8,--disable-vp8,libvpx"
 PACKAGECONFIG[ass] = "--enable-assrender,--disable-assrender,libass"
 PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
+PACKAGECONFIG[schro] = "--enable-schro,--disable-schro,schroedinger"
+PACKAGECONFIG[dc1394] = "--enable-dc1394,--disable-dc1394,libdc1394"
+PACKAGECONFIG[faac] = "--enable-faac,--disable-faac,faac"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.9.2


