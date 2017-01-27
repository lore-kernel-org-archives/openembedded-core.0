Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id B3A1277350
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:06:21 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id n124so158291103lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jZvWORtIvkH4JGpUwd97+ka+oQX0oIZGovNLy29WeBo=;
	b=ZekLO4l1WBmPgZSmjtZI4apCcgrrFCLjiMVF1hQ/MeIZGVBaTWTZ5RJrshgU2vexHr
	gxkUCJPhflyOLfMPl5tHV24q9ZBi5buylOj9kE6lMfSwRJU7sA4lyInpuUq9y+s72uBl
	+8OrOq0Y6MYZZpn9wbTSWgIsW3HX92w1Ev00OJANYwveyEtJU7wTkVHcIy0BK+qhwMGV
	loAOLSLFYx1t9EkyZ02oMKj7JF7tgw5EtgfsPpYn4TQCJ8Jt35QUc20yo8sTKMI5xz9E
	1wFLsRZrkZFxBy2D0CEH1yE71FuLE/t2yfSq9WRVtod/EYBQmBvaFd0NkcKcEQ7jzNRQ
	wwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jZvWORtIvkH4JGpUwd97+ka+oQX0oIZGovNLy29WeBo=;
	b=BW3g0i/450oxOeoaqkDTuOCNQsyYRNgkPQ8aBzF59NMo5tX60oxUOq2CUHG5YBL/X8
	bstEcvb9mcjRHTW3M0q2AK7Ealy0+Ak4wZKXnxcs/+MqFGoVhEI3/GXbphyNUBnzGShR
	aZHLONnDim7L12q5uCgYdA4pSjR+uq98GJq99ZjGSkg25DLt3dTMODNjtXq4WRuJk/1H
	4U4OjzjGFxlYl42ctGIWH1Ac6tdCuGpqLkncz2EUK0gIxrnP/cr20Wfn+BxbOyBdOMGA
	2SZ6S+wtTWPgms6Lq0/wzWd8cXyaWdGioooT4MU/paWbarwXHRMqVBuET/T0dgb1v9yM
	VGWg==
X-Gm-Message-State: AIkVDXKMj5FwjKuWhqpzQu6SkXa+q3yXFEhaucd8OC6w4ng5PjICGDxwbjW+9U9JtAUlJA==
X-Received: by 10.25.134.195 with SMTP id i186mr2300777lfd.79.1485507981101;
	Fri, 27 Jan 2017 01:06:21 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	a78sm1115683ljb.47.2017.01.27.01.06.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 01:06:20 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 10:05:58 +0100
Message-Id: <2a0ac951f00425fbeb70047e1a0601f23adfeb63.1485505680.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485505680.git.anders@chargestorm.se>
References: <cover.1485505680.git.anders@chargestorm.se>
Subject: [PATCH 3/7] python-3-manifest: add argparse to RDEPENDS for netclient
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
X-List-Received-Date: Fri, 27 Jan 2017 09:06:22 -0000

http/server.py requires argparse.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 6093c2806b..5c10cd21bf 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -154,7 +154,7 @@ RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN
 FILES_${PN}-multiprocessing="${libdir}/python3.5/lib-dynload/_multiprocessing.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_multiprocessing.*.so ${libdir}/python3.5/multiprocessing ${libdir}/python3.5/multiprocessing/__pycache__ "
 
 SUMMARY_${PN}-netclient="Python Internet Protocol clients"
-RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
+RDEPENDS_${PN}-netclient="${PN}-argparse ${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
 FILES_${PN}-netclient="${libdir}/python3.5/*Cookie*.* ${libdir}/python3.5/__pycache__/*Cookie*.* ${libdir}/python3.5/base64.* ${libdir}/python3.5/__pycache__/base64.* ${libdir}/python3.5/cookielib.* ${libdir}/python3.5/__pycache__/cookielib.* ${libdir}/python3.5/ftplib.* ${libdir}/python3.5/__pycache__/ftplib.* ${libdir}/python3.5/gopherlib.* ${libdir}/python3.5/__pycache__/gopherlib.* ${libdir}/python3.5/hmac.* ${libdir}/python3.5/__pycache__/hmac.* ${libdir}/python3.5/http* ${libdir}/python3.5/http*/__pycache__ ${libdir}/python3.5/httplib.* ${libdir}/python3.5/__pycache__/httplib.* ${libdir}/python3.5/mimetypes.* ${libdir}/python3.5/__pycache__/mimetypes.* ${libdir}/python3.5/nntplib.* ${libdir}/python3.5/__pycache__/nntplib.* ${libdir}/python3.5/poplib.* ${libdir}/python3.5/__pycache__/poplib.* ${libdir}/python3.5/smtplib.* ${libdir}/python3.5/__pycache__/smtplib.* ${libdir}/python3.5/telnetlib.* ${libdir}/python3.5/__pycache__/telnetlib.* ${libdir}/python3.5/urllib ${libdir}/python3.5/urllib/__pycache__ ${libdir}/python3.5/uuid.* ${libdir}/python3.5/__pycache__/uuid.* ${libdir}/python3.5/rfc822.* ${libdir}/python3.5/__pycache__/rfc822.* ${libdir}/python3.5/mimetools.* ${libdir}/python3.5/__pycache__/mimetools.* "
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index cc2e5619e6..ac95bc8fa9 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -318,7 +318,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-multiprocessing", "Python multiprocessing support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap",
     "lib-dynload/_multiprocessing.*.so multiprocessing" ) # package
 
-    m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
+    m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "${PN}-argparse ${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
     "*Cookie*.* " +
     "base64.* cookielib.* ftplib.* gopherlib.* hmac.* http* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib  uuid.* rfc822.* mimetools.*" )
 
-- 
2.11.0


