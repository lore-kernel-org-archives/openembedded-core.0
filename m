Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE63C776C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 23:35:55 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id x63so30704pfx.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B7R7QwPCeHPQHnzt6o0qv/DgRqtfHBQb5cwwS4RYByg=;
	b=UWvlpZVVRJD0uXXVhNuEK4vov6wIjVRfVnB7LhZsPl1NIMs10KPDryDAX5v+IlgXEn
	s7EBKcyZSZ1XZH5sm7r/sh/cwIepbgUMAZPnrWvlLfdBlcvxxXPz8nzUyxmSHALcA4uf
	Tz6PZKzQEHnsfU+7FidqrU4gf3LQ+/exnlUDfKzuxhMBH9m6Ai/8NaLlBokMNA95bxRm
	idSt0FRg1SiPXKAYf40Vq4frIDkFW9xwMQJqxPpUpUJAB3HRvdw7uVNVRoqW/b+zmjep
	q7QtP7CvQDCgeFLZMo/1I8awzDb2q8KE+aFuS/GmKdri16NoLle0BLTMvz6k54zDojWC
	c53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B7R7QwPCeHPQHnzt6o0qv/DgRqtfHBQb5cwwS4RYByg=;
	b=fa2fLMd9mz/lPZ/1mA2PZ/x9xmbN4HTCFzO3LcAnaX3/x1kxVASdvhWgpBZB/30Jm6
	hE1FhbbonXC9SJRd/Ok1Sj1xyrRm5k229zccu4XpIrw7SEX4QW4vSYQw8NtVa9VUX5uz
	zpIG5AOC6pEFbUhu8vsBipZps+/sXDFU6nVHPhB53Agsz5D7pmne0XwU68BaDlTXA6vq
	wuwSBOeySku0hGW4IW163xLtgbinV+s+eBStsiNVRf00Hz5iHy1+WOQUhAEovf9tE1Fz
	CpNEmUTrivv5OwWFY0q3czW8nXsSxhQr/YcE8aA1skyP0wX0OWseL5C5EFowighE245/
	g8/g==
X-Gm-Message-State: AFeK/H2621x1z6nTA03Wj5OYqIczxiWZmTTEFfdON0Bf5hq47zrEGKOfE5t06LkUw5dOkw==
X-Received: by 10.98.37.132 with SMTP id l126mr308257pfl.45.1489534556612;
	Tue, 14 Mar 2017 16:35:56 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 73sm124094pfh.56.2017.03.14.16.35.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 16:35:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 16:35:32 -0700
Message-Id: <2a1cd614717f323afc788e24fae76337cffa8816.1489534345.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1489534345.git.raj.khem@gmail.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] musl: Update to latest
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
X-List-Received-Date: Tue, 14 Mar 2017 23:35:55 -0000

Rich Felker (11):
      fix ld-behavior-dependent crash in ppc64 ldso startup
      rework ldso handling of global symbol table for consistency
      reorder addend handling before symbol lookup in relocation code
      emulate lazy relocation as deferrable relocation
      fix free of uninitialized buffer pointer on error in regexec
      in static dl_iterate_phdr, fix use of possibly-uninitialized aux data
      fix possible fd leak, unrestored cancellation state on dns socket fail
      fix wide scanf's use of a compound literal past its lifetime
      fix one-byte overflow in legacy getpass function
      avoid loading of multiple libc versions via explicit pathname
      remove unused refcnt field for shared libraries

Szabolcs Nagy (1):
      treat STB_WEAK and STB_GNU_UNIQUE like STB_GLOBAL in find_sym

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 7156669064..fa87d7d3e3 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "827c4e6fbe46142049ef3d8bcb8f35951712797d"
+SRCREV = "cb525397bb053ea49cf160965477a17b17286eb3"
 
 PV = "1.1.16+git${SRCPV}"
 
-- 
2.12.0


