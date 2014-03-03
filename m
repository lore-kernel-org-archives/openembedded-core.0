Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 14C6D6F58A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 08:27:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s238RnZP014248
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Mar 2014 00:27:49 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 3 Mar 2014 00:27:49 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 16:27:31 +0800
Message-ID: <d0f06e314ad657d540152ddeeef16427427df9ef.1393835059.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393835059.git.hongxu.jia@windriver.com>
References: <cover.1393835059.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/3] ppp: drop enable-ipv6.patch
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
X-List-Received-Date: Mon, 03 Mar 2014 08:27:50 -0000
Content-Type: text/plain

IPV6 has been enabled by default in 2.4.6

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/ppp/ppp-2.4.5/enable-ipv6.patch | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/enable-ipv6.patch

diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/enable-ipv6.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/enable-ipv6.patch
deleted file mode 100644
index e5fc3f4..0000000
--- a/meta/recipes-connectivity/ppp/ppp-2.4.5/enable-ipv6.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-The patch comes from OpenEmbedded
-
-Upstream-Status: Inappropriate [enable feature]
-
---- ppp-2.4.3/pppd/Makefile.linux.orig	2005-10-28 21:07:40.396359250 +0100
-+++ ppp-2.4.3/pppd/Makefile.linux	2005-10-28 21:07:54.217223000 +0100
-@@ -62,7 +62,7 @@
- 
- HAS_SHADOW=y
- #USE_PAM=y
--#HAVE_INET6=y
-+HAVE_INET6=y
- 
- # Enable plugins
- PLUGIN=y
-- 
1.8.1.2


