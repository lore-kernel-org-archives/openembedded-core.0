Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E758078726
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:25:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0HFPmjZ021655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 17 Jan 2018 15:25:50 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ebpb2-0004kq-VP; Wed, 17 Jan 2018 15:25:48 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 15:25:43 +0000
Message-Id: <1516202745-18231-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516202745-18231-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1516202745-18231-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/4] lttng-ust: upgrade 2.9.1 -> 2.10.1
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
 meta/recipes-kernel/lttng/{lttng-ust_2.9.1.bb => lttng-ust_2.10.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.9.1.bb => lttng-ust_2.10.1.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
index 03da4ca..d79a479 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
@@ -23,8 +23,8 @@ PE = "2"
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://lttng-ust-doc-examples-disable.patch \
           "
-SRC_URI[md5sum] = "5a5636fc3d9aa370f65b25a802a79e6e"
-SRC_URI[sha256sum] = "b891d267cdbbbd11cf34751f66c21c4a7fdc0eec3c1b53be2c40dca073b7daa4"
+SRC_URI[md5sum] = "4863cc2f9f0a070b42438bb646bbba06"
+SRC_URI[sha256sum] = "07cc3c0b71e7b77f1913d5b7f340a78a9af414440e4662712aef2d635b88ee9d"
 
 CVE_PRODUCT = "ust"
 
-- 
2.7.4


