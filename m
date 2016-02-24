Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C68607731B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 09:24:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1O9O1ag032566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 01:24:01 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 24 Feb 2016 01:24:01 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Feb 2016 01:23:59 -0800
Message-ID: <ab4466085aaa486a832e18626be7fda1939e949e.1456304688.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1456304688.git.liezhi.yang@windriver.com>
References: <cover.1456304688.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] sanity.bbclass: remove conflict checking for image vm and live
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
X-List-Received-Date: Wed, 24 Feb 2016 09:24:01 -0000
Content-Type: text/plain

[YOCTO #9161]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass |   12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 466eb49..edf49da 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -843,18 +843,6 @@ def check_sanity_everybuild(status, d):
         with open(checkfile, "w") as f:
             f.write(tmpdir)
 
-    # Check vmdk and live can't be built together.
-    if 'vmdk' in d.getVar('IMAGE_FSTYPES', True) and 'live' in d.getVar('IMAGE_FSTYPES', True):
-        status.addresult("Error, IMAGE_FSTYPES vmdk and live can't be built together\n")
-
-    # Check vdi and live can't be built together.
-    if 'vdi' in d.getVar('IMAGE_FSTYPES', True) and 'live' in d.getVar('IMAGE_FSTYPES', True):
-        status.addresult("Error, IMAGE_FSTYPES vdi and live can't be built together\n")
-
-    # Check qcow2 and live can't be built together.
-    if 'qcow2' in d.getVar('IMAGE_FSTYPES', True) and 'live' in d.getVar('IMAGE_FSTYPES', True):
-        status.addresult("Error, IMAGE_FSTYPES qcow2 and live can't be built together\n")
-
     # Check /bin/sh links to dash or bash
     real_sh = os.path.realpath('/bin/sh')
     if not real_sh.endswith('/dash') and not real_sh.endswith('/bash'):
-- 
1.7.9.5


