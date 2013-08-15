Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id A1E8E6B8D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:10 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so180215eek.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=GL30ydxPxVSM5v93877uhQd8NmkzQfuT4yAy5rdnS6Q=;
	b=HWlfxy33cBXnzhhw47M9gDbN8FN4NSAgkTSA5MXi6MdTy/agFTFW8IZU8QNhhW32Jv
	pCF+gSOb139bA1okJJl+Kr4Z2LuKUmGCs+IIFhRYprxDOBqu/d1CGr7OP6h9iKXcCq/G
	aPnfCnl7ENJ45EjZKru2C0zPba0yrkpOmqIXRuKqxU3B6ar2j7JCjcxo+FcJYJP+8s+q
	sN6oQ8iFaQS0FHM9GFng4tYY2FBN3XY1UAs2E/4OfPaa7G4qu6Z46kZbgaR8nl/ok1xT
	3+0ul7biJ1Gbi3eeqRsJuHacnjkjFQYpN4Sm+iXBctZgHgevpvcnIReDQ1fiUykbN3p+
	EDQA==
X-Received: by 10.14.200.132 with SMTP id z4mr20548532een.14.1376551391092;
	Thu, 15 Aug 2013 00:23:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm74980248eev.14.2013.08.15.00.23.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:25 +0200
Message-Id: <dbdb8ad0cf9dd140f58d63bc79a9c47aaa4da994.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 14/33] gst-plugins-bad: add few more PACKAGECONFIGs
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 7e80ce4..dceb12c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -24,6 +24,16 @@ PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[rsvg] = "--enable-rsvg,--disable-rsvg,librsvg,"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
 PACKAGECONFIG[neon] = "--enable-neon,--disable-neon,neon"
+PACKAGECONFIG[mms] = "--enable-libmms,--disable-libmms,libmms"
+PACKAGECONFIG[cog] = "--enable-cog,--disable-cog,libpng"
+PACKAGECONFIG[faad] = "--enable-faad,--disable-faad,faad2"
+PACKAGECONFIG[jp2k] = "--enable-jp2k,--disable-jp2k,jasper"
+PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
+PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus"
+PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
+PACKAGECONFIG[vp8] = "--enable-vp8,--disable-vp8,libvpx"
+PACKAGECONFIG[ass] = "--enable-assrender,--disable-assrender,libass"
+PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.3.2


