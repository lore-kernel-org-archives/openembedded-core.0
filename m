Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id B9582744F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:50:36 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 59-v6so9469375plc.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2018 23:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XH50gH3v5Zfcm0YQpiX+2GbtcXf2EsakvQGwlY91Gt8=;
	b=YO6wuj+VzkGiGzm0cNu9hZfVn4MnrdFhwsNFlBxlExPDOcKB/L5PVlxPve703diJWp
	4AL1V2kiMqe/kKEC4ga5/eLeaJgw566cCPwUZuiEbJuzrsFx/5j9SZu9ci7m0QrCGTSt
	oM2Q2Ji1r7BAZxSnbte9ii1NPwn93EedpFWDo/WwRTT7qnufoa5UDboE0NTWHw+cOmqp
	3Yd244NK9x2C3KjkLieCPIWkx16hTIPj7lc2DSqc9U2M9w2aCcbhqLNF7vNsQmFJqZ1O
	UZTB0euesujQAsw5HZV5YQO8tCu8LyaeeUatY26J6nLLDHIg5Euf9rUpUhfP260/s0/q
	mKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XH50gH3v5Zfcm0YQpiX+2GbtcXf2EsakvQGwlY91Gt8=;
	b=F1fB0umxOB5Pm5zWANkJw1Uxt8okwzNptvisJ7zRsfYEZ+1OT41XHiU0zPmnVhUiTC
	1SN7mJUQ6Zy/7SQoquE15w+F+k/2wnqQwM1DkXVfmI0fquiz9vIP5VO+BKcyFrYhEGDR
	oshr8S8N1c+JPLczWezqXUou6vKoifW7nOEYaLzZceLVU2q79IqJO65JY83cLajYGWw5
	zwfgfxdBTZiF0kcD8jVYAPZt8MHt7qPN5rKQ0K1CF8T8v3YCH47cPiGbm0/nLhA0xWq4
	m3TkpLZKCXEXXiIx0yLxkhm/sL04BTDp/i6CXEr2wQyC7JLimTme3xlbhEZp19Znni02
	SQlg==
X-Gm-Message-State: ALQs6tD9Kh1Q22C02N3nLQk3OldxoDtOR9nI0c29oht2eSRkNwS100iA
	kvefl/GRhoDsjSI8qWCKHAqTSg==
X-Google-Smtp-Source: AIpwx48ZMXsfgviS88XHzB0eeYZapw0jvy+RlS78KmmnxiLqgOlcSCtX2e+epVDUcdLI1/GZbVhCJg==
X-Received: by 2002:a17:902:8a82:: with SMTP id
	p2-v6mr14245633plo.91.1523861437588; 
	Sun, 15 Apr 2018 23:50:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	o13sm2388362pgn.54.2018.04.15.23.50.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 23:50:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Apr 2018 23:50:14 -0700
Message-Id: <20180416065014.29385-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180416065014.29385-1-raj.khem@gmail.com>
References: <20180416065014.29385-1-raj.khem@gmail.com>
Subject: [PATCH 4/4] libunwind: Drop adding libssp to linker flags
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
X-List-Received-Date: Mon, 16 Apr 2018 06:50:36 -0000

This is no longer needed as gcc provided libssp
is not built

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index b9c532d3ad..36851d07ed 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -14,8 +14,6 @@ PACKAGECONFIG[latexdocs] = "--enable-documentation, --disable-documentation, lat
 EXTRA_OECONF_arm = "--enable-debug-frame"
 EXTRA_OECONF_aarch64 = "--enable-debug-frame"
 
-SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared -lssp"
-
 do_install_append () {
 	oe_multilib_header libunwind.h
 }
-- 
2.17.0


