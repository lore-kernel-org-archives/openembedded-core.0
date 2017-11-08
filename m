Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8487849F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 13:17:46 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id z19so3186924qtg.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 05:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=+aF6iC6RsCVN3ILj9yTNsxzhnc2gOPj0cqmRJz5Q9ZI=;
	b=h6HZyT7Drjtp7kiqf8ip6BITKZTl6MXrgX4qlByysnpB26vY9RxlJNqP81ORCtkj/m
	NNvED6Rri2UQMkK/r0nyQO35LQb6tXIZ99JCppsTLWxNNbvqrmbeBhf+n2WF0K30/9I4
	C1Ln75C79Ia0sX1FRxoF0Jxd4prODRQlCMAgxECSrre6OP79nFPjiiScJdXhUN6atXIZ
	gUdAE3GYI4rJivWBo3rEo482GVq5dar/Z51sPKM4VHoZHLkzcUJeOUp/9GisqQSfS0m1
	M4l2aVarlw6zmk8Dg3/AQigN5i3/rwwp/wN0Q768h8j0ed6aqb/TAxlpX2cmFX0v7S/d
	fvoA==
X-Gm-Message-State: AJaThX7PDbK8gXbwqTWqM8FMcaWZahAcFcnGJdsAWMZm6Xloe+e6t5m8
	Hkjy0jeX07Rhg997FZy55zsQ7Q==
X-Google-Smtp-Source: ABhQp+TSI1E3vMT3OtTyTNEWGTcNhkLqWALdgXiNvPOM+9ZZrOofd8XWCkkEaAhPQnuNhH21YcHhWA==
X-Received: by 10.200.37.89 with SMTP id 25mr729422qtn.268.1510147067891;
	Wed, 08 Nov 2017 05:17:47 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id s9sm2723162qts.42.2017.11.08.05.17.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Nov 2017 05:17:47 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 08 Nov 2017 11:17:41 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  8 Nov 2017 11:17:15 -0200
Message-Id: <20171108131716.26248-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171108131716.26248-1-otavio@ossystems.com.br>
References: <20171108131716.26248-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 3/4] cmake: Upgrade to 3.9.5
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
X-List-Received-Date: Wed, 08 Nov 2017 13:17:47 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7:
 - new patch

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../cmake/{cmake-native_3.9.3.bb => cmake-native_3.9.5.bb}            | 0
 meta/recipes-devtools/cmake/cmake.inc                                 | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.9.3.bb => cmake_3.9.5.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.9.3.bb => cmake-native_3.9.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.9.3.bb => cmake_3.9.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.9.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.9.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.9.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.9.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 092ac74610..8d65ac5690 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,8 +17,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch \
            "
 
-SRC_URI[md5sum] = "cb0f19828461904c72ed6a1e55459d03"
-SRC_URI[sha256sum] = "8eaf75e1e932159aae98ab5e7491499545554be62a08cbcbc7c75c84b999f28a"
+SRC_URI[md5sum] = "0922130d0e0c142a88e58c6e4fef4d7d"
+SRC_URI[sha256sum] = "6220c1683b4e6bb8f38688fa3ffb17a7cf39f36317c2ddfdc3f12f09d086c166"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.9.3.bb b/meta/recipes-devtools/cmake/cmake_3.9.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.9.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.9.5.bb
-- 
2.15.0


