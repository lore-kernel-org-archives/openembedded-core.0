Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADD4619DE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 14:57:14 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id m14so2961212eaj.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 07:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yg1hIRHZURDdz5Qu8blcSrfHN0SQlUQXH+ZY6jKZCvM=;
	b=pao2GNEU3X61S0YdYAzj1jTjGiRsm6npbqiwZv2dC9Tpi0iPDTsoDE6ZahH5MegtS2
	WjYGQK6Jqancwhkxhu6ihTW4d40iEnbTXkYGd2RI21jiGbuYEsZmfhcDEtWR2VyCe10E
	GwGDfcgoBbMO/Ny89kYjWCrm10bGk4R9XAe/2OyXWC+N+lRrrxB7U4JzMUAxw06to20T
	PVvE6TKA634MLyUUZ6h1oo3raNyCG1ztWNZMB8LTfjeV3NOZRlOsHRdtotYJ6lclrqPj
	+2XUyTJEIjdQge6AecbCAXGTDRxP5adPqO5wNUSmP++aOqXwoKM7YWxi+LjWCfPPkq58
	by9Q==
X-Received: by 10.15.52.5 with SMTP id o5mr20697007eew.58.1374332235407;
	Sat, 20 Jul 2013 07:57:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r54sm35859529eev.8.2013.07.20.07.57.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 07:57:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 16:57:23 +0200
Message-Id: <8c70a1c4daf74d5a248237f22b0f58c331b681da.1374332196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
References: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332196.git.Martin.Jansa@gmail.com>
References: <cover.1374332196.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/8] gst-plugins-bad: add few more PACKAGECONFIGs
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
X-List-Received-Date: Sat, 20 Jul 2013 14:57:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 7e80ce4..40accfa 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -24,6 +24,14 @@ PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[rsvg] = "--enable-rsvg,--disable-rsvg,librsvg,"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
 PACKAGECONFIG[neon] = "--enable-neon,--disable-neon,neon"
+PACKAGECONFIG[mms] = "--enable-mms,--disable-mms,libmms"
+PACKAGECONFIG[cog] = "--enable-cog,--disable-cog,libpng"
+PACKAGECONFIG[faad] = "--enable-faad,--disable-faad,faad2"
+PACKAGECONFIG[jp2k] = "--enable-jp2k,--disable-jp2k,jasper"
+PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
+PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus"
+PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
+PACKAGECONFIG[vp8] = "--enable-vp8,--disable-vp8,libvpx"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.3.2


