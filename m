Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id DA8E47C767
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 16:04:06 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t18so10922314wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 08:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jT7UvoKp6l//Rk4EGDDeZTrp19hmuL0StXMn/L6okC8=;
	b=QBcqhWvVNLN8XJIvq39tUi5i2R19oqMFViSNFQWQYOvyRuNPEsvrCOmyFfz1C4wtHC
	f4Wpo5jk/SXfJwKN4vjJNlbKvnZoNJGMXG0VI5ebAVOUoFrmRAtJR2hAQjsnpkZfe8it
	wSO2BrPVcn0sYmXtjzce0BeVo4JDhTec9AXwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jT7UvoKp6l//Rk4EGDDeZTrp19hmuL0StXMn/L6okC8=;
	b=l2Ix7JU+QA7OPBAkCKXYT9/aq5ZAmOWcpPPYkGOp5OptIi3+Sxd+ky0k6HkGsQ7C1D
	ybQsWGOINJR6cGRxGdU753zGTKTfqRyLjH3L1sCqevQhODHDVjqr2EzgtUn/oPCOplRs
	QptqgOE5XLEiV9DSnc+OJ2Z9rEf3WWUbuHPXRTikI+8Aal12qRgKSXm+Z1oSMSo24jfr
	tnjGQR/RchN5qMSmgBN2kZWA3nHKqlozCe7VMI+/Y29tbsOxXfrPBuBMJbWeTb02E4n+
	yyUjhpp8is+ZqaZXbzeJI1dyjolIWM8ra6pmHEouugnyCCzqO367HwefyVZ3cj4wk6Cg
	3Chw==
X-Gm-Message-State: AHQUAuZ5Ox0JW8uQ00L80xB7VEwiefkyU/U2NPypKIgCcenYVBOKQtYf
	W4DRu83WFHco0Ai3lcZjyp7z82Zb7PI=
X-Google-Smtp-Source: AHgI3Ia9+o8EkQQOZJEP8jmp5wl6noKVPLSik3Ivi2fpYDdIzDL3YOb056SlG4qaQe8ONpe7uhEUSw==
X-Received: by 2002:adf:e34e:: with SMTP id n14mr7757435wrj.195.1550246647274; 
	Fri, 15 Feb 2019 08:04:07 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e17sm3810424wrs.79.2019.02.15.08.04.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 08:04:06 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 16:03:54 +0000
Message-Id: <20190215160356.9764-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
References: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/5] lttng-ust: Upgrade 2.10.2 -> 2.10.3
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
X-List-Received-Date: Fri, 15 Feb 2019 16:04:07 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-ust_2.10.2.bb => lttng-ust_2.10.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.10.2.bb => lttng-ust_2.10.3.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.2.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-ust_2.10.2.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
index 3e5f37d8865..b5c43200d62 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.10.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
@@ -23,8 +23,8 @@ PE = "2"
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://lttng-ust-doc-examples-disable.patch \
           "
-SRC_URI[md5sum] = "a95333f76e2986113154b8193f5cfca3"
-SRC_URI[sha256sum] = "c4ca22b904eb08817b313a73d499e1b217ffee1f862156d0d52865317486c045"
+SRC_URI[md5sum] = "ffcfa8c1ba9a52f002d240e936e9afa2"
+SRC_URI[sha256sum] = "9e8420f90d5f963f7aa32bc6d44adc1e491136f687c69ffb7a3075d33b40852b"
 
 CVE_PRODUCT = "ust"
 
-- 
2.20.1


