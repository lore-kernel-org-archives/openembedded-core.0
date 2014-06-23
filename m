Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6871F6FC0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 02:33:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5N2XC2t027119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jun 2014 19:33:12 -0700 (PDT)
Received: from pek-kkang-d1.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 22 Jun 2014 19:33:08 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jun 2014 10:32:51 +0800
Message-ID: <c2551e9741a835112bf6a5c6d1bb2c96a2f3b7bc.1403490121.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403490121.git.kai.kang@windriver.com>
References: <cover.1403490121.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 4/5] iptables: update rules for ip6tables
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
X-List-Received-Date: Mon, 23 Jun 2014 02:33:11 -0000
Content-Type: text/plain

ip6tables doesn't recognize target REJECT, then use DROP instead.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/iptables/iptables/ip6tables.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iptables/iptables/ip6tables.rules b/meta/recipes-extended/iptables/iptables/ip6tables.rules
index bdd52ed..1045e41 100644
--- a/meta/recipes-extended/iptables/iptables/ip6tables.rules
+++ b/meta/recipes-extended/iptables/iptables/ip6tables.rules
@@ -27,5 +27,5 @@
 -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 139 -j ACCEPT
 -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 445 -j ACCEPT
 -A RH-Firewall-1-INPUT -m tcp -p tcp --dport 2049 -j ACCEPT
--A RH-Firewall-1-INPUT -j REJECT --reject-with icmp6-adm-prohibited
+-A RH-Firewall-1-INPUT -j DROP
 COMMIT
-- 
1.9.1


