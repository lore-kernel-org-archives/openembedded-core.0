Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id D46F5795A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 21:24:43 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id x79-v6so3540611ita.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 14:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=r90Uzwo6UGyRrMZw/b5QQmkI7+3VGfVxrpdEJJzN1tg=;
	b=QNcJXFvvZp91kxlIHWF0S/6ZkSbhlwcQTMggdGwbGPOfhqINQFFC2huKRPEhMgYT/x
	pabFENfS/GEMz2RZoeUzSED3zm2c/bENiogztbFIhYdi4TIpbUSB9h+gxCHWKW4mI/nx
	6J82RdO4MY2Ww3CkTsOfdVCoPyMHofNPskMp5cTffhA+vlWNVgKywhdsMpk32TbL6soG
	9RDVZL3ouRdb7kzPQTE42myx21BWJhrdyT0MB5H8eGBq2zsn8m03wEWDkcxZzVUg61k8
	bn9UkZBTeIJexFKBixQxSPAfB+draovVDC+g6c9RVjPKHdd9oqVXyE6PkrZebyEW/z92
	7rtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r90Uzwo6UGyRrMZw/b5QQmkI7+3VGfVxrpdEJJzN1tg=;
	b=hzaD2rxSyprXcyhtcXO41Z614ZQeEG6bjQq+Iq3KN9/ZXNpM0b86qCpsLdXJK24Cwt
	cSGdTtcGC4nB2HsCyNzH7EOvMsG5O2LtjMVqFKbqDeWqqTTDdqvVN6nCjHyH/p2O3iFr
	LqzXCLksz7y4UWxI7+wiv2Q6Zp/vOCG3BnzbukzWrJmxkBTXkN6obHvgB1HnxPAbw0XH
	Jp6HBlUm/6sCkefQKYUK4+7THoseHK1ECMWwl2eyveKjtDE3iuFZsCAH33vEe5rz7d4Z
	R2qWE8lAk0ibLCYcwbFguRmDhZGKiPTBMzDjyvOPVzBYibl0aDIatB2oPmwecS2tXFI0
	fbmw==
X-Gm-Message-State: APzg51AQUSVg95IMXX/TxH/CCswleWOCuvLyJQwdphhywdFcMthwAbHC
	adCbhr86LNRP64sCf1YxHiN55h6z
X-Google-Smtp-Source: ANB0Vdbks7LlcSbr1+ZR6ppYy4jLVZa6oPt08v/KH5wUMRJ5LtigYafM962WMABS5hlEZ1PEOnu9/Q==
X-Received: by 2002:a24:f801:: with SMTP id a1-v6mr7704256ith.60.1535059484634;
	Thu, 23 Aug 2018 14:24:44 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	d11-v6sm797020iok.77.2018.08.23.14.24.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Aug 2018 14:24:44 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 16:24:37 -0500
Message-Id: <20180823212437.10711-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] swig: Remove superfluous python dependency
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
X-List-Received-Date: Thu, 23 Aug 2018 21:24:44 -0000

The actual dependency on native Python and is handled by inheriting
python3native

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/swig/swig.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
index bf61b02d6fb..aec544997f9 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
 
 SECTION = "devel"
 
-DEPENDS = "libpcre python3"
+DEPENDS = "libpcre"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
-- 
2.17.1


