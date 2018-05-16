Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id DEAF372EA6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 06:32:20 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id v24-v6so1532378plo.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 23:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TeqVBoW19EXlQzd/3+jqMWLLetGy1G/LDKmO1tj7bvE=;
	b=l335a/hM3ad316u00ItJrsKPRcWDEZDnlebI7GPt426xIGvO4KjOZHYnWZgYmv+r0z
	FwV11fOn6AN3vU+LtL8DdyPcAr+ZnLvCnqaE/oK2G85sWVstwDaI2Iz4GivRsa41pZ9n
	WH0Pwzx6ROSRauXCQtJXZY82+GTjFiztFiyGTM6hvuC7tGxRXnXxhpfR1DTxCVsDVnw0
	W+rZkWm31P12RY5L5G8zTmkaE9uTag9cgcthYh8kRM1qC8iybZFc4rdyn9mPSInM64v9
	q7XaMzyz9uc6nRaqLucU0xBMYYxMuXeMJMwkOxV61cwe1wZGH9J9XOlOvFR5hjJZdpOi
	oHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TeqVBoW19EXlQzd/3+jqMWLLetGy1G/LDKmO1tj7bvE=;
	b=agE2yuxJa9ocpiJ7BW4eD8cj5nUQrvReVCyBFdacYtYVEADnJAFwjvIvNpBU19faGY
	qP4cI/uQd8szi6tgLYbzuoxgb8Aeotyv9xLKarb8W7P+R3+wCEVZFACPjN0XW6Sql1t/
	NzEltjkviOTgUjQOhpXCMBiaP6tSW9tb0VWX2v1A6q1PcxVva18ulNzECZC1xlzT2199
	DZgPV7ETVy+JOstgHNtfCO1tDF/0+LmF6JTIei3+ny2WxPe5vBj7FVvhzK1mQxX58g+m
	sUzpP5kcErTqDCwoED7ehx1JAxXD+0URmhlP0h1IlqCzTgLZJDNk3b+vsp6Gk+vki4CK
	ynHA==
X-Gm-Message-State: ALKqPwfgORrZUEyLue0E80VrgMP1jsYTdxYxxlyFAprLxtxPsfe/egB2
	RObsDOw1gX6hV/CVhx1XUs12tg==
X-Google-Smtp-Source: AB8JxZpskfhPKE7peUdDoSy6REmSQSbQ8o3XTpyrZAfpncUA8MCPYJqIytvPZtjBMGBnnGZ1sXf3YQ==
X-Received: by 2002:a17:902:8f95:: with SMTP id
	z21-v6mr17917740plo.259.1526452341492; 
	Tue, 15 May 2018 23:32:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	s8-v6sm2517411pfh.30.2018.05.15.23.32.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 May 2018 23:32:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 23:32:12 -0700
Message-Id: <13936651721b14a74b51c673c35c2b514299ca6c.1526452205.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1526452205.git.raj.khem@gmail.com>
References: <cover.1526452205.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] musl: Make dev package rdep on staticdev
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
X-List-Received-Date: Wed, 16 May 2018 06:32:21 -0000

This is needed for enabling static linking with SDK

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index a0a098f5b4..d7d201df9d 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -66,7 +66,7 @@ do_install() {
 	done
 }
 
-RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
+RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev ${PN}-staticdev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
 
-- 
2.17.0


