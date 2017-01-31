Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5A17B71E5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 07:18:22 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id v186so206640241lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uGO0JqCGJF3T6tArxzwCtcFhi5AaLsL15NYXhasxhUQ=;
	b=Vc4GgBk6YbiQS+fPBXz747vmR9taDxJOtDR8MOtA2+gZawBbzL+6VMUDxKN/XFKT2X
	zWDGq3hj49CNUd/xzEHfkefG38DZgJiFb0QnLzcFk9t1mXic6Oo95/AZqA19NAT4Gg45
	sumgtapg451bthHgPXExPSO+jPuY8TopHOC1xayH+UFY/9N+B6UViTQ07tcKdxWfGUsY
	drfXMHizrExvlhXCIEp1ZLpE7IcN8I6JCAhGpExqfGNqZx4lM8X6TiBONva4pCEJUb+0
	LkrTUPWpvSEzfR9f28a6ZU0c0bgfPcg56gxwU/YEQChTUBdmAQNFaH3OGKM1QCncYqdA
	OwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uGO0JqCGJF3T6tArxzwCtcFhi5AaLsL15NYXhasxhUQ=;
	b=hospIqiqUtny8sHRKYp9/bFHNIEkEbF/1DzcrBJlj5rR1tpqwaZ33RQjTUJT/UG7mI
	mrDv3GiDGMjPO+WGw0IKDt37UicOztpOjOhP8Q2dI+8T2czT6CzOAUOvUvHeG/sJKJ4C
	wrGppzXMrPCIWjlZFp+Ugr4F3L3Pf3MydbzVUQ6HKI6eOw4ck8pYrx3FiozMBseazXys
	d5fmX7QzmxtxW5ixjrBb2Cq7Vzf3Wtxj7z7Wu2OyiyzEshafOaS36QtedyxZTCNfbUTw
	d+U6iZMjVC06nKu7uEe5U8mKQZIX0o1G/xpStt5f19Gdk78avQcgTzv+luCOifsOr9IH
	1HRg==
X-Gm-Message-State: AIkVDXJvMcblp21JsNIts3NymzGvqhsDMwphJe5wWpcbVxJyL+pdv21S0EwAmnGVlvScRw==
X-Received: by 10.25.21.96 with SMTP id l93mr8322835lfi.136.1485847102913;
	Mon, 30 Jan 2017 23:18:22 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	187sm4416928ljf.12.2017.01.30.23.18.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 23:18:21 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 08:18:13 +0100
Message-Id: <ca6e9905f29e9926ffff575748ff41379aa28519.1485846907.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485846907.git.anders@chargestorm.se>
References: <cover.1485846907.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v2 4/7] python-3-manifest: add socketserver to netserver
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
X-List-Received-Date: Tue, 31 Jan 2017 07:18:23 -0000

socketserver.* should be part of python3-netserver.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 5c10cd2..555ac88 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -159,7 +159,7 @@ FILES_${PN}-netclient="${libdir}/python3.5/*Cookie*.* ${libdir}/python3.5/__pyca
 
 SUMMARY_${PN}-netserver="Python Internet Protocol servers"
 RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading"
-FILES_${PN}-netserver="${libdir}/python3.5/cgi.* ${libdir}/python3.5/__pycache__/cgi.* ${libdir}/python3.5/*HTTPServer.* ${libdir}/python3.5/__pycache__/*HTTPServer.* ${libdir}/python3.5/SocketServer.* ${libdir}/python3.5/__pycache__/SocketServer.* "
+FILES_${PN}-netserver="${libdir}/python3.5/cgi.* ${libdir}/python3.5/__pycache__/cgi.* ${libdir}/python3.5/socketserver.* ${libdir}/python3.5/__pycache__/socketserver.* ${libdir}/python3.5/*HTTPServer.* ${libdir}/python3.5/__pycache__/*HTTPServer.* ${libdir}/python3.5/SocketServer.* ${libdir}/python3.5/__pycache__/SocketServer.* "
 
 SUMMARY_${PN}-numbers="Python number APIs"
 RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index ac95bc8..770ef75 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -323,7 +323,7 @@ if __name__ == "__main__":
     "base64.* cookielib.* ftplib.* gopherlib.* hmac.* http* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib  uuid.* rfc822.* mimetools.*" )
 
     m.addPackage( "${PN}-netserver", "Python Internet Protocol servers", "${PN}-core ${PN}-netclient ${PN}-shell ${PN}-threading",
-    "cgi.* *HTTPServer.* SocketServer.*" )
+    "cgi.* socketserver.* *HTTPServer.* SocketServer.*" )
 
     m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}-lang ${PN}-re",
     "decimal.* fractions.* numbers.*" )
-- 
2.10.2


