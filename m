Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD0078745
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:25:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0HFPmlA021654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 17 Jan 2018 15:25:50 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ebpb2-0004kn-Ut; Wed, 17 Jan 2018 15:25:48 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 15:25:42 +0000
Message-Id: <1516202745-18231-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/4] nasm: upgrade 2.13.01 -> 2.13.02
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
X-List-Received-Date: Wed, 17 Jan 2018 15:25:50 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/nasm/{nasm_2.13.01.bb => nasm_2.13.02.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.13.01.bb => nasm_2.13.02.bb} (80%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.13.01.bb b/meta/recipes-devtools/nasm/nasm_2.13.02.bb
similarity index 80%
rename from meta/recipes-devtools/nasm/nasm_2.13.01.bb
rename to meta/recipes-devtools/nasm/nasm_2.13.02.bb
index bf18cd6..15672ab 100644
--- a/meta/recipes-devtools/nasm/nasm_2.13.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.13.02.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
 
-SRC_URI[md5sum] = "1f7d4662040d24351df7d6719ed4f97a"
-SRC_URI[sha256sum] = "08f97baf0a7f892128c6413cfa93b69dc5825fbbd06c70928aea028835d198fa"
+SRC_URI[md5sum] = "f301c7ce89f28af9319edaf917365f61"
+SRC_URI[sha256sum] = "8d3028d286be7c185ba6ae4c8a692fc5438c129b2a3ffad60cbdcedd2793bbbe"
 
 inherit autotools-brokensep
 
-- 
2.7.4


