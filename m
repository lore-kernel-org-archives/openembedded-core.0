Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4D2B7F2E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 07:38:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U7cGg7015639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 00:38:16 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 30 Aug 2019 00:38:15 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Aug 2019 15:37:49 +0800
Message-ID: <1567150670-252374-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567150670-252374-1-git-send-email-changqing.li@windriver.com>
References: <1567150670-252374-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] man-db: support usrmerge
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
X-List-Received-Date: Fri, 30 Aug 2019 07:38:15 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/man-db/man-db_2.8.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.6.1.bb b/meta/recipes-extended/man-db/man-db_2.8.6.1.bb
index ec9eb83..a7b7fef 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.6.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.6.1.bb
@@ -18,7 +18,7 @@ USE_NLS_libc-musl = "no"
 
 inherit gettext pkgconfig autotools systemd
 
-EXTRA_OECONF = "--with-pager=less"
+EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_unitdir}/system"
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
 do_install() {
-- 
2.7.4


