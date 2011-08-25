Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QwSo8-0003uC-Jz
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 07:48:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7P5i4Db012400
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Aug 2011 22:44:04 -0700 (PDT)
Received: from localhost (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 24 Aug 2011 22:44:04 -0700
Message-ID: <33d3d235278ec30be9a61ff1f3c5bb80af7e5a76.1314242316.git.kai.kang@windriver.com>
In-Reply-To: <cover.1314242316.git.kai.kang@windriver.com>
References: <cover.1314242316.git.kai.kang@windriver.com>
Old-Date: Thu, 25 Aug 2011 10:25:55 +0800
Date: Thu, 25 Aug 2011 13:44:01 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.196]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] bitbake.conf: set includedir_nativesdk
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
X-List-Received-Date: Thu, 25 Aug 2011 05:48:53 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Fixes [Yocto #1231]

crosssdk.bbclass uses ${includedir_nativesdk} to define target_includedir,
but includedir_nativesdk is not defined before. This makes gcc-crosssdk
can NOT search the correct standard headers and libraries search path.

Define includedir_nativesdk in bitbake.conf.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7bb68b8..a22f5fa 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -53,6 +53,7 @@ bindir_cross = "/bin"
 bindir_crossscripts = "${bindir}/crossscripts"
 prefix_nativesdk = "/usr"
 bindir_nativesdk = "${prefix_nativesdk}/bin"
+includedir_nativesdk = "${prefix_nativesdk}/include"
 libdir_nativesdk = "${prefix_nativesdk}/lib"
 base_libdir_nativesdk = "/lib"
 localstatedir_nativesdk = "/var"
-- 
1.7.5.1.300.gc565c



