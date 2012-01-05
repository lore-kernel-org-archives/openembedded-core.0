Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liming.wang@windriver.com>) id 1RimAJ-0003kd-TT
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 13:11:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q058cCEt019040
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jan 2012 00:38:12 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 5 Jan 2012 00:38:12 -0800
From: Liming Wang <liming.wang@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <sgw@linux.intel.com>
Date: Thu, 5 Jan 2012 16:37:45 +0800
Message-ID: <1325752666-28560-4-git-send-email-liming.wang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
References: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] qemuppc: add machconfig
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
X-List-Received-Date: Thu, 05 Jan 2012 12:11:28 -0000
Content-Type: text/plain

Signed-off-by: Liming Wang <liming.wang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../formfactor/files/qemuppc/machconfig            |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100755 meta/recipes-bsp/formfactor/files/qemuppc/machconfig

diff --git a/meta/recipes-bsp/formfactor/files/qemuppc/machconfig b/meta/recipes-bsp/formfactor/files/qemuppc/machconfig
new file mode 100755
index 0000000..5ea2270
--- /dev/null
+++ b/meta/recipes-bsp/formfactor/files/qemuppc/machconfig
@@ -0,0 +1,10 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+ 
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=800
+DISPLAY_HEIGHT_PIXELS=600
+DISPLAY_BPP=16
+DISPLAY_DPI=150
+DISPLAY_SUBPIXEL_ORDER=vrgb
-- 
1.7.5.4



