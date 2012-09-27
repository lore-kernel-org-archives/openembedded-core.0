Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1THECm-0001cw-2v
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 15:32:40 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7E9F6D22DD;
	Thu, 27 Sep 2012 15:19:50 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 15:19:38 +0200
Message-Id: <1348751980-23989-2-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1348751980-23989-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1348751980-23989-1-git-send-email-marcin.juszkiewicz@linaro.org>
Cc: linaro-dev@lists.linaro.org, patches@linaro.org
Subject: [PATCH 1/3] siteinfo.bbclass: add AArch64 support
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
X-List-Received-Date: Thu, 27 Sep 2012 13:32:40 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/classes/siteinfo.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 8c256ce..aab0867 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -18,6 +18,7 @@
 def siteinfo_data(d):
     archinfo = {
         "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
+        "aarch64": "endian-little bit-64 arm-common",
         "arm": "endian-little bit-32 arm-common",
         "armeb": "endian-big bit-32 arm-common",
         "avr32": "endian-big bit-32 avr32-common",
@@ -60,6 +61,7 @@ def siteinfo_data(d):
         "mingw32": "common-mingw",
     }
     targetinfo = {
+        "aarch64-linux-gnu": "aarch64-linux",
         "arm-linux-gnueabi": "arm-linux",
         "arm-linux-uclibceabi": "arm-linux-uclibc",
         "armeb-linux-gnueabi": "armeb-linux",
-- 
1.7.10.4



