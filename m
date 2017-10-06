Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE00780D3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 00:51:06 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id b11so7813934pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 17:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Pgm44QkaYlKZr9g4stcOAhLs2w3GWQtJ6/KdfeV8VNI=;
	b=KSwi2W43+YmHJnmi+4Q5gKcZ0RI8XM8AiDgb4RSP6EKubYwaUw/ReTI0muvykkdKfz
	xobrtrbN9HiIQFYKvbMgjK8s5akI2KyxBy/SLibdIJV5jaJIdPWK62ZP5CIkcJeZqNZH
	8NQyEg2N4bXQm1QFXENs0wFegHC+AGKKUZOLO2XqWaIk9xg76fi4r0yKywrMtH26pdHu
	cwefp782NpZ6PmT3y3+vyk9yLFsl3O9geAOoej+yjfsGyr3n5qeydorw3yahOWLquvcP
	tSOOi3JDa5tMia4OvndbP1o8+k5naNd8fbjbmfBknztAImZ8eYegh+erTI89yuFwMM6W
	1h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Pgm44QkaYlKZr9g4stcOAhLs2w3GWQtJ6/KdfeV8VNI=;
	b=DfhZS1RPgSWkpuAneWWLTjs/kGz+ZhvLL26xqXM8JihMi5CH11PGEvjN1pRn5M8iRV
	UqrN5Xe8HhiPZKMu2vq+Kd/8exdOmDvvn8MaOZVwtSVXpyIfJxq2R60BtU5chqz2/dxH
	FW37JasV5FP9oHW1DlRTpaozg6u9EKzme0CBbtRzBwXPLmHd4YaHtpCuXGu1YMBu9f3e
	Lu/nkUWZREoT/S91cRNX4pke8Om8hF3AtCX14uU95dridISIbhsUsSVz0U7wQQe4yAdK
	B+URcIagLLGNOLoHdDr5JwGzGRHKeBDJE0QIthwkRnMmeySGjfh07xcT91pgRAUME1Iq
	PFSQ==
X-Gm-Message-State: AMCzsaUHk6cwov5d5BIocVrLkjhbkntiw8HGv0bwg6zhn7CR0K0beUDc
	UaUN261tvUx2ysHnU72oytRu2g==
X-Google-Smtp-Source: AOwi7QDFLeDVGrj9m51h5FTucRx0DL5PJCOlfRWxPFGiHRMeg/M8Uf4NlhpaH8SwM/11MvRLcMpNyQ==
X-Received: by 10.159.253.150 with SMTP id q22mr413209pls.84.1507251067455;
	Thu, 05 Oct 2017 17:51:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id o128sm259308pga.5.2017.10.05.17.51.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 17:51:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 17:50:49 -0700
Message-Id: <eb96dfefc160bdb993345a46db2e18c4990ced3a.1507250774.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <cover.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
Subject: [PATCH 10/10] openssl: Add support for riscv32/riscv64
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
X-List-Received-Date: Fri, 06 Oct 2017 00:51:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl10.inc     | 6 ++++++
 meta/recipes-connectivity/openssl/openssl_1.1.0f.bb | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index a710e9e25a..469775582b 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -135,6 +135,12 @@ do_configure () {
 	linux-powerpc64)
 		target=linux-ppc64
 		;;
+	linux-riscv64)
+		target=linux-generic64
+		;;
+	linux-riscv32)
+		target=linux-generic32
+		;;
 	linux-supersparc)
 		target=linux-sparcv8
 		;;
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
index 711a95985a..4517f8734a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
@@ -95,6 +95,12 @@ do_configure () {
 	linux-powerpc64)
 		target=linux-ppc64
 		;;
+	linux-riscv64)
+		target=linux-generic64
+		;;
+	linux-riscv32)
+		target=linux-generic32
+		;;
 	linux-supersparc)
 		target=linux-sparcv9
 		;;
-- 
2.14.2


