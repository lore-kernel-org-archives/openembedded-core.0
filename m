Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TlGLP-0001UG-IA
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 10:53:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBJ9d1vP000706
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 01:39:01 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 19 Dec 2012 01:38:58 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 17:39:36 +0800
Message-ID: <21be2b547be10e5a1405b1b1f0a561df6b80a09e.1355902677.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1355902677.git.kai.kang@windriver.com>
References: <cover.1355902677.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/4] bitbake.conf: import var ROOT_HOME
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
X-List-Received-Date: Wed, 19 Dec 2012 09:54:14 -0000
Content-Type: text/plain

Import var ROOT_HOME to configure root home directory dynamically.

[Yocto 2683]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/conf/bitbake.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index be3bfc2..983b3c0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -73,6 +73,9 @@ USRBINPATH = "${bindir}"
 USRBINPATH_class-native = "/usr/bin"
 USRBINPATH_class-nativesdk = "/usr/bin"
 
+# Root home directory
+ROOT_HOME ?= "/home/root"
+
 ##################################################################
 # Architecture-dependent build variables.
 ##################################################################
-- 
1.7.5.4



