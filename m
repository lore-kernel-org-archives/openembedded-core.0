Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 40EF478546
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 18:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=bUvZh4Xfw3RmMK/k2thRxV+bJqgz/XnkGnZ2hCC+Tsw=; 
	b=IQXApXne/wSrraNuCU5cbBApXwZzIZtl9Sga/azDTzPjvwuh8un40MEDV9vfmqv4WQkcWli2vyzH7AMnUIq1EL/4YRiHkfYy/Wxfy2JicT2C6AiIPePeNgkVVTf18dD93ZN31BWFCPf2NigzZ1NfPWydLvsp9kYZfZwiGyNVeUt6syN7tM9dekABImPkJIaXNxTOQpLahBBFK5ZJSenLYbTYB7ubFJDiKfQ7z/UF7O//seo4l61v8s2//v/ZFWpZEEgh4cfd4KQEx8IyitsL7Iu6vaqsv0STUaotx3nKUzWhnFNJ3yuwNKAVJ9dXcqFdBifL3GOrSP5gvN48WxKKoQ==;
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1diPUf-0004lz-GZ for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 20:26:09 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 20:26:03 +0200
Message-Id: <20170817182603.20588-1-clopez@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] webkitgtk: Add a recommends on shared-mime-info.
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
X-List-Received-Date: Thu, 17 Aug 2017 18:26:09 -0000

 * without this package installed any WebKitGTK+ based browser
   will fail to correctly open html files (and other files)
   from disk (file:// URIs). It will open them as plain txt files.

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.16.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
index 387965970e..df355d29ba 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
@@ -98,7 +98,7 @@ SECURITY_CFLAGS_append_aarch64 = " -fPIE"
 
 FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
 
-RRECOMMENDS_${PN} += "ca-certificates"
+RRECOMMENDS_${PN} += "ca-certificates shared-mime-info"
 
 # http://errors.yoctoproject.org/Errors/Details/20370/
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.11.0


