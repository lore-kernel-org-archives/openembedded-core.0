Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id C486F7708A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 07:28:27 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id c41-v6so7772989plj.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 00:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z9IVU5caC9U5QENLBjqNIjyCMFcY7YxOLzMFNa519Oc=;
	b=vdHwQ57sIBVVKaRsxuvClgBpfRCc845HzgvJbrrC+zz4mtmdO69z1F2HePZmLGOzSz
	0FjnRkiVbDbnBNEutOhFEzJROy+zzQp2ke+sIUhgyHsbv/I7SjRitjFPEzfGcWUnVYpy
	/N86zMd8e3MyGiSguINSjGPu+bFwAT62UQk5UBY7Vu+MG8sNXVqalqzrdRgTyuaorfzR
	t3c2UMT/vcIAajKhGnMDveo6CNR7HWAF4AXSyHE++IWbeTAxsLW1FeKwGYDOiAkrXCPN
	6Aw+k9gHhqUPeIE56sSvN2xdbV2slfkj4UGi7hH+D1skWZeBlIP2jbD7SQHu7RptGMdj
	v8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z9IVU5caC9U5QENLBjqNIjyCMFcY7YxOLzMFNa519Oc=;
	b=PfEYVi1XXAt3mu7JpANFz+UrOGiFum/YtXtoJTThraUXO7+Khp4IHJEBeTdixvv51n
	UOQRI9Nwkl8lPNWT6v9dNvYaQtbNfsfYe8i0K9pxtFSxsYpzRb3FYCNpU8Y2jcMEXkKz
	OnflgIFWmcmn8OaCiPYKJOBQL1s9r1fY8dFgXEUnSAqHFHaNwyDitd/yr2as+BBxY84O
	b5xMO3Kdm4CRIFGWx1rYCwvrCLW/YTH6qEGdhh+v67SYJ8rANKIpNsi2UKL/rYcqd7Wo
	sjcWee0+i4amhsSKUEa7+4nrnl5tEeblkcfQEBDXc/ler2LYQqTeqZDo28Nbls5qU0sV
	9KeA==
X-Gm-Message-State: APt69E3owfMNaAP9Rmt/lWaNGM/dqQQHyUPw8nqKdudmIxdZA6UNFXSz
	muxMWN+S15PYANpfGUTc6Bs48Q==
X-Google-Smtp-Source: ADUXVKJVQLqWU38vnMGA7EaZT8CHpOYferP9+ZkdVPYdkWwh1YrU1Fhhom1704R0pjvfXFTAowRN/Q==
X-Received: by 2002:a17:902:6ac3:: with SMTP id
	i3-v6mr5336462plt.378.1528442908599; 
	Fri, 08 Jun 2018 00:28:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm33935578pfk.12.2018.06.08.00.28.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 00:28:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 00:28:22 -0700
Message-Id: <2415c91c2196258cbe12bec8e650e5724955a6fc.1528442551.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528442551.git.raj.khem@gmail.com>
References: <cover.1528442551.git.raj.khem@gmail.com>
Subject: [PATCH 2/7] gcc-8: Disable libssp for non mingw targets
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
X-List-Received-Date: Fri, 08 Jun 2018 07:28:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.1.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devtools/gcc/gcc-8.1.inc
index ecc1ceff99..2b176ac98d 100644
--- a/meta/recipes-devtools/gcc/gcc-8.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.1.inc
@@ -87,10 +87,12 @@ FORTRAN = ""
 JAVA = ""
 
 LTO = "--enable-lto"
+SSP ?= "--disable-libssp"
+SSP_mingw32 = "--enable-libssp"
 
 EXTRA_OECONF_BASE = "\
     ${LTO} \
-    --enable-libssp \
+    ${SSP} \
     --enable-libitm \
     --disable-bootstrap \
     --disable-libmudflap \
@@ -114,7 +116,7 @@ EXTRA_OECONF_INITIAL = "\
     --disable-plugin \
     --enable-decimal-float=no \
     --without-isl \
-    gcc_cv_libc_provides_ssp=yes \
+    --disable-libssp \
 "
 
 EXTRA_OECONF_PATHS = "\
-- 
2.17.1


