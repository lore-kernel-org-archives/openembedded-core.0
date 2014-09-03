Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6F70571388
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 15:19:10 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id w7so8823999qcr.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 08:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=9MpRmIYRFi5yFqhCvgbvBhakL3Rwi66HdGFSVx2niN8=;
	b=tIujl7KZJdPnkYsiyWCcHbTFFeJH4NJIdZEmUQQrszDSeMCuEHVEwX8KntTIoGJV76
	xck5BGYB/iwFuXpLiT9Ibiv3LbAQKiOTlJ41gQrYGgiXMO8YIgLIcJfbHZcwhzhtddIr
	zXI3bvo/I/IJ2WHug3rNaeUqWfGKyMHtuq0g7bvVlg70dbFDnJk++hpBkUTJAi3uAJ1M
	DrVvaLWUU1DEhzy+0YOmEdCHeisMMWxfi3IS/kPV9A/4uh+KhqcAmWwNlXuGsUQtd6di
	oZTm7YO5pY4m1RUrdlaSAMogQQ2C9/89lxkMY8rkaB29Y4Hd9yHarV4pRu8saLh1bBmO
	75kQ==
MIME-Version: 1.0
X-Received: by 10.224.8.1 with SMTP id f1mr67747485qaf.89.1409757547258; Wed,
	03 Sep 2014 08:19:07 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Wed, 3 Sep 2014 08:19:07 -0700 (PDT)
Date: Wed, 3 Sep 2014 09:19:07 -0600
Message-ID: <CACS+7ZQ6X0FjCynyaDpODXyQvNgjoUOV9CbpZ9_o9PFwWv2z2A@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] packagegroup-core-sdk: add libsanitize to core SDK
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
X-List-Received-Date: Wed, 03 Sep 2014 15:19:12 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index a544bbd..378336e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -28,7 +28,9 @@ RDEPENDS_packagegroup-core-sdk = "\

 RRECOMMENDS_packagegroup-core-sdk = "\
     libgomp \
-    libgomp-dev"
+    libgomp-dev \
+    libsanitizer \
+    libsanitizer-dev"

 #python generate_sdk_pkgs () {
 #    poky_pkgs = read_pkgdata('packagegroup-core', d)['PACKAGES']
-- 
1.9.3

