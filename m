Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id E315A61415
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 15:51:09 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w15so16681992wru.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 07:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mOMmKOZ3/iNvNDyisgiR/REMEfoX3xXvtPQczdXlF7M=;
	b=tScVRGsPQipeaK8g1bCMIRyNYoeNaFWNLUbPrKfIZKHjDqXhQ3QARaTgtrSIsuDhWq
	FMukYjKb8cUgT+HNCW+sKheN8oZJd9K75bI1KNMU/Nnnvkp0jAYz7E+uYckiqttL1n9a
	OdeBk71ig/p7gLloL2Hv1nBwZvOaRmYbb/HOsPc2ou0ftTGUnYUCmUWhXC7aeM20Yyce
	PqMY/V4vbFgXXtZ5/X6OdXkIXL5zUrAea515OIsmMftDX4pGJE2VCHFr2xqIwAWtduPi
	+LZvqWV9vu4QLHEGgnW7uS7ZYOEtMdTO2ZpiFu83YT0czrCzmXmi7esBJW7ZEYayQaNl
	+ESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mOMmKOZ3/iNvNDyisgiR/REMEfoX3xXvtPQczdXlF7M=;
	b=unWvcLS9owID6WspfRw/yRYJgfy3tXifmLDNxRhOeAtXJz7XXsxo9awk9W2YUExRal
	aN0AfEnBTwzt7sl/IvlDKynRqUY05wRjcaLAxRk9EhmpGJh9YTbeUcmSWeeV+io5QqGa
	uepURJVsWGkNTXrgY3IE3g97stafsgyJBbZ2Yd6EbxVFCN1rYX9JuYvLVDO+jagEbqIh
	0SH90vouolCE6FzkHld81+nyRYhrk0TEGrA64O/OBNp+SyaxmpcdwLiAlclDU3Czl9Oq
	etT++gk0hEpK9vjacg/bDOOJWxhqjB0nQEBhtmh3xPcm5+XaS+c4HiKGPfcJ4AjMWSbs
	X7Wg==
X-Gm-Message-State: APjAAAWZxYCVT1AyrFvN4DsaDD6IgUfALdlRU8ej4kBDcakerKOwQiGC
	CfcID+pf1KVlq+f5CCJX5mf1UfDq
X-Google-Smtp-Source: APXvYqxlHbWhxdz4dHPJzZjrsXnr48GXiP6veHHF68bR9fMvmuPxGgx/UCSZpvSGiYzFcaHHjjCVPA==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr16172523wrp.321.1581868270393; 
	Sun, 16 Feb 2020 07:51:10 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	t81sm16513271wmg.6.2020.02.16.07.51.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 07:51:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 16:50:14 +0100
Message-Id: <20200216155015.21738-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216155015.21738-1-alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] ptest-packagelists: mention ifupdown ptest in a comment
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
X-List-Received-Date: Sun, 16 Feb 2020 15:51:10 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 0a13bf0a6c..23865ac3e1 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -57,6 +57,7 @@ PTESTS_FAST = "\
 #    lz4-ptest \ # Needs a rewrite
 #    rt-tests-ptest \ # Needs to be checked whether it runs at all
 #    bash-ptest \ # Test outcomes are non-deterministic by design
+#    ifupdown-ptest \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
 #"
 
 PTESTS_SLOW = "\
-- 
2.25.0


