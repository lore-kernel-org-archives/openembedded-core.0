Return-Path: <andy.voltz@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2946A60F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 15:53:23 +0000 (UTC)
Received: from bob-linux.timesys.com (192.168.3.27) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0;
	Wed, 5 Jun 2013 11:53:23 -0400
From: Andy Voltz <andy.voltz@timesys.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jun 2013 11:52:30 -0400
Message-ID: <1370447550-23693-3-git-send-email-andy.voltz@timesys.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1370447550-23693-1-git-send-email-andy.voltz@timesys.com>
References: <1370447550-23693-1-git-send-email-andy.voltz@timesys.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tune-cortexa5.inc: Add tune file for cortex-a5
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
X-List-Received-Date: Wed, 05 Jun 2013 15:53:23 -0000
Content-Type: text/plain


Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
---
 meta/conf/machine/include/tune-cortexa5.inc |    5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa5.inc

diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
new file mode 100644
index 0000000..5511c5c
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -0,0 +1,5 @@
+CORTEX_ID = "a5"
+
+TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
+
+require conf/machine/include/tune-cortexa.inc
-- 
1.7.9.5


