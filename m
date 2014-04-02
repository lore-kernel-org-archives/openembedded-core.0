Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3275E6FA87
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 12:55:38 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id w62so188118wes.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Apr 2014 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=QFk78MMy7rDiqBER1PNfVMRmXkB5+JDQaRg+dMNXlSY=;
	b=DxOLMvqOroy++3F23wKizgJ9yMhAMyoUME0FAbAvP58quZOwFSsDfLI9xOGLn/aWyv
	hsJKzuID6VA3a1ANzOp5ZeAGK3WNFy/siS7IBS6dgFsOqFCjztsk7kSET2nSz2DEmdVo
	iAUHIDDw629DisLm6ByNT/woF5u1loRGP7HSCo8aRjiDJe0bDzqrXEKJfmHultwA3b+k
	4G4d0OFy9DAiH5S/xRpKLAjtq06CCDAP2QLmAmDLNg56RCmp/3WI2W3bOvIToJc/gWek
	BFOc+pnptgNN7xF8Xwk2yqNIpyAzCz2+EEg9ui19bgyNzqrt6tJmTNXKNoU9TGPY9jbE
	FUTQ==
X-Received: by 10.194.85.75 with SMTP id f11mr459001wjz.47.1396443338813;
	Wed, 02 Apr 2014 05:55:38 -0700 (PDT)
Received: from desktop.betafive.co.uk
	(cpc66027-shep11-2-0-cust140.8-3.cable.virginmedia.com.
	[81.110.75.141]) by mx.google.com with ESMTPSA id
	ga10sm2817051wjb.23.2014.04.02.05.55.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Apr 2014 05:55:38 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 13:54:49 +0100
Message-Id: <1396443289-17504-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libarchive: Add PACKAGECONFIG for lzo
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
X-List-Received-Date: Wed, 02 Apr 2014 12:55:40 -0000

This ensures that the dependency on lzo is deterministic rather than floating.

The configure option to libarchive refers to this library as 'lzo2' but it is
just called 'lzo' in OpenEmbedded.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-extended/libarchive/libarchive_3.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index d5599e0..f90dc02 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -24,6 +24,7 @@ PACKAGECONFIG[xz] = "--with-lzmadec --with-lzma,--without-lzmadec --without-lzma
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[libxml2] = "--with-xml2,--without-xml2,libxml2,"
 PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat,"
+PACKAGECONFIG[lzo] = "--with-lzo2,--without-lzo2,lzo,"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://libarchive-CVE-2013-0211.patch \
-- 
1.9.1


