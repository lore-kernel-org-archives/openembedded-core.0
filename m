Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4326A74EBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 05:04:51 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id t12-v6so10320837plo.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 22:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G30WIlZq/qxvf72N18tqsVBg+JIfkga0HX3X6t7balo=;
	b=j/fNPtMStu4X4UC0uuAgVWcbzosGia2sm4mL84OXn76hVPB6Pn99E+JrKhomaxICxe
	0z87myDjqvUoH6lGW0vl4a1GPqVYDVjXzOlvovzx/WMFyBp0ZRjl9LFSCO1u0Kp1Vs0M
	BhN10AsTUiEY/+buC42Bg9DtyvnzaBvo9xSnM+zcmSi91LvTN+lH1VlUMObRManmPTxa
	tWXxLnEL7DRq/u1jnjcfwdPiWAvuz9Svg9giCZPrXQAASFDZqxKLKH+7pIXoOExsOu1M
	XX8pDdr2C6KRB8ilJVf45qMnYbbhDinFfNPvwPz6Co8xDt9gb6K49RmD66dlnhzYXpF5
	QsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G30WIlZq/qxvf72N18tqsVBg+JIfkga0HX3X6t7balo=;
	b=mfhicQaqT1jQP3RnUUaX8ccCEe3dhvLIHNbmVPYC6g/15gnXQn7q8yABWl5Nt5BNHA
	oJG85wmsPVGC9HpJbPhgyO7lkpSCKSHN4Ol+UozfHTG/HEfY3vUHACeXMnU+gsyLZO7R
	rM7FYSDEZvBP/KeEmjrJypYcXpBwlJIz1kpcSjtYWQTFWGxnd6t2CNhaPx6NBg41lcWM
	OjuyyNQ7Igal1VujBcpsdB7nPas4uilpNxkHsl9gf7JUY760oBi3tNusWhF4vQ2nH8En
	xcv7Lsgy5/xXSgkqSN/yyqHs+Xj9SXaXgXXwURdaEAi9E20B35H5D6LyHB1fImAWQIg9
	rDgQ==
X-Gm-Message-State: ALKqPwdkwr56p6g3QhN2ZYuQEIuJBpf4r3GVH1KTtyrIZAT67m/OayDE
	sHcE6jNrTXbzqdbhPHA+H2dtJQ==
X-Google-Smtp-Source: ADUXVKLwHXQlc/dGLw1l2WRt4vaXexdZBcJamXdaTpYzRX2sE4yyKzL5kQhWJYiL/XRJuufsCD49nA==
X-Received: by 2002:a17:902:42e4:: with SMTP id
	h91-v6mr1330142pld.27.1527656692813; 
	Tue, 29 May 2018 22:04:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	l71-v6sm24952157pge.8.2018.05.29.22.04.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 22:04:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 22:04:47 -0700
Message-Id: <27e273fe5fe880eac584023153ccef33b65bf859.1527656441.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1527656441.git.raj.khem@gmail.com>
References: <cover.1527656441.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] gcc-runtime: Remove -mcpu=cortex-a7 when building for -march=armv7ve
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
X-List-Received-Date: Wed, 30 May 2018 05:04:52 -0000

This fixes conflicts like
cc1: error: switch -mcpu=cortex-a7 conflicts with -march=armv7-a switch [-Werror]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 72b8081cd3..22617a2838 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -14,6 +14,8 @@ EXTRA_OECONF_PATHS = "\
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
+TUNE_FEATURES_remove_armv7ve = "cortexa7"
+
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
 RUNTIMELIBITM = "libitm"
-- 
2.17.0


