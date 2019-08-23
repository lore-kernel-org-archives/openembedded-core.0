Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id C95307F386
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:52:40 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id 4so6200918pld.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XonVjlK/H1SybxyfvQL5NRKNLwTKJIBTUMyU1fiB+HA=;
	b=ZkNiIZE3wITELgFCYjO/S3JCDYkNGDrM0YZZ62g94UXfIoZYECT6ACrm+YNiuHDMul
	+6J4cb1ng6DKTpptKrhsGNei8FOenwvAbf2StXZVgIXTmFjOXb6QlzDMqEEDvKPv7Dwc
	PuvXQn+M/jescED1/qRWBr3u6aF+aqG4WEuSqBrcZ2UbjVTrNqNxwcmwA/XZMTQ8OBKr
	DSB76h1zuZx948R2uOVQOwp/vRBPd7ToDwVq80MfLxJq7CgGCKmbRjAFg8c6i2ggCZCF
	kbHWVPeABKDU1bgz6SYFeSiFDBtE7E7YwZq5GaL5LdjRU7A+PvI7gYqq59Ext3UEGwch
	NBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XonVjlK/H1SybxyfvQL5NRKNLwTKJIBTUMyU1fiB+HA=;
	b=J9SCNIb57CxfGMAZ9AAwUdJF9F+a9LKicgN33QrPWF+hxSmgNIwWNgT3jV0sXmf4j8
	0u6uLwRzHgtOKx/1zHT3S7hYdBnLOs/jmehq/mvfdlIZiahs2iK0bO0waTA7Ew++kDdC
	x7k6Rzrt50d3vPDlDRsxwbTcU109FFKh4mcNsj118SaXwcyZQoqW/Ey1LTox1fX6GGY0
	xAwNJNf6RQLgRqk78HUbc/iDmcxMyNWE6QU2MG4Oba7KuS9547QYTwIK+yYDTsu7g0eu
	Eb+vbQUSWgdw5wVEIztJ7vW3kVUb/UBhgZ+9QUR+u9fDxNcsF3L3ZKPOsi3WeTQ5LJ75
	NQ+Q==
X-Gm-Message-State: APjAAAXx8Ppm0GHtvy6W0UkJAdHd9cZX846mW9pkplMQEcdcz9a8R7Gu
	y8DhFdaTQUdPy4b7WFIMoZBLAcg7
X-Google-Smtp-Source: APXvYqwkEj/OpiaORyDpIFJtJBY0WQ8ldtFmquJaVkt8PePXGEhfymlttTi7MiUO9P2iU25RWRYFBw==
X-Received: by 2002:a17:902:fe06:: with SMTP id
	g6mr6879201plj.265.1566593561822; 
	Fri, 23 Aug 2019 13:52:41 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.52.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:52:41 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:33 -0700
Message-Id: <1566593504-21918-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 02/13] tune-arm1136jf-s.inc: add hardfloat support
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
X-List-Received-Date: Fri, 23 Aug 2019 20:52:40 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-arm1136jf-s.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index d883eba..b25995d 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -6,8 +6,11 @@ TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mcpu=arm1136jf-s', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', 'armv6:', '' ,d)}"
 
-AVAILTUNES += "arm1136jfs"
+AVAILTUNES += "arm1136jfs arm1136jfshf"
 ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
+ARMPKGARCH_tune-arm1136jfshf = "arm1136jfs"
 # mcpu is used so don't use armv6 as we don't want march
 TUNE_FEATURES_tune-arm1136jfs = "arm arm1136jfs"
+TUNE_FEATURES_tune-arm1136jfshf = "${TUNE_FEATURES_tune-arm1136jfs} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-arm1136jfs = "${PACKAGE_EXTRA_ARCHS_tune-armv6} arm1136jfs-vfp"
+PACKAGE_EXTRA_ARCHS_tune-arm1136jfshf = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} arm1136jfshf-vfp"
-- 
1.9.1


