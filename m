Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C0C7A7F88A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:22 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so4402514wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P7/4qj2iQ8jCPKAq/IngPEIcV44UAlTrM6Rxc34tkZY=;
	b=SLsSKv9D0xxuKaOoLAqfeHoCygSrmBdjjc2pZxQ7/7l7Xe55nitEST5vBRG3/iyL+l
	HTYSbhEwOv3w3vKzihfYCKLgWPD0G5OQATBAU53I6+PpJGqn+lo3Qw6dKcNdARgd7e7V
	OrsfYo0HpenZKeR5FOAAR1qlSz1ugI6Fti4FtKuwHnZflRpzhE2S/32rsTt/bgEvzUOS
	aF7t00yOS+fcUAhtLgLr2/7aDjnb4kOEp7+XotLvhRZ3R8QC/SdMfdI7qe/tkRAx8aZl
	pHMgXoSCzsH08pT4/Xcji0gtY8zvhBqnQUNgeOghU6aNQAjJZe52grv+ZERjxZ931lFy
	E/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=P7/4qj2iQ8jCPKAq/IngPEIcV44UAlTrM6Rxc34tkZY=;
	b=q3aH3Sgqwb0/2OErfKhPkIbyBtUKPZBiW/HwLqhyiu6GxfEzL9Zh75qR/01krXTNVg
	dpTMzqEfWlR4UabzAzwdpGajeJRB4jtCqbSjpgM5hYR561RDfKWIMwSU4T4T1SlMOGjV
	nbXckKl2Y/EE1+Woe3qUJCKdfuVzCftOG+0kTO54krFzvGJkTr+baTv+JwFeieV1hMB8
	OwgzcRNOi806ikA/HDjaD+2w6XtFUXe8TktEcuukqBO6ee6hb1l9J1l2qjkKxESaHvou
	3i2NKEbEdniDEvMiFaYlvupBI1I/4stingglS1XW/62q7M1x0gq4/UpKpkKsrQCA0Pew
	Q9Tw==
X-Gm-Message-State: APjAAAXvCkg+GTi/refAp0ePu7s/JYXPY0QBqI2+35QfivXL339mA1OS
	gVdjd4Y4xc5uEfiDyIz8KnmKlFFv
X-Google-Smtp-Source: APXvYqxYCsEbETLtKJOhu9xvwfLTn1TdRQCvog2gDLo5sSUcRXH+nYryvdTjwwpZAME0vZ9h+fLnhQ==
X-Received: by 2002:a1c:c917:: with SMTP id f23mr5681254wmb.95.1575560663224; 
	Thu, 05 Dec 2019 07:44:23 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:56 +0100
Message-Id: <20191205154357.121346-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 23/24] nspr: update to 4.24
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:23 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/nspr/{nspr_4.23.bb => nspr_4.24.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.23.bb => nspr_4.24.bb} (96%)

diff --git a/meta/recipes-support/nspr/nspr_4.23.bb b/meta/recipes-support/nspr/nspr_4.24.bb
similarity index 96%
rename from meta/recipes-support/nspr/nspr_4.23.bb
rename to meta/recipes-support/nspr/nspr_4.24.bb
index 8e2761c20e9..5f823f89414 100644
--- a/meta/recipes-support/nspr/nspr_4.23.bb
+++ b/meta/recipes-support/nspr/nspr_4.24.bb
@@ -23,8 +23,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "90af0450423b0588f0eba6255c07ab79"
-SRC_URI[sha256sum] = "4b9d821037faf5723da901515ed9cac8b23ef1ea3729022259777393453477a4"
+SRC_URI[md5sum] = "d630c2111e1db6d2ec2069aad22b4121"
+SRC_URI[sha256sum] = "90a59a0df6a11528749647fe18401cc7e03881e3e63c309f8c520ce06dd413d0"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.17.1


