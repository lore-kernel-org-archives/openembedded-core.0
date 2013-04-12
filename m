Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UQXfS-00057m-B7
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 08:41:04 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3C6NcLx000046
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 23:23:38 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.147) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Apr 2013 23:23:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Apr 2013 14:23:30 +0800
Message-ID: <1e5101b393677a48b7bb07e064e24894218977ce.1365732443.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365732443.git.hongxu.jia@windriver.com>
References: <cover.1365732443.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] connman.inc: Add xuser to disk group
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
X-List-Received-Date: Fri, 12 Apr 2013 06:41:05 -0000
Content-Type: text/plain

1, Add xuser to disk group, so it could have permissions to access disk storage.

2, When fix [YOCTO #4164] xserver-nodm-init: Add xuser to input group, it
missed to sync with this file.

[YOCTO #4004]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 5d35bc2..1af93b1 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -53,7 +53,7 @@ SYSTEMD_WIRED_SETUP = "ExecStartPre=-/usr/lib/connman/wired-setup"
 # USERADD_PARAM is in sync with the one in xserver-nodm-init.bb
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--create-home \
-                       --groups video,tty,audio \
+                       --groups video,tty,audio,input,disk \
                        --user-group xuser"
 
 inherit autotools gtk-doc pkgconfig systemd update-rc.d useradd
-- 
1.7.10.4



