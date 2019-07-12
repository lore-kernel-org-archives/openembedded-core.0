Return-Path: <joshuagloe@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 10D387F143
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 14:09:01 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id x15so9081363wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 07:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kpdtA0GazHkZGF8u8mh13fq7WnBZw9d3uFZCZl4VzII=;
	b=YpxEkTwCgtsoqGMnrip3xc/uqlJjhpzr/fWkt6/uO5UZp+K1x5RyYSXopbDrS/ERY/
	ZMFZw4SFkJxWmyi8m86LDgfvDPwfV2UqCYN6AC1VAV5ddP5mJNcVh4Q1Z9rgaM/P8+Ip
	mwfd6+zmn6xx76d2HX/sA2p3rGq3WcDcY/w6oJ4No9EAHNE/DB8VCoNjk3SiuZSl1v1E
	LSNyAzR0DJ4XEqHRfgVSsmR80HYIzeHgBb/PMRa6MnjrLY+pVcTSrDjBSyxeSZgpHUXl
	o/j8hO7nLFSAnTEv8/cLdB3ntorGYGih5yL8oBaqZJdMzrcXGpFLtUDNI5n/I3ahzUoc
	ItpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kpdtA0GazHkZGF8u8mh13fq7WnBZw9d3uFZCZl4VzII=;
	b=m4mX5RBZEP7DWL638nTkjVn1dcTemstjjhEEzmFKAtiayQgZDhKSiIj55HNOmJNdbh
	87UIsuudU9pfNomgZIGfcm4Z4OzNG2nTlDLJ2BaY0GUt6uCyUIbYlPFyncgQXexZjFDm
	xxOH/FLie7fjNOSD4aqw7yEuIaEdt9Z9EMReQ1qYaw5REExhYeaXHzMNnWns6e6k6vZH
	QNKg9H+vrR3GCVs4UxqcqNZEDDNQ7VcTtXNTHHjSoDoLsfl5xNQGvwOSmWmo0GM6CEgg
	RdBFv5RyRxoSw4DlSwXGWSNjBCW8IyKrHXspWyTYlS1zdDiA8PNNbladWR2+Q8VHdAFO
	/bJg==
X-Gm-Message-State: APjAAAU5dEZOjwPEorMTS0XmIj5oZGo0yEwrgOTI3BP6Q6FJAgiWKWsD
	HoNZ0V7nh7LDn6ef540JvVwaYUz2YVM=
X-Google-Smtp-Source: APXvYqyvZr9gCGVukHO9vpd0r5hohB0ro0R4I/YjiBNkZZswhKVzcJ2L36K/vuEnXU+8VR/qBZTeWQ==
X-Received: by 2002:a1c:720e:: with SMTP id n14mr10011683wmc.53.1562940542629; 
	Fri, 12 Jul 2019 07:09:02 -0700 (PDT)
Received: from localhost.localdomain
	(host165-120-157-205.range165-120.btcentralplus.com.
	[165.120.157.205])
	by smtp.gmail.com with ESMTPSA id i6sm4206262wrv.47.2019.07.12.07.09.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 07:09:02 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <jlock@vmware.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 15:08:15 +0100
Message-Id: <20190712140815.11304-1-jlock@vmware.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Joshua Lock <jlock@vmware.com>
Subject: [PATCH] python3-manifest: add entry to package the timeit module
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
X-List-Received-Date: Fri, 12 Jul 2019 14:09:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Lock <jlock@vmware.com>
---
 .../python/python3/python3-manifest.json             | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 0803ac0033..17d41c34b9 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1131,6 +1131,18 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
         ]
     },
+    "timeit": {
+        "summary": "Simple way to time small bits of code",
+        "rdepends": [
+            "core"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/timeit.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/timeit.*.pyc"
+        ]
+    },
     "tkinter": {
         "summary": "Python Tcl/Tk bindings",
         "rdepends": [
-- 
2.21.0


