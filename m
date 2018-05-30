Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id A802074EDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 05:04:56 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id v24-v6so10325018plo.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 22:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Jc1qT6yyOsHNpN/QJ6/f+/AESIH22e/gQyfL49oYEyE=;
	b=s1gFotiMBcKwVt4EyIMyzM8co62/k1oiDKzruvu4V0lk0C7WV9DA1DG05pgdXE6JOT
	Hp2hC++PuiKS1QOTJIz/JJz7HNJnUB88bysxerdFJZOaIHf73iukG3XUB0L044lYkeCl
	6UPVcDsbnP/CV4fi5Zn6V4pzqIjZ74Biq4U1ZC5qiS8IDYbzA9uFuPlUeW2MNrvpJXK4
	/xBIu2sF0fwuSoISAvNSXRWF0N+cvRBZOIC5LzX7noucKJ5WLjl0v+rBZS2rive0dvTA
	PCbWEN3ggm0IXYfsvmtcmyHkXBBogU77bbHzIFE4YVoP3NDAawiAkbMHIk75QEi/XVZY
	AHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Jc1qT6yyOsHNpN/QJ6/f+/AESIH22e/gQyfL49oYEyE=;
	b=iSHQCab+QArE8Tt2ZGK/vhHKQDjKAn+jQMKX7GdMJ9GytLNXeOSCTST5CfX8GJTQxJ
	IAfmtvVUmCW7Ac8g0PAhpZhygGWz0RawuPLIz+9PgPYnSJJ19K4feGV8GKlzktztZ7Ma
	oq2CxrXwkV7OVQb9W8xe0N7dCnxZytFUI3pNEJ3v9ENQE1ApW7HvbvbB54LVZSah5N8r
	kDoSLglOmuWaaBVP5fWbgl2LiQPgShOxxOkugn6RYFavAAjqf84oIvXPi5ACRfaptLzn
	/WNT7U+l1Q+50qwHuYjOMrnnfFI4Jb4JHu9jmwGGquISZWpAiARtHDGIDMQu/N3j8OI/
	qnVA==
X-Gm-Message-State: ALKqPweMuA5UAbfQu/kPFRNHuxVCf9HQl0bqTvQcI499mmXhqiNt+ZU4
	LKVZCqcYA+ic5+QZ9MuCB2HNXg==
X-Google-Smtp-Source: ADUXVKIdr/ze/GPuFOuskTCCg8oDLFrw0+gNhaeLuFLirXhmjDQYy98J1pYh8cUYnT8wrQVMbEO7dA==
X-Received: by 2002:a17:902:9349:: with SMTP id
	g9-v6mr1287863plp.375.1527656697564; 
	Tue, 29 May 2018 22:04:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	l71-v6sm24952157pge.8.2018.05.29.22.04.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 22:04:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 22:04:51 -0700
Message-Id: <e3286fa4b8927d9fd0373fec53d9f30a2e13bdcf.1527656441.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1527656441.git.raj.khem@gmail.com>
References: <cover.1527656441.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] gcc-8: Disable float128 for ppc/musl
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
X-List-Received-Date: Wed, 30 May 2018 05:04:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index aa3b53e64c..00fec0bb6e 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -46,7 +46,7 @@ def get_long_double_setting(bb, d):
     if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC') in [ 'glibc' ]:
         return "--with-long-double-128"
     else:
-        return "--without-long-double-128"
+        return "--without-long-double-128 libgcc_cv_powerpc_float128=no"
     return ""
 
 def get_gcc_multiarch_setting(bb, d):
-- 
2.17.0


