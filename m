Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMPBT-0004Hn-Fd
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 20:39:55 +0200
Received: by wwb17 with SMTP id 17so765156wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 11:37:01 -0700 (PDT)
Received: by 10.227.5.210 with SMTP id 18mr985026wbw.18.1305657421719;
	Tue, 17 May 2011 11:37:01 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h11sm505440wbc.9.2011.05.17.11.37.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 11:37:00 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2011 20:36:54 +0200
Message-Id: <1305657414-20099-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] update-rc.d: fix after repo move
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
X-List-Received-Date: Tue, 17 May 2011 18:39:55 -0000

The git repo layout is different from the cvs repo layout

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
index 403056a..6a43d80 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=148a48321b10eb
 PR = "r3"
 
 SRC_URI = "git://github.com/philb/update-rc.d.git;tag=update-rc.d_${PV};protocol=git \
-           file://add-verbose.patch;apply=yes"
+           file://add-verbose.patch;striplevel=1"
 
-S = "${WORKDIR}/update-rc.d"
+S = "${WORKDIR}/git"
 
 
 do_compile() {
-- 
1.6.6.1



