Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 43CCC7DF94
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 22:28:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d9so78983wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 15:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=U1xw/dwe8gsv5jwu89iMbJwVwxl/GjFfReYGEliTzak=;
	b=KM+6DyDo4cFvraCBj6uNMb6DHhcmH7E4nRoqIdrq037PL/vuh67206tqar1N2wd9bs
	7r54pz9VQhRJk7xo4cYquOAoTK+9bRM5183uwDFIy9NY4xVsKHoSJ64uK1jGkvHJ+qrB
	Nv5/4pga5csKsWRNJ4Kwpt2XLbyVXEy5aWd44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U1xw/dwe8gsv5jwu89iMbJwVwxl/GjFfReYGEliTzak=;
	b=ImdGR8K6VchtA+wrGtQpqkmdgUq9rzIzeOdtiYAdefxLAP8m1UBsAkgV70LVCM0FbI
	gA8R6YOB46hKu7OtSpOFNbcC81H+bomUHRwMm/1X5ol8U1QdzpFVcEg4hKraGcSefazV
	BB/Li2E4DsH4b4eUquLDKnVPNce7lzjAKK0jWQvE2f7fhvWsQXRJ9nlCUjy8dDWkYljJ
	ZXwkPiQQ+4yxdH3Z6U6VNky4HuI3cjppaPuTwmbdWk1r2q7NLyPDEKjRY6Mf0KTR0/Cn
	MiyDLaMQLJXnnR0JXRmlk0jOfHjKrIVMZcuo8rW9Fq9D4ZiuN00C1EAZ5fbU39n3JUe/
	Edhw==
X-Gm-Message-State: APjAAAXOkL781fN1XJpWe2pDuHfdYRqndlEh+mJWheNvHiPCZ446aFtN
	/3FoUzwq+nLbp1w9fykP/a2khIfu1ns=
X-Google-Smtp-Source: APXvYqw55LN9HvQ/sMuvIWzM61TpSvjW/vLR7hurCVwP5lFa58KN1WQkKf0gXaDgvvhZo16VtA5adg==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr40016796wrv.295.1558477719839; 
	Tue, 21 May 2019 15:28:39 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z74sm5585446wmc.2.2019.05.21.15.28.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 15:28:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 23:28:33 +0100
Message-Id: <20190521222835.23928-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
References: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/6] libpcre: Add make dependency for ptest
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
X-List-Received-Date: Tue, 21 May 2019 22:28:39 -0000
Content-Transfer-Encoding: 8bit

The tests are run from a makefile so this dependency is needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libpcre/libpcre_8.43.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libpcre/libpcre_8.43.bb b/meta/recipes-support/libpcre/libpcre_8.43.bb
index 08314efb9e4..b97af08b250 100644
--- a/meta/recipes-support/libpcre/libpcre_8.43.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.43.bb
@@ -72,3 +72,5 @@ do_install_ptest() {
 	# locale so the test fails if fr_FR is UTF-8 locale.
 	sed -i -e 's:do3=yes:do3=no:g' ${D}${PTEST_PATH}/RunTest 
 }
+
+RDEPENDS_${PN}-ptest += "make"
-- 
2.20.1


