Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 097267F9AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 03:40:14 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id p14so5896809pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 19:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Hg/ZgHUgjkFh5YzNBixiUIyXsLJEtwYzb0oEnl5MHkI=;
	b=hMJZmsNGSfij9r24MZDhGQVjoNEk8FFz7YCE2LHRBdrfNHys3grg3Ta6EGQCK9DkXc
	WkdF4S8GKs8A+jZu/1tOOFx/BlV8SzHbNcKBB2d1x1jqoppHGwU2KAuRm9cLAhMSBjjT
	sszVjdoMuVPG/SjAh28QM1ls6e8KpkG9RKOd1mRo12EdomBXN2CbU8Hx07PUe099fO6j
	AemK4+mcY7G6U3bxWvE1il9wR+Us+Ud37Ctq1XiRkndFdUZewfKwjzhTbxEZmZhXJxP7
	9ugiPmYHydr969z/MMTL/ZpdAyDp9VCmyv5BPn04ECxyMxgTgqx56rsTPS1EYowedLVy
	mDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Hg/ZgHUgjkFh5YzNBixiUIyXsLJEtwYzb0oEnl5MHkI=;
	b=Z4GvV2WGNoXyCWgdpX7awBIrYw4WCoA5lVXQtt8ECmnZtsfLpxtwiRngZtN0CM5Ckb
	Kkvoj5QXJtUHkV4cRtHk5BvD40HTOPYY2sM9yCwwZ2RX+h1eQLoMAEL7sfbmOJnFT1jh
	bjQqwAIeD/2Ku4HlCsRoa4M6psoB3bOknMPV3bcvU4agYlhC1yfrcWaF/Fn2S6z8MXjP
	ziAgaweAQ3+XAk1vqZRrvvg3CaH8Lau3oMLKzPybBBn2Og/B3kOotyCDHhq8v1eBs7Oq
	/1bC8g3Zo7vDw599tmp8A8yvRu1H9JRA1qoDXqhz7eicVbbQIaP0orwHQK0WT/D0jN3m
	py5Q==
X-Gm-Message-State: APjAAAV6z80dM5t9/340s0PxNds31FFHdEdafhJv31OnyFpni1jLQEsx
	ZbxdgG6oPAadqWMiVpIpZlnENvrdRgA=
X-Google-Smtp-Source: APXvYqxNMawN8P7KQMhKVS3qWWS1rfi/IXlTaHmJHzlM1Aoas9oGGY1YnXMZlgVI+NPbCBdoFcfBkw==
X-Received: by 2002:a63:2842:: with SMTP id o63mr24903643pgo.317.1578973215630;
	Mon, 13 Jan 2020 19:40:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id
	v9sm15936286pfi.37.2020.01.13.19.40.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 19:40:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 19:40:13 -0800
Message-Id: <20200114034013.3421903-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0: Enable debug in builds
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
X-List-Received-Date: Tue, 14 Jan 2020 03:40:15 -0000
Content-Transfer-Encoding: 8bit

Packages like gst-shark needs this option to be on

Fixes

| checking whether the GStreamer debugging system is enabled... no
| configure: error: Tracers require GStreamer debug support. Rebuild GStreamer core with --enable-gst-debu
g.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Carlos Rafael Giani <crg7475@mailbox.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
index dc3e8ffafd..5ac97f1ec9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
@@ -26,7 +26,7 @@ SRC_URI[md5sum] = "c505fb818b36988daaa846e9e63eabe8"
 SRC_URI[sha256sum] = "02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af0639d46f1cf4377d"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
-                   tools"
+                   tools debug"
 
 PACKAGECONFIG[debug] = "-Dgst_debug=true,-Dgst_debug=false"
 PACKAGECONFIG[tracer-hooks] = "-Dtracer_hooks=true,-Dtracer_hooks=false"
-- 
2.24.1


