Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 286F07838F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:23:41 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id w12so510364pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OFRJxX7HPXW+caqiLUFSSRAF08UXoiEkQ0BP++pDJGQ=;
	b=l6UKy/6RtcIGWzXScvZ41rqxWZ0nO6AAGJf4Sc3jeq8vfZLjOiOEEohLl0T9YTHYek
	amyy/rg6b3mzd9MBPj0ids08ORTU8hJ6yhYXEkCVu0psrgX9yqI73qUy/HaC4K9xabgF
	G5EI6dpl5FRYuVfiBhaIBG+pDMVCyi0PF52YHo189iwSIc+sixTIrJtqFAC0Z11veh1O
	8FBrx+yCPOn7Yoin/IGOQ5Ke7yS6WsWXAitohQm/koBYdc1Havbfn0Je9lhmZdm6vS2Z
	/WATyxJWOgIQQI9ywcjT7a6BN79olWB7NZGNUyqiT8e8NSIqBWsqXsWHRqU0ib5fPRcU
	vzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OFRJxX7HPXW+caqiLUFSSRAF08UXoiEkQ0BP++pDJGQ=;
	b=soWvho1MnEDG401crL7fJ8CAFFICZsIYS+M8Z7ggP9fIKbSuJ9Sp6IcZaUv7t8f0wk
	BLF/zEExiPup0rZ592J2pqvseIruBNYzX2TWrMx5yZxgZzZaPHMJpRwbwWVtrt1ayvKE
	9RFqfxmJYzZcPSUNCNd1g9vVwQXzfPjpRZwzutD6/8UrAADY146a0HEY+79+B7u+/Mvn
	u/SWcP3ekNShsnW6SinV8QWeujjDMJtgmavHE6N+oGTOcLrHE9ly/VqxjFD+ayxeiaDE
	vLfwCIxxPJQThLJQ/6BllQpjJ5XGvBJFtig79WywDKU6C0tHaf8m9gY7uP9P3cUClGR+
	cvQQ==
X-Gm-Message-State: AKS2vOzGjpHq3mtqrZMcR1+DK91U5mKgoniiwZ+o43nCcKm992jp90e0
	NTQg4TryUmftewpM
X-Received: by 10.84.238.131 with SMTP id v3mr699242plk.168.1497453823121;
	Wed, 14 Jun 2017 08:23:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id i2sm502948pfe.89.2017.06.14.08.23.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 08:23:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 08:23:22 -0700
Message-Id: <ac58446c99c678d5ef54363ce2d4c901ebd2e092.1497453168.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497453168.git.raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
Subject: [PATCH 03/10] distutils, setuptools: Delete use of SECURITY_NO_PIE_CFLAGS
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
X-List-Received-Date: Wed, 14 Jun 2017 15:23:42 -0000

gcc can handle PIE in gcc driver

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils-common-base.bbclass | 2 --
 meta/classes/setuptools.bbclass            | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index fa733c672c..824a1b68b1 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -11,5 +11,3 @@ FILES_${PN}-dev += "\
   ${libdir}/pkgconfig \
   ${PYTHON_SITEPACKAGES_DIR}/*.la \
 "
-
-SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
index 7d0c5267d7..56343b1c73 100644
--- a/meta/classes/setuptools.bbclass
+++ b/meta/classes/setuptools.bbclass
@@ -6,5 +6,3 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
-
-SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.13.1


