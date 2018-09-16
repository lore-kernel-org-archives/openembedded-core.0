Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 86ED9745D1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 21:16:43 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id x7-v6so13587569qtk.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 14:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=CjKL/cbtOGJMAKn/k5jkkA2TvFA/n83IJqbaaiw8YNY=;
	b=INWyPmo7gnU0qF8g2CcC4TUKuf1qBMZiTtn7MvmfAqCVrXQt5xETOSJk+mNFZuDA8y
	aHu0UDAUyLdBbDeVhbWs60zPZ+rbYF8UdOT53+4yvJ0MCuZhECDIaoJDLvNarCf3CB9Q
	KRBfm7Bwkn+3FGaY1Ov23meQBkWgmtO70pk+QSd5QuZdORS7as697890uVPjREwdXlDj
	9o8s7qHZMi04zINiBMD1nk28LxqmFFmrpjgfSukxqA09B5ugNdeTfv4GlmLh6ResfpTU
	7W92mtBenWVWRApFrEpZ52BoJO97E5CXGotZJNg87ecPP7Yng2Mjtho71DBjjRcvFdz7
	BZog==
X-Gm-Message-State: APzg51BgN8AY8KW3oIOGlhaJ3pzwRdNUOGP+YhFqzvFl+RJ3QaQ79ba3
	zNO759GKNgQlqP4R0RU+yLQfqSZNaEE=
X-Google-Smtp-Source: ANB0VdaDzDdZ0Hb/iiF5/f7mILw6go/xZxb4BmFFZixqp0VlfKx5xQDouh2FheXulrwYIHMUaXuKNw==
X-Received: by 2002:a0c:e792:: with SMTP id
	x18-v6mr15751764qvn.143.1537132604421; 
	Sun, 16 Sep 2018 14:16:44 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	f6-v6sm7825909qke.77.2018.09.16.14.16.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Sep 2018 14:16:43 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sun, 16 Sep 2018 18:16:39 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 16 Sep 2018 18:16:24 -0300
Message-Id: <20180916211625.18597-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180916211625.18597-1-otavio@ossystems.com.br>
References: <20180916211625.18597-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] cmake: Upgrade 3.12.1 -> 3.12.2
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
X-List-Received-Date: Sun, 16 Sep 2018 21:16:43 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../cmake/{cmake-native_3.12.1.bb => cmake-native_3.12.2.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 4 ++--
 .../cmake/{cmake_3.12.1.bb => cmake_3.12.2.bb}                | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.12.1.bb => cmake-native_3.12.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.12.1.bb => cmake_3.12.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.12.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.12.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 4c30162c19..09e28b73dd 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,7 +18,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "10109246a51102bfda45ff3935275fbf"
-SRC_URI[sha256sum] = "c53d5c2ce81d7a957ee83e3e635c8cda5dfe20c9d501a4828ee28e1615e57ab2"
+SRC_URI[md5sum] = "6e7c550cfa1c2e216b35903dc70d80af"
+SRC_URI[sha256sum] = "0f97485799e51a7070cc11494f3e02349b0fc3a24cc12b082e737bf67a0581a4"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake_3.12.1.bb b/meta/recipes-devtools/cmake/cmake_3.12.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.12.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.12.2.bb
-- 
2.19.0


