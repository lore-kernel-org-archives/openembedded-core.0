Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id CF95F7DEAB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:21 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id l132so8416366pfc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mZlApnSFmklGS0Tg1vOnunRpYMKg7kIS06Px9ZzTQtU=;
	b=ctqI1W5ibHAKb5A0VVQa4NTZ6fxOwePB0+UuWeCTeOefocTrMHYasbOBQG1dHkp7wy
	ulpiNQeEmGb38QWRf7PmdIJjar8MjWCWI8t5P+SKVqEvMKTeL8KpdKdcU1t3Y591/gRi
	JVbkRbcWOPaddJ5c0fJZBF00OqfK0OVXuKoc8RxAWK6Xiecv5KaEji27tzEe/Q9sSpNA
	eDBTYVL8hhGPfVBP307Rk8sZfrAEV0+Xa5t7uNbMS2IZX2eMlvPa6/mXjzBikunvp4+5
	8nffjIKTPLldde+RDT8PvUCN28SaJH/+vX3kBhD00fRWZWYmXGDA31LPAwWGdrDSDd/q
	Xing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mZlApnSFmklGS0Tg1vOnunRpYMKg7kIS06Px9ZzTQtU=;
	b=aRiTpVXffA2FsxcWfKy8+2uIkvV13pifdFWa7q5UNRBwcUv8KU9EUGwD10nNLEwfTO
	UBz2WQFn7dJ8lrNqfDbaLYMbum4YQbQhKoRNcOkkt/oDxJE+eDfA3SMgL02Huwwf0cq5
	Sjl/NUgqXQ+C48wziIVgAgOeL5RVgf6Qa8Rl1ZmgrY/uz5dWtJ1OtW+sBvuQHonZsx9z
	jgN1tbLLqDHMxrllE6ib4OR49+Crg/pdvgJ+CGD345O0Fs/nist3UoTjHSPkzF0R/ezj
	KoK1w0yRTgsyjjFUlMQN8jna9PAhNnrTHFgOKgEhEVh0mjzxeY80sV2KYNYn/tyLdrvY
	jCKw==
X-Gm-Message-State: APjAAAVC+lDvhCQD9wZGZNt1bQOJdgVby/q9UaNXwsCyZSkS64TyOu7N
	5TCmm9MWW7af3GmoWPsBHkEW73ec
X-Google-Smtp-Source: APXvYqyKlr09TxkilJj1HLXu0t7vYkRdlO0Iq27z35W1FmScKBmW6qrCotjvwjDbOZFa9ePTOE+abw==
X-Received: by 2002:a65:6688:: with SMTP id b8mr35466744pgw.81.1557809662871; 
	Mon, 13 May 2019 21:54:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:58 -0700
Message-Id: <23822fb39341ba064d2e01389409958f6b4dd15c.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 16/23] ghostscript: set CVE_PRODUCT
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
X-List-Received-Date: Tue, 14 May 2019 04:54:21 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.26.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.26.bb b/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
index bb32347..2630084 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
@@ -136,3 +136,6 @@ BBCLASSEXTEND = "native"
 
 # ghostscript does not supports "arc"
 COMPATIBLE_HOST = "^(?!arc).*"
+
+# some entries in NVD uses gpl_ghostscript
+CVE_PRODUCT = "ghostscript gpl_ghostscript"
-- 
2.7.4


