Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1956E78D3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:32:53 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id n11-v6so5888808wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JySazNr1g+k/XbcFZOUadvNP1A2aJcLmLp3YQ1t6UzQ=;
	b=JMLUgriDddkFQn0KazGyB/zLuENRFkAo8jqObB0or1oKzVNuazjVpYaLCphgcLjRBd
	38fsXPeaiIv50uPvc55Stru/KlDuuD5NB3vOJvB37EZHVHaZAs8OaPjeUQvEIdFb+sHt
	l25oEdAgkLRHS711YNqY8EMpOPIljRlU9/yAXR9DT7rlrJxJEI6eVikfoM+hMedwROHp
	7k4EU5cbDCC6y9Isni1YUoW8tFjqNy21Sk3A0S/yAzjONG5UlPIGF8+cQpB1BGThcyai
	+3ED982u6vwZVPZFyhkadbkxOxxOHKcDaHfL0pjYLdHtTpUX1tnbbCzCLdfV/BX9glSd
	xbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JySazNr1g+k/XbcFZOUadvNP1A2aJcLmLp3YQ1t6UzQ=;
	b=HHmc1ydSb7/Gfofg0Z7w0Y1lIhQFTJF2qnwR4ocOJD4uC4vu6+BjoubNwZiiOhWKdD
	MkuWU05M579G2xfD/y7Xq+eHwcTb8qiFm28WJkzdZRlPE2ZJqRdKiOzQ6Pth352j8man
	aBA5ePBCpnnaRSjeBzCpjpXax8Thk6cul7QyuPdobObopMB17hdRM2whOVgjDe/Fomxu
	+ByLtkBVzJd80ce48gJE5iZB5tLbSP+1ZSKryKnXmii0NsiAaJjieQAOsreQNZmfzgVj
	KDuh6YLkPPG0/h2tHlpTl/+0gxYVh0lGcjVrdVvbkNiryqcY7I+vBglvGTLDYb4q+Cto
	jH1g==
X-Gm-Message-State: AOUpUlGMzXZEjWBC4Z0XhPzh362R6zt3atyS3oR95M2+1jQi9E5KJotn
	V9Oo2Si1RGKeajLj0HLih0pFjpHq9NE=
X-Google-Smtp-Source: AAOMgpfLYfUybM/pAl4BPXlGfupLisn1qMdVRcbFUKHE6ERF4cJJ5GuwMN0cdU2hiqH4+Vb0kAXuWA==
X-Received: by 2002:a1c:ec06:: with SMTP id k6-v6mr4930603wmh.39.1532705574453;
	Fri, 27 Jul 2018 08:32:54 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.32.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:32:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:35 +0100
Message-Id: <20180727153248.22838-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 03/16] gnutls: fix libidn dependencies
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
X-List-Received-Date: Fri, 27 Jul 2018 15:32:54 -0000

gnutls only works with libidn2, so update the build dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index b62a137e595..876a3847b0e 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -25,10 +25,8 @@ PACKAGECONFIG ??= "libidn"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
-#
 PACKAGECONFIG[seccomp] = "ac_cv_libseccomp=yes,ac_cv_libseccomp=no,libseccomp"
-
-PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn"
+PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
-- 
2.11.0


