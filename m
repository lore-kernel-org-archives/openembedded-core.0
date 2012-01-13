Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RlbWS-00084W-OF
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 08:26:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0D7ISfl001295
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 23:18:28 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 12 Jan 2012 23:18:27 -0800
Message-ID: <cebe2eb828c876886b3739ba04bcca275c0dd255.1326437644.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1326437644.git.xiaofeng.yan@windriver.com>
References: <cover.1326437644.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 12 Jan 2012 15:23:12 +0800
Date: Fri, 13 Jan 2012 15:06:30 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] gtk.inc: Change configuration of directfb to gtk-directfb
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
X-List-Received-Date: Fri, 13 Jan 2012 07:26:01 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

"direcdtfb" is a wrong configuration in PACKAGECONFIG. It should be "gtk-directfb".
PACKAGECONFIG can't select directfb as backend rightly, or else.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 5eb7eb1..4e03670 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -15,7 +15,7 @@ DEPENDS = "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbo
  libgcrypt cairo gdk-pixbuf"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
- ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+ ${@base_contains('DISTRO_FEATURES', 'gtk-directfb', 'gtk-directfb', '', d)}"
 
 # for gtk+ 2.x, have to pick either x11 or directfb not both
 # for gtk+ 3.x, PACKAGECONFIG[gtk-directfb] should be removed because directfb will not be support as
-- 
1.7.7



