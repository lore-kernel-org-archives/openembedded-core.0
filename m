Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id C56FE793B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:55:47 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id e11-v6so3252065plb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GwWrT9migWX8lRDRMPqYh/dNZQk/JcaTcQaLqqQXxik=;
	b=uil3uqM6pr5+gUF7mVjtNn843s/X1K2fPRFSvqq5/0TLnID5p6LzKapFm2wEgDwLcE
	dsl0/PGDw9JrfrifXu4Rw/cerh7sbKQWg0eMujU5vTMXZRW/eF/USIYj0S1Sj/Wa4Ho3
	uI1XuO6Zwae3TzME98RZXyvyf9w5utlQaGBMQfKMXh1QJTY+QfSlwFwxHzPDPR6U14Cj
	1J9Q7HF/UV/9wPfBANjUFUK63/qcCbKoiUg7gd0/KiKB0QEkLh6oohMLUP+PullS50o8
	vsphzqWFhV5JQuR61bsH/gXt3RSu1fyRdj7TMLD9TUuKNF7cYsLRMV1BPE1TG41JmboK
	eY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GwWrT9migWX8lRDRMPqYh/dNZQk/JcaTcQaLqqQXxik=;
	b=Ys6F4RVn8UUKdBR63C62ceaM4O6s8xUVF8yuOGc0cIHUKjxrDkB/8JO8AY8bqrQekn
	NKfxDGKCjHG7GLEUdSq/GmLnxpM49vSkQopwYkD+WqKWyHGi0R1rgCH4tG0mL/r0lKq0
	FX0yW6Cn01xkxEs+uPr13khPITRiK0sk9ACuM7j6PmSgOxf1Z+dkKLPMqpiayH3LULoV
	eplBJyXLNlo11IERCf3hCl73nKpIB4iIoFFp+H+Fk/QxkfVgWmwsRCp7+4ZDpMDyYfgb
	Ny08vjWCnYfT0bxwCHybK206vadb9FZLC8bZdQV2ar5q5ODD/Q6VbUh8Lnija7PNshXs
	b7aA==
X-Gm-Message-State: APzg51B32er+L6unSv7xZaqt38r1psutOvWP77yEexKE8D/u1WUCj7cv
	AindsxLSWDf5UycDHXhBfn4kCU10
X-Google-Smtp-Source: ANB0VdZCrA+aoIZ6R7JLUBdFIKwKWfMAwVi4rkL0m5wCnlMpSWposGOEPL7HHfV6MRqzJp7B5cl4Xw==
X-Received: by 2002:a17:902:246a:: with SMTP id
	m39-v6mr8361103plg.57.1535601348534; 
	Wed, 29 Aug 2018 20:55:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	77-v6sm8056381pga.40.2018.08.29.20.55.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 20:55:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 20:55:34 -0700
Message-Id: <e2ba59eadf6b88f176e25915ab138276bdae960c.1535601148.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535601148.git.raj.khem@gmail.com>
References: <cover.1535601148.git.raj.khem@gmail.com>
Subject: [PATCH 2/7] libc-package: Add risc-v specific options to cross-localedef invocation
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
X-List-Received-Date: Thu, 30 Aug 2018 03:55:48 -0000

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


