Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9615365E11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 06:05:06 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so11549574pab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 23:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=9WJcRMUecR/CRa0OFBtIgKft4UMByV5qS+PMnNvwgAQ=;
	b=gI6RW0zXs8IGY5kRNCaLDQLvWXWzb1JUy6Uf3ylXFFxpPRfXl/LvaUKipqzPtADa/o
	TLX9p7z4iBPcn1xef3NKqzI+jdq1cu5Hw65GqDuAdJ1QqIZod0t8FqzDbbFi8E4UWM1l
	9Wv+PIVSa9B61dL7hx5nctYKFwvRVBnLANWrEVR+Nvz4btR/PtWJJ12xYdljEZxU7ACV
	jkDafHbO31cAYRPyg83eCPYCn73Xib0hXH1VNA9P3SXZ1h0yyPTh+tN6OG3ZuMdjq3s2
	WWOutO0YB9NnUivnoMyKD8RbZYhEq5BhPSJe35jFf2mnpDXwPU4juA7YkiBA7QKCmAnd
	CNtA==
X-Received: by 10.68.164.35 with SMTP id yn3mr9969557pbb.104.1408514707836;
	Tue, 19 Aug 2014 23:05:07 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	op10sm21199467pbb.88.2014.08.19.23.05.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Aug 2014 23:05:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 23:05:03 -0700
Message-Id: <1408514703-6424-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [[PATCH] python: add webbrowser module
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
X-List-Received-Date: Wed, 20 Aug 2014 06:05:09 -0000

webbrowser is being compiled but not included in packaging.
Add webbrowser to python-netclient

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index a8afe13..b477f3f 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -159,7 +159,7 @@ FILES_${PN}-multiprocessing="${libdir}/python2.7/lib-dynload/_multiprocessing.so
 
 SUMMARY_${PN}-netclient="Python Internet Protocol clients"
 RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
-FILES_${PN}-netclient="${libdir}/python2.7/*Cookie*.* ${libdir}/python2.7/base64.* ${libdir}/python2.7/cookielib.* ${libdir}/python2.7/ftplib.* ${libdir}/python2.7/gopherlib.* ${libdir}/python2.7/hmac.* ${libdir}/python2.7/httplib.* ${libdir}/python2.7/mimetypes.* ${libdir}/python2.7/nntplib.* ${libdir}/python2.7/poplib.* ${libdir}/python2.7/smtplib.* ${libdir}/python2.7/telnetlib.* ${libdir}/python2.7/urllib.* ${libdir}/python2.7/urllib2.* ${libdir}/python2.7/urlparse.* ${libdir}/python2.7/uuid.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/mimetools.* "
+FILES_${PN}-netclient="${libdir}/python2.7/*Cookie*.* ${libdir}/python2.7/base64.* ${libdir}/python2.7/cookielib.* ${libdir}/python2.7/ftplib.* ${libdir}/python2.7/gopherlib.* ${libdir}/python2.7/hmac.* ${libdir}/python2.7/httplib.* ${libdir}/python2.7/mimetypes.* ${libdir}/python2.7/nntplib.* ${libdir}/python2.7/poplib.* ${libdir}/python2.7/smtplib.* ${libdir}/python2.7/telnetlib.* ${libdir}/python2.7/urllib.* ${libdir}/python2.7/urllib2.* ${libdir}/python2.7/urlparse.* ${libdir}/python2.7/uuid.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/mimetools.* ${libdir}/python2.7/webbrowser.*"
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
 RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient"
-- 
1.9.1


