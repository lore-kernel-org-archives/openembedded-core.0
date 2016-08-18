Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED7F176988
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:15:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i138so263399wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1k5LGL1mIuxe5R1vOguD4mAnVbb+JnMx5+NXKBNOTk0=;
	b=jikkm9IqgNTyYCLUirTGE1iNWupXg7K7a6aTeJDghel2JeiPSHVQkdJb9c6OC6X5PW
	0ZvEIYCNXzmi5E/9/EtfvyXVvvvCRntU/hG8V0uQvnyW03Zw+Pyr9jrExPwoE0AcXghC
	f76FEwREhI/tqIG9u/grVf8Cx/YvK1AdeorF5ZStBAis4k5MMRpfik1GrJ91hNgiavjk
	6RK0MHCDd8p6TW7hBlfXI9ZvTG54afxCTxYBL0B260fpvU1oXEXw9wYg9mrRywsa73ej
	6xt5eRkEyhFV7/1hWnH9zYj/+gZKk3TVvUF3Obhp7doGuF9KlxpfWeVAmBP8CSwVoy+m
	ceHQ==
X-Gm-Message-State: AEkoousNTVvnp3dplKEh+AT/PwtVH7g2AFgPpV6m5lf0AXkPULRGr7RCA9wgZLgIbbKqMw==
X-Received: by 10.194.236.68 with SMTP id us4mr2680400wjc.12.1471536907672;
	Thu, 18 Aug 2016 09:15:07 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	al10sm2921327wjc.12.2016.08.18.09.15.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 09:15:06 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2016 17:15:02 +0100
Message-Id: <20160818161503.20738-3-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160818161503.20738-1-git@andred.net>
References: <20160818161503.20738-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 3/4] gettext_0.16.1: align configure options with v0.19.8.1 recipe
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
X-List-Received-Date: Thu, 18 Aug 2016 16:15:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It doesn't look like we need any of those features, so
let's disable them explicitly.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 6710c8d..93f5fcd 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -32,6 +32,9 @@ inherit autotools texinfo
 
 EXTRA_OECONF += "--without-lispdir \
                  --disable-csharp \
+                 --disable-libasprintf \
+                 --disable-java \
+                 --disable-native-java \
                  --disable-openmp \
                  --without-emacs \
                 "
-- 
2.9.3


