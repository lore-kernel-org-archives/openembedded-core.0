Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 074586B8BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:26 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so178753eek.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=iRNayqgERnp5pklLv99uH0vcyjagkE7fHhKrZvIhivc=;
	b=MIsfVhbZv5XosEm+w52wQ5/vYZPPeIa7zOX1b/iOj3FONozo7keKl9Mb3b6thOBTSq
	w9pvT2033mvUQMBXeQNisXl/JfzyOgZ9a+6u81Fzwk44FkcjJIywDBidy6Gwg1j6ddu5
	c/CdEGWb0LAtr8UsRM6Yw984NTzB10JlFH9gopRbuOSifGX8DEsG1yI2e8U1TwsqgYxH
	v/hQljun/fXak09P22/Jyx6KAAyEAyFs9gH4m0QN6cYaLoEzmqQ/093qsw0S2zhIV58g
	E498AoHWXUiovRdrUgmONgatQyGwHUjztHTrWsSRcKLRMqLn+23PwHZcgk1yUtlVI6P9
	62zg==
X-Received: by 10.15.54.199 with SMTP id t47mr20455416eew.46.1376551407424;
	Thu, 15 Aug 2013 00:23:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm81956209eez.0.2013.08.15.00.23.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:38 +0200
Message-Id: <4b4d1cf7141fee544a517bf746b527d8095bd9b0.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 27/33] socat: add PACKAGECONFIG for tcp-wrappers
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:27 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/socat/socat_1.7.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.1.bb b/meta/recipes-connectivity/socat/socat_1.7.2.1.bb
index 950e1e5..8aff4de 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.1.bb
@@ -18,6 +18,9 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2;name=s
 SRC_URI[src.md5sum] = "7ddfea7e9e85f868670f94d3ea08358b"
 SRC_URI[src.sha256sum] = "faea2ed6c63bb97a59237fd43b7c35ad248317297e8bfeb2e6f2ec1e6bc58277"
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
+
 EXTRA_OECONF = " --disable-termios "
 
 inherit autotools
-- 
1.8.3.2


