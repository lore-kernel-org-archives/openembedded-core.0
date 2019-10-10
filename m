Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31B207F518
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 11:19:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y19so7402552wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2QHOmJLBSZDN8U4tdokZPJ/7C7SskPVpyG2QNN/E9bY=;
	b=AffvvMT+LdPpxSkw+2zsts5OsYVSwGBMsajiSZYsjMiZ7HvNcCOSwNycq4pmxuCB5/
	7qmnRV5slG2XioU4OkjwENp/WwIuZfxgerKP8jpch/VBSfZWTZ1Dus5bLoBbe9aXsMOp
	aLPpQnz6PSdFnVfKf6P9Q1InoO6p2sAuuF8eVKxrAY3+q+Tkx6BWwqdFGCVBnAMm2iNJ
	qQmlg8ui+QoYWXAhAND3rn4+Ey65sugPqOOQfCPEW8GncocSCtMKwy52+DF4vKEnQfeZ
	EEGOCOQKkk3LgylU6XNCrgyL9IA8aANmzycqbfSVNWDzC5DO2tpDwUlfdwVuEEUVQS/I
	T8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2QHOmJLBSZDN8U4tdokZPJ/7C7SskPVpyG2QNN/E9bY=;
	b=ot4HGUqfTQijXxPJQ1nkUE8WXLw9XOi0QVaisJ7BOWkGRNL6RAmiMQvOKpVRLbTtbc
	9risbZnA7dRbVjYzZ/xUqjWvTbvRpe9CgyFPtPr8aobTmynHfY6eqP547UNK+GbQqgvL
	IfkFPaaEMcTIPYwNlhxif6UvVADQ/M4ezXB4Uc4RQJjNOUtGxJsjszVtSXGYmc8FvSkc
	e6RzyHqal6krJ28GWAHN0SlCrYevcdviSz4oe5Q5IHR8bIuqc5dRBgBc1w+y1d7N1i1n
	emFNaM5LjuCiYoyr0m80by6rKXDgaXc/zuOBbz6sPKPfqtCrY694+5+Ce44Ut7J/aWhg
	7nIw==
X-Gm-Message-State: APjAAAVxuPCLYqfj15rEbNuOP1UdlPaI4rx1oFrtXt/A7onAlseBCn9p
	gSRm6NGZ0PGbv9VBmIHfGODqJkgXdcU=
X-Google-Smtp-Source: APXvYqyxnQG87bJUQxJYF9ofodeLcyaRT4gSFZRmufOiN6wLc7/3EYlVq2AM0vHGVQ3wZdm0loujdQ==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr7759056wrs.243.1570706340857; 
	Thu, 10 Oct 2019 04:19:00 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l13sm5831372wmj.25.2019.10.10.04.19.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 04:19:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:18:46 +0200
Message-Id: <20191010111848.3825-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010111848.3825-1-alex.kanavin@gmail.com>
References: <20191010111848.3825-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/10] elfutils: do not depend on target libtool
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
X-List-Received-Date: Thu, 10 Oct 2019 11:19:00 -0000

This seems to be entirely unneeded.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.177.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.177.bb b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
index 78c3791936d..818794266ce 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.177.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://sourceware.org/elfutils"
 SECTION = "base"
 LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "libtool bzip2 zlib virtual/libintl"
+DEPENDS = "bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts musl-obstack "
 # The Debian patches below are from:
 # http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
-- 
2.17.1


