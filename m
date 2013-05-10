Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UahMu-0004nq-Tl
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 09:04:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4A6jkb1000837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2013 23:45:47 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 9 May 2013 23:45:46 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 May 2013 14:47:39 +0800
Message-ID: <dca4bfa41af99d5e4bb2711c936e3300556d6fdb.1368168238.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1368168238.git.kai.kang@windriver.com>
References: <cover.1368168238.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 1/1] bitbake.conf: update way to set default ROOT_HOME
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
X-List-Received-Date: Fri, 10 May 2013 07:04:28 -0000
X-List-Received-Date: Fri, 10 May 2013 07:04:28 -0000
Content-Type: text/plain

Use "??=" to set default ROOT_HOME. It can be overwrote by developer
with "?=" in any layer and at same time it also can be overwrote in
local.conf.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8d4ccce..86a4831 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -75,7 +75,7 @@ USRBINPATH_class-native = "/usr/bin"
 USRBINPATH_class-nativesdk = "/usr/bin"
 
 # Root home directory
-ROOT_HOME ?= "/home/root"
+ROOT_HOME ??= "/home/root"
 
 ##################################################################
 # Architecture-dependent build variables.
-- 
1.7.5.4



