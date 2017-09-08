Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2F23878217
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:48:45 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id k2so1572883qte.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=Hjq0J0OTNVPBkasd/H2rTwKQVhiu84k6nkWca5dJX68=;
	b=PBiL4dluhIAGeJOM0dDbFm1FV9KRtKthSGP8/iMTVNS2P9cUMORdY7utSg09Ln8wGw
	zXtHTi48w/PsLwIwl/K000U1IAUt5k0n847evkcHpBbuiz9tnW8E89VyNSLqzbW2Cs1w
	JUgSE6PaIvu89Hkss6RV4mNCQj+OIv/RQSwB3HB0n2iU9KHtQ8gFjujLGdo/IHXztnqW
	EnTFMkY0JCOtmcnASw2lSCEbv4JCvLWGdGR5K8FBC9bvDNCvN++RGxl4fxFplNIV9E99
	TDULD9MwfpNwEACoNmjnb4/Nqyf21IGNwaEYGIpITnX71qmS/Gixr8ZP8vSRsnEsUDUb
	xj+Q==
X-Gm-Message-State: AHPjjUh8abvCvYOg3VjG+fEgWTFtrsrxxTcKAzlpd9LQ/OLS4cTBRZ5B
	lptZmJ7kLVWKg99L
X-Google-Smtp-Source: AOwi7QAeoNLlJwp3bjAN5RH0ZFWQ+s2YlBivYZ7pOf5K72LOaILMCW7aVCdTPqmVokn8NbBwEGtNHw==
X-Received: by 10.200.23.153 with SMTP id o25mr4012855qtj.206.1504878527072;
	Fri, 08 Sep 2017 06:48:47 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	c38sm1303191qtc.18.2017.09.08.06.48.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:48:46 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:48:37 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:47:52 -0300
Message-Id: <20170908134758.7570-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134758.7570-1-otavio@ossystems.com.br>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 05/11] goarch.bbclass: Add support for ARMv5
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
X-List-Received-Date: Fri, 08 Sep 2017 13:48:46 -0000

This adds support to return the proper ARMv5 format.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2: None

 meta/classes/goarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 7960ac5f9e..dbec6ee2c8 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -47,6 +47,8 @@ def go_map_arm(a, f, d):
     import re
     if re.match('arm.*', a) and re.match('arm.*7.*', f):
         return '7'
+    if re.match('arm.*', a) and re.match('arm.*5.*', f):
+        return '5'
     return ''
 
 def go_map_os(o, d):
-- 
2.14.1


