Return-Path: <nick83ola@gmail.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id 041E96C56B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 14:37:21 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id g9-v6so4813320ybh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 06:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uvreXKwUqaRLebwa4+H1Vy6K5YdE/1gXVaHvomovgQA=;
	b=ZNuLYCXSjkp3GJFQnWQOX4IABUI9dC+YPENoldac6zSMA8c/tUVwLMCrxcs+APd93d
	cdVi5eEwdmnliinquj7qFaL92cli/eGdqTeZ58DcciGtlwnv3Uq4zdBNtvtwCivMt/yF
	6WpIr1H8a/4CKuHU8kv5DHmAcCumlzE4Oa3YXUf0e4NEjOZCZDklo7zdqV9NDLzH+4gv
	79tHajM8HpFV7Vlm1FHXInQS5OvCJ2c/Y+mCPL3CvWnYC+Q4sQHhK4ziMXLpea3xqWEn
	SwS9nUW1XfofiHUi1JpvCo5f65Toxu3ozohCnz/Yhq4LANfzQIfa/OlFK+hzkZWsSoJ5
	xZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uvreXKwUqaRLebwa4+H1Vy6K5YdE/1gXVaHvomovgQA=;
	b=s+LPHoJqu+ONby++QHzU8Uv5jvCTRVltAKMLCkqQ6/WOiVQQY4K0ochrNx6PwS+pyJ
	NOX78uLK/rDPXjfldHurOdE7n6m8RvMpXGXLLRdomTEhSqh6gHW2fCcCWJP/0x7+R7D3
	GF+VNQib0BheaBT8e8EzGTe7ax9gUOmufBKg1f/a/YNEotSwEeuwoeEedPBz00VScjnH
	y/yOwc0AkA6m+TH+HlFOyinofmo+WA1HvBleDuGdWKD3wVn8Q7cIAd+/hkYMi7CDDzIL
	1D/sAhHD2bG18yBIZVx6EX7zHx1+8hNBznB1Z92dQygFk/t/Sqgsx8lkincdVDmsVdiu
	3e7Q==
X-Gm-Message-State: AGRZ1gKbBmYfDap92h+ocRgABUIXAomE0XqHEBTOURmTed67sguxq2uq
	dkUfnFiMHBJK7khB0a4MHeU/4pjf
X-Google-Smtp-Source: AFSGD/VuDJ+C6I+82i2UgGdWQtbHj+F2d9bFw6uG779KZxflC+tUDcehqlESK7OTB3mmvgo62sMN9Q==
X-Received: by 2002:a25:4bc4:: with SMTP id
	y187-v6mr15868826yba.264.1542983842622; 
	Fri, 23 Nov 2018 06:37:22 -0800 (PST)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	p201sm5876737ywe.45.2018.11.23.06.37.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 06:37:22 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 14:37:18 +0000
Message-Id: <20181123143718.9472-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] java-library: make easy to override jar package name
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
X-List-Received-Date: Fri, 23 Nov 2018 14:37:22 -0000
Content-Transfer-Encoding: 8bit

define JARFILENAME and ALTJARFILENAMES with ?= to make simple
to override them

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 classes/java-library.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index ce1cd28..c69cf6b 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -42,10 +42,10 @@ PACKAGES += "${JPN}"
 FILES_${JPN} = "${datadir_java}"
 
 # File name of the libraries' main Jar file
-JARFILENAME = "${BP}.jar"
+JARFILENAME ?= "${BP}.jar"
 
 # Space-separated list of alternative file names.
-ALTJARFILENAMES = "${BPN}.jar"
+ALTJARFILENAMES ?= "${BPN}.jar"
 
 # Java "source" distributions often contain precompiled things
 # we want to delete first.
-- 
2.19.1


