Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F9FD601F5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 12:02:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9QC2E6C002811
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 05:02:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 26 Oct 2014 05:02:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Oct 2014 20:03:44 +0800
Message-ID: <6913fd42a535242ef1d43674a3eac75632b9a89c.1414324946.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414324946.git.Qi.Chen@windriver.com>
References: <cover.1414324946.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bind: fix to use correct environment file in service file
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
X-List-Received-Date: Sun, 26 Oct 2014 12:02:15 -0000
Content-Type: text/plain

Use /etc/default/bind9 as the environment file in named.service.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/bind/bind/named.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind/named.service b/meta/recipes-connectivity/bind/bind/named.service
index 1792e41..cda56ef 100644
--- a/meta/recipes-connectivity/bind/bind/named.service
+++ b/meta/recipes-connectivity/bind/bind/named.service
@@ -6,7 +6,7 @@ After=network.target
 
 [Service]
 Type=forking
-EnvironmentFile=-/etc/sysconfig/named
+EnvironmentFile=-/etc/default/bind9
 PIDFile=/run/named/named.pid
 
 ExecStartPre=@SBINDIR@/generate-rndc-key.sh
-- 
1.9.1


