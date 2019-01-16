Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6874E7C1AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 08:46:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0G8k9u1002442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 00:46:10 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 16 Jan 2019 00:46:09 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jan 2019 16:54:29 +0800
Message-ID: <099a90d0f23d18f4115227af583a94055eeb36fa.1547628775.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1547628775.git.Qi.Chen@windriver.com>
References: <cover.1547628775.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] parselogs.py: whilelist one more amba error message
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
X-List-Received-Date: Wed, 16 Jan 2019 08:46:09 -0000
Content-Type: text/plain

When using linux-yocto-dev, we will have one more amba error message
for qemuarm, so ignore it too.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index f6e9820..3d72e20 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -113,6 +113,7 @@ ignore_errors = {
         'OF: amba_device_add() failed (-19) for /amba/sctl@101e0000',
         'OF: amba_device_add() failed (-19) for /amba/watchdog@101e1000',
         'OF: amba_device_add() failed (-19) for /amba/sci@101f0000',
+        'OF: amba_device_add() failed (-19) for /amba/spi@101f4000',
         'OF: amba_device_add() failed (-19) for /amba/ssp@101f4000',
         'OF: amba_device_add() failed (-19) for /amba/fpga/sci@a000',
         'Failed to initialize \'/amba/timer@101e3000\': -22',
-- 
1.9.1


