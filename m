Return-Path: <ftoth@telfort.nl>
Received: from radex-web.radex.nl (smtp.radex.nl [178.250.146.7])
	by mail.openembedded.org (Postfix) with ESMTP id A8A367BDFE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 12:56:15 +0000 (UTC)
Received: from [192.168.1.22] (cust-178-250-146-69.breedbanddelft.nl
	[178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id 1A37F240AB;
	Mon,  7 Jan 2019 13:56:16 +0100 (CET)
From: Ferry Toth <ftoth@telfort.nl>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <ecb15e5d-ec71-d425-e188-9c3b6fd6cd11@telfort.nl>
Date: Mon, 7 Jan 2019 13:56:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
Subject: [PATCH] libgpiod_1.2: add a dependency on python when building python bindings
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
X-List-Received-Date: Mon, 07 Jan 2019 12:56:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Commit ab54dd75 "libgpiod: Rrecommend python3 only for PN-python 
package" also removes the build dependency

on python3 however this results in fatal error: Python.h: No such file 
or directory #include <Python.h>

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>

---
meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb 
b/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
index dd080ff9d..93165a0c2 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = 
"b6b9079c933f7c8524815437937dda6b795a16141bca202a9eec70ba58
PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
-PACKAGECONFIG[python3] = 
"--enable-bindings-python,--disable-bindings-python,"
+PACKAGECONFIG[python3] = 
"--enable-bindings-python,--disable-bindings-python,python3"
inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 
'python3native', '', d)}
PACKAGES =+ "${PN}-python"

