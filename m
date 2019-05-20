Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 720A27E07F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:01 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 7so13231306wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZD5N6PK9QgX9K5sGZqsv4mHrrMjoABHFaw5N/yjqSiE=;
	b=tYnj9CQM+Wb7tXa7a8a/T3xWBZLbMzn7+02P2SPSWTiimopZ6ICEIXeW22HxiBOh6j
	X4MTYGHLzCZ5676s2b4AO11tEoPf2Z2rVO7glhhYXd0r6Vhi2A6UL9Bxm6jCHzT7c3uh
	PZ7G3YNeeG7Qp0u6yxUcJVcRb0Hhs2p0tIkFgcMkZCK0ApHO0oUXhDQBJFcIOk0YH8IR
	r6ReCyaG/3XQX2E3lfGJGaZHti1iDV4KoTHAFfeBG1c+AKLSdhdg3T7lgWPYF6lQU5zL
	GxKIDlRIHGFOvgsWxKLgzqBhAT8ubhIH+1FOFV0a7IoPByn8awSwX1yOLj7rNQc5fLGk
	C4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZD5N6PK9QgX9K5sGZqsv4mHrrMjoABHFaw5N/yjqSiE=;
	b=fPZiVEGgrzTBKh6ESLCcVkvaW3LFCxAXo6VZgoBzIkgi1n7L/m5JrkKnqAjsGAmhcC
	cx7MTFxbibG2UNXvpoM5f/2wTtp/IrkiF1XbnZlQFhVe1qEJj3A4mysrqfqyvmWHoCzK
	q23X5h/wcjUPuiLyzkemfyh0hSlfgzFvS5+YzqT7eZYyH2jBAdpAvi0RWOVhY8RdJj96
	cTe1IAxMpUkXI7vDsF3pHW3FvcQRJqhu4VtX/dU70D6rHPKVrc0zNyJrwWPGHF6FAqOz
	qfgqhGAt9igVUZItz9x+FmlNE167fbMsVzZdeFRhj/MlgtwNbtJ3Q4u8TX9Cl1UdQS0C
	e7nQ==
X-Gm-Message-State: APjAAAUsrI7x0oSLNLe9uTPU67hGGtVeuBoFI5kqxLgsvYZns89IJ88o
	BqrgqCV0YoZjJtWUFrT9sc1J6LmT
X-Google-Smtp-Source: APXvYqwT753QW/Utp7x7MoDrhLB2OHKfFi82lZsoulY36hNBJTNsrr6PWyqEbfB+mRwyas9fN2+tdA==
X-Received: by 2002:a1c:40c6:: with SMTP id n189mr12417000wma.65.1558361522001;
	Mon, 20 May 2019 07:12:02 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:13 +0200
Message-Id: <20190520141125.10805-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 30/42] python3-pbr: upgrade 5.1.3 -> 5.2.0
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
X-List-Received-Date: Mon, 20 May 2019 14:12:01 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3-pbr_5.1.3.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.2.0.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.1.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.2.0.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.1.3.bb b/meta/recipes-devtools/python/python3-pbr_5.1.3.bb
deleted file mode 100644
index d9b6ce74a34..00000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.1.3.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-SRC_URI[md5sum] = "08972dca5fd2a959f27842090973edd6"
-SRC_URI[sha256sum] = "8c361cc353d988e4f5b998555c88098b9d5964c2e11acf7b0d21925a66bb5824"
-
diff --git a/meta/recipes-devtools/python/python3-pbr_5.2.0.bb b/meta/recipes-devtools/python/python3-pbr_5.2.0.bb
new file mode 100644
index 00000000000..ed6832e4afe
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.2.0.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+SRC_URI[md5sum] = "2bca008fd08d035a2f78c606d876a6db"
+SRC_URI[sha256sum] = "d950c64aeea5456bbd147468382a5bb77fe692c13c9f00f0219814ce5b642755"
+
-- 
2.17.1


