Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 398A278DEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:50:53 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id l9-v6so1036068pff.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2k053/w+qqu8N/fFRanPuVTrsmwGHPQTXhmU/FRT8Rw=;
	b=uzF/MKsRlLHiLMopyuOxXsQlXs5vc+1dxEX9samVhVeEW0JYq6X7XIewYnJtqfy8KT
	/mTv8zd1MOYb7PC/HJLdXFqwjdodb04CI8cNiBMDITSx1JO4V5l6wcpNJuf3AGa0uoeR
	lNyRA8HJ75T8ug/UCyhdjj/B5ojCxgnlmtvAoPXgSToKmWPkiXZxkJbcJJDa54F7+zWj
	NPylmNLz98DPH3fuBg8FnYIbP4cFfqnlaG78716c3P1qEJjsstiRC0UpMobWUkSQcJwe
	FvOYjX1HHqmbFy6zUlLhtPzYK+EL30gc/XXfrq/UziOoNpVoftb4lr7cttXAvg4E9tCQ
	8iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2k053/w+qqu8N/fFRanPuVTrsmwGHPQTXhmU/FRT8Rw=;
	b=amRUdaiSrMfEGY8/Lnoh/x3sh6CCwVETbNQ53B3qfwxouXV4Y2/T2g7+wgzVOP6ixm
	mi3qfVtfGBo0Bxr+oPqxFfNDSHvRpsD/wkJRO41+UzbAqkB3MufEXZII09zAqfaC3BJG
	AmD7C3VHE0NHu1bxlnTbSSU9EvhAYcRaI8RVKP0uxozy8hffE5u4ORHGPFZSAi7a9Rte
	NObHHx9dTUeUWefKMPDjEcW7MQ0SxidnKURagcisUXkvK3mN6qaSLczROIKEztfoXXex
	KlPEHb/+gEkV+zwsrcRP0eJG3Wft2YTTH/cdrgEmMgKBBzqFgm4ArjxVQMUka/TpGYaC
	PgIQ==
X-Gm-Message-State: APzg51B5yxNIn44OX+AJWjnGJU09jSo3w8qqU2tF4FChRYTSlFBhRWHX
	l5zOJ7AQsCAc1/e+rt12+fpzCTY7
X-Google-Smtp-Source: ANB0VdbO/xrGVgAOWWVDLqTKGpk2NYfknNhhjUv4qGvA/GoLPffOj1k4WGd62tO/3nWLhvMzIrl4WA==
X-Received: by 2002:a63:6485:: with SMTP id
	y127-v6mr2436515pgb.393.1535478653990; 
	Tue, 28 Aug 2018 10:50:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	g184-v6sm3330295pgc.22.2018.08.28.10.50.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 10:50:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 10:50:39 -0700
Message-Id: <5e55d18752760c85d54db631bc954ad50bd4f171.1535478536.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535478536.git.raj.khem@gmail.com>
References: <cover.1535478536.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] musl: Update to latest
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
X-List-Received-Date: Tue, 28 Aug 2018 17:50:53 -0000

Important regression fixes for mips and pthreads

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=1ad8138819ced49851e618c9c063aa0ffc86718c..767f7a1091af3a3dcee2f7a49d0713359a81961c

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index c13371014a..f4f156042a 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "1ad8138819ced49851e618c9c063aa0ffc86718c"
+SRCREV = "767f7a1091af3a3dcee2f7a49d0713359a81961c"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.18.0


