Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UKOQB-0004yc-TC
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 08:35:53 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2Q7IpjU006231
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 00:18:51 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 26 Mar 2013 00:18:51 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Mar 2013 15:18:49 +0800
Message-ID: <6eeac889db624cc56bbf8c569e686e717f0ae9e6.1364281933.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1364281933.git.Qi.Chen@windriver.com>
References: <cover.1364281933.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] xserver-nodm: change start runlevel from 2 5 to 2 3 4 5
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
X-List-Received-Date: Tue, 26 Mar 2013 07:36:02 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This script is intended to start at runlevel 2 3 4 5, as specified
in its HEAD INFO area.

The fact that it was not started at runlevel 3 caused splash screen
not going away when booting into runlevel 3.

[YOCTO #3904]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../x11-common/xserver-nodm-init.bb                |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index eab76c5..9faeb99 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -26,7 +26,7 @@ do_install() {
 inherit update-rc.d useradd
 
 INITSCRIPT_NAME = "xserver-nodm"
-INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
+INITSCRIPT_PARAMS = "start 9 2 3 4 5 . stop 20 0 1 6 ."
 
 # Use fixed Xusername of xuser for now, this will need to be
 # fixed if the Xusername changes from xuser
-- 
1.7.9.5



