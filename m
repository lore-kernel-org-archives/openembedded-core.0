Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 63C957F43E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:15 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id c3so6857112wrd.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=v5o+hq72CYizMPYJ0jdPqv8ke+EcqWO/+O/hQAQSUfo=;
	b=EmxGSTBILnFMVXwoW3i7zB8C/qmLM6rT1kcLqnTVEMSekaCt+VG015Absy4Une4FRJ
	FkE4/mpy/27zxV55inRr36FaTpM30XQZ1j+eJYVw/Ld0v02u8WEWe1gKYnzkvqoNLiHa
	c768vuArTUAZaVdQUfWfgC73/9z4Qv6/q2tVFOwkLPEU3o5xIYuHC7Aan8pDKs+f/PRL
	/zwkm0TVGzEgGl1AKP8QDyKOSBh1PSOOMsS3ApoX7aUSbCKKt2awnfNnuK4tjXpycATO
	Kz2i7cORVoxrFdMd+12QgOQt/pEssjPOB184ZAJ9+6WJV3h+h9TQBsOeuaakq5d3/cbb
	Mn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=v5o+hq72CYizMPYJ0jdPqv8ke+EcqWO/+O/hQAQSUfo=;
	b=EfKLq179jFbHyZeFmgTd8Fy2FdTioPwpTyRnlYd41YM44Bxxs89ouwQlgWoCDZSID4
	mofJJBlypFrMCKkKFqIW0xIsa7a5lveIXEEzsOfM68tirSJ3ir97QQUoVu8aJDu5V+yl
	l+pe0G+Qb4ISu/WUfBo8hiLDoBkkhUIlgBNS3/irSHrElUejPuOl7DFaIwy+llANaeXV
	Uotg42dOP1OElPuocyjDJxBrZ8UqCf1Ut7TXSesqqNoX6Qk1QwHUEeNvLRLDCmzyNzU6
	UtjVmetCNJDnx39w5ByoMxTiODjiaWWnS8gcd+VvBvLs9RTsmWJg+fIfYop51iKT0cE8
	aVMQ==
X-Gm-Message-State: APjAAAW1P8CSj16Td0kZdWx258griqJ/MkxOVbYIsWH3UFwKhAN3DvFp
	Y6XT688/MMZZrHij5isdFZfYnx6P
X-Google-Smtp-Source: APXvYqxQJpSEVu+nQzmyXABcToPDApTkZQ6ATHJ7Mum3UIIQF5SIwZesJwSS2UybrxGeHob4jKCG5w==
X-Received: by 2002:adf:a1c4:: with SMTP id v4mr17854274wrv.108.1567169415866; 
	Fri, 30 Aug 2019 05:50:15 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:57 +0200
Message-Id: <0cf33465c00370efbea3e747edcf7d39184122a1.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 12/13] webkitgtk: use Python 3 for builds
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
X-List-Received-Date: Fri, 30 Aug 2019 12:50:15 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.24.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
index 0e5ee5ba006..71082421688 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
@@ -69,7 +69,7 @@ EXTRA_OECMAKE = " \
 		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
 		${@bb.utils.contains('GTKDOC_ENABLED', 'True', '-DENABLE_GTKDOC=ON', '-DENABLE_GTKDOC=OFF', d)} \
 		-DENABLE_MINIBROWSER=ON \
-                -DPYTHON_EXECUTABLE=`which python` \
+                -DPYTHON_EXECUTABLE=`which python3` \
 		"
 
 # Javascript JIT is not supported on ARC
-- 
2.17.1


