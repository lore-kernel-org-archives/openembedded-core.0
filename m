Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id A284B7FD59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:48:10 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id i6so1306896pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gig8iIbNGZZhWQlYvV5Q70bwyPHA6URV8VMg3C3IT/8=;
	b=VUwjWaF/2QqTQVgeuS8NHRqZ8x4isIBDW2ZS140Z6P8v6j1Mjp2xPsmIvV6qFm1E5I
	bOExtstQYV8Z9mIZMHEAoCy8+dWCS9CK3Sfzcvbm+W/Lz+yEJDMPpLDJRz0GTJ3eTK/G
	jHF/zM1eh3f79CiCTvBI8FpxTfjdXGsqCvYNtJF9ksE+bn6PnvLns9Nd4eDkf1qHi7Ih
	HCj99iGrpLHKeFMPoi/vPepb8lIppRy66AcyxesNCFvFitHJn0UhzLsRmUp0Grjr+4Nf
	8G7kztkqU3wQ2sHuiZWcbfhnFvWmBRgzP5qQqaGhi+XRLKPl7qE76Z4RVTD1mQYM29eT
	pTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gig8iIbNGZZhWQlYvV5Q70bwyPHA6URV8VMg3C3IT/8=;
	b=L7bnQhGSm1Gb40JDfTMmczgA5ymoepncu0eYbjSyJPjbCW/WGF+NlLLRUtC3X9b2kK
	6cwseU5wJIrQBu7Kqm1Xtl6qHxjNEg409ywr9QMyyKL3cCFGnxJceGGwrS8jGvMQHOSE
	R+ZcMRIYpOXaWu51PfBeNIR/pmzqrdcXj95Anqle9k1kMtEgKl0TiOZhOXcc0G1Bb9Jg
	iSbo+WOqVXRhiBBJ/SWyjlIm4DokiTLHT14+ufSMq3Y7A2P9/0Hqa+kVYLkowkOQTpzu
	RswtGDL8scuDF5eQz5GoOGLGG+MSDUUNHQ4NKipJCBey+MrwYN1upypA41gSXDgNkckd
	VCpg==
X-Gm-Message-State: APjAAAUMemuy5ad5NiXdCCA+0W2ls61I1giCGka6Z1OuNGmirOsKcONb
	XTIEA0XaYV9jmp2K4m6Jt3yt1YEhWGY=
X-Google-Smtp-Source: APXvYqwEoJYce91P/kzhN+JGKmkuSwy07FvcbkggDC8xnzugx3z8RRGFQFgJpEOjL9v0SS3LixQh2Q==
X-Received: by 2002:a63:3756:: with SMTP id g22mr4644586pgn.375.1579880891314; 
	Fri, 24 Jan 2020 07:48:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id
	133sm6729608pfy.14.2020.01.24.07.48.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 07:48:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 07:48:07 -0800
Message-Id: <20200124154810.1760420-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124154810.1760420-1-raj.khem@gmail.com>
References: <20200124154810.1760420-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/6] postgresql: Add python3 to depends
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
X-List-Received-Date: Fri, 24 Jan 2020 15:48:10 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 8ecf2fd3ca..d35711c1e5 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -58,7 +58,7 @@ enable_pam = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
-PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
+PACKAGECONFIG[python] = "--with-python,--without-python,python3,python3"
 PACKAGECONFIG[uuid] = "--with-uuid=e2fs,--without-uuid,util-linux,"
 PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
 PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
-- 
2.25.0


