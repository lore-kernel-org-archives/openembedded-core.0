Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id AD7A77E336
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:22 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x15so986910pfq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9wpx26CNE5X7rf1M85Bsbn8ELj7yODbn0japkip6K3Q=;
	b=LWwyVYgzx+EB+FZeQ2DbxpSC+NqRjCvBycbfH173BtckWD8vg18w3u3VYm9QNpy5kG
	3z22bSWaqO81b+etvh7CkOrgrPPyelxDcLyCXdYc3tor4F43DakMh36ZZUU4aC+lPTgd
	S+/N4W+/k/yqes3KofFc3Ks8V6CkFX/5SLffZRtYRbjuO2Re3+qt9Uoq+u4coug5jeu9
	lQfmzYkENwoZCR6+/w/qrt0Qx+tuNhvVGItygJ2LiyQuJogfaApBOtPHgyT4M2IhxIdR
	L5MDgQswNzhOBaDYRqDMSPV7XS8uxAnUfODhZBm4XSpUGYcbVuZry7x650Sx0fdaC1R2
	NZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9wpx26CNE5X7rf1M85Bsbn8ELj7yODbn0japkip6K3Q=;
	b=pZUT0QgyrvcSu5SAkDlx5RXxDk+zp8Uy2hxhSg+DyAOzltS908bWPp3Ro8cFJyV1L9
	Pv/gal6UHO6h+3Cy2E0NfnxuPXzpG4ChC8psf4ZBxou2GF0F8Jl0L5YqFPeV1kx2NaH7
	C7yw8zoNfcYXwFhtGnQh7iW7AYM63gHcgISbLo3amznpMxgh0IKbWB/tBy1Be77gq/wK
	1jNLlR+mTkhxBmq3K5jPVefHm+ivJUuuOtQpVYabSjvQWKY1MrO+2S4ypq+W71McJqzy
	Eo3D6ovAhrSaO0XiAiwRSxLScswqOndS0WyFQ/pbKK1Pn6cnww7t/+/JUQs+HkZOo2Ol
	60og==
X-Gm-Message-State: APjAAAVMxS0gy+lv5HkuIyn4iGK5IOAgBaRqo2b13PMraVTZeKje9Ko4
	sQwokI7ZxUtq7Kd/Pp2i97VLDAfe
X-Google-Smtp-Source: APXvYqzo8V4dGdHmkzrSZo6j+9xhAqlNBPobTOHIgLsIy4SNTG/Hr5RmWqph1uHFMRJ8a3JCeEsXuQ==
X-Received: by 2002:a63:7ca:: with SMTP id 193mr11713874pgh.240.1559574443935; 
	Mon, 03 Jun 2019 08:07:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:07:01 -0700
Message-Id: <d2361e9bb6caf66cf6d492fc5957c601fd3f9e6d.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 18/21] libpcre: Add make dependency for ptest
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:22 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The tests are run from a makefile so this dependency is needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/libpcre/libpcre_8.43.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libpcre/libpcre_8.43.bb b/meta/recipes-support/libpcre/libpcre_8.43.bb
index 08314ef..b97af08 100644
--- a/meta/recipes-support/libpcre/libpcre_8.43.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.43.bb
@@ -72,3 +72,5 @@ do_install_ptest() {
 	# locale so the test fails if fr_FR is UTF-8 locale.
 	sed -i -e 's:do3=yes:do3=no:g' ${D}${PTEST_PATH}/RunTest 
 }
+
+RDEPENDS_${PN}-ptest += "make"
-- 
2.7.4


