Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DCDB878725
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:25:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0HFPnaF021656
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 17 Jan 2018 15:25:50 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ebpb2-0004kv-WB; Wed, 17 Jan 2018 15:25:48 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 15:25:44 +0000
Message-Id: <1516202745-18231-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516202745-18231-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1516202745-18231-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/4] lttng-modules: upgrade 2.9.5 -> 2.10.4
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

LICENSE file contains a list of files and addtional files were added to
the list, license was unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-modules_2.9.5.bb => lttng-modules_2.10.4.bb}    | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.9.5.bb => lttng-modules_2.10.4.bb} (82%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.9.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.4.bb
similarity index 82%
rename from meta/recipes-kernel/lttng/lttng-modules_2.9.5.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.10.4.bb
index 61d9744..dd695f8 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.9.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.4.bb
@@ -2,9 +2,10 @@ SECTION = "devel"
 SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 LICENSE = "LGPLv2.1 & GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=362844633a08753bd96ab322a6c7f9f6 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3 \
                     file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
-                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
+                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad \
+                    "
 
 inherit module
 
@@ -15,8 +16,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
 "
 
-SRC_URI[md5sum] = "af97aaaf86133fd783bb9937dc3b4d59"
-SRC_URI[sha256sum] = "3f4e82ceb1c3c1875ec1fe89fba08294ed7feec2161339a5a71a066b27fc3e22"
+SRC_URI[md5sum] = "832452b321a4df6836549e72d05b2ce9"
+SRC_URI[sha256sum] = "f918e3b890f378f47a9ba8710ff52590e9b1d9c63b12a0e64d138e2e2e1b3c8a"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.7.4


