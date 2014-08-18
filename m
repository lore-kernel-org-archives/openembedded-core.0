Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5D970E34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:11:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6Bp6u026362
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:11:51 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:11:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:11:45 -0700
Message-ID: <1a5b869a254a0ad4f5c24e7d0639ae88536dc6e5.1408342098.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408342098.git.liezhi.yang@windriver.com>
References: <cover.1408342098.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] gst-plugins-base: add perl to RDEPENDS_gst-plugins-base-apps
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
X-List-Received-Date: Mon, 18 Aug 2014 06:11:55 -0000
Content-Type: text/plain

Perl script:
gst-plugins-base-apps/usr/bin/gst-visualise-0.10

There are two files in this pacakge, another one is (binary):
gst-plugins-base-apps/usr/bin/gst-discoverer-0.10

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gstreamer/gst-plugins-package.inc              |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 0503b34..7bb5678 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -50,6 +50,8 @@ ALLOW_EMPTY_${PN}-staticdev = "1"
 PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
 FILES_${PN}-apps = "${bindir}"
 
+RDEPENDS_${PN}-apps += "perl"
+
 FILES_${PN} = "${datadir}/gstreamer-${LIBV}"
 FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
 FILES_${PN}-glib = "${datadir}/glib-2.0"
-- 
1.7.9.5


