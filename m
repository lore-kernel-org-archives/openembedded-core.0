Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 99FE1783AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:18 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id c17so4166581iod.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=y+Fs2OQSiZPD0xKUbb1GOU8Fz8kjc3KsCZ1uHqBqgok=;
	b=Av4jG/0DQ4vxWTva3DCEdwNQZq0o1RBv0XuNo4W33RJMh5FlQkpgLnoLmfaalfAUFi
	UcJyQ9/P8tUbULb1Pk5dXaYaBrF+xJf6XHOchR5gk5XbAqVf2IWD4HvlG1e+BdqUHRj5
	0a+Z9MFasYK6o/209P3GXY66l3oxdkvWlYjXg3YNbtMAX9OeJn3asrAn6k5zwo+Wd5rD
	SatgfJwmOoE3vbJdj1u9509r4ANYWxVdtPB+VrubpfJQJBglRGm3HKHQ+R6COvNoMgMB
	b1aHDJ/mRG73W+fDEFlw+M0ugTleUGjp/3wCWo7refl+f2lAe9NQu1QlEFMFORlmfsu0
	hofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=y+Fs2OQSiZPD0xKUbb1GOU8Fz8kjc3KsCZ1uHqBqgok=;
	b=AKSxjHVMgc2RTNLpqKxPdLW0bSIMyuyx0m5OPq7f9C70kM/p1DrB4h2O9TCGSDXtAX
	D47oaganf2h4YfBdf0j/ICXujY4T/zUS6J074CngQPXtMRjsCtPTdAAj++m1VLBX6X9o
	ZYkIMbhHoNP2F9yPUOV/cY9AFaSoOI/F/QvtPvlmiViK6gD51GMXSYDgoyn924OE+FSq
	rxaeclj20C6V0GNYJL9+ohXbJI72cD9nlNw4DQjb64/cskNdB+nIIex4hFPF3JDxpeSQ
	YsNsZcs1sYuLY1Xf9ORRMcGSiJtkukFVUc6qeAbG7PyP3n09+dABBhBh2E31+E/1pJdu
	AlRg==
X-Gm-Message-State: APf1xPCt39CBQeC6/Mr7ZtGM53SqDQvzLlcXNh1BhS31tZbXNdcMRcht
	hSqIOyI/XDCoHGdjiPT9ZSWDS0Of
X-Google-Smtp-Source: AH8x227yTonsS10fdhWztwIJ2fM8ukzNi6AokQwQaxwLee/sfKgrIxZ8+7gk1AKbmfsh7SNmyql2Dw==
X-Received: by 10.107.136.86 with SMTP id k83mr4685828iod.128.1517954599603;
	Tue, 06 Feb 2018 14:03:19 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:19 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:24 -0600
Message-Id: <26b045dd54fcd814c2621bbbdffb0391626a4a90.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 05/14] icecc-create-env: Add /bin/true to environment
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:18 -0000

icecream daemons execute /bin/true from the environment as a check to
determine if the environment is valid at all, so it needs to be
included.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env/icecc-create-env         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index 723f1f9bd90..c838256f748 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -122,6 +122,16 @@ then
     add_file $pluginfile  /usr${pluginfile#*usr}
 fi
 
+# for testing the environment is usable at all
+if test -x /bin/true; then
+    add_file /bin/true
+elif test -x /usr/bin/true; then
+    add_file /usr/bin/true /bin/true
+else
+    echo "'true' not found"
+    exit 1
+fi
+
 tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
 new_target_files=
 for i in $target_files; do
-- 
2.14.3


