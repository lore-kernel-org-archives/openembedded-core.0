Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC43F774D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 08:28:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u878Sc4L030470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2016 01:28:39 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 01:28:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Sep 2016 01:28:34 -0700
Message-ID: <2fd38e5870ad42ce2a43e835afc013285de8ed7a.1473236857.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1473236857.git.liezhi.yang@windriver.com>
References: <cover.1473236857.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] lighttpd: without-memcache -> without-memcached
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
X-List-Received-Date: Wed, 07 Sep 2016 08:28:40 -0000
Content-Type: text/plain

Fixed:
WARNING: QA Issue: lighttpd: configure was passed unrecognised options: --without-memcache [unknown-configure-option]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
index bba90cf..1a3f323 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
@@ -36,7 +36,7 @@ EXTRA_OECONF = " \
              --without-bzip2 \
              --without-ldap \
              --without-lua \
-             --without-memcache \
+             --without-memcached \
              --with-pcre \
              --without-webdav-props \
              --without-webdav-locks \
-- 
2.9.0


