Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TsUvM-0003IY-5K
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 09:53:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r088bWiM018301
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2013 00:37:32 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 8 Jan 2013 00:37:32 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jan 2013 16:37:51 +0800
Message-ID: <15c7836ccd7281e33c48ec548539e270ee9652b4.1357627669.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1357627669.git.Qi.Chen@windriver.com>
References: <cover.1357627669.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] rootfs_rpm.bbclass: export INSTALL_PLATFORM_EXTRA_RPM
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
X-List-Received-Date: Tue, 08 Jan 2013 08:53:45 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Export this variable because package_rpm.bbclass needs it.

[YOCTO #3682]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index f7e4c5e..2bfd1b7 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -74,7 +74,7 @@ fakeroot rootfs_rpm_do_rootfs () {
 			shift
 		done
 	done
-	export INSTALL_PLATFORM_RPM
+	export INSTALL_PLATFORM_EXTRA_RPM
 
 	package_install_internal_rpm
 
-- 
1.7.9.5



