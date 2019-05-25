Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C8D447E437
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 20:18:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i3so12472173wml.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 13:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=O0VTZbZ/relbPA1eORfECCCzoN6P2n6J/jsDQRaRzeM=;
	b=Spi5n8hX+tik/OdJHB6AKrNihPFlBk6B51SS5QFWfRIIt8z6OHc+3xzTIUD+dD1lsR
	q3ud1EjDRFReyNpOKyJoNtrZc5cxbapbKCj7PbZ0rz3aHfNd/fzbFgFxOViIO/DSHjey
	/o90Xh+K9dXc1+tFTNVx2ixCPYJLQB/7f+F/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O0VTZbZ/relbPA1eORfECCCzoN6P2n6J/jsDQRaRzeM=;
	b=m5RkYjzOSqry3+hhwyztL3JQ1ALbpKK7KD1zEP/LzMurp8+dUuxdkrcCCFc65chA1H
	jubPdFHXsMz5CNuDPg8Q+bjdsvCmizR+NzGiiWCFe5XlG0tCg3JFKdFleZB1d4l41QEX
	lc84Za5a2RhKi/2Q+tseGjDnR2tx76Yb0iNmwqsdPkqTaNZsnBbeyBBmgoc6SWqowYCl
	N86OER4MW1vtaAB2+GXla6YUmh3AoQHHCrDXWqqn/VXyml7b93rs38x/AdVy25/Gefu3
	rUYBnJBMz91K6TH6LDJ4V4HOcncEg5XzGpOhFy1pUakwxuhqd0ZwgFX5sJlBt22V+QSz
	Rhow==
X-Gm-Message-State: APjAAAXO/RBmhMZ3GVfi5ozwbLinHJ/ChZANXvuQsemEWkunHh0E/ksD
	eWF3UazMv+fYn1GkSKCRCMx+23wpMB0=
X-Google-Smtp-Source: APXvYqzcayqfPL7/JYgyVIrRyzPX2B+tEPs9dXg3GBuWpVIFOSyrTCYCPX3uvPFeJvT4pylEm90SUg==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr10932660wmc.151.1558815535220;
	Sat, 25 May 2019 13:18:55 -0700 (PDT)
Received: from hex.int.rpsys.net ([85.255.236.98])
	by smtp.gmail.com with ESMTPSA id
	k184sm14790956wmk.0.2019.05.25.13.18.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 25 May 2019 13:18:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 May 2019 21:18:51 +0100
Message-Id: <20190525201851.23732-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525201851.23732-1-richard.purdie@linuxfoundation.org>
References: <20190525201851.23732-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] tcmode-default: Test gcc9 as default on everything except mips
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
X-List-Received-Date: Sat, 25 May 2019 20:18:55 -0000
Content-Transfer-Encoding: 8bit

mips is the only rchitecture not working with gcc9, switch the others
leaving mips on gcc 8.X until we can figure out the fix for that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 744c6c3247e..5c10a4bd0d7 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,7 +18,9 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "8.%"
+GCCVERSION ?= "9.%"
+GCCVERSION_mips ?= "8.%"
+GCCVERSION_mips64 ?= "8.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.32%"
 GDBVERSION ?= "8.3%"
-- 
2.20.1


