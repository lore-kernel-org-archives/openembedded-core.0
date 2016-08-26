Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1FF957016E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 10:31:55 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so10788662wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 03:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Km369rrfEkM/OVa1labJ83yYoraOFQ4wpAP41sAWYjo=;
	b=LjsV1WoTapVeGqMmFkr329FK8CUQKvswziyIBtYYrtZc119HtTDxn2JzywltfraSdf
	66srJW173a0LdhAUTDICZVOhDC2pK8rNJkkttUEjkj65uVGTekxjmhAF3sKlFFvFxBdi
	DIpjUwHR6sIrNjl+9EHGnv2npWZl7NDzJfIP+mwHs/gLsYw9hyo1vcNCyRE3eS0qEHvi
	2VN1BJuPwYfCIDvbUOPiUnkqGQhex0pqK+xmqgpQCni0nPsMhzXfWagEyoKF5gTxZ7sc
	Jzz4lsJGKjutkj/5vvoM3UO5U3ftg5+PwfifW+pF6is/d/yISRom7KJ/nFCkWus1DLKX
	mQow==
X-Gm-Message-State: AEkooutxCo/tOlnPsx5s9KNA/EAYofChhN3HodT7kkM48GDfqGJsSTh+EFbS31eamK8Mow==
X-Received: by 10.28.170.72 with SMTP id t69mr33593543wme.115.1472207515829;
	Fri, 26 Aug 2016 03:31:55 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id i1sm19328827wjl.9.2016.08.26.03.31.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Aug 2016 03:31:54 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 11:31:51 +0100
Message-Id: <20160826103152.6211-2-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160826103152.6211-1-git@andred.net>
References: <20160826103152.6211-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/3] libnl: update to v3.2.28
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
X-List-Received-Date: Fri, 26 Aug 2016 10:31:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

See
  http://lists.infradead.org/pipermail/libnl/2016-August/002187.html
  http://lists.infradead.org/pipermail/libnl/2016-August/002200.html

Signed-off-by: André Draszik <git@andred.net>
---
 .../libnl/{libnl_3.2.25.bb => libnl_3.2.28.bb}          | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)
 rename meta/recipes-support/libnl/{libnl_3.2.25.bb => libnl_3.2.28.bb} (67%)

diff --git a/meta/recipes-support/libnl/libnl_3.2.25.bb b/meta/recipes-support/libnl/libnl_3.2.28.bb
similarity index 67%
rename from meta/recipes-support/libnl/libnl_3.2.25.bb
rename to meta/recipes-support/libnl/libnl_3.2.28.bb
index 2624915..b792818 100644
--- a/meta/recipes-support/libnl/libnl_3.2.25.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
@@ -3,20 +3,20 @@ HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
 SECTION = "libs/network"
 
 PE = "1"
-PR = "r1"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
+SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV', True).replace('.','_')}/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
           "
+UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
 
-SRC_URI[md5sum] = "03f74d0cd5037cadc8cdfa313bbd195c"
-SRC_URI[sha256sum] = "8beb7590674957b931de6b7f81c530b85dc7c1ad8fbda015398bc1e8d1ce8ec5"
+SRC_URI[md5sum] = "bab12db1eb94a42129f712a44be91a67"
+SRC_URI[sha256sum] = "cd608992c656e8f6e3ab6c1391b162a5a51c49336b9219f7f390e61fc5437c41"
 
 inherit autotools pkgconfig
 
@@ -28,15 +28,18 @@ RCONFLICTS_${PN} = "libnl2"
 FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.la"
 FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
 
-PACKAGES += "${PN}-cli ${PN}-genl ${PN}-idiag ${PN}-nf ${PN}-route"
+PACKAGES += "${PN}-cli ${PN}-genl ${PN}-idiag ${PN}-nf ${PN}-route ${PN}-xfrm"
 FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
                      ${libdir}/libnl/cli/*/*.so \
-                     ${sbindir}/genl-ctrl-list \
-                     ${sbindir}/nl-*"
+                     ${bindir}/genl-ctrl-list \
+                     ${bindir}/idiag-socket-details \
+                     ${bindir}/nf-* \
+                     ${bindir}/nl-*"
 FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
                      ${libdir}/libnl-genl.so.*"
 FILES_${PN}-idiag = "${libdir}/libnl-idiag-3.so.*"
 FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
 FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
+FILES_${PN}-xfrm  = "${libdir}/libnl-xfrm-3.so.*"
 RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
 RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-- 
2.9.3


