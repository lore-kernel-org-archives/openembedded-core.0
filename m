Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6D27FC0D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:54 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id t8so5530304plr.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gpZ0cP0pBvV2j8HHcCcVdG3MAM/5fE2Wip9r1CPjQCA=;
	b=onxeklozOeTcEqykQ1cEwDLxR9fMR1/5lIj/eodk0xu5UD3IsFqdmKyGgCPunPLdxQ
	1qfIdfhLvcWU88+ftx8NbtstHlCGOaqNl+Z7dbUG8oIchCBBAveDJR6PMGPsKYeYVg67
	NS6u+9QnSx3V8pNd8XRyM58qhI+9M3EWVH74TgSe7pFWxpl/eJsB2UuDstMFwvkx9vdV
	PCC9OEyPtThzzPOSOeP3ZjWC9Ot9/5+RsLeNCYuv2UgkJpqEdXmxApQ+vs5jRwPWirPt
	K39KHLwQK3cnpMf5VA9CDanKP+pYdS4XnpaD0/knNZ2dotrcBAHKtpyBkOZtFSSL8wqd
	0yUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gpZ0cP0pBvV2j8HHcCcVdG3MAM/5fE2Wip9r1CPjQCA=;
	b=Ii44OXxnXvF/GjreBNNXYPU152Bj+dTO5njXS0oiaLCqVX8Al3EsJFHRAr+Y+bDudA
	ytJnbg7hDkPkIQXzBZKr8VnQ8VP7KJuKBf4KfpxKADuu5b1tlqHmmUvMST0DFUc3ZWYI
	XbAZPIV0xvQvmdfDiiipHmjvyoQUb7c+SMc8/t0DDx4HMDop83Ia86GRluhvBNa0n4mS
	LNG8IXAA4oZ3C/dcqbJpHwRQokFme6UPPpzgQdYzsljqciD9yZa/tE4mC8Fgj+PS8qCu
	Gd7GXrV523bW9atzEQ9PJmonXcFdbYQSTstZelblFWY3GV7Dan7UjFbfdgy3ccZYFyXm
	OtPw==
X-Gm-Message-State: APjAAAWy5lIagt/pRtN7ZnTCYCTePzJQj9S6wY+Qn6vv5VGxxCT9cpCA
	U99ZwtPdFVTZsLD0/q3ZbMkpLHgl
X-Google-Smtp-Source: APXvYqxbF5vyEqOQtSNaX+rvoSnGWK5/lJl5PaSzV7Jkl2Nhh21OpKXw4fVBJw2XJFn3UcVmUGnvVw==
X-Received: by 2002:a17:90a:cb05:: with SMTP id
	z5mr11488733pjt.122.1574639455119; 
	Sun, 24 Nov 2019 15:50:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:17 -0800
Message-Id: <ab075ad90036647912c2686fb1b0e473a536e078.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 12/35] Revert "devtool/standard.py: Not filtering devtool workspace for devtool finish"
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:54 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

This reverts commit 41d225f4a37d02e9f79bdbfb79caac8cd3d291ce.

Unfortunately this change broke 'devtool upgrade' functionality,
causing 'devtool finish' to write out an upgraded recipe that no
longer includes the original upstream source in SRC_URI.

(From OE-Core rev: 2d6e55192dba0bf7f6e23e5ab5b3dbc68835bb28)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1646971..60c9a04 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -2011,7 +2011,7 @@ def finish(args, config, basepath, workspace):
     no_clean = args.no_clean
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     try:
-        rd = parse_recipe(config, tinfoil, args.recipename, True, False)
+        rd = parse_recipe(config, tinfoil, args.recipename, True)
         if not rd:
             return 1
 
-- 
2.7.4


