Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED35E60AF0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:38:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02I3cDk0019667
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:38:23 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0;
	Tue, 17 Mar 2020 20:38:02 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2020 11:38:00 +0800
Message-ID: <20200318033800.5550-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [PATCH] oeqa/manual/bsp-hw.json: fix syntax error
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
X-List-Received-Date: Wed, 18 Mar 2020 03:38:34 -0000
Content-Type: text/plain

Remove the redundant comma to fix the json decode error:

$ resulttool manualexecution ../meta/lib/oeqa/manual/bsp-hw.json
Traceback (most recent call last):
[snip]
  File "/usr/lib/python3.6/json/decoder.py", line 357, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 948 column 1 (char 39810)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 73cbaaa7c2..a9bc7d4501 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -944,5 +944,5 @@
             },
             "summary": "System_can_boot_up_via_NFS"
         }
-    },
+    }
 ]
-- 
2.17.1


