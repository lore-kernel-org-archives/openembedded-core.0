Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1D775391
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 22:29:58 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id i14-v6so3462607wre.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 15:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zg00Ks30zcANuUljzGUOhlLFhRrfyS0HM2u4XI9LNPw=;
	b=cxj5XhOeUGppa+EGK9OSh5I4B5Rkb75wK4HluaSVsD5SVSQMIYxCvXxlhjBPS90vew
	lPY6IbW4rdkGtxf1r4ycvMIDVJTk8jTEeF5y70ww67UyYKJuQ7C5EVbqW2Qtx/w9e26H
	Xe4YEkAYWpQctjmBjI4RicZemX5XMveG3QEkAy7DTfGoTSdEaBPHOi7qaxaYFDdkc5hs
	auoXv0JVNsqV2AkUiD+REI4X38NAmSnvEgY2d+e8/sV7y1vtPTEV2afIkEbNtHjhva0U
	bWJPdLNvWSc81fxb15G0NQixTMC2UHD33HbpuL91Twj6rS7lqDLj0ENapQDo4kY8+3fW
	f6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zg00Ks30zcANuUljzGUOhlLFhRrfyS0HM2u4XI9LNPw=;
	b=RO+CldyTKcV3n5wQ39ppPDE98sfI+HtW1xfvCq4+bYrCqJa5KfyTL/RJwZ7fTFPZGe
	ORF9wRSRiYJYgsID55fozjues0JndNQdilMhqTMHU6par9sYZr9daCG7QQ57ElGxem1+
	FZ5LbF73+Y9wG3ZxXh19QgL40BF2F9dx7Zm+v7Cyf1/Hcg4/jh9mEjRUq7rVWw3TuRIa
	u/3L5FyFFCuV9dQud+NjG7DLqLIrHSsAJZA3PHQd+CbbRi4CVEAsn8F2Cx0EIcHID6z2
	WWRWCdaVT9QakeCtHeZZb+h1fLF7qMfmHr28BsbUkoL65VMCoUStN18jYE0Ee6K5OyAe
	ht1g==
X-Gm-Message-State: ALKqPwedOqxRtR7EusVAWyYjGH351l3dmNscYjrVJQkfpdH2tDg0Oxw5
	81pE1vN//AhQdDxs+OFbdqG7dQ==
X-Google-Smtp-Source: AB8JxZoAxSvEoUjaSSPn1BcTR1V0fMkui5CA6k4Limc4ZuCLc6cCtWEbjkpemHG4up/OvEg1hdpKlg==
X-Received: by 2002:adf:ba91:: with SMTP id
	p17-v6mr2488976wrg.125.1525991399685; 
	Thu, 10 May 2018 15:29:59 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c18-v6sm2447931wmd.13.2018.05.10.15.29.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 15:29:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2018 22:29:57 +0000
Message-Id: <20180510222957.25918-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509202422.22501-6-raj.khem@gmail.com>
References: <20180509202422.22501-6-raj.khem@gmail.com>
Subject: [PATCH] strace: remove -fno-omit-frame-pointer from DEBUG_OPTIMIZATION when ptest is enabled
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
X-List-Received-Date: Thu, 10 May 2018 22:29:59 -0000

* otherwise strace-4.22/tests/inject-nf.c fails to build as discussed here:
  http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150647.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/strace/strace_4.22.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_4.22.bb b/meta/recipes-devtools/strace/strace_4.22.bb
index 196c9d8587..947b3f7bf6 100644
--- a/meta/recipes-devtools/strace/strace_4.22.bb
+++ b/meta/recipes-devtools/strace/strace_4.22.bb
@@ -23,6 +23,9 @@ inherit autotools ptest bluetooth
 EXTRA_OECONF += "--enable-mpers=no"
 
 CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
+# otherwise strace-4.22/tests/inject-nf.c fails to build as discussed here:
+# http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150647.html
+DEBUG_OPTIMIZATION_remove = "${@bb.utils.contains('PTEST_ENABLED', '1', '-fno-omit-frame-pointer', '', d)}"
 
 RDEPENDS_${PN}-ptest += "make coreutils grep gawk sed"
 
-- 
2.17.0


