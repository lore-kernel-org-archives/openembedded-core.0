Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id A0EE071A32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2018 13:39:22 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id s48so15427397qtb.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2018 06:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=osBRgP2EPJ5KJ3wuxSnAzzjz8wL4b0XkhXYl5Yicd0k=;
	b=kVCNdA+DAQP+4pm997MebEpdgskLdaE0I6cXZqGHHTpuRRD64ZT9LmfAHQa6sq9wwf
	oTGNkg0fGZKanu9pVbfN4RpOQatj3MLGptGOA4dru/PvAPMMI6OhbYoHHCd+DnstWYDe
	idYRx3QtWPhicgIh1maXFxC3ZOKgYRROLXlXq1yYO2xxMvPUTUUonsDsqKowzzKe2NUz
	ZocjTEnj/Aexe3kzfES7YosjDjzIaQrs0Q7QCUapeaskPs3qZslVisqxG+QNkyf9P1tn
	yYdALqFhcyzLxqyxqjMqHO99vVAqZ+fKlBl963KYhMlGxH1HNWpYVsa2chyV2UuMrw8n
	epgQ==
X-Gm-Message-State: AElRT7FMbvPWyeshRN77Ci5e88fUHDrlRHAu8joPZyBTp+0psjHBBrz7
	tjknMUGoEpT7OY7ExDQwiFuhTXil
X-Google-Smtp-Source: AG47ELtMAGz+h4YZseABIk8E1lSr+Su8VBy6CjVJk8EjBKGyhU3Jx9DI2e/wOFzC9B7UFt2rIbwIsw==
X-Received: by 10.200.27.135 with SMTP id z7mr13022878qtj.294.1521380363031;
	Sun, 18 Mar 2018 06:39:23 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id n7sm8229740qtl.22.2018.03.18.06.39.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Mar 2018 06:39:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Mar 2018 09:39:14 -0400
Message-Id: <1521380354-21536-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pip: update to 9.0.2
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
X-List-Received-Date: Sun, 18 Mar 2018 13:39:22 -0000

Update to the latest stable release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pip_9.0.1.bb => python3-pip_9.0.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_9.0.1.bb => python3-pip_9.0.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pip_9.0.1.bb b/meta/recipes-devtools/python/python3-pip_9.0.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pip_9.0.1.bb
rename to meta/recipes-devtools/python/python3-pip_9.0.2.bb
index cd849eb..53fd6dc 100644
--- a/meta/recipes-devtools/python/python3-pip_9.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_9.0.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "35f01da33009719497f01a4ba69d63c9"
-SRC_URI[sha256sum] = "09f243e1a7b461f654c26a725fa373211bb7ff17a9300058b205c61658ca940d"
+SRC_URI[md5sum] = "2fddd680422326b9d1fbf56112cf341d"
+SRC_URI[sha256sum] = "88110a224e9d30e5d76592a0b2130ef10e7e67a6426e8617bb918fffbfe91fe5"
 
 inherit pypi distutils3
 
-- 
2.7.4


