Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 71DB9780BD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 00:50:56 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g65so15606902pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 17:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YD62y6Nq1sdjb9UEdJTdIA/JH7569tclkIChd7I9d/Y=;
	b=ujUaCxrxoakkD+3rf8L0OJvwmM9MEB6nKmq+P1SHisjYQ6EV7lQ2ujk1yGUbDAJf6f
	eavOuHhKfWU4OD4ApqvAvZaguECQ4vQmwTRbxrtg8oinHebViTgEeSQ3iKEIJY9svHuW
	889s96GxORy/Ng8WmBg3nsplV84tUeVDv0sf/6wuyaUTytvrKxtbfVQ1hVEZ53W+hhVy
	hqAv19X0goCKNa9mI9C+RW6cwoOu6n1J4OvzlpFJ23iEpGArMN82WN05BXypUdA7lg7l
	NQQK10oEy+u2pqNh2T7rbK4OI1El5S8HDX8vQEFZCvsO0AmKZelld2v2IcEEe8NVPOYh
	1eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YD62y6Nq1sdjb9UEdJTdIA/JH7569tclkIChd7I9d/Y=;
	b=TA0XvtNyL9LaQkQ47QNoHyU+atxjE/pwTjw0G9iMtruLrB3Q+SGlOb97oCvm7JWW7h
	jmsarTKY+pXagGLUZrDOhp2mJIWDEr9+WOuCF2rP8o82sKzsliJtqEFQNUU0l9R0ciL6
	X4ElMKy0rJ9w62l5kxriqYZKyWDcctLW4blHhaD4ca5AG9CPHDEcvBJ8O16+0UxxCgbb
	sYFQz8RkZgotG2fCN2txPbqIwaBRfnFVcePXiWto3AQ+b+j20yVX8cA3bp+rQaApqOM+
	BekyhhIR7GzY+HikAqspl1yrTtzAqTR4GfhPAGwuI/79Zw8Ymdom6Hb/wSCOP2DLi3VD
	rB3g==
X-Gm-Message-State: AMCzsaVOL4++1HcnuC/AYvXutY0NfpmtTF94J7BjRgA3gBYC/IzVGkw0
	tP+/NCyM3pkgj7mXnJdL+iIxLA==
X-Google-Smtp-Source: AOwi7QCUCiw0yT5qPUI3BFoJq20kr36lG6cjuLhhL4ZluVluycd90Zsg5l80+1F2uOkEFwA1o2wyJg==
X-Received: by 10.99.43.4 with SMTP id r4mr406703pgr.380.1507251057947;
	Thu, 05 Oct 2017 17:50:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id o128sm259308pga.5.2017.10.05.17.50.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 17:50:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 17:50:41 -0700
Message-Id: <f8af837248f8a07733f9066891d7c045bbc8250e.1507250774.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <cover.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
Subject: [PATCH 02/10] insane: Add entries for riscv 32bit/64bit
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
X-List-Received-Date: Fri, 06 Oct 2017 00:50:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0a3b528ddb..def9c707a4 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -94,6 +94,8 @@ def package_qa_get_machine_dict(d):
                         "mipsisa64r6":   ( 8,  0,    0,          False,         64),
                         "mipsisa64r6el": ( 8,  0,    0,          True,          64),
                         "nios2":      (113,    0,    0,          True,          32),
+                        "riscv":      (243,    0,    0,          True,          32),
+                        "riscv64":    (243,    0,    0,          True,          64),
                         "s390":       (22,     0,    0,          False,         32),
                         "sh4":        (42,     0,    0,          True,          32),
                         "sparc":      ( 2,     0,    0,          False,         32),
@@ -119,6 +121,8 @@ def package_qa_get_machine_dict(d):
                         "microblaze":  (189,     0,    0,          False,         32),
                         "microblazeeb":(189,     0,    0,          False,         32),
                         "microblazeel":(189,     0,    0,          True,          32),
+                        "riscv":      (243,      0,    0,          True,          32),
+                        "riscv64":    (243,      0,    0,          True,          64),
                         "sh4":        (  42,     0,    0,          True,          32),
                       },
             "uclinux-uclibc" : {
-- 
2.14.2


