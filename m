Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 78547788BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:59:02 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id q11so2230824qtl.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 09:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jVNBgeBQhCq/RebuGv4TeI3fB0SWzyXcS3RzvizDQ9s=;
	b=mJXeDQ/19YGjUSQ+cIOGr4Smn4XMRPzIS8E99AA0xV3q2dcxtahksqqk1RmsM2lx9L
	iCSx0w3Op5vSlr6FqdDTk5IYidSyvaSaEt7+BSipvR1aOvZpS0syS+zd6hkegl+Rly7O
	oIKcC1Q+X2DDUSWdy1F0I1/P8cOT7Wo6khctqo+cCg/tbx7FX22ndovxzZjDvBN4oz8Y
	K6as/b179CBb1b6jn2SNeNtYiE43Ede3c5gNrN00xlt7q8iRJcPkRm6eI+Rt5PoJr/k1
	BL1HJ1hhXUTqSJob2HLiHqVkhXWGoLQ/4/Nem3BlUF4Z62YTpP/WgrazoKM6QFPEUKNB
	ZzNw==
X-Gm-Message-State: AElRT7EXSSwwp8OQ2H7hTcqjc2N6b8DWNOL3NaaDHvJVkk6jACkqiJDu
	8z9qckVUJ1IKWxsFrsreU/0Yed8n
X-Google-Smtp-Source: AG47ELt3N0DdUUnp2INscmX3/zTUNNmm6StxLaKNLa4FkXmN8KEkWwRDe454mPaD1fi5/jF25SlnPA==
X-Received: by 10.237.32.66 with SMTP id 60mr14327216qta.332.1521133140396;
	Thu, 15 Mar 2018 09:59:00 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 3sm4314059qty.24.2018.03.15.09.58.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Mar 2018 09:58:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 12:58:49 -0400
Message-Id: <1521133129-3091-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-native: update to version 3.5.5 to fix security issues
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
X-List-Received-Date: Thu, 15 Mar 2018 16:59:02 -0000

License-Update: checksum change is due to bump in copyright year

Resolves CVE-2017-1000158 and other potential security issues

See https://docs.python.org/3.5/whatsnew/changelog.html#python-3-5-5-final

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-native_3.5.4.bb => python3-native_3.5.5.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-native_3.5.4.bb => python3-native_3.5.5.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.4.bb b/meta/recipes-devtools/python/python3-native_3.5.5.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-native_3.5.4.bb
rename to meta/recipes-devtools/python/python3-native_3.5.5.bb
index c825253..3f09b32 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.4.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.5.bb
@@ -27,10 +27,10 @@ file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
 file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
 "
 
-SRC_URI[md5sum] = "fb2780baa260b4e51cbea814f111f303"
-SRC_URI[sha256sum] = "94d93bfabb3b109f8a10365a325f920f9ec98c6e2380bf228f9700a14054c84c"
+SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
+SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.7.4


