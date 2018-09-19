Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0645D79550
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 16:04:06 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id 38-v6so2890470plc.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=hhHR6dujJUpVVVbvmYOCfUiAo58zdRangwnIYdi9o6c=;
	b=cOuYuKHVTwhS9G+znP5EF5UEU6/WMflYnL1D2g3guiEuEcSp9xw2io5E5GaWzVqTcz
	ehkNXSypFzTFjGj7Af4VCZUV1WyOydYjVCTIiiCNX7/ya4/nzOtvW/9YaTynMg6JZHoY
	jQGvhlYBbhQkOV03OR5MYy+EXbAC9vLi6oYJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hhHR6dujJUpVVVbvmYOCfUiAo58zdRangwnIYdi9o6c=;
	b=n8bT/WoluPj+9DPcqq+iYdA0tLc9W43S8qmx0rjeATCBFI155x1rvH1gZ/6D0HIDMZ
	Frip9t0jfFZyBB8Fks8/eJSa+JemLWBvTCypwZE5wvSBhIsHICX+GHnbn/w4Cdfdsa3d
	pY2qaSAKoWpg8hnlED6ydxZBE3LTHzf4lUmMA/SA7w5q6ObThOBF9oagUubQ52W6WXcz
	7Kj7H5gecWIau440RGXdvWMSNYAOFEd0+seAWa0fLEmi6yV/pIpAv5AMnTiEeYdW2M4m
	sYLOGE48hpdAWAug97+IBud/nsjSekLKiwtOPZDGcXs8HQCpgrgfe5xXg4os/S8E2iWX
	C7AA==
X-Gm-Message-State: APzg51BUxu/erJcJ+vY9dOmP8V6+yuAsvOcCYmVa/rwdqcT8DIdLeyCl
	3D+i1zEumnJxgBfrbHXvXte3iuXS85DGgQ==
X-Google-Smtp-Source: ANB0VdZXNlAf+4EljXpc7hnF8ZdgfPyNCoQloS82YsIHSef/pZqABHGD5rhJcU9Su9qW52EktdOB9w==
X-Received: by 2002:a17:902:b70f:: with SMTP id
	d15-v6mr35990315pls.53.1537373047751; 
	Wed, 19 Sep 2018 09:04:07 -0700 (PDT)
Received: from hex.int.rpsys.net ([209.121.128.187])
	by smtp.gmail.com with ESMTPSA id
	h20-v6sm24370600pgg.3.2018.09.19.09.04.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 09:04:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 09:04:04 -0700
Message-Id: <20180919160405.7291-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] uninative: Add support for aarch64 hosts
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
X-List-Received-Date: Wed, 19 Sep 2018 16:04:07 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uninative.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index de2221a3655..ba99fb6e8fd 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -1,10 +1,11 @@
-UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
+UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}"
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
 UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
 # Example checksums
-#UNINATIVE_CHECKSUM[i586] = "dead"
+#UNINATIVE_CHECKSUM[aarch64] = "dead"
+#UNINATIVE_CHECKSUM[i686] = "dead"
 #UNINATIVE_CHECKSUM[x86_64] = "dead"
 UNINATIVE_DLDIR ?= "${DL_DIR}/uninative/"
 
-- 
2.17.1


