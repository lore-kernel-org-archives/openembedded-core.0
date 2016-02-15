Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8660460290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 18:43:45 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id y89so116766249qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 10:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=VN+w50AgBOU6Uh61R20unaW2xV4CRq4axaBR2+PT1Tc=;
	b=P/Q8T0gyMTO6S5QT7IQrzyT16YfL1KRx4iNTYPe0bVCWfO4GZp3Ejzhgb2/lSZgufV
	keZ64w23+YDBYg86jEIkYNCt69zn+1ArlQ2UpbWRt9ypxeDmqcqEhngamqExJpC+UKtj
	et4xsHHDEcdX2yfSbgZZTVaqU9milAUSihLRE0iaVLGd3KTcvUO/5MaGB/yKHH8iFZFT
	A4EydWwv2z9jtK/0We1PNeoZKqs9TfixeOVlK/RONoeJII5JT9ziEKsCyWyIZPS8D66i
	Cz3QBPj+C+bVHoxuRImje8A0gZVOtn2+OPU4b496rhvV4NgbS1QXc69ZQ6iT0+J/3b5J
	OuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=VN+w50AgBOU6Uh61R20unaW2xV4CRq4axaBR2+PT1Tc=;
	b=U+4IPcU6kOhxv2bcV2CTXNRxz1OGZjji26gF/nD3HHPbfAqJNqwuk2ymHS77OB1yLB
	QYrvagSTM3QxKpjlsZKsWIOTpvRqXgyybjYTG0uui4JjMqU8jo9BZwQ6nnirMECcOr7Y
	hduqYH6tJoS0h/9Dt5Yt0vXvKrF7DeLorkk9ag/A47d5QXMVE3ftts/Sq0tL1X4rV8/5
	VT+5NPoVoKmWvPeOX60UX4+/JWyRJxFvbT67UwUXColEB4EOzIp9KUXwDqPa1qkMF3GW
	G2aYge7rgdTK0LNVddBF+lGIRPocIgCJ+eBssOn+wwyD63RK5aBslXzRMA4btqptdgsy
	UxoA==
X-Gm-Message-State: AG10YORCkXnAewEsTFRsID5n/D1CfC+xoFCF69lvFRFluPhFLh/TkOmKlrs+c//GE7kYkw==
X-Received: by 10.140.32.203 with SMTP id h69mr22383028qgh.55.1455561825547;
	Mon, 15 Feb 2016 10:43:45 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-110-59.ronkva.east.verizon.net.
	[108.44.110.59]) by smtp.gmail.com with ESMTPSA id
	141sm11486721qhk.23.2016.02.15.10.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Feb 2016 10:43:44 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 13:43:39 -0500
Message-Id: <1455561819-30889-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] cmake: Update to 3.4.3.
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
X-List-Received-Date: Mon, 15 Feb 2016 18:43:46 -0000

 * Tested by building gnuradio and friends for a cortex-a9 machine.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../cmake/{cmake-native_3.4.2.bb => cmake-native_3.4.3.bb}            | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.4.2.bb => cmake_3.4.3.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.4.2.bb => cmake-native_3.4.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.4.2.bb => cmake_3.4.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.4.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.4.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index befac7c..968d003 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,8 +17,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-Add-NIOS2-CPU-support.patch \
            "
 
-SRC_URI[md5sum] = "04545d3cc3801fe84223b864c4f7a53c"
-SRC_URI[sha256sum] = "da7cc34e1ce1d82e67a32ab081c02c2845534cd8bf2e09d88077a1b282e97392"
+SRC_URI[md5sum] = "4cb3ff35b2472aae70f542116d616e63"
+SRC_URI[sha256sum] = "b73f8c1029611df7ed81796bf5ca8ba0ef41c6761132340c73ffe42704f980fa"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.4.2.bb b/meta/recipes-devtools/cmake/cmake_3.4.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.4.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.4.3.bb
-- 
2.5.0


