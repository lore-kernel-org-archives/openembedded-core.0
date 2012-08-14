Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T1DrH-0005HK-4m
	for openembedded-core@linuxtogo.org; Tue, 14 Aug 2012 11:56:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7E9iNtp003083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Aug 2012 02:44:23 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 14 Aug 2012 02:44:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Aug 2012 17:41:01 +0800
Message-ID: <80e537fe3ae9163dbb26659d778c7f5966478937.1344929471.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1344929471.git.liezhi.yang@windriver.com>
References: <cover.1344929471.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@linuxtogo.org, Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/2] apt-native 0.7.14: remove an extra line from apt.conf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2012 09:56:19 -0000
Content-Type: text/plain

There is an additional "};" at the end of apt.conf, remove it.

[YOCTO #2495]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/apt/apt-native_0.7.14.bb |    2 +-
 meta/recipes-devtools/apt/files/apt.conf       |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt-native_0.7.14.bb b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
index 46f39f5..d4513ca 100644
--- a/meta/recipes-devtools/apt/apt-native_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
@@ -1,6 +1,6 @@
 require apt-native.inc
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI += "file://nodoc.patch \
             file://noconfigure.patch \
diff --git a/meta/recipes-devtools/apt/files/apt.conf b/meta/recipes-devtools/apt/files/apt.conf
index ab7a5db..5c20ea4 100644
--- a/meta/recipes-devtools/apt/files/apt.conf
+++ b/meta/recipes-devtools/apt/files/apt.conf
@@ -40,4 +40,3 @@ APT
 };
 
 DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-debsig"};
-};
-- 
1.7.1



