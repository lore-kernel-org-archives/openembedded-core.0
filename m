Return-Path: <ross.burton@intel.com>
Received: from mail-wj0-f177.google.com (mail-wj0-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 51A7571AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 16:50:44 +0000 (UTC)
Received: by mail-wj0-f177.google.com with SMTP id tg4so111474271wjb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 08:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tygmFZd3PIKGNiyeKyuJCmHl5/EJb1gy7CjsueiDLYQ=;
	b=v3HLwK8mCgGSljpzeLuqRhKWIaxHB9vGA8tDXNU82HkGAGF/uSPvnX0fU4SZqssUpA
	z1ywiit2abiwt/JTPnDOIB8mVZEYsSg8uPDFQYmjRcvxTib0drMDDlWZ9rJ8VeFs5VKQ
	ELonjNWZoCYpmcpsQkzV9UDpOPhSTsVbX50URHDD+RdL3WcauxHK9/YvrWPmJT3M756M
	D1ohKwx14UpQuo8ZKDnU62Aw03LmZts0z2MBginPpiS+Fnz/OGws8zJaB3Ei6rlzipg5
	U+67eDEyJXzJr6moPrydvXYsCiCnhqYEt/JiYAU/GbK/tTAzVTylV++C7DabXQ11tasD
	6tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tygmFZd3PIKGNiyeKyuJCmHl5/EJb1gy7CjsueiDLYQ=;
	b=PY5rbtujm9wUOmtM3y7cjgugcahW2DpGalHWZMPQdsnGuJkdv6jJw/kBCf58CD9ygy
	XECjMMOahRUZG+w+iLq6fR88EZF4fFn/JRgVatZpYfnFT3bvaL/ALhqUVdvKg0ie9LUq
	z8bofdFFtgewHsy1Lb4jVnat316B/y5xIT1+fBkXd6n1aly5KplXr8A/k8upEeBiV4P/
	1UyBnWtOG7WGBnwUO5zGGvu9AN7TW7Vy3bH4eMrIsClQR2K1PBx5djXRMaPyFiUgdKUX
	c8o1+rW9dMrc7I46bc3xy84duTKUiJTUm82xQOA0L00NnYTDM9X2mNQzrMi/CtHXJ9/i
	22zA==
X-Gm-Message-State: AKaTC01bLC75zF3Wl0VKr9os26SE2GMcLyI2N/FxbN3smdfZ8yRPlAKs18yFWgEMZiaY5g+Y
X-Received: by 10.194.87.103 with SMTP id w7mr36354837wjz.164.1481129445740;
	Wed, 07 Dec 2016 08:50:45 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	138sm10535402wms.20.2016.12.07.08.50.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Dec 2016 08:50:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 16:50:38 +0000
Message-Id: <1481129438-28306-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1481129438-28306-1-git-send-email-ross.burton@intel.com>
References: <1481129438-28306-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] curl: set CVE_PRODUCT
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
X-List-Received-Date: Wed, 07 Dec 2016 16:50:45 -0000

This is 'libcurl' in NVD.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/curl/curl_7.51.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_7.51.0.bb b/meta/recipes-support/curl/curl_7.51.0.bb
index e1a996b..a9589b8 100644
--- a/meta/recipes-support/curl/curl_7.51.0.bb
+++ b/meta/recipes-support/curl/curl_7.51.0.bb
@@ -17,6 +17,7 @@ SRC_URI += " file://configure_ac.patch"
 SRC_URI[md5sum] = "09a7c5769a7eae676d5e2c86d51f167e"
 SRC_URI[sha256sum] = "7f8240048907e5030f67be0a6129bc4b333783b9cca1391026d700835a788dde"
 
+CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
 
 PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls proxy zlib"
-- 
2.8.1


