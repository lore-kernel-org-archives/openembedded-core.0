Return-Path: <>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 882B37FA3B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 23:11:53 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r1so213933wrs.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+XuDKFsQZK7CLhLNwn+62FnsA4HPIY9MD2F7O83DGzA=;
	b=eDuCQkPIcGqzpvuu/0IcQ85P8v9bWeCC4j4rLeOdCAG6ny7sAIOd26hVtG5Yh8FP0Z
	amh4UXBGnnGBjh44vlxfVn6InSTdpEDfKzoHf8ZACQupVtzTMckcdMD2TbXVwFoKqAYc
	hH1XK02CS2Yt6xOKQDWLYqo6u/jHwYojWagksHPz1JAruCn6MGD3LCjHNicJTQyvLC3O
	ucvg1b3qZGIgMbYblMK3WDsBgWyOWHk1eJCemAiEIau1QvB2nJgCXNtbMHnbAE42m7vQ
	4gDzqIbos4LPuW7XANrxbrecysM3kqE+Tz986EQ1yVz4MEA8+1CJhd2WzYIKobLYgcez
	mDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+XuDKFsQZK7CLhLNwn+62FnsA4HPIY9MD2F7O83DGzA=;
	b=HX2+f1O+OMVMvZKDg76IrrffmebPQJVxj3pvWRj82GE/mYYQpVy2UyoLpHOf9rJnr1
	9aXWnDSLTqfLE5hiEK9q9enaJN/Yo9+CTxOhOJ//4rPl+e2FtT8OsJ7G0vlwif1V7YNz
	yuKPVi+hZl1S2hVvJXnW9hzGmpd8A3ljykHiizFgd6N0+mlnvMoY6h8lKd/1XNfEhgVX
	AmVfUdR6SdRT6mtTS5cdNEP0FLY1dZoPBYwvDuni9GhWxGdGJ0wqTA+5LDtF+byc8Alk
	GGcTv5XApYsVmQzZJGaV8IXPF2ejDd4vmksYnPa7rCZRreqsUK4x812eEa2G9lM/riho
	9otg==
X-Gm-Message-State: APjAAAU3QDdFLZ4pq5hUhRbTcmshELRGgytCJkyNrKoCNY3eqgSbDfMG
	jOdoUXVDRR3Ru9+dg1SW+ylriu1/
X-Google-Smtp-Source: APXvYqzWWUSB5m/W52O3wih/Gn6mdSXzOjWl1IzlmATXmMfClcmehIaSJw8AVOFdaS2XkbRXy3EySQ==
X-Received: by 2002:adf:e286:: with SMTP id v6mr44753wri.241.1571958714117;
	Thu, 24 Oct 2019 16:11:54 -0700 (PDT)
Received: from localhost.localdomain ([103.244.144.90])
	by smtp.gmail.com with ESMTPSA id 143sm267194wmb.33.2019.10.24.16.11.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Oct 2019 16:11:53 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 03:41:41 +0430
Message-Id: <20191024231141.74302-3-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191024231141.74302-1-alexander.j.kube@gmail.com>
References: <20191024231141.74302-1-alexander.j.kube@gmail.com>
Subject: [PATCH v5 3/3] go: Change default GOVERSION to 1.13
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
X-List-Received-Date: Thu, 24 Oct 2019 23:11:53 -0000

From: Alex Kube <alexander.j.kube@gmail.com>

Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4a23c50631..c6c4cf7ce0 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "8.3%"
 GLIBCVERSION ?= "2.30%"
 LINUXLIBCVERSION ?= "5.2%"
 QEMUVERSION ?= "4.1%"
-GOVERSION ?= "1.12%"
+GOVERSION ?= "1.13%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "9.0.0"
-- 
2.17.1 (Apple Git-112)


