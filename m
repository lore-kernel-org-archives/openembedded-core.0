Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 426716FC0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 02:33:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5N2X453014852
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jun 2014 19:33:05 -0700 (PDT)
Received: from pek-kkang-d1.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 22 Jun 2014 19:33:03 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jun 2014 10:32:48 +0800
Message-ID: <a55237b35d54e1c135ac51d273317ae3002a4906.1403490121.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403490121.git.kai.kang@windriver.com>
References: <cover.1403490121.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/5] iptables: update RRECOMMENDS
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
X-List-Received-Date: Mon, 23 Jun 2014 02:33:07 -0000
Content-Type: text/plain

Update RRECOMMENDS for iptables that some iptables basic rules need
these kernel modules.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/iptables/iptables_1.4.21.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb b/meta/recipes-extended/iptables/iptables_1.4.21.bb
index dc17d57..ba4e8e4 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
@@ -15,7 +15,13 @@ RRECOMMENDS_${PN} = "kernel-module-x-tables \
                      kernel-module-nf-conntrack \
                      kernel-module-nf-conntrack-ipv4 \
                      kernel-module-nf-nat \
-                     kernel-module-ipt-masquerade"
+                     kernel-module-ipt-masquerade \
+                     kernel-module-xt-tcpudp \
+                     kernel-module-xt-conntrack \
+                     kernel-module-ipt-reject \
+                     kernel-module-ip6-tables \
+                     kernel-module-ip6table-filter \
+                    "
 FILES_${PN} =+ "${libdir}/xtables/ ${datadir}/xtables"
 FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 
-- 
1.9.1


