Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id ECA246E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 18:07:58 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u25so2481171qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 11:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KqG5QfXbyj4HLmhONlM83wR1S6NF+k+HGGJvJ5WtN/Y=;
	b=c/MyLEurbgM003ViRdB2oladoz1Ff4I5QO5oP35bTMrY/s74TEMsI7v9m3XL5lyO94
	EBIWgnDUlFypLqm6xsBWTbgOZbZEPzRX5QBDzrDo8Y8TDf3XsWu50N7qI6NOJesasmNE
	O/ve6AVddSenHwYf9rDLuevqQ74iyKU2/k+yx0E3RkWLD8qOoFMU5JE4wDlr4TOhMBOW
	FKNfKKFPrMNKaj9tArGwJ3yX3Y/MLLeSWVOA7JCmUSC0qoiiMLAMzEGlE43qUa6Ned0c
	n9VG+LSYo6N7n3U5x6X1+iq4rpFyHcyec5itS1nQy3ch8FGJitZorSSqlY4ZT6YnY/D2
	GUtA==
X-Gm-Message-State: ALyK8tLdBnIPFPkPcuU5GAgR7pbDUk04OAplsC3m4/xpEKcJGmkeEkVaap6tXci9jCtUPA==
X-Received: by 10.237.37.58 with SMTP id v55mr17996271qtc.9.1468260479067;
	Mon, 11 Jul 2016 11:07:59 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(c-68-34-224-206.hsd1.al.comcast.net. [68.34.224.206])
	by smtp.gmail.com with ESMTPSA id z64sm2788668qkb.3.2016.07.11.11.07.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jul 2016 11:07:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 14:07:39 -0400
Message-Id: <1468260459-826-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] python3: regenerate outdated manifest file
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
X-List-Received-Date: Mon, 11 Jul 2016 18:08:05 -0000

generate-manifest-3.5.py updated in fa4275bbc0098124f3b44e0eafae83692db778b9

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 335c3ff..b14d567 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -35,7 +35,7 @@ FILES_${PN}-compression="${libdir}/python3.5/gzip.* ${libdir}/python3.5/zipfile.
 
 SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math"
-FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/ConfigParser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+FILES_${PN}-core="${libdir}/python3.5/__future__.* ${libdir}/python3.5/_abcoll.* ${libdir}/python3.5/abc.* ${libdir}/python3.5/ast.* ${libdir}/python3.5/copy.* ${libdir}/python3.5/copyreg.* ${libdir}/python3.5/configparser.* ${libdir}/python3.5/genericpath.* ${libdir}/python3.5/getopt.* ${libdir}/python3.5/linecache.* ${libdir}/python3.5/new.* ${libdir}/python3.5/os.* ${libdir}/python3.5/posixpath.* ${libdir}/python3.5/struct.* ${libdir}/python3.5/warnings.* ${libdir}/python3.5/site.* ${libdir}/python3.5/stat.* ${libdir}/python3.5/UserDict.* ${libdir}/python3.5/UserList.* ${libdir}/python3.5/UserString.* ${libdir}/python3.5/lib-dynload/binascii.*.so ${libdir}/python3.5/lib-dynload/_struct.*.so ${libdir}/python3.5/lib-dynload/time.*.so ${libdir}/python3.5/lib-dynload/xreadlines.*.so ${libdir}/python3.5/types.* ${libdir}/python3.5/platform.* ${bindir}/python* ${libdir}/python3.5/_weakrefset.* ${libdir}/python3.5/sysconfig.* ${libdir}/python3.5/_sysconfigdata.* ${libdir}/python3.5/config/Makefile ${includedir}/python${PYTHON_BINABI}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
-- 
1.9.1


