Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id A50367FB21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:51 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id c22so1658313wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7aSdpAMWzpMlGsdwZU01X7mczvjQ7bbkoJrBasMyYgY=;
	b=RQUN7wFm+svhuWgaGEmPAb0jVwaOIFQzVjyXeQThXZl1U2iSzqF4MQGrr4wQ+V2yOd
	4IHeHcyvaXMTY0fIdGNVXYUX9A8SL7hQGwcykgvTslI+geajnIIWTaoO/zIFDCG3oQww
	eQ7vfI4bzKPaoJ66xmFEwWKMevGbImcLf3nhRoXOzrLdeN0CyGNcOSZglOquVIuszmSH
	hTuegpU/t+nGJry4CmXSzggditJo3bo2FSYSHPkzY9cw9ghbBXOLSXI9hNE7K7wBy8Zt
	FW/n2Y3xMa7it3BZdIVIKlcG68FpbX01j5nbSClcxS8bAKImXDOECE+xa5hARfkVIanX
	BlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7aSdpAMWzpMlGsdwZU01X7mczvjQ7bbkoJrBasMyYgY=;
	b=S9p3cxp7cLJxD8J1k2eu1bmcFVicCXGx8ctDnLzHj2Kk+JJ5osKb9pXyIp62sq6DTq
	cZwUrBUWBzSOrQKvrZmz3nE/18A0Ohk+PxCokDEq3OGcWvrocOtUrSNTqRdN1/z/1IhD
	CjBWIwavK0SmAvseLYlMq7jo68GNblEUnVNlP0cwcF7ja9l7gLuSeRoAMTpTSmAU1lOb
	pH5EMfUK5/9RVc4JSLPx40n8Ll2uRmvlHbEy0O6vkXksGkZKRzjU8iIDb9vU6l1H9Fjj
	dydyHi9HDTQ1hP0uHx8ntDJ6MUDMjXIEUUlbiey917sUNgmV95YPXdII0zcpG388aMbB
	D69w==
X-Gm-Message-State: APjAAAX3ALVP8Py/DzuTriX79Temxu7ylYhF4GOywryi8C+XGhLCdvDs
	87vPE/SvvuievUW6H4C/UdkYmugHyzY=
X-Google-Smtp-Source: APXvYqzbcnBdty5ha3wVhD2lFYxxOmQyirGifHLqsMjvvTxeBQD4GI/S5yOXvTJloN01t70RD7NsYg==
X-Received: by 2002:a7b:c76d:: with SMTP id x13mr3172993wmk.155.1572342472049; 
	Tue, 29 Oct 2019 02:47:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:24 +0100
Message-Id: <3900d9fd530abc4a99ef89ab8e8b9d4e2cd2b409.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 11/19] python: include CVE patches for python-native as well
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:52 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Also avoids maintaining a different set of patches for both.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3b1c00cc46b33ddbf7e008267032220e1e298af)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python.inc       | 5 +++++
 meta/recipes-devtools/python/python_2.7.16.bb | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 779df53..8d0e908 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -8,6 +8,11 @@ INC_PR = "r1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+           file://bpo-35907-cve-2019-9948.patch \
+           file://bpo-35907-cve-2019-9948-fix.patch \
+           file://bpo-36216-cve-2019-9636.patch \
+           file://bpo-36216-cve-2019-9636-fix.patch \
+           file://CVE-2019-9740.patch \
            "
 
 SRC_URI[md5sum] = "30157d85a2c0479c09ea2cbe61f2aaf5"
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index c6160ae..a02a628 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -30,11 +30,6 @@ SRC_URI += " \
            file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
            file://float-endian.patch \
            file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
-    file://bpo-35907-cve-2019-9948.patch \
-    file://bpo-35907-cve-2019-9948-fix.patch \
-    file://bpo-36216-cve-2019-9636.patch \
-    file://bpo-36216-cve-2019-9636-fix.patch \
-    file://CVE-2019-9740.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.7.4


