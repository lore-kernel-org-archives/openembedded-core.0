Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id AFED7786B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:52:47 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id d71so928402iog.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 13:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tZK+UnXgwCIEb0jZO/FmVH2aZ3EB6zi7K+yaEYmrR78=;
	b=IBULaa55ZnUKNwMhPzVcAVhmJCm3XxnZRHTdQzT8t0iWj/9xMFSA8F8lqZdo6vX2KY
	piVhPxZsP+m6aVJIhLrV7ySQDcS5CtgrxMI4Jpe/uUaxoMU1ivP7L8lCkMooSwW7it+0
	tZ3Kdx48Ro2FpMVx6cYEYGw3R8PT9xc1+ViUGO2+lIGca/BVrLE4/NOwrHH0Zdm76pYY
	FKmsBvti8CCWeQvdhMBnxpPQ01v2yzsQ+So9fHcebUbBY07y35s7YiIfPFZnr/ePoQk4
	vkq5lKwBk20jUQ6V/QhrVJaLTEZul9Mh5j8s1Heeff9Cc0MJu9vC1vD3E12kV6znHdmn
	YGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tZK+UnXgwCIEb0jZO/FmVH2aZ3EB6zi7K+yaEYmrR78=;
	b=bHLycTVfbbrVHdJPfWpgmcHorOCgiCv12hYCoSzDlufyPYfV/t0kLzOIE/8rJ/Zoro
	m02yg89Ik61qAGppm2n3vtrfKQO/jvelQ0z8lQm1aVZvSCspc8Cnj6QK4ojoLlVinwXj
	STtlQQFe4UXRQlV/f1WNrcVeCWYjpuYTCZs2a+OBUJmu5wsPcl9rT3eVZu0e9eHCGZMw
	dBgOzfzR8gUKFjCVrOlW7fc5b8wDeBvLqIh6S7rf4k9okMDUWDNRzhTUlYuXGrgcJQlA
	OaeVF27Gv5wm6OggVFq+ZKrnQDygpUsivW4Rq9WTcYkQOHDHDSal+kI9z1krFojgrrxn
	gr9Q==
X-Gm-Message-State: APf1xPAwvasRruTrQ86qqXgxBuFqbijsnrRgRcNMaGoq9Fd82DEc56CY
	inVhFCKXhqVF/N3C4dMZivSV7lB1
X-Google-Smtp-Source: AG47ELtzO9NJyCUmJEq4M52GcizuD7Yv9ICvNpw7b1JbDNR8OX+P26YxnYYOKDjLQ81EXNLR0vufLw==
X-Received: by 10.107.22.1 with SMTP id 1mr18289519iow.238.1519768368509;
	Tue, 27 Feb 2018 13:52:48 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	f5sm96798iof.13.2018.02.27.13.52.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 13:52:47 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 15:52:45 -0600
Message-Id: <20180227215246.30689-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180226223054.5687-1-JPEWhacker@gmail.com>
References: <20180226223054.5687-1-JPEWhacker@gmail.com>
Subject: [PATCH v3 1/2] icecc.bbclass: Ignore more icecream vars in hashes
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
X-List-Received-Date: Tue, 27 Feb 2018 21:52:47 -0000

Changing ICECC_ENV_VERSION or select variables that the user can set to
control the behavior of icecc should not cause recipes to rebuild

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 36dcfbe6048..cab64f52703 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -30,7 +30,10 @@
 
 BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_BL \
     ICECC_USER_CLASS_BL ICECC_USER_PACKAGE_WL ICECC_PATH ICECC_ENV_EXEC \
-    ICECC_CARET_WORKAROUND ICECC_CFLAGS"
+    ICECC_CARET_WORKAROUND ICECC_CFLAGS ICECC_ENV_VERSION \
+    ICECC_DEBUG ICECC_LOGFILE ICECC_REPEAT_RATE ICECC_PREFERRED_HOST \
+    ICECC_CLANG_REMOTE_CPP ICECC_IGNORE_UNVERIFIED ICECC_TEST_SOCKET \
+    "
 
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 
-- 
2.14.3


