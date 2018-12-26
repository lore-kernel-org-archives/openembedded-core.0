Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 09A556C12F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 20:10:24 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id u6so7875572plm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 12:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SKZDLWX/zIn/kKSMe372e9IS0WFdHm28pVDmw2Iqrzw=;
	b=r8m+bV6FfHkx+TlaJ26G+2UsNsEmgeK8xdND2cgA9p9o5NKuokFMOKjsdYildyHdG5
	1wWu4vp1BYFI2bmsvOjrzqAWU5oGEj4boJ1EkJ7KUQ8CFY6+U6TafxG3gVJ/ovOQ/FGu
	mq7lcaP7IX4EmOIGKRVt9pVplfnawwEhtVCJ3c8s89MBWhqVYDIhHKaMRtg5ymxuUHoS
	JfF8591n07IGYZfqZAaOvoGSIev9gqgfUtKK56ywV7DhUBvr4imIKByEDov6I8+zQ0Q0
	TbERXqznoA6nVkkF2fih+igBSH3jui+wIaENOX+EyGJ/SwXGGIYHkihumlY2GXPuGKVd
	I2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SKZDLWX/zIn/kKSMe372e9IS0WFdHm28pVDmw2Iqrzw=;
	b=GI6JQA2Z3yP4DCs92jtyy1Brvvxxeecp+sfRocNdw9CyN7jhfpmcRE514xDB/zTp45
	HXEkGQqH76p7MYr0zDpVeOMN4zWP/bTBzBk00zSHTnljLN1HOCO8cUoa+77rDZmF+0YP
	lRMAEgquNw6iW5j64bgpEckzegpPPCSXUFf1ek8RJp7SLgQ7h7VncRA+Ma841n+LiUQJ
	ujLJfDfICzW+2O4X7Kg0i16a893EOEdQrOTPE2BshV6fZtZFn2eAk0LKxVey8u5WNPfa
	4ZX6VofaJAmTTOYAG023kmZKkCHdCi9LTPqUDbAUuAQetyfflSoQeYxc/rbqJez473km
	ERzQ==
X-Gm-Message-State: AJcUukf+2OAhb28RHXBbWY5jj5MnvhQH2let3ulqZ/TdYwrdRKFjaS7K
	wZs910nJalEAyS6ZZemHKVptbV6J8Go=
X-Google-Smtp-Source: ALg8bN5zjeDOyegBDAKYpohZb3nNSBS1qfMKMsmmYSiWim9bLTvLQjmgnvaBTe6zkfwYc8nOAFA9yA==
X-Received: by 2002:a17:902:1127:: with SMTP id
	d36mr20469034pla.299.1545855025727; 
	Wed, 26 Dec 2018 12:10:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	l3sm60029493pga.92.2018.12.26.12.10.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 12:10:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2018 12:09:49 -0800
Message-Id: <20181226200954.5267-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181226200954.5267-1-raj.khem@gmail.com>
References: <20181226200954.5267-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] musl: Update to latest master
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
X-List-Received-Date: Wed, 26 Dec 2018 20:10:25 -0000
Content-Transfer-Encoding: 8bit

* sync APIs from  kernel v4.18
* Misc bug fixes

Full logs
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=39ef612aa193cc6e954ac5a01574300ccd4b7ef9..21a172dd36cae7a08492fd3a7500d7bf0daee13e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 046a08aec2..33d6e69130 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "39ef612aa193cc6e954ac5a01574300ccd4b7ef9"
+SRCREV = "21a172dd36cae7a08492fd3a7500d7bf0daee13e"
 
 PV = "1.1.20+git${SRCPV}"
 
-- 
2.20.1


