Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SDUZF-0003Y9-9s
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 07:40:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2U5V46d016432
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:31:05 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 29 Mar 2012 22:31:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2012 13:29:54 +0800
Message-ID: <ac05d9a1b72099761bbc1a8312cd0d4ad8600b4a.1333085308.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1333085308.git.liezhi.yang@windriver.com>
References: <cover.1333085308.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qt4-x11-free: enable -accessibility and -sm
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
X-List-Received-Date: Fri, 30 Mar 2012 05:40:09 -0000
Content-Type: text/plain

Is it possible to enable the "-sm -accessibility" in oe-core, please?
There is a meta-kde layer which requires the "-sm -accessibility", but
they are disabled in meta/recipes-qt/qt4/qt4.inc:

QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"

I checked the log of the qt4, can't find the related log for
"-no-accessibility -no-sm".

Another way is use the bbappend, but it would be great if it can be
enabled in oe-core.

This only enables for qt4-x11, doesn't enable for qt4-embedded, and
have done testing on: qemux86, qemuarm, qemumips, qemuppc.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 072c522..a59198d 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -13,6 +13,9 @@ QT_GLFLAGS_qemuppc = "-opengl"
 QT_CONFIG_FLAGS += "-no-xinerama -no-xkb"
 QT_BASE_LIB  ?= "libqt"
 
+# required by kdelibs4
+QT_DISTRO_FLAGS = "-accessibility -sm"
+
 inherit qt4x11
 
 do_install_append() {
-- 
1.7.1



