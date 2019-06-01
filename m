Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id ECD267E636
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 10:25:35 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b18so8049830wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tzCi6VA0ydoiGQr5Fvp107to7/EfVu2+vuJ6cVW2/ko=;
	b=Nw78p0gYwv8ntnz3BxqwuxnoLU1GJG6zYjogpBOzuaiyf5vNFNnLNlp30N9dswEnVl
	7pXezX6sfGFp9k6+JlmtBcUtAKjXjEOY03PG/1KZPI5/CrWi87ENt91IRT+Y2d5oCuI2
	eK3Pb6Bofj2NYUcjIE3It10AZt/9MgiVEs/uY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tzCi6VA0ydoiGQr5Fvp107to7/EfVu2+vuJ6cVW2/ko=;
	b=EQcWXO5xlnnFnj5jDUFYpdzYKPw1ZTRlQoFB1mmZbQ3WbLd4Io22YeRSFFT0cdvAfS
	ba5dMyHG5brhPcpP4L56cSV47Ln25ceHENwy3HZSA9xNqjrRP3Ld5AODwQWkUhRr3p+Y
	r7h+sifpOaas/PcmTk4fgWp/3eIMFYvFT2DqMvJnxZdQDU2gJG9GOVgH1VGD7p/r2PQr
	Wo08vZWTFIIQkZ2Co2rvw/u+jNvM2gu7Z9LTH2tpvV20RGGDkMd4xLy+2KunQOILyar+
	UHUmech45xV5MHCwOkfwfunRhlegMXp8ZSUkECE7Y3hqVi+AylgX7RhOAuso75A9isOc
	7I2g==
X-Gm-Message-State: APjAAAV3F3B3ZNf9xmc7zfnmvpLFvnkFOYxnKzkaiyBTXOKADaTlsVbr
	P+4D3qwYTrzdqtDa+3cBvQ+lXS50sVc=
X-Google-Smtp-Source: APXvYqznClCziIxIatb0rIElGVDZhyAjz1A1BDw1KJTP29VYLDQg0OuZ/JJ7T8tMzELrxpCgCBQrvA==
X-Received: by 2002:adf:8023:: with SMTP id 32mr10184279wrk.18.1559384736600; 
	Sat, 01 Jun 2019 03:25:36 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a124sm11912234wmh.3.2019.06.01.03.25.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 01 Jun 2019 03:25:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 11:25:29 +0100
Message-Id: <20190601102530.5995-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
References: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 7/8] libxml-sax-perl: Fix module ptest dependencies
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
X-List-Received-Date: Sat, 01 Jun 2019 10:25:36 -0000
Content-Transfer-Encoding: 8bit

This fixes runtime errors when running the ptest in a minimal image.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/perl/libxml-sax-perl_1.00.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
index fd3a2a0ee70..80a1c8e39b3 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
@@ -29,6 +29,7 @@ do_install_ptest() {
 	chown -R root:root ${D}${PTEST_PATH}/testfiles
 }
 
-RDEPENDS_${PN}-ptest += "perl-module-test"
+RDEPENDS_${PN} += "perl-module-encode perl-module-perlio"
+RDEPENDS_${PN}-ptest += "perl-module-test perl-module-base perl-module-fatal perl-module-encode-unicode perl-module-encode-byte"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


