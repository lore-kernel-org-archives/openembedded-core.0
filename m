Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9C21878744
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 03:02:16 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id d71so10454171iog.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3TJO2NUVRrbQIvMPmLoQzYNhyUapGgK5uQNBC+3nvU8=;
	b=tNwXMFes4uL6vAGP6raVQHdc5AK4Th8MjNIRMkRJwB5vZPSBzpjNX3erLSjX4foBqq
	1xWw/mwCZ6qXg6+3jZWo4XgGefHXOEa350nihOm+MX/eOjwsg6cZdrjXvYJaxYDNYA94
	45oM4VvO9hWJ/O5qR5WTwcYZRyAmS7Qj1ZqeUjZC+QPnNKKvuRnZe6OgQtWhJzXw0W37
	shQuhV/eyhRZe/hH4+9KX7pXsKMHHkGjwhSW7ebm9qOUKIKDOeahuZayye+LB0RnrTHo
	z5aLfEOVsianPq+hdK2ffk3470pr2cbOfsOK0qnYHBayAQZffsntx9PuhgWMpHdTKzC+
	jttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3TJO2NUVRrbQIvMPmLoQzYNhyUapGgK5uQNBC+3nvU8=;
	b=JIb5j9Qxl3LkObcfPSRhKhbUU+l0xiEA8iNPkca+6Rktj4rnljaMeNovkHVP1ZzfEi
	6aAG4w0gH3EpWHAuO9cAAKz23PuGXSC7/gfaJ+4gIergi2cU82h0D7agRmTjZbN5EX8o
	YwIlD/owzHuoVNZ6WzOsHqu0Yl5BVqsyZvBS/O56nQ9VyhO6/r6QFDQCNXb2/KgoPua8
	XZ1L5tOo5VlNJFP0M2RmtqW7fIQ9ygQ4TBQ0zrXlnSTgEUuZkQKElXaSSxcIK70cwZCy
	o2r4iXEC19VSt9zvMLtsqUlxYFRqtjAcLjEZfs+qtDc9lQk0OWY4VYT00ia3api8Zb/j
	yi9g==
X-Gm-Message-State: APf1xPDZs/slSBvEJlXN1ozqFP19gInProP4V9+u9nEmtTpPte4Mfknn
	HNIc9RKAzb/+rXZsSUdq+l80NnR2
X-Google-Smtp-Source: AG47ELsKws3pgJp4NzfqjE/7+s5Gk/ukj0c1StdNRq/B/LoQbWZzdEchvDEq3aqDDGY38AA7bKjr/g==
X-Received: by 10.107.132.227 with SMTP id o96mr14897880ioi.58.1519700537787; 
	Mon, 26 Feb 2018 19:02:17 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id m5sm6301932iti.2.2018.02.26.19.02.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Feb 2018 19:02:17 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 21:01:35 -0600
Message-Id: <20180227030135.3120-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180227030135.3120-1-JPEWhacker@gmail.com>
References: <20180226223054.5687-1-JPEWhacker@gmail.com>
	<20180227030135.3120-1-JPEWhacker@gmail.com>
Subject: [PATCH v2 2/2] sstatesig: Ignore icecc-create-env in task sigs
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
X-List-Received-Date: Tue, 27 Feb 2018 03:02:16 -0000

Changes to the icecc-create-env recipe should not cause all recipes to
rebuild just because the have inherited icecc.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 3a8778eae01..6be9d32133a 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -29,7 +29,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
         return True
 
     # Quilt (patch application) changing isn't likely to affect anything
-    excludelist = ['quilt-native', 'subversion-native', 'git-native', 'ccache-native']
+    excludelist = ['quilt-native', 'subversion-native', 'git-native', 'ccache-native', 'icecc-create-env-native']
     if depname in excludelist and recipename != depname:
         return False
 
-- 
2.14.3


