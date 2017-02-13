Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 66FDB72001
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:07:36 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id r141so787993ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lAbnuOACsKo8cRjDY8K1ax8r3kfLBApKLGHG/D9s8NU=;
	b=NgQv077R/fpb2ZYREKGqa/2ACgwj75ahEGhCQsCqHbDrjLCIyLjB6IUPG2vhCe09r9
	bJA/KcM0sAiKkWG7/ASOrJgsymf35Nw7uO6tapdXulE2UU6Et+QBGxcmOlo/wIlVmlnE
	lO2Kam6Mq4vLL/hlwvkfN+rPU9SEnAIgOE9SN0VpsR1SXEnuVCJ04YH6Z2OCggAQRv6j
	2rSVFCBxhAtwuDxb4AoLLG3QHDYIIcU2v5vrCKBZh22qDlP9Gr+niSp15Tung1VpmfqD
	1ogqlw6I/aQfA/d1/pO5SBalCl96zMLYExm49616lmtpQrpAT9zlmF9jq2Cv3YxZ6biC
	qtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lAbnuOACsKo8cRjDY8K1ax8r3kfLBApKLGHG/D9s8NU=;
	b=DgiAnLMu6wPlkwVDd/updfHeI2gcVfSO7eEw6di83xZJ2z30pM9LQ4zqLnF1BCcep1
	DcSw2i/YvR225te+Rw69Cx+rfJal9uxYPL94/Du3FTELyASQdueZPPtHafvwxxu1MOvK
	BgkZYS/B7mmKew+30bWs7vIUunNbHUaQckJ4uBLedopDGIi5vrbyas3xGYV6U06qFyx9
	52In4JMjz+I7ZhAOitcC85fHGjdsIfofmkEAIJy7+CGRuo6Fhb1Wd6chjzJur0pAxWhB
	Kg7D7tUmCJrn84JFE1nCN7hiGUOqwNEI3/OHXk94OhdK2sKnF7Wb7Fn9WYJDf1vyP+tt
	t0/Q==
X-Gm-Message-State: AMke39nn61QhzLGnMA98SM5kvjMH698MIe49wVAaSSj3TFgrk7AGg2PYOGQp+lrQqCZOsQ==
X-Received: by 10.36.236.2 with SMTP id g2mr587666ith.18.1487023656929;
	Mon, 13 Feb 2017 14:07:36 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id m6sm4457659ioa.57.2017.02.13.14.07.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:07:36 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 16:06:55 -0600
Message-Id: <1059e1bfee8f16f3af686ff6ea982128bb7d4a84.1487022302.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1487022302.git.george.mccollister@gmail.com>
References: <cover.1487022302.git.george.mccollister@gmail.com>
Subject: [morty][PATCH v2 2/3] gdb-cross-canadian: Depend on nativesdk-python3-importlib
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
X-List-Received-Date: Mon, 13 Feb 2017 22:07:37 -0000

Add missing dependency on nativesdk-python3-importlib so the imp Python
module is installed.

Before this patch, running gdb from the sdk would give the following
error:

Python Exception <class 'ImportError'> No module named 'imp':

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index e53081d..3ff1989 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -14,7 +14,8 @@ GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 PACKAGECONFIG ??= "python readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python3, \
                          nativesdk-python3-core nativesdk-python3-lang nativesdk-python3-re \
-                         nativesdk-python3-codecs nativesdk-python3-netclient"
+                         nativesdk-python3-codecs nativesdk-python3-netclient \
+                         nativesdk-python3-importlib"
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,nativesdk-readline"
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
-- 
2.8.0


