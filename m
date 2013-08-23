Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 731486B5A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:24:07 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id eo20so205373lab.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 00:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FtC16mAZfwu+Wa/29kPOZWY9CDN/q40awoz5vReFCDY=;
	b=OqrEA12nMdBiHkK9NPDfQbV/MO2EeU2z0KY5NScibW/nKvUgPnKDKudgm3WSR8Pkom
	RrMxKktuxy95zwbhToLJp2Y9VEf1jgNgNKvukrFGz5jQ75KlBkSoY/m8b5Fiskl0+q/d
	VUVaaqnTvBCNvAPqBtNRvAWhYZZvH+J+2QuHZ+laIYSsRbFaUUr34QU94JKW//fYOq+e
	e3EKFlOTlkNHYBPRQYwS40NRC1J/gqVMITIFveR/WZhFN152p4nX1at/Po16Ucs1/cb2
	QSRZs1ArhYj1d5UIEjSbhFFi1ogKQAp2zTvUt1mBFjdrY81k2rZu5wCaGY9s4vETnCvh
	AByw==
X-Received: by 10.152.30.74 with SMTP id q10mr1436922lah.27.1377242646517;
	Fri, 23 Aug 2013 00:24:06 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id js17sm6111079lab.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 00:24:05 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VClj1-00082f-0m; Fri, 23 Aug 2013 10:24:03 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 10:24:01 +0300
Message-Id: <3718f807775a7de16c841a40707b8fa16d337ebc.1377242514.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <379bb582b3884f9ab4605ee7260f78b8d8bcd93a.1377242514.git.cazfi74@gmail.com>
References: <379bb582b3884f9ab4605ee7260f78b8d8bcd93a.1377242514.git.cazfi74@gmail.com>
In-Reply-To: <cover.1377242514.git.cazfi74@gmail.com>
References: <cover.1377242514.git.cazfi74@gmail.com>
Subject: [PATCH 2/2] ccache: update to upstream version 3.1.9
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
X-List-Received-Date: Fri, 23 Aug 2013 07:24:08 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-devtools/ccache/{ccache_3.1.8.bb => ccache_3.1.9.bb} |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.1.8.bb => ccache_3.1.9.bb} (43%)

diff --git a/meta/recipes-devtools/ccache/ccache_3.1.8.bb b/meta/recipes-devtools/ccache/ccache_3.1.9.bb
similarity index 43%
rename from meta/recipes-devtools/ccache/ccache_3.1.8.bb
rename to meta/recipes-devtools/ccache/ccache_3.1.9.bb
index b445f0f..1679171 100644
--- a/meta/recipes-devtools/ccache/ccache_3.1.8.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.1.9.bb
@@ -1,8 +1,7 @@
 require ccache.inc
 
-PR = "r0"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
 
-SRC_URI[md5sum] = "ffa001305f31f44a3834be7c6c5102c5"
-SRC_URI[sha256sum] = "9c4134a88d2566ba41a070a6cedc53fa92e1008f40c116c61e73dde16453d63e"
+SRC_URI[md5sum] = "522a6016bda56892653612bbdefff3e0"
+SRC_URI[sha256sum] = "4981fdf3ad851de400d94083a0d03f115ce9ce8062c3fd7a291630294b0006c4"
-- 
1.7.10.4


