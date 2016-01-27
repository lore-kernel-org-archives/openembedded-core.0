Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id E79A47327E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 22:20:26 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id n128so11603305pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qvvb3hiWEltz55TGbZ+kMth1ORLshoY+Xs/gQmCR7Rw=;
	b=GkbxhzJYCh7Y0LasYjuvNN/2JleoAGsjrlDgosotO8U09uRlPvzIpDst/+7kcZ5P9n
	JXWWbEh79JkpDrOkeMR/Hjt2KJ6zTFB+AdHyodjIox4YhLGewSIN0alzW21HmN7e8ZVC
	Xqq0jhBVYATRrVbcZ6YQSnTQ8Afcht6ED4+j5/m8+RMxAZu4U7CEeQyvjI6lbW7WcU5P
	VO8NV32JemP7Pkkas3jHAmCOD7bOV0S2+opyMX6NCI2bckg36w6NcCknNewont2cww+b
	v1HTV1gYenYqwpMFfzBvUU45bwChEB/17OUX9ntBpxzoBqjrCkSej4X2NpXW7iWCs2K7
	ddMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qvvb3hiWEltz55TGbZ+kMth1ORLshoY+Xs/gQmCR7Rw=;
	b=MepydJ2mt5NNKvMawJxqJU7V4/ZwmRUMJBu5Rt6n1HLEd6THRsvoDb4eWIe7raDWTH
	d5Oml03OA+qVubK98+HrEzxOymipDheqRkwIyJBT4goimnICISEUdOBfVThmeB1QKojk
	8QaRSa2KzKPq4I4FGRhnyOR/XrQCvcVxvlE509zwFCVVQO4lnbirK6ac3oilimrA/hDU
	vAqg3swN9GZfVxg54wQrG65hPrL2YJi6pTx8ZoyCOBoT/VzVr3jJgXL5gJeTQXXxVql0
	fsowt2DpcNxv0NMPhe4FGb6u0+4X5Dajix7q1KfziimLQWGePNx9mUGp4/K1oiC7gCcK
	2zfw==
X-Gm-Message-State: AG10YOTqR3sCLVRpTcxcgYjQ1wzk/tQLTBowsI3Nl4LYQ8C7Z1n6MFYHYcCEpsHU+VbZgg==
X-Received: by 10.98.42.83 with SMTP id q80mr45439156pfq.19.1453933227615;
	Wed, 27 Jan 2016 14:20:27 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	76sm11282162pfl.36.2016.01.27.14.20.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 14:20:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Wed, 27 Jan 2016 14:20:21 -0800
Message-Id: <1453933221-23617-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1453933221-23617-1-git-send-email-akuster808@gmail.com>
References: <1453933221-23617-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] libpcre: bug fixes include security
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
X-List-Received-Date: Wed, 27 Jan 2016 22:20:27 -0000

From: Armin Kuster <akuster@mvista.com>

[Yocto # 9008]

This is the next patch release for pcre. The 8.xx series now only contains
bug fixes.

http://www.pcre.org/original/changelog.txt

The following security fixes are included:
CVE-2015-3210 pcre: heap buffer overflow in pcre_compile2() / compile_regex()
CVE-2015-3217 pcre: stack overflow in match()
CVE-2015-5073 CVE-2015-8388 pcre: Buffer overflow caused by certain patterns with an unmatched closing parenthesis

CVE-2015-8380 pcre: Heap-based buffer overflow in pcre_exec
CVE-2015-8381 pcre: Heap Overflow in compile_regex()
CVE-2015-8383 pcre: Buffer overflow caused by repeated conditional group
CVE-2015-8384 pcre: Buffer overflow caused by recursive back reference by name within certain group
CVE-2015-8385 pcre: Buffer overflow caused by forward reference by name to certain group
CVE-2015-8386 pcre: Buffer overflow caused by lookbehind assertion
CVE-2015-8387 pcre: Integer overflow in subroutine calls
CVE-2015-8389 pcre: Infinite recursion in JIT compiler when processing certain patterns
 CVE-2015-8390 pcre: Reading from uninitialized memory when processing certain patterns

 CVE-2015-8392 pcre: Buffer overflow caused by certain patterns with duplicated named groups
 CVE-2015-8393 pcre: Information leak when running pcgrep -q on crafted binary
 CVE-2015-8394 pcre: Integer overflow caused by missing check for certain conditions
 CVE-2015-8395 pcre: Buffer overflow caused by certain references
 CVE-2016-1283 pcre: Heap buffer overflow in pcre_compile2 causes DoS

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/libpcre/{libpcre_8.37.bb => libpcre_8.38.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.37.bb => libpcre_8.38.bb} (94%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.37.bb b/meta/recipes-support/libpcre/libpcre_8.38.bb
similarity index 94%
rename from meta/recipes-support/libpcre/libpcre_8.37.bb
rename to meta/recipes-support/libpcre/libpcre_8.38.bb
index 1880639..c567607 100644
--- a/meta/recipes-support/libpcre/libpcre_8.37.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.38.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "ed91be292cb01d21bc7e526816c26981"
-SRC_URI[sha256sum] = "51679ea8006ce31379fb0860e46dd86665d864b5020fc9cd19e71260eef4789d"
+SRC_URI[md5sum] = "00aabbfe56d5a48b270f999b508c5ad2"
+SRC_URI[sha256sum] = "b9e02d36e23024d6c02a2e5b25204b3a4fa6ade43e0a5f869f254f49535079df"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
2.3.5


