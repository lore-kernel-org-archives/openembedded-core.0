Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0D9782DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:55:27 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id t46so579166qtj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=SfyUiiZ9/a+f0RZaAd6yr8fz3NjCXpUhi/Z/iruakcw=;
	b=DPqGVDwXMaOSTHqbInmvQrs2QSE9XqYN0XIqJFF5Z0PkpIrur9CD9ReLaXJN2OCl0s
	uz4IP1wqdrqhH7PDzbhGkIdDnZXb5PoSPLaYSjLRtyQjwxhbGLbImaKX+6ntDWKoFJQR
	OgpItBCCzWFUJer9+dkUmfJkSvg4pVj7vwx3btCv9NlE4cuhuL9kT6hoW7KQBlCEyKfl
	D1T4975XhsgxlupmYP6U/gD2mKU9948+nSdajOAJpkMYV/5p8POpOc38P/oQ+OvtLkYc
	nh9/4397V75Pz0nwvEKnIoApJsFdx48xS5UMC3yCixlvjREwzCAAUjZmg8A8rgguBbMM
	PgIA==
X-Gm-Message-State: AHPjjUiuWSbENwr1+Pu5Z7XOojo9qE10t8smqRGYssSx3hzjwovEKtra
	LqIc99LokFbQBxgF
X-Google-Smtp-Source: AOwi7QCdnCJ0YnU4R5pkk2R4UL1V8b05JQpiVNqwxLIcQ3gaDd1gRiTs2UpHMbtnqvtmFJnwCJKj2g==
X-Received: by 10.200.57.83 with SMTP id t19mr28661516qtb.150.1505325328228;
	Wed, 13 Sep 2017 10:55:28 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	t123sm9413041qkh.39.2017.09.13.10.55.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 10:55:27 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 13 Sep 2017 14:55:20 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 14:54:09 -0300
Message-Id: <20170913175410.23041-9-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913175410.23041-1-otavio@ossystems.com.br>
References: <20170913175410.23041-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 8/9] goarch.bbclass: set ARM_INSTRUCTION_SET to "arm"
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
X-List-Received-Date: Wed, 13 Sep 2017 17:55:27 -0000

From: Matt Madison <matt@madison.systems>

Go does not play well with thumb, so ensure that the
toolchain and any packages use arm, not thumb, instructions.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v9:
- new patch

 meta/classes/goarch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index bfba3c9723..8b95c5fe94 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -27,6 +27,7 @@ COMPATIBLE_HOST_linux-gnux32 = "null"
 COMPATIBLE_HOST_linux-muslx32 = "null"
 COMPATIBLE_HOST_powerpc = "null"
 COMPATIBLE_HOST_powerpc64 = "null"
+ARM_INSTRUCTION_SET = "arm"
 
 def go_map_arch(a, d):
     import re
-- 
2.14.1


