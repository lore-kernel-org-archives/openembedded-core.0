Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E33347D735
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y3so13496490wmm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+/hvThw8Q7Sk1Lpt3E0FaG+nIPlginPE/xhswSLUKSQ=;
	b=QOn2r1ggZ4ExAubn5wti2agxgOaCW9rO6AXs7UxA5zKX9DB9oH81LWat44xaDUZedW
	3UJg3pH2BXkMqlyf83FhDe3yYpUGgzKJnjtD9edCa9BY4DEc0LIob/O1FbJ66yKWehPb
	KMvOamc2+OGUjWqBr9FEmaBXk+cvJGHZgGa9nCgr9rj1ZvUKi24L9ED7mtGG44uNyrqG
	nLlpAJwMf7GWwDiXTbeLgzTmb35Edlxn+f9pxdh0wB9ERjed2p2Bocp6VMRrKnuX7M8e
	rMQg+VGkgCXguXZeSLK3CR02KhvecI3JVbzbvV2tbHZx0BvQ0/dDvxI7NCJhLBLzUfgH
	S0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+/hvThw8Q7Sk1Lpt3E0FaG+nIPlginPE/xhswSLUKSQ=;
	b=gMUhpRK7m71uRoBzrRjGhgukE3A0I2lt0kaKURwlqi64YCxT8PcDe97p7/8rMi+cE3
	bKMgIPNoCcWLN/uBth3lPl4jcHArkzqkCGL2itjtrFFtI1y6XQqoIIMMOuHaqXa8eJso
	PKL0G+CH+/6GW5Eehg2wjt7nYsJgBnk8r+SV3rDtiUkR6ZC3SbNWoyumr4aIyAHq5lvz
	P0NZYugD1pYy+vUu/NeiW7kGed3aj37Uc5yi/hEgmuFhtmPkxU4Z7J48Z9OJsXwig4K9
	e5L3JH+gyZbbyxzeutYzRIqniGLqwqAYQTWbVbSPNUaR5sfGhXDUnfqi6talhE2i7O5s
	cNPA==
X-Gm-Message-State: APjAAAXJJx0Sz9T3VsX35FuQZh1yPeXTxO6hYf5NcoTDHbeot6ocL982
	5xDQx8DziNJyPzikbh4xKgWlhqFF
X-Google-Smtp-Source: APXvYqxglsRJq8Vde712iU92Fx/V0mM6XysxQgKDuwP8HBpkXg5jzODtkJNtWtSNDbz7jpYBShyEow==
X-Received: by 2002:a05:600c:21d7:: with SMTP id
	x23mr12749979wmj.87.1558361496337; 
	Mon, 20 May 2019 07:11:36 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:47 +0200
Message-Id: <20190520141125.10805-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/42] createrepo-c: upgrade 0.12.2 -> 0.14.0
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
X-List-Received-Date: Mon, 20 May 2019 14:11:36 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.12.2.bb => createrepo-c_0.14.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.12.2.bb => createrepo-c_0.14.0.bb} (93%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.12.2.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.0.bb
similarity index 93%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.12.2.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.14.0.bb
index c70523dca66..2a3007c38df 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.12.2.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.0.bb
@@ -8,11 +8,11 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "5b4c06f6af24633f667da37455281f24a4abd461"
+SRCREV = "8cffea9751b14366a7f6f3664f5d39fe4f0f9253"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
+DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm libmodulemd"
 DEPENDS_append_class-native = " file-replacement-native"
 
 inherit cmake pkgconfig bash-completion distutils3-base
-- 
2.17.1


