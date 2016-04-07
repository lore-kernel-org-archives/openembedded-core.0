Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7E807680A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 07:50:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u377ofS4019603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 00:50:41 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 00:50:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Apr 2016 00:50:39 -0700
Message-ID: <0186a488dc4ff5d3daf5ef0d1fd54bb0e79763a7.1460015043.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1460015043.git.liezhi.yang@windriver.com>
References: <cover.1460015043.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] fs-perms.txt: fix ROOT_HOME's permission
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
X-List-Received-Date: Thu, 07 Apr 2016 07:50:41 -0000
Content-Type: text/plain

It should be 0700 rather than 0755.

Reported-by: Charles Chan <charles.wh.chan@gmail.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/files/fs-perms.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index 109cbe5..1d74da7 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -51,6 +51,7 @@ ${localstatedir}/lock	link	/run/lock
 ${localstatedir}/tmp	link	volatile/tmp
 
 /home				0755	root	root	false - - -
+${ROOT_HOME}			0700	root	root	false - - -
 /srv				0755	root	root	false - - -
 ${prefix}/src			0755	root	root	false - - -
 ${localstatedir}/local		0755	root	root	false - - -
-- 
2.8.0


