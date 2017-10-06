Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6627C780BD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 00:50:58 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id i195so8478248pgd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 17:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i38JKG229jqv3XuXNgUDsz2aaGIqVhXAzhn92MjBZrw=;
	b=CXb4hZMDOQUDCXxw7GoYXfJtTBobxciI/s5tfneJ6iFuG6ElrYbO9H1APvLP/BqoO3
	yrO1iE9pLFL4aiYdZ0sDvJWqCrmfdwlcMYWXch2ca7l8BC+gZD2Tvha34Ty91EDsBSoE
	bH5CJqipGNk3qu+oUlFzkFxEri5QUKEB00nN/RO8JLLD8pD++HFAaG2F35UwiemBN40W
	3I0pwx8roO2TEltD4aM206LEVKBIXhZZJFN3S/Nd1pG1FKzSakA7o/V68TnhhPFpbJeZ
	oeFwXwLwu042X4ujkmZ6q1MUUIrEmZaepHaqv4v8TdvlKscc/XEnXee3Y5WNI0Gmnv9f
	M7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i38JKG229jqv3XuXNgUDsz2aaGIqVhXAzhn92MjBZrw=;
	b=QP8PgsGU07wsfhKHFQYdGm69DreRKIVHfqkLit/hdh3yL8f39xan9YO11f+z3HBSSO
	uk2dZgT6PObKi+EUPj1lcgRAU/GFwct8NT/uUNgFOqOpqCNb1YB64zLK0SVoRlLjSmm9
	/ZlNpOR3bdpc/RxKleIaX68yRX/T4l4CCakB8OHx0wNoQwBWq+cUpGZ+oVtaZhfifhlC
	ap2HNfdjUj5yT9XiLG/jFVXFrwSyPfjPTuymtXjWCqtgx2M9bdqU47zzshwbggiWclRn
	43r3E63lucTccfJW/c8X+AU2FnbtaueYDXik5o5zS0hP4kk05zdvNd7AaFHzOofh9VzM
	vaUw==
X-Gm-Message-State: AMCzsaUkHqgtWptZ46+l27t7GVBm1EhgiD+RaTRe3VJs/cE7jkIXTuxq
	2Jak3G681de+qkyy0CIBhY25Ow==
X-Google-Smtp-Source: AOwi7QCO69UfP64eWlx2G4xKP70j1QKjTyR6l1BhMIt+LmWoa/puFbkNzZheyea8Nd24JWdiNUfaOA==
X-Received: by 10.84.132.129 with SMTP id e1mr403286ple.444.1507251060445;
	Thu, 05 Oct 2017 17:51:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id o128sm259308pga.5.2017.10.05.17.50.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 17:50:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 17:50:43 -0700
Message-Id: <d552fcb01421a7e7f4f68a62b87434e2cc3ec21d.1507250774.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <cover.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
Subject: [PATCH 04/10] kernel-arch.bbclass: Add riscv to kernel arch map
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
X-List-Received-Date: Fri, 06 Oct 2017 00:50:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel-arch.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index d036fcf20c..cf0edb6173 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -14,7 +14,7 @@ valid_archs = "alpha cris ia64 \
                parisc s390  v850 \
                avr32 blackfin \
                microblaze \
-               nios2 arc xtensa"
+               nios2 arc riscv xtensa"
 
 def map_kernel_arch(a, d):
     import re
@@ -26,6 +26,7 @@ def map_kernel_arch(a, d):
     elif re.match('aarch64$', a):               return 'arm64'
     elif re.match('aarch64_be$', a):            return 'arm64'
     elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a):      return 'mips'
+    elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
     elif re.match('p(pc|owerpc)(|64)', a):      return 'powerpc'
     elif re.match('sh(3|4)$', a):               return 'sh'
     elif re.match('bfin', a):                   return 'blackfin'
-- 
2.14.2


