Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 997B378A96
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 11:02:06 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 139so14636597wmn.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 03:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mRW8EXVXJCXNwNqzYiD84y+v32aIEuif6iqbSgfTFo4=;
	b=EoZi4L+HYHyGxz0WiccFOiQvCSZ0PIbPRg0cwvhOKJDRJG9EJLVrlSy1LmVDWMWy9M
	mUqCyO8QS8bBv1DNbIn/EfI5/79Y2+91Yud4AQ9PdCphSms+0tKkxqzwyiiw/Ln7gZb/
	LujFUwNLjvuQ8/mFYa6VX4siQ3/QSHTxv8cXY5wxPzCckdKcG1U8MSxcOUsWmU3xkZMU
	apctIuO2OphqCtKGU2MDfcidj6RU/MhSih87oj9YsGr/mKRVvNpw3LT8/x99iGiI5+SY
	Xo2/HVmvNK5Yz7UUnDgL2sdDpJ8J70IPy6j3buyf8OuNZnbL6wfZtImKht8wpMiZodPN
	95Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mRW8EXVXJCXNwNqzYiD84y+v32aIEuif6iqbSgfTFo4=;
	b=QSXSyj5qRI2EPZDFASqT4s80phNTvF05XFOz5vtG/898h5tbqroE5B4GRPQHXPNGdf
	KraIpfBAjcphvRCMSJINnETj4RDgC+doGvAapuhrs6Gzir/ASXXH+gdYgZL6gfqziBiN
	Tsp6Tnl2izg7rJdpPAzKlGfiMfAKOGLqUQ48p/38WDVStA19Ayl4CdXeFCKKFVHWCvFz
	eYdUdLfcfY4s/nVvSbnboseSyfXRJW9h2F9sqbUHmLcD/kVlgnzKX31CUKQGlFR6mEXz
	R+Sd6a3N9AAtVdtJGYhFF9zRivKtqpZg6UDc02o2qzC0TlcOVd0ga/YVlI8tlf6UOkm+
	6tSw==
X-Gm-Message-State: AElRT7FnKXycW/RqTI/e2Rbr9wGEOMpth8yKtQL9Rtt9V1uqnDt/vMZi
	gpa5gR1nEngYwyrwqa+6VqUECr2t
X-Google-Smtp-Source: AG47ELseEWp+lo0Ol6ChO/VbmrO581wERKPZztLebwD3YkGUHk346XjrxZcykGDXhct7MnZRhhqQSQ==
X-Received: by 10.28.4.216 with SMTP id 207mr4983823wme.108.1520247727125;
	Mon, 05 Mar 2018 03:02:07 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o9sm13042874wrf.43.2018.03.05.03.02.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:02:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 11:01:58 +0000
Message-Id: <20180305110158.10308-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305110158.10308-1-ross.burton@intel.com>
References: <20180305110158.10308-1-ross.burton@intel.com>
Subject: [PATCH 4/4] populate_sdk_base: depend on nativesdk-glibc-locale
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
X-List-Received-Date: Mon, 05 Mar 2018 11:02:07 -0000

If we're building a SDK and we're using glibc so may be installing locales,
add a build-dependency on natiesdk-glibc-locale so the locales we need will
exist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index be5970a4bbc..60a5abc7dc8 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -47,6 +47,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 SDK_DEPENDS = "virtual/fakeroot-native pixz-native cross-localedef-native"
+SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
 # could be set to the MACHINE_ARCH
-- 
2.11.0


