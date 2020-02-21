Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1701761757
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:45:37 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id n7so2042841pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 14:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ffd2leJfsa3NZ+jfZzB0EU/IjDSNqLAIQWxF15owRJI=;
	b=S1Q+ENgUKcPBYwPmyo5aIgwXXZEldevbP13x12HKSe4z/lzxHmIHzXnM9/PTVALiGE
	2rQRa61a4NfdEZ1gH35pLGn4NCsDkfdf22eZL9LFCAAfktpaHZ211QmRO19Qwt9VW8GL
	RZxBu0OkLb0Vl2AvqzsIByVXfzkufIeV3fNyroeNnkxbYo4jP55uygmzJYXAXzCNViFz
	7/kF8PNKxSbZDlm5/E5OzdMNf/J4IIcyXW6QuY+EF1yPiXUb7nGuaQ3sVnF9Yciy7KoT
	Ka5XVJrVkPMbNTRzf7gM+hjWikfYqiLe58au6o5uyKHcAQfoTmUiqKkR814IvQeIyqOt
	vGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ffd2leJfsa3NZ+jfZzB0EU/IjDSNqLAIQWxF15owRJI=;
	b=TWyZOKTBrPSLTMJGvOQ7ixSqE4Cogvd16UdVJzHCOd69+ddC5D5WV82PVTqlLCl5F8
	4dUfHozc3NmAOdQXA5k5L1SQx0CJJxrCVxCfp9RRzBEctlbyGbaEvU8yzVD6iu/vVSoz
	373wQ2Csc14VgkB7DtFYCkWOE20d4qjGr7EutZrRErtIOLOJzDAWc3UrB5RQELPXfQ1P
	zOlplJl4AqCCigcFXKsorNqkR4vs++GafPIam0oDGKSChwAtbnwibXlLo6o+r0xwgMi/
	kAciXk/Rp8yRIzvZAhhFw3qNEcnAXYM0lLMhatmEcqI0dhudVmYoeIGtvP/vCyeNZOiE
	nfQg==
X-Gm-Message-State: APjAAAWtHllw8dszy01C+Q6SwLuBn28NVfwU3fNgRRa4PRjygb5qJZSK
	lvY2t+b1I4pzpKgPX/BVMvP87Fr4uVY=
X-Google-Smtp-Source: APXvYqw6ok+YyJRqidqv1oraQ+9iqd+kvACH0edWesQn/x4Dgvk0/bALGbx0hse5x2UxmxpWXcpbOg==
X-Received: by 2002:a62:5bc3:: with SMTP id
	p186mr16889838pfb.162.1582325138629; 
	Fri, 21 Feb 2020 14:45:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	m12sm3830284pfh.37.2020.02.21.14.45.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 14:45:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 14:45:36 -0800
Message-Id: <20200221224537.4052134-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221224537.4052134-1-raj.khem@gmail.com>
References: <20200221224537.4052134-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] go: Upgrade to 1.13.8 minor release
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
X-List-Received-Date: Fri, 21 Feb 2020 22:45:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.13.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.13.inc b/meta/recipes-devtools/go/go-1.13.inc
index 39dbd742ec..7780aced89 100644
--- a/meta/recipes-devtools/go/go-1.13.inc
+++ b/meta/recipes-devtools/go/go-1.13.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.13"
-GO_MINOR = ".5"
+GO_MINOR = ".8"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,6 +19,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "ecd1729313608d3ef352ea4fd9ea42cd"
-SRC_URI[main.sha256sum] = "27d356e2a0b30d9983b60a788cf225da5f914066b37a6b4f69d457ba55a626ff"
-
+SRC_URI[main.md5sum] = "984c244563f2d2f48103e8d6db8a8308"
+SRC_URI[main.sha256sum] = "b13bf04633d4d8cf53226ebeaace8d4d2fd07ae6fa676d0844a688339debec34"
-- 
2.25.1


