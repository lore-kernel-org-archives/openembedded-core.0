Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id DB2BE78AD3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:18 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v18so17454575wrv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VZIADNdshGMuwrRhpMvMLp4c7sWP8CkixY2REcfo9SY=;
	b=dHPQToMOffqb72HMuDIsYG0dKKICH50xhdE+T678AWa6x7Mjare/CHE8ZL8evy7XN8
	XWNqdRQVliME4zDgWVR+9xM/5fKDy7yL++0fT6ixL2uq1a7bUmCGMjOcLcD5w3T2r173
	cI3Nhlr6Ch3ii8Zlmm8DIC1NgdJAva4Mi88YJzmg2OIVFuhYWowgvino3jzO6d9N1Kop
	rotPqWcER1uOm12bbjj1LjCC0OqlSqEXB9WZjp/WOuHaYtAURNk+IUgdyl3xBv0H+aY3
	EV8UroadFsRouoieTHxFUq63NggRPS0x1pSSq8mM+CXzG/P/O2zqoaEhR4Sae7AJganG
	NfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VZIADNdshGMuwrRhpMvMLp4c7sWP8CkixY2REcfo9SY=;
	b=TDVCgjba7sqrBmrO5aKVGEWJBq+s9tXlrJBRLaGRjUgr1YexppqKUpSTPNC0IU/Tus
	l3VWQPbvjEwLXWzwfOG/0E1UgkDiyMRcFyojYrwtMWSxK3EOO5U7ZUlUMkP+Jp2UEJu8
	gTkkY/Iiafy6qzDKRZ+vUS6nb/CRLhI3pAoVrkO4ajxm4uIcZlDXo7darzjOpSBTgeds
	a9IpPKeJ6PL15nfl0VVcK3PfXQcAq1oVJjA7azxMBNJ4s57TrWBYoXdcK68hIFg0FqNj
	4cUuPae0iOGBvc+BRZKO0BDAFOlsXoFBm6b3umMeYtmUzW+tY0MWrmDVM0BYN5wMiBIU
	fo9A==
X-Gm-Message-State: APf1xPB1rtx6OQzk2I4ZqGz1NyPHnQvI35KhdwaDcq0WDmQhEohoMD3V
	i1jklVlsA/FkyDaB/As59nh2h3jg
X-Google-Smtp-Source: AG47ELvrqiVuxVxv5LMDVrunAVsUUquzIeX/VRlAePcnHjjT8poieAwEO3BtCKREgrHJqT+QJBXHBQ==
X-Received: by 10.223.160.157 with SMTP id m29mr13288298wrm.119.1520270479726; 
	Mon, 05 Mar 2018 09:21:19 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:44 +0000
Message-Id: <20180305172046.21729-27-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 27/29] vulkan: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:19 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch        | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch b/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
index 3cf241d62a0..bcf84a5a3e7 100644
--- a/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
+++ b/meta/recipes-graphics/vulkan/vulkan/demos-Don-t-build-tri-or-cube.patch
@@ -11,9 +11,11 @@ Date:   Tue Feb 16 10:05:25 2016 -0500
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 
---- a/demos/CMakeLists.txt
-+++ b/demos/CMakeLists.txt
-@@ -61,46 +61,6 @@
+Index: git/demos/CMakeLists.txt
+===================================================================
+--- git.orig/demos/CMakeLists.txt
++++ git/demos/CMakeLists.txt
+@@ -63,46 +63,6 @@ elseif(UNIX)
  else()
  endif()
  
@@ -60,7 +62,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  
  if(WIN32)
      include_directories (
-@@ -114,43 +74,6 @@
+@@ -116,43 +76,6 @@ endif()
  add_executable(${API_LOWERCASE}info vulkaninfo.c)
  target_link_libraries(${API_LOWERCASE}info ${LIBRARIES})
  
@@ -103,4 +105,4 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 -endif()
  
  if(UNIX)
-     install(TARGETS ${API_LOWERCASE}info DESTINATION ${CMAKE_INSTALL_BINDIR})
+     if(INSTALL_LVL_FILES)
-- 
2.11.0


