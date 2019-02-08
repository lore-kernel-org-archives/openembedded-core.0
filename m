Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3D27C5C5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:04 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m1so3691942wml.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SJP4DWLGnNq33eOnd4m3y56YH3zNcTOmAhzBsYa67zk=;
	b=tAJePbXtey0aV/pgoVF5affs0K8S3/Hp18m3B3+THMNNuDfT2hESv+a7v6TG7tsxMk
	t4xc0qs1ttZFdbYf7HtDOLhYflBoF4SdKoBX7kqQnhge4fh02LFvpRXBcJzvDr/r/kEp
	AhL9IN6/4hqwi/EFiIa/QJKRGyqkrdQ+md2tmNIfMGj4AsQO0Ai4giFPDC2PTo+ZwqVm
	TAJ2VYoPeB+75+7JN/j/xREmLzZc1r3A+ZbTb50nT0TmZO6iwVGbntTAZiUrr6ZQM1Mh
	KTJU9HCkJdGjF41V6m0sHU3x7RG0iXBLrV3Wc7g9Ty+FFzUx5ZvX1jpSy8NgHYs/2cV6
	Tw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SJP4DWLGnNq33eOnd4m3y56YH3zNcTOmAhzBsYa67zk=;
	b=Ic456hquI5dmzkuzQPhw4w61VZtm/wmXNQgu3leMYLrpmfLquoidkuIQGPoYGLi8cG
	D0ixRAOKDOJdJSqjrNDO/7rm6QlPa0PPi5osum0rBY7tBC2nRcx0yHRljrtVR+wmWeLM
	Jak+7taoG/SSUZg4qpiqdAKhtPZIM7+p74OUFXTTmw1WV2xAhlxUeZ/kN13lt5xt9coZ
	j8oiJDndqlSqeRKHfdK81eZpl3r99aM1OE26zZ8O/L9EGBZDDovGTRfNtSJnNISk3zRZ
	w7RVnAszUD0fEGtA73UjJOLr6iQwKs0cF4yAIDxt7E6ZXOjZZuBlcW7p/VNJIlbYm1v0
	pd3A==
X-Gm-Message-State: AHQUAuainxzDUg6dZ3yrpLWHbjELkYZuGjovd7KSEPdyityRrTlxrW8Q
	nF5wxYKpdFFJRv9MIgSQfBSyL/Bo
X-Google-Smtp-Source: AHgI3IaVe8aUrXg28hTM7Rl2qV1AqUMYcQfBglrnF+c8+uWaCbx1o5ZFRuRxPOO0wYBlsksIdWSmUg==
X-Received: by 2002:a1c:c58d:: with SMTP id v135mr12312815wmf.88.1549637165053;
	Fri, 08 Feb 2019 06:46:05 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.46.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:46:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:46 +0100
Message-Id: <5610fa8f79d9455b67ed8eb474053b972e4d5859.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1549637121.git.alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
Subject: [PATCH 05/12] qemu: remove support for building against host sdl
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:05 -0000

This hasn't been the default for a long time (as some distros don't
support it), and with gtk+ being the new default shouldn't
be needed at all.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 07f78058e7b..dccf9dcb00c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,14 +39,6 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.17.1


