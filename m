Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 362CA79091
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:56:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5D7uhVg027555
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 00:56:43 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 13 Jun 2018 00:56:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jun 2018 15:58:24 +0800
Message-ID: <c18b14798810390683ff51ce6710d62af85676ab.1528870775.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528870775.git.Qi.Chen@windriver.com>
References: <cover.1528870775.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] oeqa/runtime/cases/parselogs.py: ignore a message from watchdog
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
X-List-Received-Date: Wed, 13 Jun 2018 07:56:42 -0000
Content-Type: text/plain

The following message from watchdog is not an error.

  "error retry time-out = 60 seconds"

Checking watchdog's source codes, we have:

  src/watchdog.c: log_message(LOG_INFO, "error retry time-out = %d seconds", retry_timeout);

It's clear this is an info message, so parselogs should ignore it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index bfebb38..1cdea58 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -50,6 +50,7 @@ common_errors = [
     "GPT: Use GNU Parted to correct GPT errors",
     "Cannot set xattr user.Librepo.DownloadInProgress",
     "Failed to read /var/lib/nfs/statd/state: Success",
+    "error retry time-out =",
     ]
 
 video_related = [
-- 
1.9.1


