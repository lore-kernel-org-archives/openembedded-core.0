Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TJLoo-0003o1-FF
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 12:04:42 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4F240D22BA;
	Wed,  3 Oct 2012 11:51:46 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 11:51:30 +0200
Message-Id: <1349257892-32178-4-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 3/5] insane.bbclass: add AArch64 support
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
X-List-Received-Date: Wed, 03 Oct 2012 10:04:42 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/classes/insane.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4f87c93..5e9cba1 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -44,6 +44,7 @@ def package_qa_get_machine_dict():
                         "arm" :       (40,     0,    0,          True,          32),
                       },
             "linux" : { 
+                        "aarch64" :   (183,    0,    0,          True,          64),
                         "arm" :       (40,    97,    0,          True,          32),
                         "armeb":      (40,    97,    0,          False,         32),
                         "powerpc":    (20,     0,    0,          False,         32),
-- 
1.7.10.4



