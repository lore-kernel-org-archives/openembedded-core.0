Return-Path: <philip.balister@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2CFD571A9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 14:40:21 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id w20so17423022qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 06:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=fO7YShRVl2Z99E3jaRleS9ooLAfoUfu8SUPJ09GM1Fs=;
	b=XubWE0r1qOK5RsInxzl5UDPN6vYAkwpTWe93p2X2gjjcy0VJPS2msZScb+gaLuKMSe
	6qRpcetvVp2mupECHMnLGgy0gasFDLQKVMcEd7CQ+o5CdufxgsIDTq+7OGT5iFrfamQg
	19yVXFal3E6fOQFUjNY0uXvl00dz8MhSrdkUcRnheCjabfcK9xuXg0Mdq4poZ9J+BS5M
	g+DgZQ/hT10hBke8yCY2d7/X0gFic3y2PofRZF/Vw/6tyomvLaHnMFqzEbKdOIm4VGU+
	uc4I2NKwS8YriEiAeSkg4SkwHuoFQK5osb7PFnFQQbvrkOIoZV7Abf0XbwUA5Y0kFrPz
	xmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=fO7YShRVl2Z99E3jaRleS9ooLAfoUfu8SUPJ09GM1Fs=;
	b=KcF3sYxrMHGQJ1BEIOa8kKc73AKiS1aDDX8j88rMByBPQ4cAs05QxtFZsyLcHvqAly
	07LDBoIEpv1LvM2c8jAPJBaCjPGAbR1cur+n0olLngzGTI/jgJdVGjZ2z5JxtsNcOY9h
	sfAHy+gL8ApiBfLXl8BKKNdG1xgv6y4NgrloSa507RREYE8rk1W195UnVmF338XVEnNa
	WG0W5k/ONmFoxt00FNeuPFj9S+kOGeBMhZXAwfmQRsX+GKKRyI+gA2vkD/XuKh2s1ssI
	a6ftaTkkzhVp633jqqucunEl7AY6dj3PAF0I8l3UifVoSHP+nfa4wEaVdKPxx76vKSyS
	Y4eQ==
X-Gm-Message-State: AMke39kpJ0SELOG3vp02wBgB++GS/KnFTSHIdV5sznKZlShWDDRBvEO9T5C+HEXQhzG6LA==
X-Received: by 10.200.34.81 with SMTP id p17mr25707019qtp.264.1487083221896;
	Tue, 14 Feb 2017 06:40:21 -0800 (PST)
Received: from thuvia.localdomain (pool-108-4-175-67.ronkva.east.verizon.net.
	[108.4.175.67]) by smtp.gmail.com with ESMTPSA id
	f126sm413770qkc.47.2017.02.14.06.40.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Feb 2017 06:40:20 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 09:40:07 -0500
Message-Id: <1487083207-14487-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] cmake: Update to 3.7.2.
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
X-List-Received-Date: Tue, 14 Feb 2017 14:40:22 -0000

Tested by building gnuradio stack.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../cmake/{cmake-native_3.7.1.bb => cmake-native_3.7.2.bb}            | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.7.1.bb => cmake-native_3.7.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.7.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.7.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.7.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.7.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 18e547d..131ff70 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,8 +17,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://avoid-gcc-warnings-with-Wstrict-prototypes.patch \
            "
 
-SRC_URI[md5sum] = "d031d5a06e9f1c5367cdfc56fbd2a1c8"
-SRC_URI[sha256sum] = "449a5bce64dbd4d5b9517ebd1a1248ed197add6ad27934478976fd5f1f9330e1"
+SRC_URI[md5sum] = "79bd7e65cd81ea3aa2619484ad6ff25a"
+SRC_URI[sha256sum] = "dc1246c4e6d168ea4d6e042cfba577c1acd65feea27e56f5ff37df920c30cae0"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.7.1.bb b/meta/recipes-devtools/cmake/cmake_3.7.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.7.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.7.2.bb
-- 
2.7.4


