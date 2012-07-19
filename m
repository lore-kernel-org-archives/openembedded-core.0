Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1Sruz2-00040T-19
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 19:57:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6JHkTfI002460
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 10:46:29 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 19 Jul 2012 10:46:29 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2012 13:46:14 -0400
Message-ID: <1342719981-1324-10-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1342719981-1324-1-git-send-email-morgan.little@windriver.com>
References: <1342719981-1324-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 09/16] gnome-doc-utils: Update for python-native changes
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
X-List-Received-Date: Thu, 19 Jul 2012 17:57:59 -0000
Content-Type: text/plain

Add pythonnative to the inherits list
---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index 08333db..3c9a50d 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -2,7 +2,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "libxml2 libxslt libxslt-native gnome-doc-utils-native glib-2.0"
 DEPENDS_virtclass-native = "libxml2-native libxslt-native intltool-native glib-2.0-native"
 
-inherit gnome gettext python-dir
+inherit gnome gettext python-dir pythonnative
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
-- 
1.7.0.4



