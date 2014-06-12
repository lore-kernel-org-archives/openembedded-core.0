Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEC6D61F16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 09:21:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5C9L1O1008856
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 02:21:02 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 12 Jun 2014 02:21:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jun 2014 02:21:01 -0700
Message-ID: <d34c8b5769080274b7202919e450d42c69a5450d.1402564829.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402564829.git.liezhi.yang@windriver.com>
References: <cover.1402564829.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gstreamer1.0-rtsp-server: depends on libcgroup
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
X-List-Received-Date: Thu, 12 Jun 2014 09:21:03 -0000
Content-Type: text/plain

Otherwise may do_compile error:
test-cgroups.c:43:23:: fatal error: libcgroup.h: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 6917d41..e4bf7b0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -2,7 +2,7 @@ SUMMARY = "A library on top of GStreamer for building an RTSP server"
 SECTION = "multimedia"
 LICENSE = "LGPLv2"
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
-DEPENDS = "gstreamer1.0"
+DEPENDS = "gstreamer1.0 libcgroup"
 
 PNREAL = "gst-rtsp-server"
 
-- 
1.7.9.5


