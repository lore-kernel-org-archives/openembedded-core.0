Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UBLnE-0007YQ-DB
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 09:58:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r218fq1D008525
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2013 00:41:52 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Fri, 1 Mar 2013 00:41:52 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2013 16:42:07 +0800
Message-ID: <b9e02ae503da777c7d930ca1c58e95daa6092d35.1361942825.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1361942825.git.Qi.Chen@windriver.com>
References: <cover.1361942825.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] matchbox-session-sato: do not rdepend on initscripts
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
X-List-Received-Date: Fri, 01 Mar 2013 08:58:31 -0000
X-List-Received-Date: Fri, 01 Mar 2013 08:58:31 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, matchbox-session-sato depended on initscripts, thus resulting
in initscripts package built and installed in case of systemd init manager.

But there is actually no dependency between them. So this patch removes
the dependency.

[YOCTO #3940]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 2d34754..70cf7a9 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -5,12 +5,9 @@ BUGTRACKER = "http://bugzilla.openedhand.com/"
 LICENSE = "GPLv2.0+"
 LIC_FILES_CHKSUM = "file://session;endline=3;md5=f8a5c5b9c279e52dc094d10e11c2be63"
 
-# Distro can override initscripts provider
-VIRTUAL-RUNTIME_initscripts ?= "initscripts"
-
 SECTION = "x11"
-RDEPENDS_${PN} = "formfactor gtk-sato-engine matchbox-theme-sato gtk-theme-sato matchbox-panel-2 matchbox-desktop-sato ${VIRTUAL-RUNTIME_initscripts} matchbox-session"
-PR = "r29"
+RDEPENDS_${PN} = "formfactor gtk-sato-engine matchbox-theme-sato gtk-theme-sato matchbox-panel-2 matchbox-desktop-sato matchbox-session"
+PR = "r30"
 
 # This package is architecture specific because the session script is modified
 # based on the machine architecture.
-- 
1.7.9.5



