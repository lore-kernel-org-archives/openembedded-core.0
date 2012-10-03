Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TJLon-0003nn-Tk
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 12:04:41 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BCC47D22B7;
	Wed,  3 Oct 2012 11:51:45 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 11:51:29 +0200
Message-Id: <1349257892-32178-3-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 2/5] kernel-arch.bblass: add AArch64 support
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
 meta/classes/kernel-arch.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 6446504..b3b78b6 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -8,7 +8,7 @@ valid_archs = "alpha cris ia64 \
                i386 x86 \
                m68knommu m68k ppc powerpc powerpc64 ppc64  \
                sparc sparc64 \
-               arm \
+               arm aarch64 \
                m32r mips \
                sh sh64 um h8300   \
                parisc s390  v850 \
@@ -22,6 +22,7 @@ def map_kernel_arch(a, d):
 
     if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
     elif re.match('armeb$', a):                 return 'arm'
+    elif re.match('aarch64$', a):               return 'arm64'
     elif re.match('mips(el|64|64el)$', a):      return 'mips'
     elif re.match('p(pc|owerpc)(|64)', a):      return 'powerpc'
     elif re.match('sh(3|4)$', a):               return 'sh'
-- 
1.7.10.4



