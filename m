Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.28868.1606537489746944040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:24:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D9XzaQeE;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id b10so4749699pfo.4
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PBadsmKs7+T4zC1to5RuQVqkUvbLl9M7rWSLlMrewig=;
        b=D9XzaQeETEhwTSqJOf+57IKDYAelJ9+jPFxtBNQ+0+YU8Del53SRtIeBLqT59NFkQK
         bYsn66pv5iN8WxYk4HqlBQK/jibUQ1vWkltMdSocQXnE+Lh0uvECXp620uj2KoW5Iw3h
         6N165wn+LplX7oNrkLFl2/N6FiGrOGNRz5LEOkDGvlpS7ds0GY8TGmhLc5Kdu6Xp4oQ+
         I+bUJsNuKJeSAPz07i1NR9o88uXrOUpovkL5+jg2FSE/QgIPZv0w9OeVAdam8t8IcWga
         M5UgQKlPAI4dtgmUI1wxq8sIVEwSwTZWXmubcM3dwcf5Xvt45hWD5otLQg3ToTaXs1bq
         kLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PBadsmKs7+T4zC1to5RuQVqkUvbLl9M7rWSLlMrewig=;
        b=jp5QWrSpMDRbSPS92eJi17tBVeBvksudhuml/afPzyhyTAThmiWkklUh2h1NuoLqys
         z/mdMa5zxRb036n0qQoKjeCHBb5+WQy/cbQCnjVsz8Oc96s1VS/f3pcs1BDIDc7l16HO
         NTSBjj/p/WCabydj4OXobld/+Ni87NtTafFI6XG39QVaIpyQNiifQYDklph9wxZ3aBxA
         miE3g6MNX6NjyeuC/nuJfG+yWfwpJ61G7zWptPfqtFp5WgeLhnm8peTgt2JhP9Gvq8JT
         He4Wgj1PVnlt6rc3oUduh0OCwqg7vrhVCAPZxScHKTImZ8RtELwixMgHQIb482IIFvus
         Jmjg==
X-Gm-Message-State: AOAM533a1+ZBdD2TvjsRMNRDhpw9M7TCZJTIPPNJiNI2qQim5a7XHLlP
	FhOEcRzI11vHWrcxe8mKIIIH8gcG9JsCpQ==
X-Google-Smtp-Source: ABdhPJwVW8Xp0zQURp6FUJqxYgrWcVdROqSDWk/ZgIZ3ay1W9/1ERhCKek9hVgXu0aPj61DN7BxW9g==
X-Received: by 2002:a17:90a:7b86:: with SMTP id z6mr136689pjc.34.1606537489129;
        Fri, 27 Nov 2020 20:24:49 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.24.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:24:48 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/18] python3-iniconfig: move from meta-python
Date: Fri, 27 Nov 2020 20:24:16 -0800
Message-Id: <a634c7c8cd8069246dd0e931a3c714982b7ec5cc.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

A small and simple INI-file parser module

* Part of the dependency chain for pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb

diff --git a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
new file mode 100644
index 00000000000..af4291bbf46
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A small and simple INI-file parser module"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
+
+SRC_URI[md5sum] = "0b7f3be87481211c183eae095bcea6f1"
+SRC_URI[sha256sum] = "bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32"
+
+inherit pypi setuptools3
-- 
2.25.0

