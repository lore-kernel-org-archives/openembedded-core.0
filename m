Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id C582160C5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 05:40:48 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 185so2739166pfv.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 21:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ygq/JiRGHXkhF00ye0LdKpLX2b9uQuqy81FM/+FtIAE=;
	b=HCc6OwZ4q1PT/ZxhUbeYpLY4nWTk/i0b3TKEZboitcYPWSNoBCYxwdTvtSLT6RceDO
	FjQAZUvfmng76ZQ+t4t2ncK+Gf3xpXWEZiRNZ8jn8Efx4Ygtw6JKVvqrgoWMllziOrYx
	Vp9jLjkCMHK5V++KP9ouAR0+WtE9PWeDAoHFXX801lfw7pJ6/NlV5CH6VRuqIQL6iF5j
	pOiV2dZZpmRS7hU2dP+FR4SwVjmBJm2hBi3ICCcnGlbUFLUdTsm1VpNN685kKWA5mO57
	UsoBpKDyLycsHESV+BTW9tU+h8v3V8ClulPL/GaX7o+sExyKDRcgNYgfxsFuDbgENmzW
	u5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ygq/JiRGHXkhF00ye0LdKpLX2b9uQuqy81FM/+FtIAE=;
	b=Qsy/KY1IPCV2CKcam/iRAnXJuzRhvK6JbQL4PTw9gACJAVmGSfUIDFsjlzm7CckmbC
	yS3CCyPz7hG7qn2S06VxlMbtYlQrrtvr5DPnIHAzn8mpjQ5nq8rF6Lb0UoFcReMNkj+z
	F3/abzhGQztSLaE3H+FslfK9mCXH9WxHb18vAHl6RpxSY9nr3onZuQGPVfEFmRXhUMjZ
	CfgpPIAFb2N8oL15g0380co0exSdEQtJgozpvYUmRHOXx8qw1NWmCp7m9mytsLYfkkgt
	sRCLnbab+Ij6JuvW/bviSeEisZqmhbpluVLRFS30CJTA8lWs3Wyv6RKIy5e8pbs8QecB
	XXtw==
X-Gm-Message-State: APjAAAVg0v18+3Zd7cY8Gk9KcXfqcxrQIADGfcueByF8vXKlf1M/0+aL
	7yZydw0MeZlvQpNxgsC5iMToJKnUwtg=
X-Google-Smtp-Source: APXvYqxRGe+RF/bzoww31w2JMXVa50kME5YdRn+xkqFBfmDVpYGycabNYM7zPxRDopeh8Ci5DxMnGA==
X-Received: by 2002:aa7:971c:: with SMTP id a28mr9015166pfg.152.1580449249093; 
	Thu, 30 Jan 2020 21:40:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id
	g22sm8215996pgk.85.2020.01.30.21.40.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Jan 2020 21:40:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2020 21:40:51 -0800
Message-Id: <20200131054051.6139-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] uninative: Recognise ppc64 host ldso
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:01 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 9f8645a36a..70799bbf6d 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -1,4 +1,4 @@
-UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}"
+UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('BUILD_ARCH', 'ppc64le', 'ld64.so.2', '', d)}"
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
-- 
2.25.0


