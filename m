Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id A8F4F78802
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 13:24:52 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id s39so12959158qth.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 05:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=eglJjux4cy6Zx2Afs6ob3kmEGWJEgDf6T9uSHkWLLXI=;
	b=S0FGQ9EpyT+LLLXAqbpP7CE2uW1qRS2sIeXDndKzdz8uGTxHErKWh1JeOcWV220M8m
	OxfTazXSehnGVrouACLcFJhq+9TIVFIzAk7+8oUr713bvxw02Y7UMVmyG8OC6KCmHa9K
	1laUXXImMLop8SlI58Fo+ccrS4FM9tibxtkJZOHLFay+R0P1QNsSSvGB9qMwFIsrIRaH
	TT3/OU7d7D8uwrpR0+NQZU5UimClER1dn5Zx2m1Jy645+Rmd2Vt+T6zGzc0Z/21927cN
	ygrbmaUMig832dmjFBJvdBfp1iMX2wi+lcK7vhHuhwudRzsKPbeCxwhe3m8PqG8N0HmB
	MQrw==
X-Gm-Message-State: AKwxytf2YVAv9LHy46JBXmfQVuadNk8UiNEiEIbraAKQII1TKxt7JDNo
	y/ZeaPbGgKFX9RU3QzaZoyXklg==
X-Google-Smtp-Source: ACJfBovf4v/qv1aRHIcvlvx+UNC/BodZna1h3orJi9+hjTPnBqyEssk21bcFld5FOo78ihKzaLUkMg==
X-Received: by 10.200.0.18 with SMTP id a18mr16329599qtg.162.1516281893368;
	Thu, 18 Jan 2018 05:24:53 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	b62sm4549308qkf.66.2018.01.18.05.24.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Jan 2018 05:24:52 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 18 Jan 2018 11:24:42 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jan 2018 11:24:41 -0200
Message-Id: <20180118132441.9788-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] go-dep: Add native and nativesdk variants
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
X-List-Received-Date: Thu, 18 Jan 2018 13:24:52 -0000

The go-dep must be used as native (and consequently as nativesdk)
during the build process. This adds the two variants as supported by
the recipe.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/go-dep_0.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-dep_0.3.2.bb b/meta/recipes-devtools/go/go-dep_0.3.2.bb
index 627324a1df..cdf6da1593 100644
--- a/meta/recipes-devtools/go/go-dep_0.3.2.bb
+++ b/meta/recipes-devtools/go/go-dep_0.3.2.bb
@@ -17,3 +17,5 @@ inherit go
 GO_INSTALL = "${GO_IMPORT}/cmd/dep"
 
 RDEPENDS_${PN}-dev += "bash"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.15.1


