Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC3378432
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:29:37 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id l25so3155162qtf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=UKc6XHI/ICg248/M1vikVIHDhzRXimDerF1c/+BmKBk=;
	b=e7ySUYy8/MJic+RTv97GeOB5J5C0pueSJwz3gjwP1e5j24Y4w4XJ8nE4ReWG3Ww9IF
	J/x9EglGFPaRj9y7aa8zUT9xJOKk+viPKp7Lr7fD5TCJ8ptK/N4Hpzynka/t2ta2SZAz
	AaE73PKmMyRp47UVKA4t9+X82Xisdv6mNlp5WwuPUmJTxZFybXb7M1n1R0yTcYyJJTNY
	wDzzccff0eDgWnttZ2tOSY4sQ3LNc0ko9I7SUTgcj0sn5O+J4X2qvUryoUXZR+FAOBmB
	4nUVYYRTf8lx3A6CmQkakSa701I3stQYUWMDYEmbRFEUdeTFTL4SMqgco9Zvv6n6Sdk5
	cDgQ==
X-Gm-Message-State: AHPjjUi5nFtqWiIAxHgSJN0vEE5ITOa1lzu4y+9Qo97aZIVWtl3pGUMG
	MQy9G3mibkDtR/ct
X-Google-Smtp-Source: AOwi7QDuaIIIuVXUQIQxWAlU4XoTmtm4WWV2KnAMbIlgdxkWKrFfmMSqsHYyEwK/gO7fSat8Ej3yOw==
X-Received: by 10.200.35.21 with SMTP id a21mr9053623qta.215.1505154578179;
	Mon, 11 Sep 2017 11:29:38 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id m4sm6982587qkm.66.2017.09.11.11.29.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 11:29:37 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 15:29:30 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 15:28:45 -0300
Message-Id: <20170911182853.11076-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911182853.11076-1-otavio@ossystems.com.br>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 04/12] go.bbclass: remove GO_GCFLAGS nad GO_LDFLAGS
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
X-List-Received-Date: Mon, 11 Sep 2017 18:29:37 -0000

From: Matt Madison <matt@madison.systems>

These variables are not used anywhere.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7: None
Changes in v6:
- new patch

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


