Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVj-0001ch-Ur
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:32 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:12:11 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so1873962wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=6PxyTvO42eJy0LlD5DNM0/MojLYo6OiyFBpsDCc7MyA=;
	b=PHa9KdgIFn8Qf+SLGIt+bSdhD9RLXYA7QnhnXS0TS9HikQol/wPadu3vVsqPcAwbMk
	n4vD0wBTL+st5druNMTaEmYhw0eP6IPRCw89jArQGpShFnXOlYzjWIubck9QOTWNcSLa
	zUez5Hf/YsD/FmLm7ojxNyOzEYzn9U/yyzDHsgZE8h9dPOGWL4s/3KdU0foMsct/P/ZB
	GdIpOlNGRseJntBLRjFbaGB27ydYD7snkt5JztOo+TqwBgmMjilQJT/qUS7Uv2FSq30W
	3+Y7jyMaWg6TmJ6XGhbGkzP5aJrh+COYiKrPaAqkNItHZsjCZmYhDSQWjqKjzVTHB3Ca
	seEA==
Received: by 10.216.233.95 with SMTP id o73mr1663317weq.59.1342714324962;
	Thu, 19 Jul 2012 09:12:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.12.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:12:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:11 +0100
Message-Id: <4fa61c5d1061c37157682a2165cc90f210e65731.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn/7ReGQEbuj7HuyBK3LuBQtXS6FueoA3OLcazSW+ivtmZxuWhijLUa+fxj0qAOGnSkrunR
Subject: [PATCH 24/26] atk: cleanup thanks to new gtk-doc.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 16:23:32 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/atk_2.2.0.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/atk/atk_2.2.0.bb b/meta/recipes-support/atk/atk_2.2.0.bb
index 74e7288..d8706ff 100644
--- a/meta/recipes-support/atk/atk_2.2.0.bb
+++ b/meta/recipes-support/atk/atk_2.2.0.bb
@@ -7,11 +7,11 @@ LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
                     file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
-PR = "r2"
+PR = "r3"
 
-DEPENDS = "glib-2.0 gtk-doc-native"
+DEPENDS = "glib-2.0"
 
-inherit autotools pkgconfig
+inherit autotools gtk-doc pkgconfig
 
 SRC_URI = "http://download.gnome.org/sources/atk/2.2/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "4894e9b04f0a9f1c37a624a1e8d6d73f"
-- 
1.7.10



