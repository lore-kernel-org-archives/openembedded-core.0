Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f44.google.com (unknown [209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF1D6606F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:35:24 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id hr17so1826498lab.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=IeTKTsb5rCzR2Z4o4y/Lg1l0jlEj5MQ50/5RDk8Fvus=;
	b=kJ7FCng5icmSajkUlMqORGk21aVbVyXrRGsjdlJ4zx4/b/l4qE2o3Wsf5PWb9yOm6u
	RRcRLNvAhwAeIA6t2PGTttLIj8MBRbdTZOoWgC+2s1Zm5zo33OcnrD2CJwLzMheSjxKz
	Gf5L1zi7p0kIukzKTrQ1mmPlWZqai/jG2cyLn2Qv2PYRjqMrtyhlh3vRb6jsVelBENj1
	B1sCEWdeE+DAYxIqDoFiBCjVs0GqdzDtonQu+sotiI6ZimGY3Q+8WZfQ1Dwe0jr+rOvE
	qeu8H/Rl2C+KnUMdrCmj7+9/xXEtcO0v5vHC9hQEKLy7PeNGF9R9+gZqhmIuBp7ZUTUv
	IYQA==
X-Received: by 10.112.73.211 with SMTP id n19mr4475lbv.84.1399894524714;
	Mon, 12 May 2014 04:35:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f9sm11491591lae.16.2014.05.12.04.34.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:34:53 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:34:57 +0200
Message-Id: <e4b3317f551972d53f9dba06c23a81536ed3315d.1399894447.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
Subject: [daisy][PATCH 08/10] gst-plugins-bad: add PACKAGECONFIG for schro, dc1394 and faac
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
X-List-Received-Date: Mon, 12 May 2014 11:35:25 -0000

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
index dceb12c..110a505 100644
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


