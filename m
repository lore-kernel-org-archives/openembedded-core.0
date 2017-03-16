Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A95E37765B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:21:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2GELBWA009185
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:21:11 -0700
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 07:21:10 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 10:20:55 -0400
Message-ID: <1489674056-21470-5-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489674056-21470-1-git-send-email-paul.gortmaker@windriver.com>
References: <1489674056-21470-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] net-tools: use update-alternatives for more manpages
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
X-List-Received-Date: Thu, 16 Mar 2017 14:21:09 -0000
Content-Type: text/plain

To fix:

  file /usr/share/man/man1/dnsdomainname.1 conflicts between attempted installs
  of inetutils-doc-1.9.4-r0.core2_64 and net-tools-doc-1.60+26-r0.core2_64

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 49a65f873a91..99a42359b817 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -101,8 +101,9 @@ base_sbindir_progs = "arp ifconfig ipmaddr iptunnel mii-tool nameif plipconfig r
 base_bindir_progs  = "dnsdomainname domainname hostname netstat nisdomainname ypdomainname"
 
 ALTERNATIVE_${PN} = "${base_sbindir_progs} ${base_bindir_progs}"
-ALTERNATIVE_${PN}-doc += "hostname.1"
+ALTERNATIVE_${PN}-doc += "hostname.1 dnsdomainname.1"
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
+ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
 ALTERNATIVE_PRIORITY[hostname.1] = "10"
 
 python __anonymous() {
-- 
2.7.4


