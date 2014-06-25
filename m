Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7054C65E83
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:16:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5P9GL7k027387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 02:16:21 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 25 Jun 2014 02:16:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jun 2014 02:16:20 -0700
Message-ID: <91c4c2c00702bcf6807ae079e58b6d77aec80443.1403687736.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1403687736.git.liezhi.yang@windriver.com>
References: <cover.1403687736.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] createrepo: RDEPENDS on libxml2-python
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
X-List-Received-Date: Wed, 25 Jun 2014 09:16:31 -0000
Content-Type: text/plain

Fixed the error when run createrepo on target:
  Traceback (most recent call last):
    File "/usr/share/createrepo/genpkgmetadata.py", line 27, in <module>
      import libxml2
    File "/usr/lib64/python2.7/site-packages/libxml2.py", line 1, in <module>
  ImportError: No module named libxml2mod

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../createrepo/createrepo_0.4.11.bb                |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index 159a6c4..49b45fc 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -5,6 +5,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
 DEPENDS_class-native += "libxml2-native rpm-native"
+RDEPENDS_${PN}_class-target = "libxml2-python"
 
 PR = "r9"
 
-- 
1.7.9.5


