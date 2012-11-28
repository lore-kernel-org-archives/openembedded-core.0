Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tdjob-0004dz-TE
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 16:44:46 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so7328475pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fvTC55D5tNxFt+0b0P4i/upmTwJPnxeBU5O/BUiee1Q=;
	b=R1uvP2z4LVkMy7OSEQDiRzrOQF+lKriCCjr030JNUzBLHkNGiGx7GklcqsMDnwfTX/
	c0x9blSjZHmOGEpYfB76+x2HL7j5WZqGAync8GYh0OIVT+9GrL4S0ArUHFeFKLEq4b3+
	7lgcIix9hPlZF+vnz6MaSv5vvXCuFOWucZhbhU9X/SA4rNsJ5FJTuzxm334tkRsktnDY
	mxJZRjkZJfjb+Q6mvy+HNcYZVCCMDQpWeM7NeWrdhjzOInOoVjXbwIKGe92v8z1b5qgx
	Xsg8He2D7e3HJO/0/PK8bchRjB/HHe7iXqJCWFjFdb8w2s/PcTKByGCvDdYmk8rkUR38
	Mv+g==
Received: by 10.68.211.39 with SMTP id mz7mr59748836pbc.5.1354116630765;
	Wed, 28 Nov 2012 07:30:30 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gl9sm12599259pbc.51.2012.11.28.07.30.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 07:30:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 07:29:39 -0800
Message-Id: <020e9ba0b1fba8f3fa2358e32e65401b9c1e0c7c.1354116375.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8a0cdf9a8789439bc86ca4a8b3cbb77408659ac6.1354116375.git.raj.khem@gmail.com>
References: <8a0cdf9a8789439bc86ca4a8b3cbb77408659ac6.1354116375.git.raj.khem@gmail.com>
In-Reply-To: <cover.1354116375.git.raj.khem@gmail.com>
References: <cover.1354116375.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] tcmode-default.inc: Use binutils 2.23.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 15:44:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 9193691..1d6cd8b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "4.7%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.22"
+BINUVERSION ?= "2.23.1"
 EGLIBCVERSION ?= "2.16"
 UCLIBCVERSION ?= "0.9.33"
 LINUXLIBCVERSION ?= "3.4.3"
-- 
1.7.9.5



