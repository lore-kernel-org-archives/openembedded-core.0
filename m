Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id A63D061260
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 04:43:08 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i6so5960309pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 20:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wd3KQ3mh0cdZh5DTqgvHj2zXJhNF15fWQnqMK7oKdcU=;
	b=J9l33eaOtN6a01UrKJk5qZtcsyJD2ABsC5gMosOtBcSL/f185ZoHsCwfZ9UhNRsYYn
	76hrP00kGscyTEeVSFwqAoEo/d2wfkO+/mScWlZTxJp5/SXtvjf1EAbj25yoRKHI+O69
	NZ8GGQ01kwPrW6ATzfLTyTC2OPVmfLW+9BN/SYxiwvG3WW/z319bai5fue5vubXYmFcA
	SvHLm5ncbhWDaPqFIsqEcVNvUI9fm89mNwdgwPe06xupCWptUsFqULFhHNCtQi3FCQjJ
	bBdN2RvD3NlVGus6ZNUeX+Q8/pR7bioIERZHQgK2jdVxsxIhPBnaMPoA1buR/eaFdFzt
	sneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=wd3KQ3mh0cdZh5DTqgvHj2zXJhNF15fWQnqMK7oKdcU=;
	b=sBmX8MZBqoDzLmrmvyhI1pQMj5RaVnfq54V63I5PGXcR/bwCoEuiGP4i0xaMP4LvUf
	/3kmjhy6WvLVKpELOvGeG1FgYDDExNSu6LwUr+2ztIkYPFI9ksXBfTgFrUzkc0Dz4TFn
	eBv7bNUE9aAbbo5Qj4CIlasnUgg7DY2eTjlRYny0toQOOFc42TxIGRahl1sspJz06F8y
	055S/KctmHgJUjfHSVNCYf4FjqKFJUSPMdSi/WIT6D+NcFwpQ9Vuybbq7r5v3yw1fJ46
	yd5tlTl05Up+qpbAQ7ZlcfF9ZW22tZS92il8d912f3khUf5Z2AL2gB3Ej8/pJVW1nHU3
	zodA==
X-Gm-Message-State: APjAAAUQqboogcBYkGR5i8zH/ZJwS275n4lohBBME7F8elwKIjx9eUqA
	kUPZtqdfSSDwd5Tw5myTDWzOw2y1v3W2Tg==
X-Google-Smtp-Source: APXvYqwe8mIgrIiLPIyu/e3cUFq4NEnic1XyA2GbNP8Np8eZ7lox2aHKo0oi+NRYD/tIugt4J3d3gw==
X-Received: by 2002:a63:2010:: with SMTP id g16mr7301132pgg.314.1581741789484; 
	Fri, 14 Feb 2020 20:43:09 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id g2sm8888394pgn.59.2020.02.14.20.43.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 20:43:08 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 632D32A050B; Fri, 14 Feb 2020 20:43:07 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 20:42:52 -0800
Message-Id: <20200215044253.5596-5-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200215044253.5596-1-jpuhlman@mvista.com>
References: <20200215044253.5596-1-jpuhlman@mvista.com>
Subject: [PATCH 5/6] subversion: move pkgconfig files in to libdir
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
X-List-Received-Date: Sat, 15 Feb 2020 04:43:08 -0000

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

All of the .pc files contain the path to ${libdir} which fails
in a multilib rpm image.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/subversion/subversion_1.13.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.13.0.bb b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
index 9c1281a63e..6879f1249f 100644
--- a/meta/recipes-devtools/subversion/subversion_1.13.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
@@ -37,6 +37,8 @@ EXTRA_OECONF = " \
     ac_cv_path_RUBY=none \
 "
 
+EXTRA_OEMAKE += "pkgconfig_dir=${libdir}/pkgconfig"
+
 acpaths = "-I build/ -I build/ac-macros/"
 
 CPPFLAGS += "-P"
-- 
2.13.3


