Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB07978F72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 08:05:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9I85m1k001055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 01:05:48 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 18 Oct 2018 01:05:47 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Oct 2018 16:05:44 +0800
Message-ID: <1539849944-6349-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH] dhcp: use config file dhcpd6.conf in dhcpd6.service for DHCP IPv6
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
X-List-Received-Date: Thu, 18 Oct 2018 08:05:47 -0000
Content-Type: text/plain

Use dhcpd6.conf for DHCP IPv6 and dhpcd.conf for DHCP IPv4.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/dhcp/files/dhcpd6.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcp/files/dhcpd6.service b/meta/recipes-connectivity/dhcp/files/dhcpd6.service
index ca96abb..52a6224 100644
--- a/meta/recipes-connectivity/dhcp/files/dhcpd6.service
+++ b/meta/recipes-connectivity/dhcp/files/dhcpd6.service
@@ -9,7 +9,7 @@ PIDFile=@localstatedir@/run/dhcpd6.pid
 EnvironmentFile=@SYSCONFDIR@/default/dhcp-server
 EnvironmentFile=-@SYSCONFDIR@/sysconfig/dhcpd6
 ExecStartPre=@base_bindir@/touch @localstatedir@/lib/dhcp/dhcpd6.leases
-ExecStart=@SBINDIR@/dhcpd -f -6 -cf @SYSCONFDIR@/dhcp/dhcpd.conf -pf @localstatedir@/run/dhcpd6.pid $DHCPDARGS -q $INTERFACES
+ExecStart=@SBINDIR@/dhcpd -f -6 -cf @SYSCONFDIR@/dhcp/dhcpd6.conf -pf @localstatedir@/run/dhcpd6.pid $DHCPDARGS -q $INTERFACES
 
 [Install]
 WantedBy=multi-user.target
-- 
2.7.4


