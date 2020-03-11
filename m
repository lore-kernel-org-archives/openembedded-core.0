Return-Path: <wallinux@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 792D360786
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 09:40:28 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q19so1509479ljp.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+XEqSSw6Rp+acHniu8SrKaZFQXkRhL6GcKYTizknBV8=;
	b=faZWCz/75QU9REc5RL1XIr6CzyfBy7yMcBpKw7vsfWdOepT1F5lXGW6nVOyvbP2k7/
	tgxYSXdSJ6T/SKAxR9hVELxPD6mYbChUYJMHIViTdSAtL482RjCLm8tB+mdYo4Ig660a
	bgyX0w1jE9AH2Mtl3Ax08i3t46AYrsNG62HuonbtC2ZycL4w7DYK21sucky7igDG6juF
	XqCUn1fspO6LgCYRQ4YrFkyXNSjgJ8nBpVtnuFbj3voD/Cqzozm6EBK4J935dlTrhths
	bd7TK2/yIb+rK0ml/Saq8dKI3UGZ+04cvuP+ysQ7tg79EBxD4RQD6OziaUNXGgz+s7zn
	zqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+XEqSSw6Rp+acHniu8SrKaZFQXkRhL6GcKYTizknBV8=;
	b=AP1B3fJ0ew4b5rYloJQhy4nCHt61qb+F/l/AOfjS5GKqctykrYyOT5OknTQGUdJTct
	/mrnDa0SLGku7nFUbbF1ff5YD9szSXUzKtonn/o/f7+eS9gp2nWmuLoE5wdwODqzLW+S
	Pt5oCwRzMXMO3xBqZjVP2zTD9AgI8ZDXtfczuZt9qaWlGvo8TKQ00CMJURVFBDFw34JA
	KcWfxJ6HEok/RiNtSDbG3Ju2WuNLJnmXBp8/AxWw7qy3YiZ+qle0TFOSmBzQ5Vyv7jdG
	PTfhh1wughHB/nOA9tfMd7YQWhkzDyOrmaAJEmpAphHskLOvIK2Gy4Tl5G4GeKxYXwA+
	3lEg==
X-Gm-Message-State: ANhLgQ3aFuQd6iAQeuILVtmHB+nYxcjW+PU4yUL4P9SOXwdeSrqe7eId
	OtOcIZpt61ZyGqTrSIp6JqL/2dq7Xio=
X-Google-Smtp-Source: ADFU+vtOKuwBUUN9juIpWgLjTUXR7jkzjbyJiOQNKHZ2iPv66sqNM/3KGFg0Lvhvb9vFxZlya9HbVw==
X-Received: by 2002:a2e:960b:: with SMTP id v11mr1615320ljh.115.1583919628846; 
	Wed, 11 Mar 2020 02:40:28 -0700 (PDT)
Received: from arn-awallin-linux-l5.corp.ad.wrs.com
	(host-95-199-24-28.mobileonline.telia.com. [95.199.24.28])
	by smtp.gmail.com with ESMTPSA id k2sm2578754lfc.95.2020.03.11.02.40.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 02:40:28 -0700 (PDT)
From: Anders Wallin <wallinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 10:40:15 +0100
Message-Id: <20200311094015.14893-1-wallinux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] lttng-ust: update to 2.11.1
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
X-List-Received-Date: Wed, 11 Mar 2020 09:40:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anders Wallin <wallinux@gmail.com>
---
 .../lttng/{lttng-ust_2.11.0.bb => lttng-ust_2.11.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.11.0.bb => lttng-ust_2.11.1.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb
index 0e03a31652..3bd0dfad61 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb
@@ -31,8 +31,8 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
            "
 
-SRC_URI[md5sum] = "99823cfeb76562d753ffe67880e9cc59"
-SRC_URI[sha256sum] = "683280cfe5e12021e64c32cef9eeb0128f1f23dec32ba28adb5a2074be37c4d8"
+SRC_URI[md5sum] = "7de04a8ff1f0a4effa09a42620ec4081"
+SRC_URI[sha256sum] = "7fbab963d60741ffd4d8dd0a246f6cf168cdfe3b2385798bd90550f5f0bba869"
 
 CVE_PRODUCT = "ust"
 
-- 
2.25.1


