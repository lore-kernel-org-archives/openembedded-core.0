Return-Path: <oystwa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id C7FF077BBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:59:45 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id b190so5623291lfg.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=12yf6RMBFkMWjZs1O19SWNW0zgWn43qpkJ35WPif0EY=;
	b=It9dHFVRyjXjcQ9L8IByMv1Of+Jg+iA2JbPaUFjDcFpmGY4HMj7VoBdUf9nKeQtEAo
	8kiJEgUYDyLFf/NSNoo/hqUz5FqLbvWGEeIU1tSgk5lAkRY0LIchrXbr6kDH8drV6gyK
	IS5W/xHM2MAwIJtu31q+raW0jVd7+xyU3kfjBj1NZGePuCufS/HDmvrnpNJLxQ9m8rQ+
	dKzfAo5pgWtuLevvNHHrEcoakxmh4Gbjagdgx4rdT4KZtERCElmClUfFFemIk+xC1bZ6
	3ia4UI7TRwUyTKZtrJUS7BpLh0ytaopN/IYOcWovvedHMkLdYxhs96Q8kyQXmNFoIq6G
	DI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=12yf6RMBFkMWjZs1O19SWNW0zgWn43qpkJ35WPif0EY=;
	b=XcWUZ1wm867augMDupArmtXWxo0dx8bRoZ/iboFLplFwsjP3lPEeV13uvKDtaXAtU9
	Ps2R0LrpbPLsXE7LxB0FG5pKw2yPiS06RKLZrLDc0k2M6zyvZ5k2MBaMsGklH7s7Amz6
	qoOe29XxrTMsrvx9cZt+a+Tbs+0aHTQszcK69dQoFCFmHCUAnI75HxMsnUtqZdrrvl7H
	Ws2CpO5uj4C6EtDdO2m95YUKiDNPyOTjPQww11kcnSd/DvcE77oTwlR6pR0+ik01Ru4B
	LuC8yuVdUFFDCEqFY9uP5IMDSIuFyud58w3XpAQQzGtAvAaDR30Bp4w+lA+FPxbAW3JI
	B8gQ==
X-Gm-Message-State: AMCzsaXDzhMuK84bkOWY3La+gyaumew3VL0mtyjhIZ+/Hy/PL/GAgcI+
	qmXOGUmI+HfK3c9qwLtZAi5zqGHw
X-Google-Smtp-Source: AOwi7QD493d/U7bVVoN+rBW0QiBhO07k7pP2aeBXq5rK8F4halkrzYW2CvXFoekI1kXdKwkjLAteug==
X-Received: by 10.25.26.14 with SMTP id a14mr4836055lfa.28.1507640385811;
	Tue, 10 Oct 2017 05:59:45 -0700 (PDT)
Received: from localhost.localdomain (114.138.16.62.customer.cdi.no.
	[62.16.138.114])
	by smtp.gmail.com with ESMTPSA id x25sm2465149lja.5.2017.10.10.05.59.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 05:59:45 -0700 (PDT)
From: =?UTF-8?q?=C3=98ystein=20Walle?= <oystwa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Oct 2017 14:59:40 +0200
Message-Id: <20171010125940.21780-1-oystwa@gmail.com>
X-Mailer: git-send-email 2.11.0.485.g4e59582
In-Reply-To: <c320b487-28bd-f3bb-33eb-f171c4da498a@linux.intel.com>
References: <c320b487-28bd-f3bb-33eb-f171c4da498a@linux.intel.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?=C3=98ystein=20Walle?= <ow@datarespons.no>
Subject: [PATCH v2] cmake: fix typo in toolchain file
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
X-List-Received-Date: Tue, 10 Oct 2017 12:59:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Øystein Walle <ow@datarespons.no>

The missing underscore makes CMake define a new variable named "CMAKE"
with the contents "ASM_FLAGS ${CMAKE_C_FLAGS}" instead of a variable
named "CMAKE_ASM_FLAGS" with contents equal to "CMAKE_C_FLAGS". It seems
clear that the intention was to assign "CMAKE_ASM_FLAGS".

CMake uses variables named "CMAKE_<LANG>_FLAGS" for defining default
compiler flags for a given language <LANG>. Leaving this flag unset may
have unintended consequences. Not doing so is however not an error as
far as CMake is concerned so it is silently accepted.

Signed-off-by: Øystein Walle <ow@datarespons.no>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 6518408c70..dc8477ea34 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -1,7 +1,7 @@
 set( CMAKE_SYSTEM_NAME Linux )
 set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
 set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
-set( CMAKE ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
+set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
 
 set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} $ENV{OECORE_NATIVE_SYSROOT} )
-- 
2.14.2


