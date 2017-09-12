Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 93E82783E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:51:31 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id o77so7118810qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=O7D+knef1eSG7E7pZ94grpA6V9lJ1/eLFDlcUxsn7yk=;
	b=iQXu8/qZrRRyXvjMqBHZzrDlp/J+jq0k7B86/rj27n3By3HaasVpw3DAsZz/CodLqa
	Y+RFReAbQhVM6ksNGa7WUxWDdtSwXPwsQAPduD2iO9F3zlx2i3i+/anEFLAcyzSB+xof
	Oq09NKom6xRQQl4hOJrGbzaQFp6Zu7n1yRkk34W58IMH9ABkhZ5QxvXoYvRxAzUJlRSc
	yWooGrjB5ajIYyAyBvhaXusZX0ZlDjicr7sYbNRtR+HkF2Q7GOWVveCpLGB1xpHATm1J
	8CqU28L7ibplrChTNz9Qdrjieijq+qF49LzCU/buEy0BDkwijpZvqz7JYap7BjKz36nC
	bOIA==
X-Gm-Message-State: AHPjjUiij72BBeuhceB3YUUCeD3cMKvOQf9OugfThJ53bV3LJEbCWgEr
	J4dH2blZefBXzQBH
X-Google-Smtp-Source: AOwi7QD9phq99N6Rbh+AMAhanbDDNj9w9IH/50219W5tVXBcHqfSCqMUR6iq24hjY8TawUncnj9jSw==
X-Received: by 10.55.176.4 with SMTP id z4mr8727013qke.159.1505220692238;
	Tue, 12 Sep 2017 05:51:32 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id y10sm1590400qkl.5.2017.09.12.05.51.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:51:31 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:51:24 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:22 -0300
Message-Id: <20170912125031.4009-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 04/13] go.bbclass: remove GO_GCFLAGS nad GO_LDFLAGS
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
X-List-Received-Date: Tue, 12 Sep 2017 12:51:31 -0000

From: Matt Madison <matt@madison.systems>

These variables are not used anywhere.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
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


