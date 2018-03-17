Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6487C78977
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 03:40:46 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id s13so4831184pgn.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 20:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Mq1hUloFxtz85FchJbFjfuyVIeZxfxwIvrFZ6GfD1Q8=;
	b=KZdNes21uId+axKMT46RKGeCn3vrosheo6ThqRSY2BcC4WSRqBfHBEii8Wlspx4bxu
	pCLzz35hgU3FqheTGA1UvHmbLM+XXUzdmNu23sqdE0E5paeO57v+Rf/Bwksa/isHHcOm
	td9WgzcPU+42RSwDZ8IgM5t/z10vq/7+QKeK4Me6D0gs0v3bkyHwqpxX+FDUUDLxSC6g
	HWpm/SMkfHiSb8ho9yeuzKHukV7UVrtT2eshh5GvsVjtjjwe5limgRjkwnvq0mUR4IyP
	GeQO8gh4Ek7ROfjiuo57cHPCxrwKzyED4+V0xKfIVtCJVkpjuw66INvpdKCEh6qf6D/3
	3Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Mq1hUloFxtz85FchJbFjfuyVIeZxfxwIvrFZ6GfD1Q8=;
	b=U0d/HDLOpF2lh5Pil9mcKoO9Ki9+FeI/KL/rg1e0A4lqb+cHVLc0Ig712a3iFEwQjV
	31hLkom03uK0Bieozf/seSyTYdCM46QMdKp56TgMPeKcjOlS25s3++QTqCdigxW/zyid
	Fo/SiMKrmHNyiF+bLrsysutif00S+8E7cFJN5q7+Y8r3wRuJVArX2g9GKdjP7tcsF2iu
	HGxNUa2dAdUkCILrsaeXc6QjCTMGEcHdD+KAoKDnfaTDwc+39hT9UO3TNKoMCZjK/3za
	WIj3MTomxcJYe3zD78sFh0BsuwqiaP87iWIiO60BkO/lwoLx78VsW3Rsoqj5LyzvuGv1
	w4jw==
X-Gm-Message-State: AElRT7Fkz/6JJS+qdi8gZ/JuUgbrP2a0GXoq91hDAsS89jXVas0z4zIe
	m+xr1GQgtDWc3yCM5ydBfOz4bQ==
X-Google-Smtp-Source: AG47ELvSzelPZDtZkuT13owMOv0FKHAVitx3z6pIZbE0ANVZo1Uf3EEuXQRhi2/1XnB0icjorN5i5Q==
X-Received: by 10.99.134.193 with SMTP id x184mr3396794pgd.324.1521258047798; 
	Fri, 16 Mar 2018 20:40:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	184sm874800pfg.124.2018.03.16.20.40.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 20:40:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 20:40:34 -0700
Message-Id: <19ff9542e08c7df5898cc811f65200050ecf02d5.1521257828.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1521257828.git.raj.khem@gmail.com>
References: <cover.1521257828.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] x264: Use updated gnu-config artifacts
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
X-List-Received-Date: Sat, 17 Mar 2018 03:40:46 -0000

It is not using autoconf completely, therefore there
is no autoreconf happening, so when we depend on latest
gnu-config changes e.g. new architectures like riscv
the build does not see them and fails.

Installing these files from native sysroot helps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index a669295044..c445d15e69 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -43,6 +43,8 @@ EXTRA_OECONF = '--prefix=${prefix} \
                '
 
 do_configure() {
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     ./configure ${EXTRA_OECONF}
 }
 
-- 
2.16.2


