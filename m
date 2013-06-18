Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B4E226A928
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 07:19:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5I7JKkQ002826
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 00:19:20 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 00:19:18 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 15:19:14 +0800
Message-ID: <b57b85f69322501fb617a01e625734cda1088b5e.1371539741.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371539741.git.rongqing.li@windriver.com>
References: <cover.1371539741.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] base-files: create /usr/lib/locale dir
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
X-List-Received-Date: Tue, 18 Jun 2013 07:19:20 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Lsbtest shows that /usr/lib/locale dir is lost, so create it

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index ac85ed9..fa1cc58 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -36,7 +36,7 @@ dirs2775 = "/home ${prefix}/src ${localstatedir}/local"
 dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
            ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin \
            ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
-           ${libdir} ${sbindir} ${datadir} \
+           ${libdir} /usr/lib/locale ${sbindir} ${datadir} \
            ${datadir}/common-licenses ${datadir}/dict ${infodir} \
            ${mandir} ${datadir}/misc ${localstatedir} \
            ${localstatedir}/backups ${localstatedir}/lib \
-- 
1.7.10.4


