Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id DADC678260
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:47:53 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id c69so5329817qke.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=/zSh6ViwrxaYHy5AJxFFOxBh670fd3OiX4I2jc6ttJ8=;
	b=Yow+WneRzyFbgWLp6bxyTgDhqcAzXE4gVHXlr1qMUfkoMoH4iN4vKKeAh7K44BZ+E0
	GxblpHShCMvTe+r7H3wl8JVobKclFZ8DTdFNsgw18nIh0vqFSbjyU3ZKpsQDfyBWqYFb
	naShUEXyvOeRQb96T/Mtj5VXYdNL6RT8AxcbTV7N8s6vm+zY1N2saL1GMZqR2mIZIm9x
	aJbGeGY8zwI77dyQ63Lsh5uxdK3qT15eno7AgmHVSsrb/+OoBuB8Lj5rIPmLyhRwAnWL
	GUh/443sMfwcKHCwu4GdS1L+OXAK8vuz6S2Yg7LZESupE4SAI1n7G2UV6SgA4kUtbUWL
	H2Jw==
X-Gm-Message-State: AHPjjUg/ijt26S8wSI3HyQiS+sZxxqqIr7tsQHegbI9ryVHwtHmawArU
	V7sjsVW5Cd7uGrwn
X-Google-Smtp-Source: ADKCNb5rwcH5rSEx4sf/Sa5YBuTS0HdpcRUeG+0KvMVexKy0B9eJe1lx+0QpGy474d9WKKAG89sbwg==
X-Received: by 10.55.141.66 with SMTP id p63mr14766645qkd.210.1505134074814;
	Mon, 11 Sep 2017 05:47:54 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	x124sm6022226qka.85.2017.09.11.05.47.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:47:54 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:47:49 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:50 -0300
Message-Id: <20170911124558.2863-19-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 18/26] go.bbclass: remove GO_GCFLAGS nad GO_LDFLAGS
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
X-List-Received-Date: Mon, 11 Sep 2017 12:47:54 -0000

From: Matt Madison <matt@madison.systems>

These variables are not used anywhere.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- new patch

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/classes/go.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index b3464d2105..0ff82ca2bb 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -42,8 +42,6 @@ export GOROOT_FINAL = "${libdir}/go"
 export GOBIN_FINAL
 export GOPKG_FINAL = "${GOROOT_FINAL}/pkg/${TARGET_GOTUPLE}"
 export GOSRC_FINAL = "${GOROOT_FINAL}/src"
-export GO_GCFLAGS = "${TARGET_CFLAGS}"
-export GO_LDFLAGS = "${TARGET_LDFLAGS}"
 export CGO_CFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CFLAGS}"
 export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
 export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CXXFLAGS}"
-- 
2.14.1


