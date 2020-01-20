Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 945D07FCA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:33 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d16so262395wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HgqIK6kiiQzBtFx6VqLSwm5tGt1uQWB2KRtnYp0z5zc=;
	b=aNOEFhrbdCrGmQP1dPXLVUYy6u+y6JQvMZ3MqLlHOxiCXGcbNUSSNuypCssV7PxdJ0
	2uvN1nk5AnxO8DKwtkAxp1gr2dZrYbqo2WQmOdW5lW03srF+Qz+VaVQqkD4zSOLhIlN6
	yyP4MbCGRapyy03wRDJWnwLxkQPqopzh5mdbAA6ICYmEUiE/nJL7cQrS81pdl6ZGPESi
	hi+0BkKQXQntE2oS/w3P//CWkORpDglonD15oBToOF4B3gAR+s10S9tSxX/ruH1qlyoz
	aGT4HItoniISU4DuHVo05/fJYTu7KCiefJABwzUZ4Hsx2EnNjcGjh3oMYFO8+hc5Wi//
	DkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HgqIK6kiiQzBtFx6VqLSwm5tGt1uQWB2KRtnYp0z5zc=;
	b=orVd5uk+d8Jvt2ls1BU6zkTGvlh8Kns1gsRmTwDLDuc/N9X5aPWNRgPKhg9DIcvMNd
	Yx+Tb2Byrmj5fs8UK4KQRNhqd8MBF5jK30aKd+grbiL4JDyI0zlFrZshDNPi/76cMc24
	+vp8FR6bkYJY5YNMAf+2yjY/2ZtVVx0E+oRKSrosVpU7ukhVWpv8SesF7w2XGXEHmk1Q
	dgmfJFNycguR8nh/dqZ0GfBeNujHnJ91yJeHRq2xO9uOy7/KrXy3CZWGpON+wc3BEEll
	5uDpebkM6PUOtXx6QhUEOTEsG0cKI6UOhy2DokmNGu1naBVyQZJsxXWohkLlc8Y8qQt0
	MJQA==
X-Gm-Message-State: APjAAAXnhNKoHlYwjABvmdYrQZ556kzmismbGlBiPTzYU026DDyfuW93
	Nw5KoSdHLUM8NpQLqFUgO+7C39Bs
X-Google-Smtp-Source: APXvYqyY2rRLfb7Im6M9XfDbOJlxdnQw6GI60qeH8Xbq4enAlt3eFrHAdNOjOmskLdmSAisH4x+9iA==
X-Received: by 2002:adf:ef4e:: with SMTP id c14mr589479wrp.142.1579541134288; 
	Mon, 20 Jan 2020 09:25:34 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:58 +0100
Message-Id: <20200120172510.22648-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/24] openssh: explicitly skip unit tests
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:34 -0000

These tests are already implicitly excluded by not being built.
This change avoids a confusing failure-but-not-really printed by
run-ptest.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/run-ptest | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index daf62cca5b1..ae03e929b24 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -1,6 +1,7 @@
 #!/bin/sh
 
 export TEST_SHELL=sh
+export SKIP_UNIT=1
 
 cd regress
 sed -i "/\t\tagent-ptrace /d" Makefile
-- 
2.17.1


