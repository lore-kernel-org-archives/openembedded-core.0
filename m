Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00AF377C17
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 10:35:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v86AZ1kc024422
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Sep 2017 03:35:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 6 Sep 2017 03:35:01 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Sep 2017 18:22:46 +0800
Message-ID: <247577769b1cd9935fb6a19cd26e632799cfa684.1504693247.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1504693247.git.kai.kang@windriver.com>
References: <cover.1504693247.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bootchart2: update python interpreter
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
X-List-Received-Date: Wed, 06 Sep 2017 10:35:01 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

For bootchart2-native, the python interpreter "#!FIXMESTAGINGDIRHOST/usr/bin/python3"
of file pybootchartgui is not right.

Use '#!${USRBINPATH}/env python3' instead to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index 4f01734bb0..a3101351ee 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -134,7 +134,7 @@ do_install () {
     echo 'EXIT_PROC="$EXIT_PROC matchbox-window-manager"' >> ${D}${sysconfdir}/bootchartd.conf
 
    # Use python 3 instead of python 2
-   sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${bindir}/pybootchartgui
+   sed -i -e '1s,#!.*python.*,#!${USRBINPATH}/env python3,' ${D}${bindir}/pybootchartgui
 }
 
 PACKAGES =+ "pybootchartgui"
-- 
2.14.1


