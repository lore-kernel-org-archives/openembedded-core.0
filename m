Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6907D39B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 13:18:25 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b24so3092498wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yxHCnY6F3VTwKHMS4HH3+pCQJzYHGmxGl+ySMnBA5/o=;
	b=rjq9kjn/azJIrusbe7ja+K8Goy+dwAM+MJkYCl9B/GuMiMi8lCUlnyClMVlHbSMaQD
	FDQtKIc0QM3OgXPzG44fYCFVC8uBMKw2kPEZc3fmIhG0KiD3ysCkxtMSnKf/D/roFRh5
	1+mORkJHznNNETaueLcpTzemYlba6mtvINlM4lwHKxSXus++wbdh9/lqA2LaowpmjDWG
	TxhcebAaDwGZ04mjlf1seU+FbuySgeBsWdDBSeDhqGNx2dOkRz5zBWuzWDkxXeRU/9Wi
	xMJUcoQFYjgt01OrqXcwbrYCK69o78Ixz9OsYNibqBBE5rDEu8DGIor798gqN9NqXLnt
	ZzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yxHCnY6F3VTwKHMS4HH3+pCQJzYHGmxGl+ySMnBA5/o=;
	b=At6n6jd9bnJ3UqEoRBcEQqFTSETalHMQkjGgz2HJMBXLMePd9/H7aZdOTC7EL5zTPa
	i+qyN0PmFgCkdC1Hpy4k8om5h+vGuDxgD4UscY3dCPW83b5nix4+ojgPL07HYvjhvFGI
	1t1QymqcG/pvKUK7tA/CBWqKhOoluyT9eAx5AC48hfZMqazG67jdH7IWPef73LUJs6/m
	ftSspzg4B7lnjUGuLSGhcYI7BspcwuRvXIFvVkp+mwLlBg85IKEyM69gyolsKphQ0kDP
	MQ4TJ6H25/m+Fy245b6eaZ/TlIv5Ej7uCf4O0ONGwCXcLKt89qvZJnuXYalU8LZNOsVn
	s2jQ==
X-Gm-Message-State: APjAAAUkcScunerQcmmhCcazUT+mOmTZ6NL7FNH44CYQgCM+z/82qo8l
	jISw8YsRU39PxyCFiTbL3fNID0TNRXw=
X-Google-Smtp-Source: APXvYqzhznuhh8DsRokBC3DiKZNbPc6Z3hxbnoV+nVkxZ9E0IITEuhdaC/3fN1uRR8ktYySzbWVZrg==
X-Received: by 2002:a7b:cd13:: with SMTP id f19mr3575727wmj.4.1570540705968;
	Tue, 08 Oct 2019 06:18:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o18sm5148480wrw.90.2019.10.08.06.18.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 06:18:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 14:18:22 +0100
Message-Id: <20191008131822.22701-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pango: remove obsolete libtool FILES
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
X-List-Received-Date: Tue, 08 Oct 2019 13:18:26 -0000
Content-Transfer-Encoding: 8bit

We now build Pango with Meson which doesn't use libtool, so we can remove the
FILES that packages up non-existant .la files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/pango_1.44.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango_1.44.6.bb b/meta/recipes-graphics/pango/pango_1.44.6.bb
index da7f2156dca..8138ef72c16 100644
--- a/meta/recipes-graphics/pango/pango_1.44.6.bb
+++ b/meta/recipes-graphics/pango/pango_1.44.6.bb
@@ -33,10 +33,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 GIR_MESON_OPTION = 'introspection'
 
 LEAD_SONAME = "libpango-1.0*"
-LIBV = "1.8.0"
 
 FILES_${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
-FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
 RDEPENDS_${PN}-ptest += "cantarell-fonts"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-en-us"
-- 
2.20.1


