Return-Path: <matt@madison.systems>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E1A7E78AB0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:55 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g12so6033563pgs.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BaqJUI3cUqCTYW9QTtOfpgv0PMpoI4KN+XDTP5h/t8I=;
	b=vxtSjXAtt1te2cnkHd38hMa3eZjgXSi4yU8QDNcCER12go5weKH/mUwQoa+X/mrhwI
	cbma1BPiq5I6v3jWIa81Ju8kX/GvrKPMIVXu2c+SC3ZIqwGsLdkThX7HZpN/wXoE8Nay
	MzSdx2MjTr+0joTDM0jbkUuyl0G4Uz+1HeJwZsMni5ScZqIB0OWWCt67OYV8uLdpEM6y
	aPIM5WqUtBlEPgXgKIDfZb2jq9GJs0JMifZKAj2ZuSnS2i7jhmN+/KcXpu1NrA3tCYtT
	DmeFzbBCy4ndUxx+auJvVUvmBT1mc6iaOsA0WpKOBoWsAcg2goRr3C4p2+dXwrLHkRaa
	eLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BaqJUI3cUqCTYW9QTtOfpgv0PMpoI4KN+XDTP5h/t8I=;
	b=qByqHcg3ERst9Axc2b92aw4Q9n7IMD0ShcYQ7Fa2peJ5GQc5h0BvjzOeKizRJIVqON
	vqAXziJRwk6D+Lw4iXuSBF0o+4NAnLAWMas4TYyEvDkRkq1EyZ43yGvz86XToZz0At0C
	qy5f1ZpdtUaJtxKt5h6/RWleEAvr7dNLFtVkE+wBc5QdRiKergzyg4QtVu11vJ6gdH9O
	8QW64CNZZLv9dsBpfQ7wwqaj6/kSAy196FQ8vxImT42d8kKQx6GPtSk6tbGljlD2ov3w
	3EQ6G5uFEKYQqxhUFbsHAbRyo767WM3X488ipsSGnLC2u0ada0iprraKMTJnFRLl2oZ7
	z/yw==
X-Gm-Message-State: APf1xPDGZoaZVwpToDE1K4lAr149MJDgMbV4JIVLSMFykJzkFR7HTPmc
	03C/Pl3sEKqaoftYt8z1s4rqJNl/
X-Google-Smtp-Source: AG47ELvnAgToT3lvg2aZWM/9IBqR0Yc39+P0s6k0a9moNdmsNuQBX3Orc4BxW+f8mqtdW3EOTeU/PQ==
X-Received: by 10.99.103.196 with SMTP id b187mr10529983pgc.1.1520197797080;
	Sun, 04 Mar 2018 13:09:57 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:55 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:33 -0800
Message-Id: <20180304210937.29727-10-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 09/13] go.bbclass, goarch.bbclass: update SECURITY_CFLAGS
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:56 -0000

With go1.10 the NOPIE flags are only required for
MIPS target builds, and are now incompatible for
the other architectures.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass     | 3 ---
 meta/classes/goarch.bbclass | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index a51ba3e9f0..d33d83ea7f 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -34,9 +34,6 @@ GOTOOLDIR = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go/pkg/tool/${BUILD_GOTUPLE}
 GOTOOLDIR_class-native = "${STAGING_LIBDIR_NATIVE}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOTOOLDIR
 
-SECURITY_CFLAGS = "${SECURITY_NOPIE_CFLAGS}"
-SECURITY_LDFLAGS = ""
-
 export CGO_ENABLED ?= "1"
 export CGO_CFLAGS ?= "${CFLAGS}"
 export CGO_CPPFLAGS ?= "${CPPFLAGS}"
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 5c8ed33b15..f54c5169e3 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -35,6 +35,8 @@ COMPATIBLE_HOST_powerpc64 = "null"
 COMPATIBLE_HOST_mipsarchn32 = "null"
 ARM_INSTRUCTION_SET = "arm"
 TUNE_CCARGS_remove = "-march=mips32r2"
+SECURITY_CFLAGS_mips = "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_NOPIE_CFLAGS ??= ""
 
 def go_map_arch(a, d):
     import re
-- 
2.14.1


