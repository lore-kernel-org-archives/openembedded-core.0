Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7639772453
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jan 2015 04:45:42 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y13so23162532pdi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jan 2015 20:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=5M9iFEG1bbdRZHSZSk8o0wq3ltAMz1QMbIWNvMxotLw=;
	b=Mfr7g52R+OHDF6k2aAMOoBau8o6WYQz8sy3JHWGboKZZt7at4Dmch2Em4AufWmacO6
	s4Siw5/skqhAj6S0yDxKMp+ml+hwnNWz8XD0ulg1dlXhbyDOfKmNFjJpFJcQytJpEzHI
	6CPiA7SeiqyDcKztSSomydQOUQqvAuTI+CqOnPgGTgezyHafOeKLvtvI/H5gLeoad27l
	vxYDVquh3ls5RLfSLzWSUwmj+f9+1lyl01ukzD7aylIdHDPLXv9wpSNX+WnjroxJxkBe
	DTUK0D010slC5dgPjS53wX7ljh3FCRZ/kCu9uwBFW9RsI05IHyLc5hulaFUl2efNhEJf
	i2tQ==
X-Received: by 10.70.137.238 with SMTP id ql14mr120659658pdb.94.1420173943194; 
	Thu, 01 Jan 2015 20:45:43 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	pr3sm44804356pbb.37.2015.01.01.20.45.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Jan 2015 20:45:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jan 2015 20:45:28 -0800
Message-Id: <1420173928-25007-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] lz4: update to r127
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
X-List-Received-Date: Fri, 02 Jan 2015 04:45:47 -0000

dropped Makefile from license check.

r127
added : lz4frame_static.h

r126
New : lz4frame API is now integrated into liblz4
Fixed : GCC 4.9 bug on highest performance settings, reported by Greg Slazinski
Fixed : bug within LZ4 HC streaming mode, reported by James Boyle
Fixed : older compiler don't like nameless unions, reported by Cheyi Lin
Changed : lz4 is C90 compatible
Changed : added -pedantic option, fixed a few minor warnings

r125
New 32/64 bits, little/big endian and strict/efficient align detection routines
(internal)
New directory structure
Small decompression speed improvement
Fixed a bug into LZ4_compress_limitedOutput(), thanks to Christopher Speller
lz4 utility uses lz4frame library (lz4io modified)

r124
New : LZ4 HC streaming mode
Fixed : LZ4F_compressBound() using null preferencesPtr

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/lz4/lz4_svn.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_svn.bb
index 3a74200..363e439 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4_svn.bb
@@ -2,11 +2,10 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd \
-                    file://Makefile;md5=7551cc5d31ca66e003ab06e83486524a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
 
 # Upstream names releases after SVN revs
-SRCREV = "123"
+SRCREV = "127"
 PV = "r${SRCREV}"
 
 SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
-- 
1.9.1


