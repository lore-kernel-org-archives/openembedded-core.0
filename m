Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E5E317C446
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 20:18:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b203so4801965wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 13:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QiiRy88OTD4vMtvPPsTA2I8l0wUti9dH4nHdJQtA+ks=;
	b=AikLsGl2mC7C5iRMu6GoIAY2G6cFIEPNQ2eZa+pjjVdjI/TfiGz6HlBDFaAB7DZYtL
	99JOwXV4RCn2a8Lua/jYKwN6hTUz5rltUSUrxB0+GMHNLcU5tVrF8ugEmlHqQQfrtoJK
	l3yQ/PSkWa+jY+durBpNb/crREt9VNJ6fbeaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QiiRy88OTD4vMtvPPsTA2I8l0wUti9dH4nHdJQtA+ks=;
	b=WeXwoKCE82X6dyQxznYDWlIeT1PXHTcSaEcOdIMXf/rDNhIBvs3AllHfkbVH1pLe5n
	YMl5vA3EfOnyICvliTRV+Mqqd3hY7kT2uhfgVJs71WStXJqjgoitlyEm1l8r7nBd7Y2Q
	GkSFUKjXshYBZnsOFPwzazzbHcAAX9cjwIlKYmvcahh3f69H2s3xULuojvDUBLMGB0xo
	L9NN/tNxdBfmeyPDCysxCV8JmS8RTeCVMMLoeOmgCgH/Z62Q5ZGKKgc+m1ltjX39Qoa2
	JL/6b8d+90NcXnrW6syic8W4YB439dx4xXMDipRlm4DtQuS8ics19ceLYhyt2jy4iUgD
	yW4g==
X-Gm-Message-State: APjAAAVZUmWLeeRlPCIP+C5tg3nVcISy5GkaG3yN8d77MM/Oy34Gp4NO
	V7w1dwSxTJTXIla0M8UZUU1lTr1CGfw=
X-Google-Smtp-Source: APXvYqyNGzzzogbYrAiFIdMcJufll3l6/JIWbeEj4hqMIE0iZ1n/4kJfNErcQutXrWK4Dp5yNBSo6Q==
X-Received: by 2002:a1c:7dd6:: with SMTP id y205mr1100383wmc.90.1557433113219; 
	Thu, 09 May 2019 13:18:33 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n15sm5001201wru.67.2019.05.09.13.18.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 13:18:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2019 21:18:29 +0100
Message-Id: <20190509201829.16696-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] tcmode-default: Add PREFERRED_VERSION for libgfortran
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
X-List-Received-Date: Thu, 09 May 2019 20:18:33 -0000
Content-Transfer-Encoding: 8bit

With the addition of gcc 9 recipes it highlighted there is no PREFERRED_VERSION
set for libgfortran and it should match the rest of gcc. Add this missing
PREFERRED_VERSION line to avoid mixing gcc versions in inadvisable ways.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 02e9ddde24a..daacfe28c45 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -39,6 +39,7 @@ PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc-sanitizers ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_libgcc-initial ?= "${GCCVERSION}"
+PREFERRED_VERSION_libgfortran ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
-- 
2.20.1


