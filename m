Return-Path: <misla011@fiu.edu>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id DCEB87FD7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 21:37:04 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id m15so6351432qtq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 14:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=r1hemERMcghU5AjKvhPdA3ZthhM2wUcZJ+PFS4eS0/4=;
	b=Y7YaL2XjqrzoSxyzMiyrQUzSFlqQiX4cLkAtUtpVtmMpUb0/EK2lR9gd2/FsxtD+UA
	WGPtKxpHdZ/3/T+Ng0pVH6i947GF2UPNdEZEfpbDXBUl+9CAt0lXE97dwmvNDRAIag5b
	e8V0HeNOZmAeLoKhvQ0/tcI67eqtAze+HOC/5efAvsaEuprXR0CM8b0OSNfA0G8JOCwN
	X0+dFnJoqoFtvFZUhlUj5+INix1bF5CtlTEQBkjvARTvCHdJdQOVu5IunvtklSOKtjom
	7Qgw244vPgwmsvJWxTDqlSG3GTELiMH26XtDor+NkrFNSjFtxT0TFcn6/AJrRCzzHAsd
	no/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=r1hemERMcghU5AjKvhPdA3ZthhM2wUcZJ+PFS4eS0/4=;
	b=hsziEheJEfuu7KvqYU8hOtRBhsYEtBBqT6zKEB1Jeuvz4LyidLLsSuYw3X6FsWhitf
	dyCDYf+g+Z9jALEc2tiQTD4aVKrthGCKvagoZ8fiaQUWaX32WepNOXoYUAj9OXMKkhYF
	T39O9EK8SbIg1dMXscitI6lVy4/cPFquqN6PoTYN7RtorrvhcdSo74wZnbVlyo1Ef5Bw
	o9SLTv5FmYvH7cxKlS/KBL44GZiaPyThXElP5Q2UmkuRRv8wDTNk8l2/1c4CuzdbkWEk
	z4cNNn8VHoUGlYBJOsvgYf3+Tpp27F2pqpivATfrdlwLoyVZSb2UC9D3crXL8k0RiGqq
	LBPA==
X-Gm-Message-State: APjAAAXngeOWjBzNMZFCqwdRNyQGPx5Pps12t/Y3jMAy7VNmFTy8Gfc6
	s1BWcZtlbz4wbhMWX5Pl4fU5cX/8R3Q=
X-Google-Smtp-Source: APXvYqwyO+i0U/P/+1G80CKTAqJCm34VeUYq6T8TSbU2C8QeEK8E7oJnTZ+kUEBSP2kl3ZTxs+OIXA==
X-Received: by 2002:a05:6214:c4:: with SMTP id f4mr629262qvs.111.1568756225242;
	Tue, 17 Sep 2019 14:37:05 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7]) by smtp.gmail.com with ESMTPSA id
	x59sm1857929qte.20.2019.09.17.14.37.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Sep 2019 14:37:04 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 21:36:51 +0000
Message-Id: <20190917213651.51388-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Reply-To: muislam@microsoft.com
Subject: [thud][PATCH v3] gcc: CVE fix for gcc <CVE-2019-15847>
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
X-List-Received-Date: Tue, 17 Sep 2019 21:37:05 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 meta/recipes-devtools/gcc/gcc-8.2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
index 866a77558b..65fd29d943 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
@@ -70,6 +70,9 @@ SRC_URI = "\
            file://0039-Fix-for-testsuite-failure.patch \
            file://0040-Re-introduce-spe-commandline-options.patch \
            file://0041-ARC-fix-spec-gen.patch \
+           file://CVE-2019-15847_p1.patch \
+           file://CVE-2019-15847_p2.patch \
+           file://CVE-2019-15847_p3.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
-- 
2.23.0


