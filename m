Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 256FD78340
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 11:46:02 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k10so4572234wre.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 04:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WEFz6vVfSUeCkqEMrzU87Ig/kGVG6XNpD0skKxjkBdI=;
	b=I4df00OEuVIXi1bpZYPMS/wcn2YJ4IbZW/UI3Lz8+nrLKa7e8JqgJK923fWQ04KUQr
	n7nFgb5CgFYiVILFsxmchdhzQImCyIS2h1vJZQyuhX4tZpjgQYe/5oLcIyBUcwaulXvW
	lqDCsLKHrU0nIoEE1TnS4SCaW/8n3ftICuvkHy2YQAeUXhJhW0iTn1BD7EaDasiEh8/j
	0TuhL8OOMIUocsxk2hqLjcMIGQUjUzifdBJk8jtNCX1bAjkxwojgYzpLvzuV1NWbCEtP
	gkGEmiplihLsePkyrYFahAiK5MvnsXEEa0YSQg4W+SVdACnaC0mDYMqRirGTLNcqCiDy
	YdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WEFz6vVfSUeCkqEMrzU87Ig/kGVG6XNpD0skKxjkBdI=;
	b=GZpcnM6qrjUyc0QwPuxpccXz0482dOPmisZhCmi06blcchwVIwrqBQMMYeWZMdN6bw
	FwdYn5cYVpHUjAkc8zZ3a7bxquaw5cnsm8oYmyVOZIlwrrM19+ywqRclVhzeRPbGtJ3Z
	wdm2AdXgfirfmwJ12joLw4vwkWNfb5+gY44ZNzNs/hVXHZ0BagCkj4skhPq4S0+rCwxF
	Klt8cizBQGhnyfTQlBaQCSDvCeLUZHs5I3fudgbpvyQmTPzVy5URv/EK78rHWv9OF617
	iWfuLG35YUdhNiI3Ccn4ru2CqXAZYx3t8MN2XIm20T9ZdEn6XSnup9TezCvuCYoSypNB
	7T/w==
X-Gm-Message-State: AHYfb5iyX9tG+38KkOBZJmi9KNIoIq4rs3mvkPqycI2DL7Wbkx54ZkYq
	7PjzRwbUKMfeIFIG
X-Received: by 10.80.153.29 with SMTP id k29mr5100946edb.89.1503315963543;
	Mon, 21 Aug 2017 04:46:03 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.88]) by smtp.gmail.com with ESMTPSA id
	j32sm5916712edd.50.2017.08.21.04.46.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Aug 2017 04:46:03 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 13:45:52 +0200
Message-Id: <1503315952-28377-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] meta: move some text from oe-setup-builddir to conf-notes.txt
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
X-List-Received-Date: Mon, 21 Aug 2017 11:46:03 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This allows the end users to be able to override the entire notes
showing on the shell console. For instance, Our company uses a
external conf-notes.txt, and we run bitbake with some extra variables,
looks like: F=xxx D=xxx M=xxx bitbake <target>, so we want to show
exactly these texts on the shell console, that's why we need this
change.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/conf/conf-notes.txt  | 5 +++++
 scripts/oe-setup-builddir | 7 -------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/conf/conf-notes.txt b/meta/conf/conf-notes.txt
index 2f2932b..f1a4f4d 100644
--- a/meta/conf/conf-notes.txt
+++ b/meta/conf/conf-notes.txt
@@ -1,3 +1,8 @@
+
+### Shell environment set up for builds. ###
+
+You can now run 'bitbake <target>'
+
 Common targets are:
     core-image-minimal
     core-image-sato
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index ef49551..55d73ca 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -133,13 +133,6 @@ EOM
 #    unset SHOWYPDOC
 fi
 
-cat <<EOM
-
-### Shell environment set up for builds. ###
-
-You can now run 'bitbake <target>'
-
-EOM
 if [ -z "$OECORENOTESCONF" ]; then
     OECORENOTESCONF="$OEROOT/meta/conf/conf-notes.txt"
 fi
-- 
2.7.4


