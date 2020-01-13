Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8CAE17FC51
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:31 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id d5so4296145pjz.5
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PgxQqI9tu4k4Kt9E5aB9v2ur7JJAUyVAlPGBBxXrLhw=;
	b=UrTqIygb2gPq3ccK9GtcWQDleL10OSecIMtkhYie1QbiaYWlijwvWfHDAm2cxTLgUn
	NMC86jEFDbZ+1CmlYYhDNMnY3Q9ID6BOPMHrbQ2o7XyYogJCYHw6DyIhTtPhnyO6KLtw
	x3ca3nHmGwL3Yl6HaII0LBRjdWfBbbTkd77v0PA3J8FgjUP6JhGooMb5Gg4Dg6EWh4Py
	LKouv1RQBjyZFs2t6PkTduUnt932h0JW06Flf2cLITvxojKyit6mJWTifVuXooC4VfyG
	uvXQogyt+u7z+BpZvaubW/XEgsmu2l72DB88Jcn7/3KlJOpLX5je9RktSqEB7oDaXmP6
	H1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PgxQqI9tu4k4Kt9E5aB9v2ur7JJAUyVAlPGBBxXrLhw=;
	b=Q9ZKX5OXH5Me8Usv4dwnnbDfpjQgDRTCIwn5/iLFaf9Pa/kb35rJKvYRmSgEVGG3OT
	AmGIlRTcuwQRkzE7SnDamzjOK7WJ81DXoKxs3ht3BkwmZPFCy7woakwOPCOlionWCfXt
	aIyckl+cA/q4bELpGFX2d9jOpmyBU9/Za5nxmXB9c+Ai1+YJ41XFJTpCnZf1CoxCLdOh
	jcaYoW8LDTbvQZmzRploIDeiEsQXFHIVVouo9+0LS8trb2J3MYay59IPBtRUjTZN9Fnk
	8olPeXBy0jsWszWVEa4ANTbw8BmQvJxtMLCJkwyDE6KEiSpO4zG2g9wAAPg4IqQZf79G
	WlBg==
X-Gm-Message-State: APjAAAVnnQsku7125rPWH4hQPISeDjA/6CKLAmaPy9BKuzYdaU33FgPl
	clg0BKwHfY4PJp/z15YFA/Wp02X1
X-Google-Smtp-Source: APXvYqwH2lKBYabCM46mMZy8rLLUoIyVS8O3EfgpcLsqcF9fKGs4nQYSF6fsfGSs0GsRdCQ/3bzyGg==
X-Received: by 2002:a17:90a:d783:: with SMTP id
	z3mr22072416pju.3.1578929432449; 
	Mon, 13 Jan 2020 07:30:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:00 -0800
Message-Id: <925482bef72e80622e904ce437c5ebe8e78be338.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 01/28] openssl: set CVE vendor to openssl
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:31 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Differentiate it from openssl gem for Ruby.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1b.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
index 9e36df807c..13e6ad4db7 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
@@ -204,3 +204,5 @@ RREPLACES_openssl-conf = "openssl10-conf"
 RCONFLICTS_openssl-conf = "openssl10-conf"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "openssl:openssl"
-- 
2.17.1


