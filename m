Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2BFD17FEBE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id w5so1247183wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mvwpNdoCsNDhUa5Gg4yMiU7wxIYixq5RXDH0EamNoMg=;
	b=dYNNf1tWEfSY2wqyreb3INnuVnhMnrvVQKOvfDiNslnP0MCaOGwvUwZYsdy61wqCLK
	zyjRb8oqsmWsP78T81kLYo0P2m/Ry9jHulkXCeGXZARp1De2t+RZ4wiZknFBJXys8U+P
	/YT3ekiAv0Wd5X19Y3LJQPeTCjPg9X6VcTBEo43B6H9tfPmrrl2Y4cPlEnQiOprLWuNe
	yEkMZP+bLxJDe+P18yi1oktLZ8xShTnJidYni/QrTwWUoMJOu/eiwpwXjTcYGgPTdOp1
	Xw9nvH0cKZzTB/yHHFOlA4ysYbSKvGHiH1vpBVB0p71WQkfY+s1GliOIkCvNt1I1BdJz
	4ZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mvwpNdoCsNDhUa5Gg4yMiU7wxIYixq5RXDH0EamNoMg=;
	b=tL8/hgaNGe7ZS3FOzfGTBJwjJ1PVYrQ5wNMbXn4Hf3m9jSe2cEILe0xap4+Pxt2iwP
	MzIWpOnXujcPk/kiqcpdyQnvyIg7mjVA0pnmrxnrA2TbCsOwuKG2M1MMgjOALwpOeIwI
	lhxpcGgWhfd91mxHC89EGSJKMqDS9AqfqgQnvpzcbw9OabwDR6QU4kmzjQl06RDQFYm4
	C9JohTucCwaJ6sWo9vlkNSB7CnIYT6hln1kBWPaaNJSQAk5wLSgFqGog2tJMDzYpviu3
	MeCaE6CQoNbIf5Jf4EI8YX2Qsyj/NWyOS91EuEBvN8GwLZ0pRKk2WcxvnXanu0B+z4f0
	k0Lg==
X-Gm-Message-State: APjAAAUeBLQMLzawEkcG5QEWjHEQA68CqhuC7RDJrUa4WcE/Z3zcl/2c
	Gf6NCOnT3Vr0NFooIju/0ToVsTV9Lh8=
X-Google-Smtp-Source: APXvYqxO/rbcIesl80RgWULgIT8M1zeQp4S8dIc8S8NXpkpoxcuLet+hujUKtn90afgeVzVes4gFYg==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr3855685wmb.81.1578490109024;
	Wed, 08 Jan 2020 05:28:29 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:53 +0100
Message-Id: <20200108132759.95603-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 22/28] gzip: do not pull in perl-ptest for gzip-ptest
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:29 -0000

This significantly adds to the ptest execution time and isn't
needed, as all tests pass anyway.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/gzip/gzip_1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gzip/gzip_1.10.bb b/meta/recipes-extended/gzip/gzip_1.10.bb
index 50dad7bf58c..9778e687e1a 100644
--- a/meta/recipes-extended/gzip/gzip_1.10.bb
+++ b/meta/recipes-extended/gzip/gzip_1.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 PROVIDES_append_class-native = " gzip-replacement-native"
 
-RDEPENDS_${PN}-ptest += "make perl perl-ptest grep diffutils"
+RDEPENDS_${PN}-ptest += "make perl grep diffutils"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


