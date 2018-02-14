Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4220C78213
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 17:09:46 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id w63so2355909ita.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 09:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=X8jc+GUgJIFfhPQVJ0ZnBHclABqPwCAyCG4eLwVZ8I8=;
	b=GmLBsNYiGyPcDBZNF0oxmJE4y74oTrpndikxYdoETTRd97Z1ZP6IetjV/Lg/abwKka
	KcYImRqe5rO2unowK8s1TtxkBI1wPHHc1gyKkuZ9vH6nE7uUAFbUnjkVWYlMzKSB3rze
	OKLAI3yB0K27MQa7Z6FlHveJgvvLuibW9pk7jrUZqsRXN1AaucI97u6HoRXLhtj/ngzX
	FcWenBU/q1evjY/2j6JpteisVFBbUd+1U524awVVeSbbrywJtLdu0ZKBs/eaKnSvCQhU
	QmDr4/tcNGckfJZxK6+mAp9I1EEeudDBVn9Q7ETxW5/plYdTkA4/Y4piXNI8D9uA8Gmy
	hudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X8jc+GUgJIFfhPQVJ0ZnBHclABqPwCAyCG4eLwVZ8I8=;
	b=lmo17sRWhO6Nukv0f9saIyGf8NAvG9P9cfaoUuQP/5FmFHeC63QaRAaPIJQ29UZFov
	/0crWcvL/gkqRC1OjpYb80cmLzfnCpzyb+7+k9qXLfSmbEM6sO5f+69jv+EO1zxu6ug7
	Ku08tpqIP0Fxo/W/pKmRwJb/7bR8eNOSw0x/M5159ShW2lTDRuE2VjiYdzh6mBDBpHGh
	0ClM42QQOA5A6s7hMsCXi9fpvFZa6MSgO4udjCJh1g8bHYNqER+FD5aqZRQP/8ZVfinL
	Bo8n54wAOkuCRmE4SD3F6+m0w2u2RwTAiX7uZaut8bVgAqB1k5iWp32yjHEo0oYh0muH
	6ZAQ==
X-Gm-Message-State: APf1xPBHSF/f/dtDyiSCCicqWKnOF34mKufH6bW+LR29NcgcgCmukdCt
	+p5EX7L3VB9pdCPxxVVQ13/kwhSE
X-Google-Smtp-Source: AH8x226TjEE4rmFGQ+ftILzDteAlA/k3IrG164gk7ogsqVqS+oyd+H4zeHKYl0EEuIpQp/s8N1eQiw==
X-Received: by 10.36.17.129 with SMTP id 123mr7041318itf.78.1518628188080;
	Wed, 14 Feb 2018 09:09:48 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	s32sm10385189ite.1.2018.02.14.09.09.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 14 Feb 2018 09:09:47 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Feb 2018 11:09:38 -0600
Message-Id: <20180214170938.5339-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Cc: Matt.Hoosier@garmin.com
Subject: [PATCH] externalsrc.bbclass: Suppress git errors
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
X-List-Received-Date: Wed, 14 Feb 2018 17:09:47 -0000

Suppress any warnings git might generate when searching for a valid git
directory, as there are use cases where the directory is expected to not
exist and the warning is superfluous

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 65dd13ddc1f..ac1b904e72c 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -189,7 +189,7 @@ def srctree_hash_files(d, srcdir=None):
 
     try:
         git_dir = os.path.join(s_dir,
-            subprocess.check_output(['git', '-C', s_dir, 'rev-parse', '--git-dir']).decode("utf-8").rstrip())
+            subprocess.check_output(['git', '-C', s_dir, 'rev-parse', '--git-dir'], stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
     except subprocess.CalledProcessError:
         pass
 
-- 
2.14.3


