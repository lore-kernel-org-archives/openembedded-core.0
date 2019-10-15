Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 694337F360
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 08:50:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9F8otmS000123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 01:50:55 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 15 Oct 2019 01:50:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Oct 2019 16:51:11 +0800
Message-ID: <f25dc9d8cf72566819e6bf3b55ee987ca80adb3e.1571129436.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571129436.git.liezhi.yang@windriver.com>
References: <cover.1571129436.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] weston: Fix PACKAGECONFIG for remoting
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
X-List-Received-Date: Tue, 15 Oct 2019 08:50:54 -0000
Content-Type: text/plain

Fix a typo: gstreamer-1.0 -> gstreamer1.0.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/wayland/weston_7.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_7.0.0.bb b/meta/recipes-graphics/wayland/weston_7.0.0.bb
index d212754..02d724a 100644
--- a/meta/recipes-graphics/wayland/weston_7.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_7.0.0.bb
@@ -64,7 +64,7 @@ PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-color
 # Clients support
 PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
 # Virtual remote output with GStreamer on DRM backend
-PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer-1.0"
+PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0"
 # Weston with PAM support
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
 
-- 
2.7.4


