Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 50F9478CA0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 14:05:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g15-v6so18352021wru.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RUKOpB1PZmDgYchEy5XHTCJUuHHD/oMbLFtgcMgYIyU=;
	b=Y6G9nnHLFKEc1VW89YQlmwWuh/VC9TG9TKZGN3EpZMKXzUMkfY1y+/dEersVExx7kN
	28Ncjzz9LqFjcF+KVGdne6o5t/EJ/nA1DdkgwHzW+KlGpGcYrMUWom43a1L2SZEBoU7F
	VqOGEuMy7zI0Yla7GHPQ7rcJwH2sV0N/e4EUu2wECn/vDscikPO4Pj/WAVtVPKFnXfv0
	ger3uANCQSkfNc75ChccKL2aF3Uq4M4dYbaMWts4hIeSLkPeD5wQ9l7ac1XW+xLpfv10
	wK7ColgoAjytJRAV+lT1yxFnX3m4FZVQ3w3dtbAQru9Wikg3WQDbuTuJYzl59/IJuznE
	kGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RUKOpB1PZmDgYchEy5XHTCJUuHHD/oMbLFtgcMgYIyU=;
	b=oP/seWncx2Q+UcEpY8Jq0y4F6VYs6OBrtDkbgV23ZzekTawk17Ut1pMGg9SyVrQtpG
	durc90QH4ISH3zwRtMOlUKjo+4Hcs/WLa9cXFP94nCJDOO+H07hfORPZ5SKHDv0iny+u
	acZqx2Y41vmqvUTW1fKpbUDSYYjSuNZsqOkoOc0zuPLWZLdHnVrNVxE2AnHGHQ590uG1
	v+HNh1UYt/DM+L+5OyD7+S2rx0Wh7syxwuLlRzO15XLXKEN2V484+F4HZ3HcgBulMSLg
	txetBYK9SGQpGPueiNjcfHfWOZF0BJ/OcIhPIPAJZpJnmbN0QrKS+abLHr3Bom8WMNGf
	lT8g==
X-Gm-Message-State: ABuFfoiaIFny7Q+BmYBQQgz59WL4cswk/MwE0N2nHhIF30S3B7PHrxyn
	vqeuyf49AhIs7FzmzQ+ewHGC9A+s3EY=
X-Google-Smtp-Source: ACcGV61BlPRccTJz7H57Kb1dhruRiE7hFmjVmXjNxEPh8MveQGmHBk1vhOi1h5ctwI82LQIRHxS19Q==
X-Received: by 2002:adf:e28d:: with SMTP id
	v13-v6mr16053682wri.139.1539007500660; 
	Mon, 08 Oct 2018 07:05:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o201-v6sm13027023wmg.16.2018.10.08.07.04.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 07:04:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2018 15:04:54 +0100
Message-Id: <20181008140455.8990-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181008140455.8990-1-ross.burton@intel.com>
References: <20181008140455.8990-1-ross.burton@intel.com>
Subject: [PATCH 3/4] python3: fix patch headers
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
X-List-Received-Date: Mon, 08 Oct 2018 14:05:00 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/ftplib.patch | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/ftplib.patch b/meta/recipes-devtools/python/python3/ftplib.patch
index 8bb3cd02196..49c5b2736b9 100644
--- a/meta/recipes-devtools/python/python3/ftplib.patch
+++ b/meta/recipes-devtools/python/python3/ftplib.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 From cabe916dc694997d4892b58986e73a713d5a2f8d Mon Sep 17 00:00:00 2001
 From: "Miss Islington (bot)"
  <31488909+miss-islington@users.noreply.github.com>
-- 
2.11.0


