Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 774FF79C4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:46:22 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u12-v6so20009849pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I98H+jZWEef+b1nr6X/i4SsZ/rkZt9KQxCXG0AjvmKM=;
	b=WY7QG3ouHJJ2lwZJYjyn0UCcfPQ0hrp3zTIugbJUTvZ2EEutUne8XOANbtOOD+VkkN
	dhgDXklGCjqzfFr0VNyfHP5msfdBU3O2Ab22lARxGjw0UrmQrWv4oR436kWb06IuW7zl
	ZF9TKMkPlUaUoCrj+eaDC1N+6kuv4qlXExLyrcrlDlZ1ETI2Mzuim9Mo4BBu4YvM2VeV
	t4NcBlBrzDaKkYr/eTT4udjRqFroohEZXrUn1eJNU9UvWUBF53mQnVUqnMSB8siwURv0
	cXTIu8ku4BL6TT6gGqKO0P7UBGjE5WJdUHVPYY++K30qLWiUJPvCB0E+5UFJzDGGYMFd
	0X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I98H+jZWEef+b1nr6X/i4SsZ/rkZt9KQxCXG0AjvmKM=;
	b=mz3xUZQhn+P1CXZsXUhZTJfyWZDuOzYghO2JwKUyWEFI8n8R8ZS6f3NFlnFl8kVlnE
	j1p2gogewvLZVsywJSMeovATRij/WUPnHIKNFjP3D+2mBQDgpATXBT3HF6mG6GhJPsTP
	eKB0psi5X/nALx8SNvI84X/9ox7GtJ3fuAEN/82nlVaTGzSxLKoVo7TfGCVvPob3lehc
	KV0O3tHLkdXt5H6cBQQF36xNX8K+FcPRiCCKHRMHspN23Kg98TrZmyLExSp8hI8xz+Fw
	eI4+IA6eCbxOy7CJKKMz4ERpY078FaV+xseoAYWHxrSfIXqut/o0jdjWQRPXVdsGgbul
	WmsA==
X-Gm-Message-State: AGRZ1gKl/vPdQFQR0HsvyGafnMUUNdaHeYl1OvjcNAKaOFH/zMPmXMRc
	/7wrHYn+BHGTsmU5h8gBD3bAuxFTNQioqg==
X-Google-Smtp-Source: AJdET5fKOixzXWoXAMF9AJbtqp0ZqhxuKGXTmnejg1MqSmKWsZ25juleNuNlO9gFXGIpTOwKU8VW3Q==
X-Received: by 2002:a63:d849:: with SMTP id
	k9-v6mr5985687pgj.200.1540219582716; 
	Mon, 22 Oct 2018 07:46:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f239])
	by smtp.gmail.com with ESMTPSA id
	k132-v6sm1904980pga.28.2018.10.22.07.46.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Oct 2018 07:46:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 07:46:05 -0700
Message-Id: <20181022144605.37541-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] glide: Minor update to 0.13.2
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
X-List-Received-Date: Mon, 22 Oct 2018 14:46:22 -0000
Content-Transfer-Encoding: 8bit

Fixed ptest issue
vet config not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/glide/{glide_0.13.1.bb => glide_0.13.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/glide/{glide_0.13.1.bb => glide_0.13.2.bb} (98%)

diff --git a/meta/recipes-devtools/glide/glide_0.13.1.bb b/meta/recipes-devtools/glide/glide_0.13.2.bb
similarity index 98%
rename from meta/recipes-devtools/glide/glide_0.13.1.bb
rename to meta/recipes-devtools/glide/glide_0.13.2.bb
index ba076d2bb7..3a32fa1af1 100644
--- a/meta/recipes-devtools/glide/glide_0.13.1.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=54905cf894f8cc416a92f4fc
 
 GO_IMPORT = "github.com/Masterminds/glide"
 SRC_URI = "git://${GO_IMPORT}"
-SRCREV = "67790b3dbede72cfdc54aa53be4706322c9499e0"
+SRCREV = "9ef6ca313b3200079861f2de4e567b1d22081d19"
 
 inherit go
 
-- 
2.19.1


