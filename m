Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9E9B67CE53
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 05:00:22 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x9so12319736iog.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 21:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6TnYZZgcxVpezfgy+dOBvZA9Oap2RvZPo14c2ZOL7bs=;
	b=fdW0Qm2WGNhNornKstgvket1zzkolri7J+R4bWvVwMh7MHXZ/pkHue3l7f2RVJ0HHs
	wwJE+QBDp36cr4/ZGgyQUM2PxTVAaaFfSKw3yoep7qtsX3XGmP51U59SYTMclSvh5KzG
	tIOnNKUf39msxhd0QRfHScZFwAo7eDDIoBsBTa4fypRdH+bFKXLY/2CeBGi4zekeLu/+
	nndElXV7mjQr+sjfcbfsRPUn6pSFNkveOY6O24qNT2+GTntiP9HGk8IzkPkzwpF9wesA
	O5V8nd29+SFGAkYM/QFr+pZxYY5x43HRqjhLXnNy4cWb/zF/24TehrdgmfGFtdbf3zOR
	xqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6TnYZZgcxVpezfgy+dOBvZA9Oap2RvZPo14c2ZOL7bs=;
	b=eF01yeCux/tYrV7zzZKxOxWSVUKKQ45gZk5Q38IM89yClUM5dNaaySTeDe/YikXktq
	ryqZIwEQXkx1R+w7qGGkYCd9YhpGTRDNkKAoBQ3o/9qbbsiUNiM4A61o4HtvHY/FwfMF
	O5ZyyDC0Qhuutt4ntcJrjjcJEERqyVUEFb12SetEv8mqyAIocB7nC4dd+Xl98ThyyGbj
	piZfmlowrk71dDBcCkzDuzlC30W9vZyKWz6QdNxjC8lzq8ua+cgkV5D7hiFXyM5buSbv
	vzSITNUZ7um2NWYrwFqPpusvca3w4D8fKP9N8kT3f9gTIyIvuvWly13v0KDpoePOvw+B
	YNQg==
X-Gm-Message-State: APjAAAXvXyEPrNa1SuAjExvV+Uf8eDNru/hoKe7pdHy0JPMPK0FVpOPL
	SuvL7b5YwzyXbaAVJkvIkNQ=
X-Google-Smtp-Source: APXvYqxakocjYh3URnPANB7VEhbZHuAwXxvMAe8y/hS8n4xoKy6buWAmIwVapCXfC4jVSG6NjoPvJw==
X-Received: by 2002:a5d:848d:: with SMTP id t13mr5471974iom.278.1551934823458; 
	Wed, 06 Mar 2019 21:00:23 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	o141sm1811451ito.14.2019.03.06.21.00.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 21:00:22 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  7 Mar 2019 00:00:18 -0500
Message-Id: <20190307050019.23389-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190307050019.23389-1-bruce.ashfield@gmail.com>
References: <20190307050019.23389-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] core-image-kernel-dev: add systemtap and dependencies
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
X-List-Received-Date: Thu, 07 Mar 2019 05:00:22 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To allow the kernel-dev image to test systemtap, we add the userspace
and required image configuration.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-extended/images/core-image-kernel-dev.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
index a40b3aa955..4d16da1ea8 100644
--- a/meta/recipes-extended/images/core-image-kernel-dev.bb
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -11,6 +11,7 @@ KERNEL_DEV_MODULE ?= "kernel-modules"
 CORE_IMAGE_EXTRA_INSTALL += "${KERNEL_DEV_MODULE} \
                              ${KERNEL_DEV_UTILS} \
                              ${KERNEL_DEV_TOOLS} \
+                             systemtap \
                             "
 
 # We need extra space for things like kernel builds, etc.
@@ -18,3 +19,5 @@ IMAGE_ROOTFS_EXTRA_SPACE_append = " + 3000000"
 
 # Let's define our own subset to test, we can later add a on-target kernel build even!
 DEFAULT_TEST_SUITES = "ping ssh df connman syslog scp date parselogs"
+
+IMAGE_FEATURES += "tools-profile"
-- 
2.19.1


