Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TT8M0-0002t4-WB
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:43:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9U9TjE1000313
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 02:29:45 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 30 Oct 2012 02:29:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2012 17:33:52 +0800
Message-ID: <64ad1e6ebfac0523ea6cccd5140bf78c20352e52.1351496696.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1351496696.git.liezhi.yang@windriver.com>
References: <cover.1351496696.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 11/11] recipes-connectivity: replace virtclass-native(sdk) with class-native(sdk)
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
X-List-Received-Date: Tue, 30 Oct 2012 09:43:26 -0000
Content-Type: text/plain

The overrides virtclass-native and virtclass-nativesdk are deprecated,
which should be replaced by class-native and class-nativesdk.

[YOCTO #3297]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 089b9a4..c88b77a 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -23,7 +23,7 @@ CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_END
 
 # Avoid binaries being marked as requiring an executable stack (which causes 
 # issues with SELinux on the host)
-CFLAG_append_virtclass-native = " -Wa,--noexecstack"
+CFLAG_append_class-native = " -Wa,--noexecstack"
 
 # -02 does not work on mipsel: ssh hangs when it tries to read /dev/urandom
 CFLAG_mtx-1 := "${@'${CFLAG}'.replace('-O2', '')}"
-- 
1.7.11.2



