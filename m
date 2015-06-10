Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 257757404A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 07:32:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5A7WUJF024020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 00:32:30 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 10 Jun 2015 00:32:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2015 00:32:28 -0700
Message-ID: <faec38d4562418f8903b54a3ecab27654823cf80.1433921514.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433921514.git.liezhi.yang@windriver.com>
References: <cover.1433921514.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] update-rc.d.bbclass: add MLPREFIX when set RRECOMMENDS
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
X-List-Received-Date: Wed, 10 Jun 2015 07:32:31 -0000
Content-Type: text/plain

Fixed when build with multilib:
WARNING: Multilib QA Issue: lib32-alsa-state package lib32-alsa-state - suspicious values 'update-rc.d' in RRECOMMENDS
WARNING: Multilib QA Issue: lib32-modutils-initscripts package lib32-modutils-initscripts - suspicious values 'update-rc.d' in RRECOMMENDS
WARNING: Multilib QA Issue: lib32-init-ifupdown package lib32-init-ifupdown - suspicious values 'update-rc.d' in RRECOMMENDS
WARNING: Multilib QA Issue: lib32-xserver-nodm-init package lib32-xserver-nodm-init - suspicious values 'update-rc.d' in RRECOMMENDS
WARNING: Multilib QA Issue: lib32-sysklogd package lib32-sysklogd - suspicious values 'update-rc.d' in RRECOMMENDS

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/update-rc.d.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index c385635..4d62c2f 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -118,7 +118,7 @@ python populate_packages_updatercd () {
         postrm += localdata.getVar('updatercd_postrm', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 
-        d.appendVar('RRECOMMENDS_' + pkg, " ${UPDATERCD}")
+        d.appendVar('RRECOMMENDS_' + pkg, " ${MLPREFIX}${UPDATERCD}")
 
     # Check that this class isn't being inhibited (generally, by
     # systemd.bbclass) before doing any work.
-- 
1.7.9.5


