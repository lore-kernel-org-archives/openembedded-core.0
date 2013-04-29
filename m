Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UWqFm-00022c-Cw
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 17:44:36 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3TFQTLU025348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 29 Apr 2013 17:26:30 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UWpyG-0000hh-Kq; Mon, 29 Apr 2013 17:26:28 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2013 17:26:23 +0200
Message-Id: <1367249183-2579-7-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1367249183-2579-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1367249183-2579-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.4
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 7/7] gamin: fix libexecdir packaging
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
X-List-Received-Date: Mon, 29 Apr 2013 15:44:49 -0000
X-List-Received-Date: Mon, 29 Apr 2013 15:44:49 -0000
X-List-Received-Date: Mon, 29 Apr 2013 15:44:49 -0000

${libexecdir}/* wildcard can match everything in ${libdir} which
causes packaging of unwanted files.  Remove this wildcard and specify
libexec binaries manually

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-extended/gamin/gamin_0.1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gamin/gamin_0.1.10.bb b/meta/recipes-extended/gamin/gamin_0.1.10.bb
index 375d265..e7e7842 100644
--- a/meta/recipes-extended/gamin/gamin_0.1.10.bb
+++ b/meta/recipes-extended/gamin/gamin_0.1.10.bb
@@ -24,7 +24,7 @@ inherit autotools pkgconfig
 EXTRA_OECONF = "--without-python"
 
 PACKAGES += "lib${BPN} lib${BPN}-dev"
-FILES_${PN} = "${libexecdir}"
+FILES_${PN} = "${libexecdir}/gam_server"
 FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_lib${BPN} = "${libdir}/lib*.so.*"
 FILES_lib${BPN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/lib*.la \
-- 
1.8.1.4



