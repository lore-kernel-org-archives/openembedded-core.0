Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1THUkA-0002Fu-P9
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 09:12:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8S6xKlx022292
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 23:59:21 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Thu, 27 Sep 2012 23:59:20 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Sep 2012 14:59:29 +0800
Message-ID: <ee4845cd7af5e6bed22e91862efebfd7adf27e93.1348815461.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1348815461.git.kai.kang@windriver.com>
References: <cover.1348815461.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.159]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] ltp: add dependency libcap
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
X-List-Received-Date: Fri, 28 Sep 2012 07:12:15 -0000
Content-Type: text/plain

Similar to libaio, libcap is another dependency of ltp.

If libcap has been done populate_sysroot but rpm/ipk package is not
created, ltp will be compiled with libcap. So when install ltp to a
image, it complains that package libcap is not found.

[Yocto #2973]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20120903.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20120903.bb b/meta/recipes-extended/ltp/ltp_20120903.bb
index 85270ea..e3e760d 100644
--- a/meta/recipes-extended/ltp/ltp_20120903.bb
+++ b/meta/recipes-extended/ltp/ltp_20120903.bb
@@ -19,9 +19,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		"
 
-DEPENDS = "attr libaio"
+DEPENDS = "attr libaio libcap"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
 
-- 
1.7.5.4



