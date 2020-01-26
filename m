Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 59EE57FF24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:58 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id w62so3865944pfw.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YwvbhHwSfURuqXasVwzJ452fm6hkw2EBGy0qA92vU9s=;
	b=pnbAMUPUQ7+eYRToEdkgEh6i6k6OTnk9dTEpdqCc+TCmgEUW8raTidCmDeDhn6ZvLR
	TXymxKHzYA/WUmYnAPuBdPufhZ8gQV8cQzYP/wk/wbGQVC6RLcz5rq1otdYOSW3Qm9Ed
	ZZw7m2iTMXVyIsY+nAZ4X/O4503vn6FXgBGmZ0PWnA7mKWZZsJ9z8p3ddlvmwg1Nh6QC
	T2lW4SKMWkoXjzHlp+CGEd9trnwzlj0sBI4OqkIr4cLUnJbms6qtTkfMTBaWHUl2ydBa
	u3puLi2Q0Y/4zLet56WbAWMjUblleczC3zBysfr1W7dOjlOlgOmZqKtUHjOkE52r3moX
	tGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YwvbhHwSfURuqXasVwzJ452fm6hkw2EBGy0qA92vU9s=;
	b=eb+ebjKGAAaZHit6fSGIntlMw8KTyvaXrVsCgUrTbdDX5ckaXLkx6ZOe/KhRbpQCsH
	x8xTlM8eU3PUJiSdx6vpu/Sy01klhEahPzzqmkRSs4AFlMPXSdguikS7bWnzWyJtG7+2
	+gOquuiT4I2oUzNJ6ylLioqhSGgsOG92rBl2nLbBPzm99M6oSei8NEYzQVcPVYKAGChT
	AFMY4fTfJWTjvqeaoxFSwcCaCKSsEUV8fI5hTHmuaZxsBUNaEjaXiSfojzn8/zyNCZos
	LQlqylbnmqGFXpy4F9HrW9BCWrITvsyfhnbC4VJ1Ayc55ToZcLYDq5XhAwcBD3Ljp7vH
	k20w==
X-Gm-Message-State: APjAAAUDnkVSeCBlSeARN/UncDgQ/81Mjesk52qtFBnGI79KQbFywsTi
	0XpTSDA5NwYIHj6FCIgYWghXmt+d04E=
X-Google-Smtp-Source: APXvYqxqDS8n61b5BOXNVpu7JVSk8cFE1oNPHw9xJ7maUVDDMuk1Y7H4W+d/yqksmfurP2xK4nuxsg==
X-Received: by 2002:a63:cb06:: with SMTP id p6mr15736939pgg.236.1580066878923; 
	Sun, 26 Jan 2020 11:27:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:49 -0800
Message-Id: <c3fc7c93ab6ae1bfc436d28bb4585aaa2c674183.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/13] Disable CGO on riscv64
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:58 -0000
Content-Transfer-Encoding: 8bit

Its not supported yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/go.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 369652dbbd..c99689ac59 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -53,6 +53,7 @@ GOTOOLDIR_class-native = "${STAGING_LIBDIR_NATIVE}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOTOOLDIR
 
 export CGO_ENABLED ?= "1"
+export CGO_ENABLED_riscv64 = "0"
 export CGO_CFLAGS ?= "${CFLAGS}"
 export CGO_CPPFLAGS ?= "${CPPFLAGS}"
 export CGO_CXXFLAGS ?= "${CXXFLAGS}"
-- 
2.25.0


