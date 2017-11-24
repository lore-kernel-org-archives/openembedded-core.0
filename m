Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9B47578543
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 04:56:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAO4uWpN018290
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 20:56:33 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 23 Nov 2017 20:56:32 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Nov 2017 12:57:24 +0800
Message-ID: <c8d6d68334a2f9bc1037eea10466744def202e14.1511499380.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1511499380.git.Qi.Chen@windriver.com>
References: <cover.1511499380.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] templates/layer.conf: remove backslash to enable bbappend setting
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
X-List-Received-Date: Fri, 24 Nov 2017 04:56:31 -0000
Content-Type: text/plain

Remove the redundant backslash in template layer.conf file, otherwise,
the bbappend line setting wouldn't have effect, causing bbappend files
in these created layers not having any effect.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/bblayers/templates/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/templates/layer.conf b/meta/lib/bblayers/templates/layer.conf
index e0d9ba2..3c03002 100644
--- a/meta/lib/bblayers/templates/layer.conf
+++ b/meta/lib/bblayers/templates/layer.conf
@@ -2,7 +2,7 @@
 BBPATH .= ":${LAYERDIR}"
 
 # We have recipes-* directories, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \\
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
             ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "%s"
-- 
1.9.1


