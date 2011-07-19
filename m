Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4R-000258-MF
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:21:55 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so3528794iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7MZeZH+lkNVBgCFCq16M02WfcFOrXX1m/jZs9X4A/qA=;
	b=H+avy03JD7JxdbYbjj3D9ll1Nem6zhrF2XCyTH2npan3EgplB7sYC6SGffQSHQZ8ns
	TGRjr2mQD6DCyE8X3Oi7zpanvBIz0sZTmx0Crr5QEdOs4CnWJwwHkqp4ijg0B0++8jt8
	AbOVllBJX2C/u8RrrWwJJZiFldXP2wvBPaJ3k=
Received: by 10.231.11.77 with SMTP id s13mr829696ibs.137.1311034673180;
	Mon, 18 Jul 2011 17:17:53 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.17.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:17:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:27 -0700
Message-Id: <bebfbfd3218d4df28d0d2c81e05fd6c3e271bcd9.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 08/16] task-core-x11-sato: Add empty NETWORK_MANAGER for uclibc
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
X-List-Received-Date: Tue, 19 Jul 2011 00:21:57 -0000

conman needs some features from libresolv e.g. ns_initparse
which are missing in uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/tasks/task-core-x11-sato.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/tasks/task-core-x11-sato.bb b/meta/recipes-sato/tasks/task-core-x11-sato.bb
index 43b24d2..cd71077 100644
--- a/meta/recipes-sato/tasks/task-core-x11-sato.bb
+++ b/meta/recipes-sato/tasks/task-core-x11-sato.bb
@@ -19,6 +19,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 ALLOW_EMPTY = "1"
 
 NETWORK_MANAGER ?= "connman-gnome"
+NETWORK_MANAGER_libc-uclibc = ""
+
 RDEPENDS_task-core-x11-sato = "\
     matchbox-desktop \
     matchbox-session-sato \
-- 
1.7.4.1



