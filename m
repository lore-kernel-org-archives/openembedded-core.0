Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 57DB7714CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 05:49:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8I5nRKR006885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 22:49:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 17 Sep 2014 22:49:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Sep 2014 13:50:00 +0800
Message-ID: <cbcf90ef7466703fd5015923cb6d1b3998ee9a95.1411019338.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411019338.git.Qi.Chen@windriver.com>
References: <cover.1411019338.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dhcp: set Type=forking for dhcpd.service
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
X-List-Received-Date: Thu, 18 Sep 2014 05:49:30 -0000
Content-Type: text/plain

Set Type=forking for dhcpd.service to make it start up correctly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/dhcp/files/dhcpd.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/dhcp/files/dhcpd.service b/meta/recipes-connectivity/dhcp/files/dhcpd.service
index 8648f1a..80f6c41 100644
--- a/meta/recipes-connectivity/dhcp/files/dhcpd.service
+++ b/meta/recipes-connectivity/dhcp/files/dhcpd.service
@@ -4,6 +4,7 @@ After=network.target
 After=time-sync.target
 
 [Service]
+Type=forking
 EnvironmentFile=@SYSCONFDIR@/default/dhcp-server
 ExecStart=-@SBINDIR@/dhcpd -q $INTERFACES
 
-- 
1.9.1


