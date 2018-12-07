Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC1F79C5E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 23:23:30 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b14so5227231wru.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2018 15:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4p6dOchRYw4K2oqjqI2hHWg/L2TcHDSTzCnmLOV9X4Q=;
	b=FtbKHkA1a0rpOk+K8Ubxya7HqvU8Fh3YN6Sqe6M/LF/jzyrsqChS0zh61sIlZ6QkhK
	EU39Byff1tFPDWVys4+LCktOqQ3PXPEF8ogvrv9OlbxUIg5+detzx6tW7+upoDYy/6qA
	glBZkVeay2G9NY4hcieiWWJLV0T9LxpojVjka++914nB1Fg9jX5teMC/X8dN+9UbCDy5
	STqDujbP0al71CvupnTzPfIk1gXPP2CC+u9qZcUbI1ogj6poSxfDersZgAxAzLsd3y6o
	Y+pBXicF2d7Lmwp6tnm5fimwdBowNRQbM3xFqsql2a//0hUz4JP6Z4EOhwscCL9wrN9y
	noPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4p6dOchRYw4K2oqjqI2hHWg/L2TcHDSTzCnmLOV9X4Q=;
	b=Ql4Etd04muLVpps7ewMBW0ubXZxA6YW/N/AH7bLNvgobLrpsMlbd9hV0fLkmIPjXiJ
	mnej/DwkkZAz4Wxgw2dWz1DJzXkoRDGIXCI8OjqF9pL6TvC0YGSG35DMJbeVrHDjjp2I
	u0O8zlAL7I4cAFg91HbBQxf0S0aNUK1wRQTVvXhST4rl7309tNXdwCQ7OI2seldJjs2L
	1XAg8KKUCt9Pd2ShnC0rF7LptZ9tj/HXUG3gp+9dilN/LBvbcRC9qOoU0oP0ATo0GWy7
	RbxzcHfbbtGyBGk7Np4uHM9hAsLr3y2tR+ELahuVGlEOc1Lt8oyuVSKv5z3UixYV7inj
	rjmg==
X-Gm-Message-State: AA+aEWZKmE1qJ7OkqbYCCZaquL3X6htoz/yF/vmJInKWmyE2a080ohKv
	fGTD0ocpNERYeC0b5bRNg6P72fBl
X-Google-Smtp-Source: AFSGD/WWJOcqQhc3azdYX6kxBllV/2w+Dsi9A7CRhwNnONkrDHI9kMc1u5ub82rzP/RdOPvxfNDJQw==
X-Received: by 2002:adf:e7d0:: with SMTP id e16mr3499034wrn.142.1544225010818; 
	Fri, 07 Dec 2018 15:23:30 -0800 (PST)
Received: from localhost.localdomain
	(host55-101-dynamic.58-82-r.retail.telecomitalia.it. [82.58.101.55])
	by smtp.gmail.com with ESMTPSA id
	l197sm12531523wma.44.2018.12.07.15.23.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 15:23:30 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Dec 2018 00:23:23 +0100
Message-Id: <20181207232323.3855-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] meson.bbclass: map mips64el TARGET_ARCH to mips64 for the cross file
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
X-List-Received-Date: Fri, 07 Dec 2018 23:23:30 -0000

Meson uses 'mips64' for both big- and little-endian MIPS64 machines,
so map mips64el to mips64.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 3cbdcf18c2..f01f6e3565 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -56,6 +56,8 @@ def meson_cpu_family(var, d):
         return 'ppc64'
     elif arch == 'mipsel':
         return 'mips'
+    elif arch == 'mips64el':
+        return 'mips64'
     elif re.match(r"i[3-6]86", arch):
         return "x86"
     else:
-- 
2.17.1


