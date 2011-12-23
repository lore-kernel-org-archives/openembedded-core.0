Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RdtWf-0008EV-Id
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 02:02:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBN0tEJK004383
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 16:55:14 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 22 Dec 2011 16:55:13 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 19:01:41 -0600
Message-ID: <f1d70541e79f94a472450088f2663a69d22a310e.1324601996.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1324601996.git.mark.hatle@windriver.com>
References: <cover.1324601996.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 7/7] base.bbclass: Allow buildstats to be optionally supplied
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
X-List-Received-Date: Fri, 23 Dec 2011 01:02:22 -0000
Content-Type: text/plain

Buildstats should be allowed to be optionally enabled.  It's
recommended that it be enabled via the USER_CLASSES setting.

Alternatively it could be enabled via the INHERIT_DISTRO or
similar mechanism.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/base.bbclass   |    1 -
 meta/conf/local.conf.sample |    3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index fbcaefb..e65a722 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -7,7 +7,6 @@ inherit mirrors
 inherit utils
 inherit utility-tasks
 inherit metadata_scm
-inherit buildstats
 inherit logging
 
 OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup"
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 73ab9f8..7d52d0e 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -134,12 +134,13 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # The following is a list of additional classes to use when building images which
 # enable extra features. Some available options which can be included in this variable 
 # are:
+#   - 'buildstats' collect build statistics
 #   - 'image-mklibs' to reduce shared library files size for an image
 #   - 'image-prelink' in order to prelink the filesystem image
 #   - 'image-swab' to perform host system intrusion detection
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "image-mklibs image-prelink"
+USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 
 #
 # Runtime testing of images
-- 
1.7.3.4



