Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 88B6E7FDA2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 02:58:50 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id d5so8360241pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 18:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=orPK4UOQvI42oR3QDG9oiHE8zXzQBWTOGJfizj6ZJHs=;
	b=WcoRzhVCdKpxg6qkByMs7kU8roIYz/L+8/HucRL7Z3/BpIxuasvLljpOnGConi//h9
	52owaRuYDnA2Q+/mpM+wu3jHtuPwq35KaYyz4t7fqJcC1jW23xACDVNktxbF08vv7Awe
	7SakRJVX4FIp+nET9jDFfkug7nTVn2lxWifwBR1gkaoi8Ce3+SEMtVi3SBQt6NJqPX1L
	EZFz4bJ97N1D/P8uMArw8Bs+QrDJ8JreL17loniciBIZgJNnAG51S65Kp3MZk5ffPMRh
	BqJk0VwWNIRhMU9lW8JFbPppRxVn3d7izhYOsp6Lic824eDBHimlrmuae5qUQABMSEKK
	po/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=orPK4UOQvI42oR3QDG9oiHE8zXzQBWTOGJfizj6ZJHs=;
	b=RmfKY3SdAkrxr9HWv5exsMklehSU6Wa5iC2CWstvD7JT0yTZ4cncwfhupZX/UApunn
	O3sPQHn81Rv7SiUQEofsP3Mel69xyhFuvBJxIpvtZXaORTNar+skkjL9NirZRUWshQ1f
	a1bSZ6vFt7M9ZVns6DU2O2vKvGVvVG1dY6WTXJpNhSFMv82xCVddsdsGWXGygkvjlvN1
	l4FZuvDL3875oaDmJzoi7tX0V9L5dwBru6O7zLEN7I6+eIgmWcKmbSx5gCi8c2NQRi3x
	oYX6CCoO1Fg6AB2N0gQLvqXsCzXDs68TlmAjK0iFW3Mg1V1qmXFdSoPlcfCI2G3w8uYM
	C+Uw==
X-Gm-Message-State: APjAAAXEN8TLsOvDbfdFs9teSfqodirb2lC1bm/1cKk50Q4FVjg5PKgf
	Pev0fn8b4LAATmITxIL2zPAgz8cnoXM=
X-Google-Smtp-Source: APXvYqyp/26C0mAnAwaAAnAZLB/5TeCeVQ5L66F9lcH5x9dnbrSNnv9oDGoZRvKsEdXZcWZGrUci9A==
X-Received: by 2002:a17:90a:1ae9:: with SMTP id
	p96mr47317113pjp.8.1578365931164; 
	Mon, 06 Jan 2020 18:58:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9bd6])
	by smtp.gmail.com with ESMTPSA id
	q12sm78904894pfh.158.2020.01.06.18.58.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:58:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 18:58:45 -0800
Message-Id: <e7c8eac44fac3313591a072798c79f3146517704.1578360245.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578360245.git.raj.khem@gmail.com>
References: <cover.1578360245.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] Revert "tclibc-musl: Add -D__USE_TIME_BITS64 to c/c++ flags"
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
X-List-Received-Date: Tue, 07 Jan 2020 02:58:50 -0000
Content-Transfer-Encoding: 8bit

This reverts commit 194bd4136459e7a38510830b2fb0938d892ece45.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-musl.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 22f8214ba3..8badbbb40a 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -18,7 +18,6 @@ DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
 #USE_NLS ?= "no"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
-TARGET_CC_ARCH += "-D__USE_TIME_BITS64"
 
 IMAGE_LINGUAS = ""
 
-- 
2.24.1


