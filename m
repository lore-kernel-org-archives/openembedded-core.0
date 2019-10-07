Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0FFE77E28B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 16:39:18 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id y35so8567470pgl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 09:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=joifqa59ao3lb9glHoLS9+MPBwOGHOBW5uxXHUkm1S0=;
	b=IRe9rL8Sdrs5ADiKsHlCO/lpsO0Cr9lDj1QsWQ83XeY7AfsfKYIfQOhyetPY4+D++u
	ItGdGomZS8D9byTFO9puA3nORdK2rnrHM3DUpLd/qzd1rjtu9ctRdkEuUoeaQ4Q2XPH4
	jfaHkUIlsfOHQYIyu/bl2sMM69H6Xj2pUidpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=joifqa59ao3lb9glHoLS9+MPBwOGHOBW5uxXHUkm1S0=;
	b=bEG5W7pzyQaVmdn27zudR4SVytRCHpKCAdEVrOiJJJqcmb868EFzyWwGo54+/Jv7QJ
	Qext3adr2McC1x3b9mrgIisyxYHo7KTzYeTt/hWbvV8l3vQMhnjrEnBCOkdN3GaEhgUh
	MuencLh6YhMX9f0tl20qa9zO60LOFpXdlf2iOUigFkaot0Sf/hoVlWq6pFiIhZ6688+f
	I948f7TiU9gfjNWXV37XsmM1SdzL5d/S6eQGvsoJ0uBtqI7X8iYHBhYxsm/ILWPGLRmV
	lSXw1/1NxUZPSDd5d4FwV2/MAjSrtCEK+RgDcFlPzO+jLNt1H2h1DFwQTSW1cjDbpHRU
	rwWg==
X-Gm-Message-State: APjAAAUfKZJri3C/mg8r1tZPtrgZc6BBvIsd9sjL0P3lQJsuo6JUWKFB
	p6IMqe7E+xqVlLL88C8YQ2xkDmuGO9Q=
X-Google-Smtp-Source: APXvYqxNrX7FLITkZZln87gjaqQeTaCXZJRjgqJcbv+MTegz8PEh6mSaQQSJts8Sa/CIXwI0XK+ajA==
X-Received: by 2002:a63:5a12:: with SMTP id o18mr30889993pgb.217.1570466359686;
	Mon, 07 Oct 2019 09:39:19 -0700 (PDT)
Received: from localhost.yoctoproject.org ([2601:1c0:ce01:91e0::6f11])
	by smtp.gmail.com with ESMTPSA id
	207sm19037507pfu.129.2019.10.07.09.39.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 09:39:19 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 09:38:31 -0700
Message-Id: <20191007163831.28887-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: rpurdie@linuxfoundation.org
Subject: [PATCH] uninative: Update to 2.7 release
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
X-List-Received-Date: Mon, 07 Oct 2019 16:39:19 -0000
Content-Transfer-Encoding: 8bit

The 2.7 release updates glibc to version 2.30. Recently added to openSUSE
Tumbleweed and needed for Fedora Core 31.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index df24346855..42fed6f2ba 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.29"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.6/"
-UNINATIVE_CHECKSUM[aarch64] ?= "a37118fc8b423f48146120707b81dd15017512c3e8ef9e6ca2cb3a033f4f4046"
-UNINATIVE_CHECKSUM[i686] ?= "3234fc3ded810225071f23a0e9a99f4f8c2480059945a848eff076ce78122ade"
-UNINATIVE_CHECKSUM[x86_64] ?= "133387753a9acf3e1b788103c59fac91e968e2ee331d7a4b9498e926ada7be57"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.7/"
+UNINATIVE_CHECKSUM[aarch64] ?= "e76a45886ee8a0b3904b761c17ac8ff91edf9811ee455f1832d10763ba794dfc"
+UNINATIVE_CHECKSUM[i686] ?= "810d027dfb1c7675226afbcec07808770516c969ee7378f6d8240281083f8924"
+UNINATIVE_CHECKSUM[x86_64] ?= "9498d8bba047499999a7310ac2576d0796461184965351a56f6d32c888a1f216"
-- 
2.21.0


