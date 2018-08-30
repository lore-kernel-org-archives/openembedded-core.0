Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1665379306
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 00:06:10 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id k21-v6so2996865pff.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 17:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GwWrT9migWX8lRDRMPqYh/dNZQk/JcaTcQaLqqQXxik=;
	b=dYLs9p1SxtctCEJPMigvsyTissRG1muAaXUKXC0TcpByCBrXEtQOkQc1hH0XT+xbzC
	VL1BhHuCDbcP5AL15gS/vtq9Y4Zfx8LmfXV1yJXzIJyHaXWcoFSbSUf9m3lQ6XeMu5ml
	U7Q1HuS2Q7OtW66hkuqy4h3NrYklErxehbzv+bEFZNaK46VObMx888QXBwd8R3FYj2nx
	wkzSgs1AWFoTOkhbQRK1uvokPBhE3ubpvtHr58DhzPj0uArv806fr+VHp+wsChENfcU3
	YXdaTNvZc9q/mcu/Lu8WqeVMIx93qwF2mV0S+j46DnIieQxAEl2pwpHZ3Ko3qVtBPgWs
	p0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GwWrT9migWX8lRDRMPqYh/dNZQk/JcaTcQaLqqQXxik=;
	b=fnl/sAz+0OI625xQO6OISECOvf5MFT0TKavdjgpOMQjpGOhItNRfsIxIdmr3NAUMZD
	4fxyP3r606r7qzwR3aHzgVrdynfm7gceZmtqHdnBFi2msqoZPcqpVmxf/SzIF7vS3ud/
	fyEpYnikLL1mtIyKGAzryqqBY5v/PO1OGjuMpZO0kYieu2JcnNEPGlDoigLVmvB8VSER
	C/asURZrnIk3RcNsecpoFhKhsVS8HxVSC1ryRF1o8Yhnm6glqQUvxCdiwVwlm9V2iZlG
	WPzr1SQfBK4VZv4X4ICfPMJ+p7V++xLGaJkp0VCKsYaFNQjOCnnDLY/oT4tFVDOqIEnk
	m4nw==
X-Gm-Message-State: APzg51BIYJlwKG6gBOohFWppMC7R2aBx7EhdCdan8cDfgNmAmMwNxch+
	F1//yO6Zc5d6d7U3iXJ6bluRt8ks
X-Google-Smtp-Source: ANB0Vdb25+OvVXQnM7cx/NyOP2lN6ULe8d2zOhID1skTBVy3NK3khh63Dqlkr1SFq0njctSe69vvcQ==
X-Received: by 2002:a65:6292:: with SMTP id
	f18-v6mr7402548pgv.85.1535587571554; 
	Wed, 29 Aug 2018 17:06:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	x65-v6sm8295727pfk.140.2018.08.29.17.06.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 17:06:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 17:06:00 -0700
Message-Id: <e2ba59eadf6b88f176e25915ab138276bdae960c.1535587162.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535587162.git.raj.khem@gmail.com>
References: <cover.1535587162.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] libc-package: Add risc-v specific options to cross-localedef invocation
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
X-List-Received-Date: Thu, 30 Aug 2018 00:06:11 -0000

It was otherwise being deferred until boot time

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/libc-package.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 2e7cd25297..9d09c7be6a 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -257,6 +257,8 @@ python package_do_split_gconvs () {
                 "mipsisa32r6el":  " --uint32-align=4 --little-endian ", \
                 "mips64el":" --uint32-align=4 --little-endian ", \
                 "mipsisa64r6el":" --uint32-align=4 --little-endian ", \
+                "riscv64": " --uint32-align=4 --little-endian ", \
+                "riscv32": " --uint32-align=4 --little-endian ", \
                 "i586":    " --uint32-align=4 --little-endian ", \
                 "i686":    " --uint32-align=4 --little-endian ", \
                 "x86_64":  " --uint32-align=4 --little-endian "  }
-- 
2.18.0


