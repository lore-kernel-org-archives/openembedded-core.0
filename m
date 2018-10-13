Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1D81879B7E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 21:17:07 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id n1-v6so16962330wrt.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 14:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qr0El1GJdWJcSJaQUh2dbU2aNN+mQE2V02POvrbARR8=;
	b=HJDvJ5rsTnMBqL1uCRrwzG4dj81ManlDj/9jvA+m0TLDKtJgtDy7FpRXNMWfh0o9H+
	Ip73poIttdxUL4+Qy4gMwKLqZn7d8q7Tx/2//ajuQ+O94x4FAXiHx0bB3NRyx8izP9yF
	P82RvWjs+TevAQwQJR5pXZskm9MX9ZC+Rg3zpPdsiA1Af2bArY8Kx3ZfsnjZubpcH0d9
	jNSUnOl9xuzlF4I2LVX0tIXr6/AptFcFQIg6FOizN5BewknWSvY4LdYxbf/gbUj+H216
	n9y7a+dVwYM95gtnVdhmPOxeWYS2WHre6H5f7FXCMlBkuVpweW6Q8wM+OTijmwAE/RPd
	klng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qr0El1GJdWJcSJaQUh2dbU2aNN+mQE2V02POvrbARR8=;
	b=ua8sRbmPV8gueucD7yBUE4mJTssM1J2L2DW/Q5ie0PDnHi7spzlqWbRUGWTNEEC1Uo
	RDZgPIKrhfjQXZTllTvG42pbzIaCgdJ33YjuRHHrxSbcJWxQlYEF1nrzIl9DQpTuEgql
	sz+In9L7gM/mRAXr38D72Ae+8y9oP5KP80/zUHn7Ss2JkyLOjpMIU/hUSWxjYru40ilw
	nUFIiiJ3gdeAjwNxQJz6RriuhsZlo6+j537+CJjNkukIBJZPNtMxAyzsAt/46vFaBoyJ
	y2y++EDIfZOWe6xt+mDyowEFmLRzp47sxquKftlwFQtFNaDGsbxywUmyYC+UGiB90HPR
	r12Q==
X-Gm-Message-State: ABuFfoioSPi2nDQdRFjuM3NbC+DPrHtoucN417+n7bGnHlAFjKvzeKGv
	CCV45qtjWLHhut+RUisLEWQTNWYM
X-Google-Smtp-Source: ACcGV63e39Hap2BViZCoOE1HSpr5BCklVLpsXjOxtZ+ogyCPdt2aPsgn2wDUGJgFhJLvmMECvQr+Aw==
X-Received: by 2002:a5d:52ce:: with SMTP id
	r14-v6mr9128522wrv.123.1539465427691; 
	Sat, 13 Oct 2018 14:17:07 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m16-v6sm4632167wmd.35.2018.10.13.14.17.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Oct 2018 14:17:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Oct 2018 21:17:03 +0000
Message-Id: <20181013211703.1224-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181013211703.1224-1-Martin.Jansa@gmail.com>
References: <20181013211703.1224-1-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] glib.inc: drop duplicate locale-base-fr-fr runtime dependency
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
X-List-Received-Date: Sat, 13 Oct 2018 21:17:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 92dcf997c0..e8215da583 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -163,7 +163,6 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             locale-base-hr-hr \
             locale-base-el-gr \
             locale-base-fr-fr \
-            locale-base-fr-fr \
             locale-base-es-es \
             locale-base-en-gb \
            "
-- 
2.17.1


