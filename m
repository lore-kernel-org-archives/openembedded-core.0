Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6EE7DFB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:07 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h4so8080865wre.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tokA5tjB6GMsI3SDTwZjT4GBZEOA7iVB67BbBd1XGmQ=;
	b=dzn2RWWdOYnSSVuDrXlpaxgAnGvLfIbmFwfy3QqnVNADMWdUARDS28wGK7/2M3EkrK
	ATgPciQEIkDwEJWhCe+EaDHF3MTTj/5y79sFVLUnLwwHKvZX+uDowNf7O2FiuUoaNdJB
	b7a4ltEwinwoNV4Bpk2g0wi4kd0Y2CPgkZrkg660PSTA8tVLKGkkL8sErVk2equzkqzY
	AnnIPtDDuX+mvABXh6RF9IdNjNXHAWJOfD3n01Ncl/PwkWgBqaDgF138dKTNWgFIE8lw
	eWTZrG/E52qIEmR12NC+cnfh498EG1WUhYN+IfraQq2U7JasRWOPuy2QghZDlMhB/HcM
	kKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tokA5tjB6GMsI3SDTwZjT4GBZEOA7iVB67BbBd1XGmQ=;
	b=exE1a01ES0NpvpJF9vif0dQk2MidNw8zHsRoVcHLSmXZbJ8ZO87AGmSueCj8Doe6Sz
	s6e0N6PMtV2LIAPjmrhCGS5MWzVv/qOpoUNh0n8K+YWiy4NqzmrCAe4A98cOPuNQb4Li
	FQd4U9HV+KhMXeR/FkVjMbjSLhbeKsMLmvwhvuvf8zDIIw2mqxWtHB6XcVR3qouyAo0/
	wKkHVOLEefAdIH3l3KDmjlvRufAlUJdI+Xp9otuvGujYSDIP7ruMWEjJ5yiqX1TrLV7C
	JNPYbeXjevUGtjwyqHe/ql7INABSPlQcxhkdmyZB/5+AhaQnqR1bvmKwMgmbQ+81Dene
	bLhw==
X-Gm-Message-State: APjAAAVmQezumKxyuevo86emf6KJWSBf79jHay49ZaOfy2fWdc4HZ4eE
	Qm4hqKyZ5pgRBX0Q/MQdKjOJVfCx
X-Google-Smtp-Source: APXvYqw9R8CijKKWFq42LqlVecUtwH93Vjv+VBifcjS7/Kzt23z4ZQZIRsjZmUhZKVtYPfSGmIFUwg==
X-Received: by 2002:adf:f2c7:: with SMTP id d7mr32985665wrp.320.1558116728172; 
	Fri, 17 May 2019 11:12:08 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:25 +0200
Message-Id: <20190517181151.44001-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/37] go: update 1.12.1->1.12.5
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
X-List-Received-Date: Fri, 17 May 2019 18:12:07 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/go/go-1.12.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 0cf0a63ff65..7c4cac1fc25 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.12"
-GO_MINOR = ".1"
+GO_MINOR = ".5"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,5 +19,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "09fe592343465560b4b8431d870b3df3"
-SRC_URI[main.sha256sum] = "0be127684df4b842a64e58093154f9d15422f1405f1fcff4b2c36ffc6a15818a"
+SRC_URI[main.md5sum] = "cb6f594d22dd79af4fff9779607b1b47"
+SRC_URI[main.sha256sum] = "2aa5f088cbb332e73fc3def546800616b38d3bfe6b8713b8a6404060f22503e8"
-- 
2.17.1


