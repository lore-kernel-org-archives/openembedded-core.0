Return-Path: <raj.khem@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id CCF7577EAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 23:47:58 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id d72so6097552ybh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 16:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TtB+fFe7FAiw8Ov0sn2DyOhr1oFkGdYAQk1vTvyKa/I=;
	b=oVClK/ntU6EwgGUeR4N3hWUPyayrZwf5Pfudm3NI/FRatwy1yIOw5THbOpDmDpXzWz
	18kdJC8yqEDHlTaH7l6mVUiSOmx347YnKDc5eNLDDbIllQPM4tvxHszWrtEoHFugIN2/
	70giZ0e72WTClGd5NFU4nbfFfx5iw5qem4GZtbANg6bTC2WBI7ysVP7mva/00xPvWjBd
	QdjEIrxiM/vxa9udZFl7aJQiuY1UpileYbTxepI0ah8Pvks54DmdXoUXCtwU1AWANR8P
	nHMfghTK5srlHpJYdeRxxVnUvLPvRCPD7X0uGUt5az+abg1QiaY0QBdfdY/H9Elv+KTU
	vI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TtB+fFe7FAiw8Ov0sn2DyOhr1oFkGdYAQk1vTvyKa/I=;
	b=B2AgpUu/zkCj641GxfxTOBPjW4HvqvFjhjtPQJNRLE4WOj4GPPqe4dz2DuVu/cbAOi
	1f3S4xiXXvDPQPHEP9xD/lVT7Q7JZrZbf+85/NdnmFwDYfgzwlR28IOgmTQi8952nEta
	Eqj6tdYTcGjgCcJiYlxXtip4jdTMgMmXY09/lfA+YCOP9RJq7Fu+rrV4hoMAuiS6P8Bq
	n4VWQhuCDRwoNoupdG9x1v75feLXBNxcMv8yauL2iSRNNb0GeQhyK5t3ABAWl0iS7ZWx
	qzU9oJWV9EWYSKf4vHQrNa0EoQxZq6fi51yfMX2BfnnQuas5OQCt5NxxnqQdeWTps4tN
	BhdQ==
X-Gm-Message-State: AODbwcBBvEHcNHRPJqytjSYkCewRpup1CLN1OGOF3xWOX6M8cuyyIfAS
	hrg6C8AoEiGLIw==
X-Received: by 10.37.195.65 with SMTP id t62mr26243413ybf.35.1495583279994;
	Tue, 23 May 2017 16:47:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id v19sm975325ywg.46.2017.05.23.16.47.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 May 2017 16:47:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 May 2017 16:47:43 -0700
Message-Id: <20170523234744.34487-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170523234744.34487-1-raj.khem@gmail.com>
References: <20170523234744.34487-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] xkeyboard-config: Drop explicit dep on virtual/gettext
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
X-List-Received-Date: Tue, 23 May 2017 23:47:59 -0000

let gettext.bbclass provide the defaults they
are good for it.
What it needs it a dep on gettext-native for intltool-native
which now intltool-native expresses correctly

Helps compile when distros disable NLS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
index d00904df21..168b840939 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
@@ -17,7 +17,7 @@ SRC_URI[md5sum] = "1f68886339116ae3877052204c9b9b88"
 SRC_URI[sha256sum] = "d1bfc72553c4e3ef1cd6f13eec0488cf940498b612ab8a0b362e7090c94bc134"
 
 SECTION = "x11/libs"
-DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
+DEPENDS = "intltool-native util-macros libxslt-native"
 
 EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
 
-- 
2.13.0


