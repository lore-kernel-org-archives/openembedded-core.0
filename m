Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3478C7F830
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 18:38:22 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l1so768302wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 10:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pwM5lNLV++23mOGgd6ORWAsuRVXiqCHhAz/7x2QPZB0=;
	b=ip+c/H6gsrx4ZwkmIxmcMRdffm5LRCDEoR9SPuVpqLsd0SFHDu5EbbG4U//z3SSxmI
	TCwfDGFg5Sf5mNKthSwfOKfgTwaRPhhRyKOEZMQ/W8cppqzpkDtX0Y+A7CC+ss6uCXMW
	maHmA8iMSpWpVcw1FaPurYBXHxs++B5uuHi6VBLC8C3ZbAhTE3qzG/UukKFVzFb9Oj2N
	69euBOjGvdsYsToiDGDkwmSi4HMxPDFqOS6diIzxcMZdEatnELElnC3bf1PwH5sVliG3
	iUYHfdAv8xaL1IpHm8syyDmHlEGxtzHbBENeoec34a3nRIXLtPVm3mMCBynkxyeI9Ond
	kbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pwM5lNLV++23mOGgd6ORWAsuRVXiqCHhAz/7x2QPZB0=;
	b=KswTLWR74SHDzofUP2uHhIMMzGbFQA3JnDXiqITfAvFSTKZxt9KnYCJSUeIOpNRoti
	XBVOnRAm7XVMrNtlKc7fWUbhKfqbvIP+ItEDSOxx2uRl08tt9ljG0YTdCuy3307CAL/0
	pwMzSkTMf8aCFnoXO2QleSCQrre0VcxEyVwgNIIZZc0bn0FpzkOSGuakpNC7jJ9tNlgb
	8HIsEksWuy5CR/aFv2NFBe7eE5CTI1CRxkOQ+T2+RcapHH0Sqmf6SXegenVJOffFuSKD
	OB44qLaqkIb4Nhw1iYEBnbxYmG4r9EuKzrMwZIRyXSKcHjxXL9KhTZhw3E7v6t7yTYBY
	a8Ew==
X-Gm-Message-State: APjAAAVxRQ9HEq33FseWM3Uby15fk7m4GxN7VDcjYKzBRfoN/59JynEa
	lTFgkY9OKiaDms7JErHi6+9jq/gcJ7M=
X-Google-Smtp-Source: APXvYqy0GGByp6+wscSk2mTMM2jnttB79za+tYF96asHCA3yQCBHw9H0NxXC83q2A0KF1aCBo+LADg==
X-Received: by 2002:a1c:9601:: with SMTP id y1mr4925219wmd.157.1574275102753; 
	Wed, 20 Nov 2019 10:38:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p25sm143652wma.20.2019.11.20.10.38.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 10:38:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 18:38:10 +0000
Message-Id: <20191120183813.9390-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120183813.9390-1-ross.burton@intel.com>
References: <20191120183813.9390-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] packagegroup-core-self-hosted: remove intltool
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
X-List-Received-Date: Wed, 20 Nov 2019 18:38:22 -0000
Content-Transfer-Encoding: 8bit

Very little software needs intltool to build, and we don't need it on the host
to build Poky.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index ee9d0636f2f..1fcc142cacf 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -75,7 +75,6 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     g++-symlinks \
     gcc \
     gcc-symlinks \
-    intltool \
     ldd \
     less \
     libstdc++ \
-- 
2.20.1


