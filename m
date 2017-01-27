Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB4F71D7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:06:22 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id n124so158291395lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=znnJpy/iRWsGejk5ydi/IytFBtJ6ps3qlHrpCxxakro=;
	b=QywcPLQyZz1PsC7oZPJYnYLmRY6Qj7agnNlHgfByRNuz94q8vmp6u2yP/QtaDnZ8Hs
	CN2sizOcewNJOLEUO6HF64sSgm7m/STPfj5vEKSFQtwgCA1dxYgS3oeTs1CGhCf2ZD6d
	vO98Rp+BRR/jubtvBteTKXUXV3U+eYwemw9LwBY/v+DLsNYq63rajNeQlmz15iJ/Nx9V
	UfX//n85m2LktNEPJ2vmZwXZnPjbEAITkSe/FNJqf8y6jzBGPak5WPZxK2FI20euSeRU
	WamYJfDQ6S9r3njYrkta40NAcDPMOjfrWmfZkn5tSIh6g/DHNNwDjH/C4T3D17pJy6Dp
	q0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=znnJpy/iRWsGejk5ydi/IytFBtJ6ps3qlHrpCxxakro=;
	b=m7Z/zrCxNZAp8g/jggDp8mVo0OX5xndim0c6K5jvi1Sc87/1YJgB45OfAbxzpFzpcY
	ajc8lB9L8sAAxzGY7am8PE5tbGjl3gfRPiiN3XfFfV2sL5JIwUGhXFZQ6w0ERxh8uKMn
	W0sbFpUZLZMsjH/ekzQxFz+lEq5AyqZZ0du6TnG7zBLdcImuBi5fJTUyDUiGfhlGejEv
	DLZJW7dexQ22c2CK+ihv/sE7iOR+jU7ZzmG4xMDJJpFVZYSDrR8wtXk3NMxw4r5jsz9K
	2Pi/4OVN8ZarypRKg0ZtVwbxSy3/3SESake/JxrLVMe9BBGVFqOOirsRW3qkdt0uv3UM
	eTsg==
X-Gm-Message-State: AIkVDXIiRICs53x1OSt9QP8zzh/M2Hv7kstDTScELb+5G6R8TLNfxynrXm1IZ4xhxGkghw==
X-Received: by 10.25.23.162 with SMTP id 34mr2027325lfx.174.1485507982587;
	Fri, 27 Jan 2017 01:06:22 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id r18sm1155498lff.4.2017.01.27.01.06.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 01:06:21 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 10:05:59 +0100
Message-Id: <fe6761e60e5b7964bfe56202a6597e8f64b939b3.1485505680.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485505680.git.anders@chargestorm.se>
References: <cover.1485505680.git.anders@chargestorm.se>
Subject: [PATCH 4/7] python-3-manifest: add socketserver to netserver
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
X-List-Received-Date: Fri, 27 Jan 2017 09:06:23 -0000

socketserver.* should be part of python3-netserver.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 5c10cd21bf..555ac8844d 100644
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
index ac95bc8fa9..770ef754e6 100755
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
2.11.0


