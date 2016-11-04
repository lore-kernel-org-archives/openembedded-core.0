Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A952071AE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 06:44:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA46iXsP004007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2016 23:44:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 3 Nov 2016 23:44:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Nov 2016 14:44:57 +0800
Message-ID: <292d1ca47a2d3d4c09884edf53be5b0a79c3acab.1478241842.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1478241842.git.Qi.Chen@windriver.com>
References: <cover.1478241842.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tcf-agent: fix systemd service file
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
X-List-Received-Date: Fri, 04 Nov 2016 06:44:34 -0000
Content-Type: text/plain

Fix tcf-agent service file so that `systemctl stop tcf-agent' doesn't
fail.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
index fd9a6c4..dd3a79b 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
@@ -3,8 +3,7 @@ Description=Target Communication Framework agent
 After=network.target
 
 [Service]
-Type=forking
-ExecStart=@SBINDIR@/tcf-agent -d -L- -l0
+ExecStart=@SBINDIR@/tcf-agent -L- -l0
 
 [Install]
 WantedBy=multi-user.target
-- 
1.9.1


