Return-Path: <Lu.Jiang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2598E7CEC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 09:42:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2K9fnIn017919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Mar 2019 02:42:09 -0700
Received: from ljiang0-OptiPlex-9020.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 20 Mar 2019 02:42:03 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 20 Mar 2019 17:39:27 +0800
Message-ID: <20190320093929.28688-3-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190320093929.28688-1-lu.jiang@windriver.com>
References: <20190320093929.28688-1-lu.jiang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] libsoup:enable libsoup build as native package
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
X-List-Received-Date: Wed, 20 Mar 2019 09:42:29 -0000
Content-Type: text/plain

Enable libsoup build as a native package, for it may invoked by
other native package, such as ostree.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
index a123818cf3..c2284c0458 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
@@ -50,3 +50,5 @@ DEBIAN_NOAUTONAME_${PN} = "1"
 
 # glib-networking is needed for SSL, proxies, etc.
 DEPENDS += "glib-networking"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


