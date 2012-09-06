Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9eEF-0004fh-09
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 17:42:51 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 06 Sep 2012 08:30:24 -0700
Received: by weyr6 with SMTP id r6so1298905wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 08:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=U8qHTdroZYO840UqG2BeXg3bv9oK2lO1jU6amhDXdbg=;
	b=TX7Yz/zpG4Dc9zB0hQZTdnO4oH5jrE0/kbmj5CU5QWz+l8+bKQTRBFiI5LtSGOPvpl
	u/DljFff/IRG9v+hXXuRhjjg++yO13/aCdMXggmYzDVX4QAC3nGGxODrwXZITg0F6qU3
	9bG1JL4zSUEIbH5xdPwjMS3AVtA8niR7MfyBiaEeQaXUTdtQW7ym5XbuAydqEXQFzROf
	4apISo+bhUPYqtqPVZpUtyHimYRgzk8cTGfcBTrA8XKZG6vsYh4YaxZPF2x/M0e4FtCj
	5AOKZCJ2n3ttsTvafu3496X11N1jpyZOP0FSt4RHas/l65IDxYs5xkNvWNcKVzvevcaY
	TJng==
Received: by 10.216.198.137 with SMTP id v9mr1464297wen.116.1346945421276;
	Thu, 06 Sep 2012 08:30:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j6sm6520856wiy.4.2012.09.06.08.30.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 08:30:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 16:29:35 +0100
Message-Id: <1346945375-5770-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlEgHR5C/3k8Gf9zzycCyiE9oLkXyHO4BiddOoD6FZ8OKnFm/6zTJ729E9TCW4Fq0Tvm/mQ
Subject: [PATCH] gst-plugins-good: disable (uninstalled) examples
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 15:42:51 -0000

The examples pull in a GTK+ build dependency, so remove that too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index ac63f94..0fc34df 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -5,14 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
+DEPENDS += "gst-plugins-base gconf cairo jpeg libpng zlib libid3tag flac \
 	    speex libsoup-2.4 pulseaudio"
-PR = "r2"
+PR = "r3"
 
 inherit gettext gconf
 
 EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check \
-                 --disable-orc"
+                 --disable-orc --disable-examples"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-- 
1.7.10



