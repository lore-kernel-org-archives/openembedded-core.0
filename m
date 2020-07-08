Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4713.1594242486024799703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=CA4vovRj;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjH59sNz4D
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242483;
	bh=U6YDscUbh4z398kMdu239oxW4osErUdLbxkTHdlujB8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CA4vovRjP3GA0O9XN82EqlsO0KVCMr9rec9TeED1Q9HkR5LkyPRegVZW+lqoh9leW
	 dK+Gc0nhOhOCuU4X3wLH6bMZLz8SfA/AROvQlXk+Fo8Fg7Ne72YmaX1UY80Zm9PYiU
	 X4ua1mb2OnhZLHjdJgbptAbveZk80Mw22g4JxI00FN0YxCgiXa0okyDbrNeWTva5Dh
	 mK1C55G+ANHqL5Er3HlJrVzmqjIr5jrUqH9ZNtkT06T0qIre8HrRApH8jfgxw9B1nH
	 tqwyCT7FBw3VTqfH/Za3yZcfoTInwjFte2p/iCK0PtdCMnZb7ZQlnHxfChi/z3DOFW
	 K1yj87+KF0NbtUHvufC+/a90Pwd5oe1Mh3j1yS1agCaP3OZ02WoNlEs63QoXQcpDDW
	 VC0DzcgmSkd9sxwfd/9z0126jMnsHcnxuJguj3yw4ldk3VVGmYR3+rQYyIwVI+aQga
	 4QDqIkRC1hkhwVLKavyS7dVJV+YbtGwa/EKvK+Fz3yh6Av64Erxou3kOmATO3lr9rX
	 EJMqXBGKF8FD1gOwz54A/J1K6zHnaEvqrzP45jy4bMaH6ilGlDyGmQui2Z4y0Xg5nT
	 aFTylx3bnWG9cxNfWbcbVfEDkna9N/+MLwGEu8PRiAulWJz1jLWb2WJHFTzfemdoz5
	 TLxFklMT1tbgTeazxOic6ClM=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 02/19] timezone: upgrade 2019c -> 2020a
Date: Thu,  9 Jul 2020 00:07:44 +0300
Message-Id: <20200708210801.5553-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

See full changelog https://github.com/eggert/tz/blob/master/NEWS#L11

(From OE-Core rev: 9d74b048e3a160d7a9a20e85817e9eb3a558af63)

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/timezone/timezone.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index f6bab1acb4..e542290c3c 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2019c"
+PV = "2020a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -12,7 +12,7 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "195a17454c5db05cab96595380650391"
-SRC_URI[tzcode.sha256sum] = "f6ebd3668e02d5ed223d3b7b1947561bf2d2da2f4bd1db61efefd9e06c167ed4"
-SRC_URI[tzdata.md5sum] = "f6987e6dfdb2eb83a1b5076a50b80894"
-SRC_URI[tzdata.sha256sum] = "79c7806dab09072308da0e3d22c37d3b245015a591891ea147d3b133b60ffc7c"
+SRC_URI[tzcode.md5sum] = "f87c3477e85a5c4b00df0def6c6a0055"
+SRC_URI[tzcode.sha256sum] = "7d2af7120ee03df71fbca24031ccaf42404752e639196fe93c79a41b38a6d669"
+SRC_URI[tzdata.md5sum] = "96a985bb8eeab535fb8aa2132296763a"
+SRC_URI[tzdata.sha256sum] = "547161eca24d344e0b5f96aff6a76b454da295dc14ed4ca50c2355043fb899a2"
-- 
2.17.1

