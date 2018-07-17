Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9FDFF6FF84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 05:05:20 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 94-v6so4365158ple.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 22:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PT0WnXn3UaAhNL3D06PAxvNLqVDIqaUNF7voUfey+o4=;
	b=rQtafA04Qzcn8bGa5vbZ3UmSN3f34hiJMotPN0yWB/4kO1Ba5Pdwq7HezN10ibyBTS
	D4zqjIMAFo3duKQzw+am/IE0gKlubRKBdKXehOtaXuhtzgDppfL/6aQC/FaXcoIQIC9n
	Bjr/opPmPW8lABjWTqjKCso0R3ZAuYr4BUvVcGOBApp4+D4yCUOr4gblFCRV4cQHmdhY
	mvSb2Sk0qXymOwfx+mKXETX1GyShOq0qFaby9aYARpO/IQi9r+CKmHfEpC/R1TCPxCNJ
	p3SvOBgTKMzcPw/LsQMprCiM1TBdfC5g0T70KESOxVQDr2RW/YBZTGCIDBptCq7P1s30
	tQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PT0WnXn3UaAhNL3D06PAxvNLqVDIqaUNF7voUfey+o4=;
	b=nYsxhWyJLMCmWcoTfkCz8kVdsox5SA7C/doh46Z08PUS+b9IX1tJ77P81xjY3oub/1
	5qcxLkIbxZGJDBGkx1xIsvhbp8Z7N7/mBEXuYKAxkb2ZOkEADh0epcBkPtT63wJa7PhI
	lqaOLrPB+lyZOHmUaDmgp8SHY5G8sQx1n1LZPlX4c2MCIfOmloIlRVZO498mqOZSCPtI
	hkmNSEMONVxh3/KqUxTyIKaRo7tkk5Li9vsghJqHoLnst5H/0Pn6JjdaAqLJp/Stntkh
	Pr+rrsnr0kGf7m40LhbUvqn9NxCd6f7eyunx+tXDTyeOytmPlrLIn/DGm0NRHgi1VHcP
	sMYQ==
X-Gm-Message-State: AOUpUlENZ6FhNmEvq0AH7fy8RW0B9r+Nbvz8+szKoMruyk5+L8ExTm8u
	9tUUKeL59x82P7Q2qwT1X8qAVA==
X-Google-Smtp-Source: AAOMgpcwYNIijiXzyLjgdovB4yN3OSuBA9T1Ml9yg6s4A+GiBRPo69u+dgQ5ZYI9iwMqgkppqhJxFw==
X-Received: by 2002:a17:902:6686:: with SMTP id
	e6-v6mr118698plk.35.1531803921261; 
	Mon, 16 Jul 2018 22:05:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	e82-v6sm140138pfd.40.2018.07.16.22.05.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 22:05:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 22:05:10 -0700
Message-Id: <20180717050510.16626-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] musl: Update to latest master
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
X-List-Received-Date: Tue, 17 Jul 2018 05:05:20 -0000

General bug fixes

Full logs
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=193338e619de7c993efa2c0e1a87240bd732c181..9cad27a3dc1a4eb349b6591e4dc8cc89dce32277

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 2bcd45d571..b56870cb3f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "193338e619de7c993efa2c0e1a87240bd732c181"
+SRCREV = "9cad27a3dc1a4eb349b6591e4dc8cc89dce32277"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.18.0


