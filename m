Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id D09486BF3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 01:57:35 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id g189so1738154pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 17:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=avKpXa98tBJS24yJpBOzjoYabvIDgSkVh9yn92qS6ls=;
	b=mFezcHwyWfCptkCMuUMzL5DSG4qW9+tFSGfO1NaMVjNyVoQiHIgNvsYYBXKFMKECHV
	J1d+XFrIk0U1i+Ic416uwesL01Cg6KZY7U3tz4GFPFQi73Z9oMW2C93NV7XgUYWWxNWe
	7uRv5niwuGrHDcno9iJLqIGhT81x1np4494ydNywIARUVpaAWZQqc4ftbJ/n497XWrTw
	UYRNbh56wADLG8zevecvdZb6cUwigNz52krsliU/FvfX5Iw8xigO5dq/MqTPha5H6YA+
	aoujeqEaBn8091HpXIAbV1MKbdTXzdCcdYfnxq18HsEMBQqieQse9tCzJp1bsWfd1A8y
	8Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=avKpXa98tBJS24yJpBOzjoYabvIDgSkVh9yn92qS6ls=;
	b=QduvaMf0UQWt9L8c/Sa+im59Q85Ufi+tVQmM3N9LsCqql/KQclww4zwi3JoSzhht4b
	H6uiysoxZ4EXBQQ8i+FQklZhJTxD4ow25Clkx8gtDcqMgXr6EmhBTW+Bjs08X55bVdG5
	68Ijoc5QF/HaDqVSD2DZG3kTkNK7kkYZeYKD/oeCWfzWfFMtef79SPACzFWMe0woiCB4
	FgRyEpFu0cbVvGwX7VUNyIw4RfVGwkZSuK2fs0Wzx1q9HB9ByfI1Qs+3h1q6+Hsx2qxR
	Tubs+gbO2v6Gzst9Sp5xK+iUvMFtTtxhW/BZshUADADW/UbRQ4iN6dYd0iP5lq1nziiq
	y9LQ==
X-Gm-Message-State: AA+aEWZk4tbcEALxfa5Q/plBxlcGnM04/K8sRg9ys10Lf2f2ZEq8UBWf
	2sGpxMiai/b6rSCcowbSr5WIw5tuOe4=
X-Google-Smtp-Source: ALg8bN7SaM4t3Nn2UrhY40pOFMX2xF6DfE0qInxj9XWkYu/XWkp6M1ALAIVhmqg4Hl2mmbnwxwxV1Q==
X-Received: by 2002:a62:1992:: with SMTP id 140mr568718pfz.33.1545357456499;
	Thu, 20 Dec 2018 17:57:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	h128sm35407961pgc.15.2018.12.20.17.57.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Dec 2018 17:57:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 17:57:26 -0800
Message-Id: <20181221015726.30424-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181221015726.30424-1-raj.khem@gmail.com>
References: <20181221015726.30424-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] nfs-utils: Disable format-overflow as Werror
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
X-List-Received-Date: Fri, 21 Dec 2018 01:57:36 -0000
Content-Transfer-Encoding: 8bit

These warnings are intricate and we can ignore that for now as they are
being found by gcc 9, eventually this should be not needed when code
upstream is fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
index 6be2aab47c..63aa6add5a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
@@ -64,6 +64,8 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --with-statdpath=/var/lib/nfs/statd \
                "
 
+CFLAGS += "-Wno-error=format-overflow"
+
 PACKAGECONFIG ??= "tcp-wrappers \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
-- 
2.20.1


