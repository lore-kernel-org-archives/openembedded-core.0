Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C033A6086F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 15:58:08 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b15-v6so1454724wrv.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ldkAKxEyujIF+sDMV1RlHZvKR1DQ/zIxA/uzbOuKEEM=;
	b=g59XCoZoIDFExP2gZq05Y8AdwDFh9g+XhkYiRG9W/9uH8GQl+AhLk84V3ISl/QqVqe
	R1qGwQKAq+7ZvKCJvlkXaI337rYFzHITsVxawvr/Liov7wL0KBl1/eJOXGr+clOGTKDd
	Y2IscyuT5X/v54NzIG8jgHDbdH/DwR+XCBVLrFEdLeFMPOdamqKU72G2PqJC5o53/L47
	MWwfKjflULH1a+Sdiq1FrwS23orqaI7Ekn3xP3cgS8OhmYWELTkOSqtXv8+oh6/GOQp9
	h3llrkHLu65bwCk/P6KYcgae/E2gPL9MLvPWYAuJ07kPWAEWgIyx6ZQQnpWeuM4kwb+E
	sKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ldkAKxEyujIF+sDMV1RlHZvKR1DQ/zIxA/uzbOuKEEM=;
	b=YXVvT1MbTmg59BQScf+KyUS92FKmXAiXid6hH5531kP7T21Us7v4gyo9ife0uLtNnG
	qT/mdxooaqsM9yyHCReXOjxzFnceiEfNaDfXfx0iLS+5KNno5JBu4Q4izloPGdDb2KTt
	8EMnildg8sTLE1o+g/9N8ocMjwMmZJdGwYL1Fao/fXY0viYrhar7jExz8bU3NbGo/kbC
	f/ZNvUFfazZLjnSzp94+lEeYpm+HYxFtQNitVuBH5G4RsFQI3hryzU+9Beb6T1lUNTUa
	cbnMGdOnhBGbEf+V38n1tNhcH/n9O35FxGARsvMrhCJtMxlSDy7YjfENz/SVzt7RHlg9
	mLDw==
X-Gm-Message-State: APt69E2fXLO60fkPiHRvGB50MClpdX/J4eNU+skYBtBZvqF8SlmfeDGF
	It+CK9gyFxKI0hX0yXqC5XHK1cGM
X-Google-Smtp-Source: AAOMgpf2ajD7CAY16US0qtLjtn9S3oKY6QDt06Jt+HFwRaVUY4Vy1UeuUDjoOHNhSLFmxr68oZMNxA==
X-Received: by 2002:adf:edca:: with SMTP id
	v10-v6mr4962625wro.264.1530806289002; 
	Thu, 05 Jul 2018 08:58:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r194-v6sm12188065wmd.36.2018.07.05.08.58.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 08:58:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2018 16:58:04 +0100
Message-Id: <20180705155805.20847-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] python-numpy: set CLEANBROKEN
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
X-List-Received-Date: Thu, 05 Jul 2018 15:58:09 -0000

The distutils class is about to do a clean via "setup.py clean", but numpy
doesn't support this and errors.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python-numpy/python-numpy.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 1d822fa3fe3..1b51f7baaf2 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -77,6 +77,8 @@ CONFIGFILESURI_riscv64 = " \
 
 S = "${WORKDIR}/numpy-${PV}"
 
+CLEANBROKEN = "1"
+
 # Make the build fail and replace *config.h with proper one
 # This is a ugly, ugly hack - Koen
 do_compile_prepend_class-target() {
-- 
2.11.0


