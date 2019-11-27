Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id F13BA7FC50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:40:11 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s5so27452023wrw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EAMxL9cen2imH69UlrV2J8XX6d3rorZ4EreBxfi/BZk=;
	b=OUeqdo8CvKb13VJEsmb4y77dodoiKzkzc7HOPLKxevoUXeIDcM9c7LQdo4NNt9yAli
	5wSgiUdCbC3WuAYkdKPaWwfz86kN4jJ6YBfeIEsloqbHiy6YMCuhWQhdMnEoW/fpROz8
	smydhOMZVJ/dSlGJ6RW/9jNc9FptGIwXfGIgEeYGySM4TLVU3kJx2gp+e4jLrQq2H3Hm
	gol8CmBzjb2xF6wcNGrBzsVvSn5GEKhhtVujjk0cz/pql8ZvzAVTlmXf/2smu2oVQrVS
	bVvtPTYVGFhpdoVKH6hcSIIDvu2iV8zT7KcytMBOtN75H50ysFakqbZVT9mpbd892t1y
	UTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EAMxL9cen2imH69UlrV2J8XX6d3rorZ4EreBxfi/BZk=;
	b=ZMDHw8nmJZy3s7DWttD3RZU3WpkW8tAxluSgSoiGVWunsu830O6PtsIDeVFNrzNUVM
	ghlJAY2zh6AbqbIz1dJKvSFa4PA2RPUoGFjkUVXNNVrZ0e2mwrXfx5KHZdPIGQMqLJEP
	NXOzgtWzCBXG3Wt86pKPcR8wCXVEOrQF64H9rT77ir38aMgYO+Q/0oGbeEcbXVi9iqn3
	WUbr77N1Jbs71hFrPMuRwWoEvKayKtSU0odvl4Sh4RVM/nWlH3/8J2WYnS//dvQZ3+yK
	C6cqd0mLKW1kjNvNFBpJYT/5OzvQ24zfHQU3nShvmAHwWHsDFJx7hm7Ze+lAwc2B6h1Z
	tF2A==
X-Gm-Message-State: APjAAAVAHPs3Lf75EeC63bbVCJWqbH4QpxBP6C+LvJ1I2YLhtz0GmV4Y
	1lbyLRSkGfiPOZGx7yiTx+yLl8pc
X-Google-Smtp-Source: APXvYqwBCUznSj2B+cgPgZLO2dHoPcMMMROX9dTlk75Yu9WnK5suum2YihT/s/ekRNMaeNHKHYdcGA==
X-Received: by 2002:adf:8b01:: with SMTP id n1mr35639023wra.227.1574872811687; 
	Wed, 27 Nov 2019 08:40:11 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id w4sm19743067wrs.1.2019.11.27.08.40.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 08:40:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 17:39:53 +0100
Message-Id: <20191127164003.115980-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127164003.115980-1-alex.kanavin@gmail.com>
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/14] dnf: upgrade 4.2.2 -> 4.2.16
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
X-List-Received-Date: Wed, 27 Nov 2019 16:40:12 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.16.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.16.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.2.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.2.16.bb
index f38167f1ad0..1373bccee23 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.16.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            "
 
-SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
+SRCREV = "4c74fe24c4232ce6bbde4b252f9715cdb29923f0"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


