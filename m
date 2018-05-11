Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 314FB75366
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 06:52:50 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id a39-v6so2739392pla.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 23:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=SAZwyJMZVucaeazgWd3PzzBrL2bx1ZGzg3hkgjcmhJY=;
	b=qBqaVnRgnx7BGUHn95qHv3CjxV6M5W1PLbayt9Zeg+Vv+ge4rc3a9DuZXyn6ibANcs
	ilE984Uufflp/QL4uw/+2seQ24qwiLvz6rDIxpTWXhC3XqbeNjSDLDyytpN7BbaIYBhv
	bmRje9IdnAvTBjwP/Ej9dAcCFmWLyUo55aevYAPd1zmLtebbtinWlFZNXu5WAkf/E/qc
	q/XuSw+J6+WxZ8++u3med71NTpM+MAXWLhfyQfhRhWWL/Wv2UBaCKHd7nr8DSQNDKAP3
	0+d2RfDfVCvLETz+Fi5SIVGK08PmRNgUSYod9bXdFGrhPTikT2D8929kZZzNGDkBM1zf
	6PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SAZwyJMZVucaeazgWd3PzzBrL2bx1ZGzg3hkgjcmhJY=;
	b=a81Q8w0lLhPD0uJ2yMdWsAEQN68+VV4EAEsvM9/XJcyQR6AKxiGaanuCi3wLobtE2s
	cH4On6FnP/h5Pi5r9FnkkwRAllJeIYLkP6srhz/bE30Nce5DoWUnNUDvknZ56k0P8m+8
	9cd2P3feycDAYVqge4cLxdJBxtp8QWTzgy7LuBlUry3iptIL+JwmskwxwmvgHe8FqlZN
	Iev2Wq09qSggZD2ogX+sN1vHemjnN9WnQV6N3sAlb5FTec4FNifWQIgrbWeLvoRPffMn
	ZmsqlDfDOyD7zOg8YuYSo2ozo8m8N16wa1nHJ5iUQgzIkKYcsuhRXK5hswVh59jd8D2h
	SiaA==
X-Gm-Message-State: ALKqPwcePV83gWvhnF8SVNXfMLxKhSkYzbAEenn/7AArdXCLfDYbr3cC
	ffWWEYBqjQfWcaH5Iwjv59s9KA==
X-Google-Smtp-Source: AB8JxZpFELJoso+4v6oKmLY6Ucr4E9bcJ6BOrYGDbw5dJvHNtq6wBb9EKc+Ee1Si0KZoooVD4qSmRA==
X-Received: by 2002:a17:902:7405:: with SMTP id
	g5-v6mr4298629pll.102.1526021571798; 
	Thu, 10 May 2018 23:52:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	q126-v6sm4583116pga.79.2018.05.10.23.52.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 23:52:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2018 23:52:47 -0700
Message-Id: <20180511065249.40069-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 1/3] gcc-sanitizers: Package new liblsan objects built with gcc8
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
X-List-Received-Date: Fri, 11 May 2018 06:52:51 -0000

Fixes installed-vs-shipped QA errors

Reported-by: Dan McGregor <danismostlikely@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 3b7e0028f2..e5e84526fa 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -94,6 +94,7 @@ FILES_liblsan += "${libdir}/liblsan.so.*"
 FILES_liblsan-dev += "\
     ${libdir}/liblsan.so \
     ${libdir}/liblsan.la \
+    ${libdir}/liblsan_preinit.o \
 "
 FILES_liblsan-staticdev += "${libdir}/liblsan.a"
 
-- 
2.17.0


