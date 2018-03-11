Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9B98B78989
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:43:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x7so9953841wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TnA3EsYION8CNGv/mPE/tHjVxo66HzlVZgE9yVFQWRg=;
	b=lAbMcn8re+HdwCcwycyS41dLrz+BAahnSyMODCSvGj7Sw5ZVUR6lxoluzwFqN9lUlZ
	yapJe1jQpJEZkfCEF1YgBFqfoDNaDquQ6k8YCQUN46GXX3PEbUBw5H4FS1iDm3gDbr5H
	BBfsdafWFDGvaEarZrpEuz789CDxxbrCdPsIo9gLxWQcAMgSSR+EDuRx3O1yqsYXigfd
	1kNNqxitJgjJLloXvFAmRg2+vWoDzchETlm+eSDwGXSRTxvL7hZVZLzy5GbahRvJCb6s
	vlVXGIuQE2HJ/U5xxOH57JwGJHc6F9TWshKXgZpKQUS7y2mIfGuT6QqStjljbALIiXpf
	KSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TnA3EsYION8CNGv/mPE/tHjVxo66HzlVZgE9yVFQWRg=;
	b=U/pvpRzOy6V8jj7hWT4Pksp2/ZvO7YP/l96JUGOWQ35kURQa5fINzK/W0o16ZXuiUG
	CpTbB8WeuVOcDYOeWheQidmWoaBBBpkcuEiAYGjaMRHzrmz9z3dTo8qXwtNrQutTkKPP
	wH0xyySAwWTAuT1Wj4uj6swYrxxW3Rd0Sy4fPpTisBalI3rnHlqQhj7DBei1cCvCx6zl
	sJSeHVgZCOQm1pMWieOs3iR531sylUFY0ZTDArQMYinOwzcuQxaj+Dqby1wpZVqSJCuN
	/sValcgL0ZJ/GErBGZ0nhV75g7m/s+XzMvgsxPin0pwFgGDXV7ZypG29Sg7j0wi2idSf
	kVww==
X-Gm-Message-State: AElRT7G1SwXJwa4f3gpCtzLpWvhy4wTt23TrTrUqRBbl3wy9CMt6kNxx
	FoBcDf8d1x5Q9npV0CdPyzj5bw==
X-Google-Smtp-Source: AG47ELuNcE4lREBHtm4v37uF3EH9QBkuDIzndZyaKSUVNG0YP6pHq6u8ya/TKCpcPWN/UfKDqPnQWw==
X-Received: by 10.28.174.11 with SMTP id x11mr2123247wme.124.1520729000810;
	Sat, 10 Mar 2018 16:43:20 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u22sm4957951wrf.86.2018.03.10.16.43.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:43:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:43:11 +0000
Message-Id: <26e2a47a4a68823db22304ae9b79c735bdd0a052.1520728804.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728804.git.Martin.Jansa@gmail.com>
References: <cover.1520728804.git.Martin.Jansa@gmail.com>
Subject: [rocko][PATCH 2/8] gcc-runtime: Disable libitm on riscv
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
X-List-Received-Date: Sun, 11 Mar 2018 00:43:20 -0000

From: Khem Raj <raj.khem@gmail.com>

Cherry-picked from oe-core master 21caa8bcda93ce67ef58548f7b85d0569d13d0b9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index ee08529a5f..d3d4bd36a8 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -20,6 +20,8 @@ RUNTIMELIBITM = "libitm"
 RUNTIMELIBITM_mipsarch = ""
 RUNTIMELIBITM_nios2 = ""
 RUNTIMELIBITM_microblaze = ""
+RUNTIMELIBITM_riscv32 = ""
+RUNTIMELIBITM_riscv64 = ""
 
 RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
-- 
2.15.1


