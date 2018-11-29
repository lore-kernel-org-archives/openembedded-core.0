Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB7576D583
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 12:17:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j10so1677673wru.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 04:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MCyk2jTonCXIXMiErSlrzhrkQAfZbIR3ZyJBLJG1yAk=;
	b=Se5JZxnhjH5ipGFP1sqdtspVtwMFwwnBmYkve1tQAUzTy2ErH/Hqy+ze9ZrHqHljYr
	CYFaTEOF+PpEuKxXrbI0Df3H1AC86I/e9f/IuraYcf3inSTbk2y4s1WIzCtTL2JRvOUo
	bEv7+QY/6hmVKA6kmYhv3PXRPwDkJQcyDZn3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MCyk2jTonCXIXMiErSlrzhrkQAfZbIR3ZyJBLJG1yAk=;
	b=YhpSb6EgI4a9bFGEm6mTv+OYeSEVP29NNHktIm5p0YA+j6b62SbzSPGyQ8F0etpxz5
	o0XSj8Uya2St3Vj4MJA3AfeUYXSM5X37TmlzB3ngw+KzdhFyjrGy6jtMjo6vLM/rhtwK
	koCUVSZ3+briB0gqfh8ihJSr627G5f8Z7c1MosYvHZD25OJGYkA6hSGSZX+2UpKBUSl6
	g0jkbqtBh4dWp8uDapxcw4tcgwll4eGafUKYrLaU9ZKEt/D4/3yLl+9M9CiACprQ7Os/
	Bz+iQoPfd8F7bEkdRKZ9821d7ujXI/xQjAbceBoi2uMCccrETGbeFsUdpDQPLA+8RvfY
	mhyw==
X-Gm-Message-State: AA+aEWaXSUtefhYmRSf66XPPUyaEpPi0CpEOQj8g0ELOiSjQEcbOtg6X
	sRcZthK6oYNDOoku6B5RXsXEH43xHG0=
X-Google-Smtp-Source: AFSGD/W0dwHrBW/IaWHdwCtFAzOeA0FaHfRcusNeJ8HDvEh3u4xPq9giUgG5qwfU1AFn9s5xtpnQoQ==
X-Received: by 2002:a5d:694d:: with SMTP id r13mr1173947wrw.323.1543493869253; 
	Thu, 29 Nov 2018 04:17:49 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 5sm2717625wmw.8.2018.11.29.04.17.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 04:17:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 12:17:43 +0000
Message-Id: <20181129121744.10052-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181129121744.10052-1-richard.purdie@linuxfoundation.org>
References: <20181129121744.10052-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/5] meta-selftest/error: Cleanup large trailing whitespace
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
X-List-Received-Date: Thu, 29 Nov 2018 12:17:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/recipes-test/error/error.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/error/error.bb b/meta-selftest/recipes-test/error/error.bb
index 3c22e7cbebb..65d00a46d99 100644
--- a/meta-selftest/recipes-test/error/error.bb
+++ b/meta-selftest/recipes-test/error/error.bb
@@ -2,7 +2,7 @@ SUMMARY = "Error Test case that fails on do_compile"
 DESCRIPTION = "This generates a compile time error to be used to for testing."
 LICENSE = "MIT"
 
-INHIBIT_DEFAULT_DEPS = "1"                                                                                                                                                                  
+INHIBIT_DEFAULT_DEPS = "1"
 EXCLUDE_FROM_WORLD = "1"
 
 do_compile() {
-- 
2.19.1


