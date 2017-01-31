Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id C745B71E51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 07:18:21 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id z134so206575531lff.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2ouV9jniHFMyL9DDLG7rk3wbX/Xu4aKWC5Gjo2+2iQw=;
	b=zQR9wClVG1GN2+iGwfcOgXzTS9uX8btY6o6EPZNzwmwAIkE2id/dWvTyz5P1YoYC6z
	z4Oy+b5YicrFJOZeS+Jk8ZkpA4HF4iEuhJBeXtkWk1BDaRd8CHr1ldH9iRnT53LYerCL
	7AS7L6YsGuWb6uVdQQ/auE4My8Nd2nmZLE0RNSRlUwFg8EYeRlKHTJ29RkIwd9Ax4Z6Y
	cwDYM9xZvk5GreWFZX6eLfBJQyZIXf07vlgWeqid4gcx8aNVi4wP8+5FSFdsWCNpMNG3
	AVjyxzO4sz+afIT3dUEn4GRi+rJ6z9rTno2QLXu91rRYF2vOdlLVzuq8eax0XD+J+FII
	NEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2ouV9jniHFMyL9DDLG7rk3wbX/Xu4aKWC5Gjo2+2iQw=;
	b=JAfSCMrrBxoY43WP0Nc71RiKzm25VTkhW60/XcwFeBCxZtTpYfWp91bqwC8xvpWwvm
	13f2B77M6qWUWBzB5mm0AehYqRHeaHhSNuJ/rWADrdii2jteI9gCpzgf+tRQUoJlntve
	dxRDDvSgwDa5iwTgY5u+EPQHF+wLzKt17jMawpNqN2Sp+6XiY53POlobuVhx/Fo3340r
	SaDYQo/zH1/HpD1pTRkA4KsAS8/alI7Ts27eun8DkGk6kZGL+vmyWCQqCudVdPaXNakR
	ZSwPRWfhy/BkuGzPbE2mBp8cXrj6239J0h/JnLyGBdCXqT8WQQHq65qLO8SISgHQpByy
	/TAw==
X-Gm-Message-State: AIkVDXJDnXpVBHxD1wV1XM4NzUgN7OshE/R2eS+SZWtCKPkgNeXE8dY1VdDKoRYj9c5xqg==
X-Received: by 10.25.156.144 with SMTP id f138mr8969422lfe.80.1485847101390;
	Mon, 30 Jan 2017 23:18:21 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id w4sm400323ljd.23.2017.01.30.23.18.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 23:18:20 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 08:18:12 +0100
Message-Id: <61ff6f1cfa8e2d96012033d36d2e36b80a969364.1485846907.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485846907.git.anders@chargestorm.se>
References: <cover.1485846907.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v2 3/7] python-3-manifest: add argparse to RDEPENDS for netclient
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
X-List-Received-Date: Tue, 31 Jan 2017 07:18:22 -0000

http/server.py requires argparse.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 6093c28..5c10cd2 100644
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
index cc2e561..ac95bc8 100755
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
2.10.2


