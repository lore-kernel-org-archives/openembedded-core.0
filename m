Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D7147E09C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 12:09:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c5so7589788wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=D0BnixtiQqr/G8MDyNPBC1iF2xAlGpf9U7/LaCcSPMc=;
	b=ItZCmYdHQLUMCl+e5a48Cz6etwKrONDU76Mfy3M66u6BBT2UxoRmBK9ddxMeONYFyf
	mFbt4syNCZYhQvF3wN5fhYlEnfck6FZDDMuo42WOUJR90CD1A3F9f74bGDQaafOSWp0N
	/EQhpa5upVLhgWCsgCI8aT5yYhZ9KcB7jfxrgEagj1neaHSXzEcydLhKTaXaEzgE3qyF
	0lWzD1B6lf+gpdH0hHeyqe0SsZkO6gfuggqOaAdrN6qzB2jq9O7BBWIv75hJLPdU8OA0
	yW7mLGId1FiM2EqTcgyROu/ppxJMn+kcc+dl08aJK/RTeUJ/hMOCMqvWn56BGby3Cp8M
	lLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D0BnixtiQqr/G8MDyNPBC1iF2xAlGpf9U7/LaCcSPMc=;
	b=Nn936gtnVy0BCgekKr/DMYIrakwkzcmgvdtImAdNY/mKKI6rAVeJp/QqXU9DCUySbt
	/7XN7f0aXVzK+IDb8PGLnI2b1412f6RRoCqrqwL59TBNiwL8j1UFe6N33snNXq1A1l63
	iS2A8In75SC8u2DlPKr/xi2JBF+sPkF6H6sQLDd18Hx1VyF/TsFk6rCgCRU0vaeTXcTv
	xRvf2L0oVGyHFXPNtzw85lzpPZrwR29qcdVgFTtd6vYQ9ud5LagTrXPHS8ogZxx8dyts
	T1qiJtqUdUnrXPkclceYwyx+GDMUWAg1euvi3R5vF8HQ4Pr3IZBRnmhx+WbkXqCC/Y4F
	SWrQ==
X-Gm-Message-State: APjAAAXceYiFErBVsrxBMbbS3eV1lGqYueXnptlmYyepalO8jtNtLq6V
	Shmp10M16Bqt7gSYlsWpHn0qlH/h1xg=
X-Google-Smtp-Source: APXvYqwx9lrDQiKGaDKH24IlHa5KZ1VXaprORA99u3kei7piLKiLcwhP0YfjVr9eXnUNp2sM6sE4Zw==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr1566249wrp.298.1557490193780; 
	Fri, 10 May 2019 05:09:53 -0700 (PDT)
Received: from localhost ([88.98.246.218])
	by smtp.gmail.com with ESMTPSA id n4sm9656479wmb.22.2019.05.10.05.09.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 May 2019 05:09:52 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2019 13:09:32 +0100
Message-Id: <20190510120932.29765-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509214007.13927-1-luca.boccassi@gmail.com>
References: <20190509214007.13927-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] systemd: enable portabled by default
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
X-List-Received-Date: Fri, 10 May 2019 12:09:53 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

portable services have been declared production ready with v241, so enable
by default and install the files in the main package.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: Just enable by default, and let the files be installed in the main package
    as requested by reviewers.

 meta/recipes-core/systemd/systemd_242.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 73e03c7a77..f15d125bf8 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -81,6 +81,7 @@ PACKAGECONFIG ??= " \
     nss \
     nss-mymachines \
     nss-resolve \
+    portabled \
     quotacheck \
     randomseed \
     resolved \
-- 
2.20.1


