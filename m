Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id D689774765
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 23:16:40 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id g2-v6so8015495pgs.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 16:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xRgsOLxGx+mAAk5iDLDHbg6ySLr20fcWgpptX/pMJwQ=;
	b=QcOK590bCZcToB6CMHjaexODg3mnPRPgPYrUXPP2fO5SYqd3mJTJZcfuhjHEMiDspo
	1wO8ET3/EcpxFkmOiR8qc5TbhjXilHnX2Tm90fvitIU7GXyG0DjAaKRQDmHKwzIR6ghY
	xl2N/bytXHkZPpw+QHBZpCeVa60Xc8nS08+E9hugE/2BytNCDMBArj0QZRWcr5J7fxow
	to6+nTpjbjKfNmcrmzFY6uoXgzj7lM+3tBDoPqwkwws16EK9hVoOvExFtl/J9yUKVXec
	HG3wgTpCYnES1BzK5BTBRZuc1NgvETl3nmSnDiXRRSizjtiN4D9oeU106UtGL5MIiQFt
	i9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xRgsOLxGx+mAAk5iDLDHbg6ySLr20fcWgpptX/pMJwQ=;
	b=C5Opmrm1bEDNt+/3a6xZIhuWAd3DGOv03Dm1UuDFRl00TH0BdjDzwdo10eGYdQFzEV
	hR6NHVDXxeWPMEEzLfAS2+ekDLI6kX8wlKaQ7bHQIceHVypDN6v41tWjr1lN54vLpVLR
	UrsJsef1/ZVZqODLudGvu4mSX5IP+0LcThcVQczzz3c8NNOtmOh321N0KQnDMk75TycT
	XYro3Uy1Ztqgvt9zDJHZY1L7R5UbTJXGNbY0k5eQT1sLKf6KYUqoz5cNDPxYV1yWRmz2
	XFU3ZHce7KHStVzaX6M8UpHcPpEB3aCjLew3pS0KKEBIl8p6+gI7zzkIwOHMj6czpZPa
	19vA==
X-Gm-Message-State: AOUpUlEClKOj2EqtGuA+gmIhdr4MWqkYhYlp/bz717cB/YqOEAwBjkHf
	8mNDgDKQzXg2oe/6ZKq54bYPlQcE
X-Google-Smtp-Source: AAOMgpeqYw2TW8gsdSMxv5YVrtzex1XYPkDXVCfLMUvWDQXsV2HQ05SA5fssk2WXPCWj/XmBMwRXaQ==
X-Received: by 2002:a63:e0b:: with SMTP id
	d11-v6mr3795166pgl.134.1532128600898; 
	Fri, 20 Jul 2018 16:16:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::8092])
	by smtp.gmail.com with ESMTPSA id
	a15-v6sm4327302pfe.32.2018.07.20.16.16.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 16:16:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org,
	martin.jansa@gmail.com
Date: Fri, 20 Jul 2018 16:16:32 -0700
Message-Id: <20180720231632.21344-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-qt5][PATCH] packagegroup-qt5-toolchain-target: Remove non-existing qttranslations-qt from rdeps
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
X-List-Received-Date: Fri, 20 Jul 2018 23:16:40 -0000

Fixes
ERROR: Nothing RPROVIDES 'qttranslations-qt' (but /home/jenkins/oe/world/oe-build/sources/meta-qt5/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'qttranslations-qt' is unbuildable, removing...

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 8219aeb..d020cc3 100755
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -36,7 +36,6 @@ RDEPENDS_${PN} += " \
     qtbase-mkspecs \
     qtbase-plugins \
     qtbase-staticdev \
-    qttranslations-qt \
     qttranslations-qtbase \
     qttranslations-qthelp \
     qtcharts-dev \
-- 
2.18.0


