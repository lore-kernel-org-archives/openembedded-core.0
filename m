Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 14F077F88B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:43 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id l35so7210603pje.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kAhcOfSt51/ahjEQBHTbPIw4lzfhmFqgnOlNBWGRvEw=;
	b=s7H25p6ZUGUh8kpiHgjR/uUERI5njosnQBx+Z5stsW9K/34GfTp2jcYxtzzlXEAR2x
	MslYaiW23TsWwe7D9cGfF7x2ZGRMAoNv6+O378b0B6gb5DzGJr4AsLL7rft4FMOTYlL7
	TFUQNYuFURXIIFvEjWZiieweO4i+QPJYB0HIo/JFBI2sul+HXZYTFkjKuNLLRWOKjYJR
	oriUHFFzYG3rKbk2RzQvP/npLsaOmvZgd3pRq0Lp4q+dgmNFnQxZkksc/hNiq2fTT1Dp
	kuuweWM9NDPGSmQpnFLgcwVqyp2o2FkVfUJzuXJGheTuIC6eggj068t6c7zuj9N8cIaU
	ACow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kAhcOfSt51/ahjEQBHTbPIw4lzfhmFqgnOlNBWGRvEw=;
	b=pCeI9+TgvEi8srL8aCQ7J2G4Xh/3FkYDjQ6lOq7V9iQ8GADbWFTl61nuTOEicxTXw5
	3KIvGTw1Bmzp2wvBMCYtmitfY64YA7z8afysKjpAtvmroVmZ2qYqK2TVNmFlUTekJcid
	ezm1/wp2KxP1jIq3H4iRisgFvGYxf+vv0LcEUMZvXEnZism8ZhUCsR+2slNWov9jcwGm
	4LFfHrPApf2cpBxY7NJ6qKOhFPZNcl6WxIS/zfbMsgM8IQs5fr5C6QLR4/9MXjhqGiDh
	vPED8dmXyQO9hTsSu41V9yKcW3nkXu07Gk0KSJb7kZFUAQJh0PaUEsNwBH82KpwSeEIB
	+sTg==
X-Gm-Message-State: APjAAAWjUGpkhfRLOJlyn3OBKX2U3x/BkMNBkJhWR++Oklk036m+NqOP
	QzheSORgxhQE0cNTgLyVD7aKLYTA8U4=
X-Google-Smtp-Source: APXvYqxC12BWCvYmPNa8BWmQPiHJAX65EBMKf+SUu37as1TmvK06kHcsc4c4qSrpuhdI/9bqU7dhdA==
X-Received: by 2002:a17:90a:2808:: with SMTP id
	e8mr40935531pjd.63.1577645083842; 
	Sun, 29 Dec 2019 10:44:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:15 -0800
Message-Id: <20191229184415.19514-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 19/19] pango: Disable Wimplicit-fallthrough as error
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:43 -0000
Content-Transfer-Encoding: 8bit

Clang is quite a lot more stricter and ends up finding more cases,
these are code format warnings so its safer to disable them here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/pango/pango_1.44.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/pango/pango_1.44.7.bb b/meta/recipes-graphics/pango/pango_1.44.7.bb
index afb56a6cde..0ee8abcc09 100644
--- a/meta/recipes-graphics/pango/pango_1.44.7.bb
+++ b/meta/recipes-graphics/pango/pango_1.44.7.bb
@@ -32,6 +32,10 @@ PACKAGECONFIG[thai] = ",,libthai"
 GTKDOC_MESON_OPTION = "gtk_doc"
 GIR_MESON_OPTION = 'introspection'
 
+do_configure_prepend_toolchain-clang() {
+    sed -i -e "/Werror=implicit-fallthrough/d" ${S}/meson.build
+}
+
 LEAD_SONAME = "libpango-1.0*"
 
 FILES_${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
-- 
2.24.1


