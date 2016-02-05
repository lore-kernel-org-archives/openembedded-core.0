Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id BC0A277142
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 19:56:37 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id il1so1885600obb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 11:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4I05Kmg7nzth8MQaPgsXepYhlxv2O8dLDQVXr2bTgtw=;
	b=RDs7AOfLukW2F3MgyC2JP3XA4yNNbuDuSN/G5laDofxORy+kWcJ7QqQ8Uuas6cJ6Ts
	Dh/prtuHt/rH/YXsLkAhAucfkc3oSKoMEjROc8kAmLqFbHcbBepNx5D4WByFyXCNsXny
	0yU+zDEbKnOr9ZPrX9tosnpGfHHwQx0a7eI2BNe8SthAzM69FRf9y109HVYBUa++Cnw8
	kKBMYn8COXxi2WGYubZgNiCWPthaf8xcQG0MvKSqREEI94OMbiwyuJJ/fu8aZfAhdgJJ
	ybNPswr0wTFbAeJOiQPiZVFImKPa7h+id89QdSS+rzolPt8Ho9tnficRPQimSFVXC6Zk
	5mYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4I05Kmg7nzth8MQaPgsXepYhlxv2O8dLDQVXr2bTgtw=;
	b=bWtja/f/BPrzKNBIwMrOjqDG/QQF5NN9YTinDQmqYtsrYcSfeywY9zTHsKSsbrKmmu
	Rtk/Q05idBIQ+k2tIKUKFftCafi9XALTzwx7iU5S+g0XyzMZcgSwqWWW8xmpleqzIjWz
	gw5f78vscPY/Gp7D4HevWRa4KKeyZiWwxFayX+kE5GzgQuShcs4tNGIQ6niuFKWNfq9f
	MBaUi/GtgORIRQj95ybU1MQ+tBL8nw4O1G6F63v6JDIVWoiMuS2Ii7ZQK28jQWi4beIG
	5V5frZf3ZukucCDv2WSzwSvjVUJdqqM2+xBqVtHdy2iZWfXYZfYdaHLZzg943nHhfXqM
	lvPA==
X-Gm-Message-State: AG10YORlMxpkOvKVmBAhhLwbLkFn4nmP27H+VJLX93ou58F3O8dRFeQdft/qsN8wY+hAAw==
X-Received: by 10.60.58.6 with SMTP id m6mr13549221oeq.47.1454702198338;
	Fri, 05 Feb 2016 11:56:38 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	f9sm10046151obw.13.2016.02.05.11.56.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 11:56:37 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 11:56:17 -0800
Message-Id: <1454702179-30239-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454702179-30239-1-git-send-email-armccurdy@gmail.com>
References: <1454702179-30239-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/4] gmp: move BBCLASSEXTEND = "native nativesdk" from gmp.inc into 6.1.0 recipe
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
X-List-Received-Date: Fri, 05 Feb 2016 19:56:37 -0000

It's unlikely that native builds of gmp 4.2.1 (ie the last LGPLv2
version) would ever be required (and given that recent versions of gcc
require gmp >= 4.3.2, native builds of gmp 4.2.1 are unlikely to work
very well). Restrict native and nativesdk builds to gmp 6.1.0 only.

  https://gcc.gnu.org/install/prerequisites.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gmp/gmp.inc      | 2 --
 meta/recipes-support/gmp/gmp_6.1.0.bb | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 1e3e2a0..2beea26 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -9,5 +9,3 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
 
 ARM_INSTRUCTION_SET = "arm"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/gmp/gmp_6.1.0.bb b/meta/recipes-support/gmp/gmp_6.1.0.bb
index 44bd8a2..de827f5 100644
--- a/meta/recipes-support/gmp/gmp_6.1.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.0.bb
@@ -29,3 +29,5 @@ do_install_append_class-target() {
 }
 
 SSTATE_SCAN_FILES += "gmp.h"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


