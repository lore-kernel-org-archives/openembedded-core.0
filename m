Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2ED6ADC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 10:29:59 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y10so2285641wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 03:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=skXNaFA1PZt0ASz5XCZGrj+hV0rOkaPJ3Y/kKAREm/Y=;
	b=Q5CUmKEYe+4OT87Zl8Ox90+x5wv/F9qjY7dlU6JZFaoqSbU2QyX/YsN8Q8TqPRfj5k
	PO1/XG9w/mWXlLOvRwsNiqEEO7rsYqdl/rchjgx4b6AuIPGlV4kTQ5mb6j9YDgqAoHVH
	sChUuSJbmcQsYmg/HEOm7uGMLvKVO5D2v71xdTelTyR5m66pXmU89eS3mfd033PxPpO7
	Qo6MJ3o0aLu4m2g0zEojR2au/gKZ5zMTk4/q50ODXBDaQ3TwyYBJ1BMvqTplAUq+9+ZJ
	J6AqkURU9RzEsk1p/0wA/6FgPiR3VPZUjQTWI2ML+UFmV0p2IY77JHGoNFByqtmQ0JjA
	XrPQ==
X-Received: by 10.194.48.49 with SMTP id i17mr16582127wjn.55.1372069800024;
	Mon, 24 Jun 2013 03:30:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fs8sm15570508wib.0.2013.06.24.03.29.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 03:29:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2013 11:26:25 +0100
Message-Id: <67384a7ecf6813d7fa18d3b4d8cfa8eb75f4b2d1.1372069538.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372069538.git.ross.burton@intel.com>
References: <cover.1372069538.git.ross.burton@intel.com>
In-Reply-To: <cover.1372069538.git.ross.burton@intel.com>
References: <cover.1372069538.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnVdY7a8Cx0Jdbu4M3op1I5WsUnlUKIwJWO3rOiS4LtqaquRbRzWVDKFfKxdh2qrgFV8iCh
Subject: [PATCH 1/4] gst-plugins-bad: use correct option when enabling librsvg
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
X-List-Received-Date: Mon, 24 Jun 2013 10:30:00 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 80a8b04..3d86f00 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -17,7 +17,7 @@ EXTRA_OECONF += "--disable-examples --disable-experimental --disable-sdl --disab
                  --disable-orc --disable-neon"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'librsvg', '', d)}"
-PACKAGECONFIG[librsvg] = "--enable-librsvg,--disable-librsvg,librsvg,"
+PACKAGECONFIG[librsvg] = "--enable-rsvg,--disable-rsvg,librsvg,"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.7.10.4


