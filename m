Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 874546A4BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 11:00:53 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id n12so3992201wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 04:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=pwRbl6uWLqbwFboy06olHzb6L8useTX1zeYvGDkC3q4=;
	b=YbRIeMhvOXHtgghzuuiI6xi2hTpH/qdU8U3r4lVqlzlrv7q7bl4hptBt+oNptp4oHL
	uOhoCnlICwfcz6dAH5GdDFDzj0tpwip9EwntDeUhkgSj6wcskv3bs4t+/RG0wY26hV0Y
	/Qi1iaegBhzUBFUeeiWu1FK0hBMBkuR6h8afDKzcbvHJtFc5K6rEFuHbhcCCDjCoGnaI
	qMc0XSWM4SbRdtNzZD9R5wxrW9D1e4dDGcmf0biXd/Up4rS8fJPPgK+AH1CAdp7UH1Mm
	YRF3iSm0hLv6FT2oDiszGMGw7LHAVGMuy48hRBE1x4A+nsoLEWmoU1BboQukhppWg8kO
	1Ikg==
X-Received: by 10.180.208.81 with SMTP id mc17mr15649245wic.35.1369825252011; 
	Wed, 29 May 2013 04:00:52 -0700 (PDT)
Received: from melchett.burtonini.com ([81.2.106.35])
	by mx.google.com with ESMTPSA id m3sm30350942wij.5.2013.05.29.04.00.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 May 2013 04:00:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2013 11:57:32 +0100
Message-Id: <1369825053-10131-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQml4OMwMY4S07aR8opJQsDyoNMaVNW4hVnbbisqpqpQbR/8bOTDAi9py23KZEpjB/FI1kIZ
Subject: [PATCH 1/2] pixbufcache: add more documentation
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
X-List-Received-Date: Wed, 29 May 2013 11:00:54 -0000

Add some more documentation to the PIXBUFCACHE_SYSROOT_DEPS variable to clarify
the usage.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/pixbufcache.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 274d67d..d46a8ba 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -61,6 +61,9 @@ pixbufcache_sstate_postinst() {
 # do_populate_sysroot_setscene so that pixbufcache_sstate_postinst can work
 # (otherwise gdk-pixbuf-query-loaders may not exist or link). Only add
 # gdk-pixbuf-native if we're not building gdk-pixbuf itself.
+#
+# Packages that use this class should extend this variable with their runtime
+# dependencies.
 PIXBUFCACHE_SYSROOT_DEPS = ""
 PIXBUFCACHE_SYSROOT_DEPS_class-native = "${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' == 'gdk-pixbuf']} glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene libpng-native:do_populate_sysroot_setscene"
 do_populate_sysroot_setscene[depends] += "${PIXBUFCACHE_SYSROOT_DEPS}"
-- 
1.7.10.4


