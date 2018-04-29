Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 07C437320B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:19 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f189so5129311pfa.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XH50gH3v5Zfcm0YQpiX+2GbtcXf2EsakvQGwlY91Gt8=;
	b=LbHrujGAy6Dncr7GCOuzSGAEOWXKRJC4xh5nSTsYRq7S3ImuxBCXDEZRpXJzjaBReJ
	PaPOiM91kj4JxkkygCwYN+11bXEAXDNC2MNh6veBXOw5xAeH1WLVDXfYay82JskvMI2m
	Pn0EPnf4HLBXb47JXKnecZOsRThlq6vCrnilriRfetyizQs63sXPqtQjzGzfyoWLvZiT
	8PYDSFOIrzsNPgoro7vBn7ANbqKk5ALCWlhGfwAiAR7g+nnOmLuHPLZ87S3tZSVHugWO
	dnShYp9yclBPUn9a3nbroRArLLQB5skM8w2ZzXcQ2xKjgHL9La8OKx0FXDziquyXm8E+
	3k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XH50gH3v5Zfcm0YQpiX+2GbtcXf2EsakvQGwlY91Gt8=;
	b=jjrMLYBtHFP4ms456KeaPkJdy3zvhN/78WTZfY2v/gnJPbQpgUHYmufhPrfXscCBlT
	uzk5etKUaf8mKV6UEORxp/yJLkoKtqTmLcywuwFj+9gp+PH3Xk6Oy5+Vq+pWCN0MdWT5
	yHLlizwUSqY9ogNVqkOqD3VF3hfiSohJSubN+hpO2umDMt/ve3ktWHp7VHhGiNh9wXhu
	pxjHTPVSstAgOchxiBPAmcZP6jzUz8zc1dVcGem4X34pFpgv0P8eWii51EKCSRsARew8
	NQ5hvNVzWvCvTxKwwuimVjSGJS0qGYeZbjJdjB/tPSjwmLO8SUu2/oUeDWNOjByz9z9F
	AG2Q==
X-Gm-Message-State: ALQs6tBj3qgd1JQCPkaMRFAnWxoPHphKUrE8gmCoDiuEGFmCK/LzgXUA
	PawElJpbsLsxPPL28KpZva74bw==
X-Google-Smtp-Source: AB8JxZqQarFEvRtp+s05ZHoahdgddxnvnK6foUtMa6sjZOIozlc1ePmaq6zNP9m9OP9xVDovYVz4HQ==
X-Received: by 2002:a65:4c4f:: with SMTP id
	l15-v6mr8221052pgr.61.1525030580764; 
	Sun, 29 Apr 2018 12:36:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:35:51 -0700
Message-Id: <420f0ec2bab73b9d25b0b8e055cec9b3fc2e85ed.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 04/24] libunwind: Drop adding libssp to linker flags
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:20 -0000

This is no longer needed as gcc provided libssp
is not built

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index b9c532d3ad..36851d07ed 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -14,8 +14,6 @@ PACKAGECONFIG[latexdocs] = "--enable-documentation, --disable-documentation, lat
 EXTRA_OECONF_arm = "--enable-debug-frame"
 EXTRA_OECONF_aarch64 = "--enable-debug-frame"
 
-SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared -lssp"
-
 do_install_append () {
 	oe_multilib_header libunwind.h
 }
-- 
2.17.0


