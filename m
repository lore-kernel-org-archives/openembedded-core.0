Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C10B6E8B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 10:04:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0OA4FNW019521
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 02:04:16 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 24 Jan 2014 02:04:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jan 2014 18:04:24 +0800
Message-ID: <5c19f5d2d8c024e73be35d71b04c1956e54dead7.1390557768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390557768.git.Qi.Chen@windriver.com>
References: <cover.1390557768.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] image.bbclass: fix paths to run-postinsts
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
X-List-Received-Date: Fri, 24 Jan 2014 10:04:15 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

The run-postinsts script has been moved to ${sbindir}.

[YOCTO #5719]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4c63bc2..5049b3f 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -531,7 +531,7 @@ rootfs_uninstall_unneeded () {
 			# All packages were successfully configured.
 			# update-rc.d, base-passwd, run-postinsts are no further use, remove them now
 			remove_run_postinsts=false
-			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
+			if [ -e ${IMAGE_ROOTFS}${sbindir}/run-postinsts ]; then
 				remove_run_postinsts=true
 			fi
 
@@ -555,7 +555,7 @@ rootfs_uninstall_unneeded () {
 			# Some packages were not successfully configured, save them only
 			# if we have run-postinsts script present. Otherwise, they're
 			# useless
-			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
+			if [ -e ${IMAGE_ROOTFS}${sbindir}/run-postinsts ]; then
 				save_postinsts
 			fi
 		fi
-- 
1.7.9.5


