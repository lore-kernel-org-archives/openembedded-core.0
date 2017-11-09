Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3490E7852D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:59:05 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id d28so3148185pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 17:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JuO5Cls2RAnmoowbPXMskATd/GFearYwW/s7AEKAjTA=;
	b=fxZjuG7Lza0NUgVt6UebGAukKLl+YZxYmtFpEUIFIdwSlMN/AfhVgOmsh5DS8JG1Ba
	825vWSqQLzRiPZNmGeF7UIa8Oq2DBS1QDHGdz4eBfD2QPDLwoutQXXWn2UaXidxMdjY/
	6IPpNLI3qDafe7HaKv0Z/cdacl0w+Sl9LBaoZyNU4+WHAqR+ekCo4ORWt8WInXsmnAnh
	YqBa6jLnLJxOvKD5Sx9d64MIWMKMPgnmEjdNre1HBLF+OLs/MKi0GHnL1UW4oqZuHh9G
	KtCyI5SYFO8WUOtW57SwML237LJ7b1+NvUpO2h+ix11lbVRWLqgwnX1vEsGpBjc2P7k5
	V5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JuO5Cls2RAnmoowbPXMskATd/GFearYwW/s7AEKAjTA=;
	b=uCIsbRLCpDOyyBiVTYVncLoRqQp5d4culbp5oHAFycWLk420bwrTkCjk42d+Q8jbA4
	+XH5D34HAcJIBBelzwuAes8dtyA/rx9vnN/a3qM6wLETQ0xKqonsGl1ltnPDZACrdLc9
	XGwWo0UcROm6l9KB5DxRBcpqeMmwIZw4eYfc+G6B8JcsD24RU/Fr+161prprFFcHLVQx
	O3a961XS5NY5Q+l52hhOi9W8y32B7hSGaex08dKWTu52CLFcbihLsx0aKHIBxBmtyNy3
	PxVojLbzURKV/dnxlnVEIPpPc4eqIefhtXAuuQMcjJVkCMmEVxxRkgBuaqKPWt9qFUQ0
	luVw==
X-Gm-Message-State: AJaThX4iWbgUfHY6jHuKtLfQaI3GldURYrVCQDMn9TZNc1OBiwkBEEez
	OiuF+lfMhR7oN3x4DcipGIk6Pw==
X-Google-Smtp-Source: ABhQp+T3pFHe/X70dH0usZPbF0e/To7Gv+cZJV/2W0ZjbzWToS5IduQ4HKnsN9CnT4wJmlLw8XRRIw==
X-Received: by 10.99.160.25 with SMTP id r25mr2258519pge.67.1510192746512;
	Wed, 08 Nov 2017 17:59:06 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	w17sm10156709pfa.70.2017.11.08.17.59.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 17:59:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 17:58:51 -0800
Message-Id: <826373113902dd8d6284ec49a2ea2076c7e298c0.1510192517.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510192517.git.raj.khem@gmail.com>
References: <cover.1510192517.git.raj.khem@gmail.com>
Subject: [PATCH 4/5] musl: Update to 1.1.18
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
X-List-Received-Date: Thu, 09 Nov 2017 01:59:05 -0000

Rich Felker (9):
      fix access by setjmp and longjmp to __hwcap on arm built as thumb2
      for executing init array functions, use function type with prototype
      fix read-after-free type error in pthread_detach
      fix incorrect base name offset from nftw when pathname ends in slash(es)
      in dns parsing callback, enforce MAXADDRS to preclude overflow
      release 1.1.17
      fix regression in glob with literal . or .. path component
      fix build regression on ARM for ISA levels less than v5
      release 1.1.18

Szabolcs Nagy (1):
      math: rewrite fma with mostly int arithmetics

Will Dietz (1):
      posix_spawn: use larger stack to cover worst-case in execvpe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 671de326fb..932c9a27a0 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "48be5b6313d7b827acf555769e93b389fa9f6307"
+SRCREV = "eb03bde2f24582874cb72b56c7811bf51da0c817"
 
-PV = "1.1.16+git${SRCPV}"
+PV = "1.1.18+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
2.15.0


