Return-Path: <geissonator@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD57796BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 20:40:37 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id x83-v6so253939ywd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 13:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7p779LuSAVnba03Ys+cAa7S4GY/KbDEBB4xjC945pms=;
	b=Udq+m8QLFy4EO+QYFaPniwPYfLLqhugUIjy0xXwTBNUcFar2fDnPqr3iBLFckxp4VT
	kpHBSp0oLvl8JHfE3H25VCWpsa1pRgJ4D0O2SlirStY1UVe/gJ1Y7NEPJHwSIapTKjBi
	F1QO6nVTbHROsGxX1rRjxB7YuxvMrNGhEXcvqbGGfDsOqy/8Nr4TBwegW2glk0GqZ/ku
	GGxZ7+9d6c7zq5SPISz4aVvanb8VsvmIdd5En5E6L0b4LZqwswJxVePodPXHeHChUFuB
	0NHdaUJiG6X4x1+EUD/eJkT4E3DfO4htQFIhBsB7iSSbfrL/Q+mgp5K+Nx+807vEZpNy
	kFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7p779LuSAVnba03Ys+cAa7S4GY/KbDEBB4xjC945pms=;
	b=DyOSFmKRmvKeelGTNOhILlx3//8rmVFecxEJiCLwayYw3WzZWj01GkHMGwGOK1pPq8
	gRzlR+TyObeqhYuiGGgcz9onAh1wCnzAnDCu4RgPvY1s2sJWZ0iZXwdgAd7chhBVgIYn
	bVSjO9HnO8jXNdEymW/p8KuzEMdXEG9yWpjiQ/CkCGPa3k27hBjXiLc7mE1F5GOGkWAc
	BL5Bg9BdNHvXw+buQGfakIKjQ+/vM1rXdn92+HR8HuT5+OYl8hzhLw4lY/jKZMgCcD+y
	twoH2YV+Cpr5ORUdRzVXmPfj0KA3+o5nM3La8WWWAGWA/PUk2ELyuRZXXf68SPXvtpoj
	qYVQ==
X-Gm-Message-State: APzg51AKqLExLDvt6clZuNMEapGV7bdHX6LI2Msj7CkPUDNwcLIs/VlD
	UOGMTe9caM5oA4h8+C8xYqRJGNdZ
X-Google-Smtp-Source: ANB0VdZVRB2vvQ18ECa2yvEuPukrMJYhU9OOT5CJxCzxRd5cHZ19uReGsOGDp+wEczKLjbD4Ge7JxQ==
X-Received: by 2002:a0d:da01:: with SMTP id
	c1-v6mr1817257ywe.346.1536784838143; 
	Wed, 12 Sep 2018 13:40:38 -0700 (PDT)
Received: from andrewg-VirtualBox.ibm.com
	(45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
	by smtp.gmail.com with ESMTPSA id
	r84-v6sm1297031ywe.10.2018.09.12.13.40.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Sep 2018 13:40:37 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 13:40:25 -0700
Message-Id: <1536784825-4476-2-git-send-email-geissonator@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536784825-4476-1-git-send-email-geissonator@gmail.com>
References: <1536784825-4476-1-git-send-email-geissonator@gmail.com>
Cc: Andrew Geissler <geissonator@gmail.com>,
	alejandro.enedino.hernandez-samaniego@xilinx.com
Subject: [PATCH 2/2] python/python3: Add option to remove test files
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
X-List-Received-Date: Wed, 12 Sep 2018 20:40:37 -0000

A quick search in the python package shows the following test
directories being included in the python image:
./Python-2.7.14/Lib/bsddb/test
./Python-2.7.14/Lib/sqlite3/test
./Python-2.7.14/Lib/ctypes/test
./Python-2.7.14/Lib/unittest/test
./Python-2.7.14/Lib/lib-tk/test
./Python-2.7.14/Lib/email/test

In some distributions, the extra space taken up by these test files
is very valuable.

The default is to still include the test files.

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 meta/recipes-devtools/python/python3_3.5.5.bb | 9 +++++++++
 meta/recipes-devtools/python/python_2.7.15.bb | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index c919a97..5d1397a 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -160,6 +160,11 @@ EOF
 	fi
 }
 
+# Some packages include test/ directories and files. Provide option
+# to not include them.
+
+INCLUDE_TESTS ?= "1"
+
 do_install() {
 	# make install needs the original Makefile, or otherwise the inclues would
 	# go to ${D}${STAGING...}/...
@@ -189,6 +194,10 @@ do_install() {
 	fi
 
 	oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
+
+    if [ "${INCLUDE_TESTS}" -ne "1" ]; then
+        find ${D}${libdir}/python${PYTHON_MAJMIN} -name test -exec rm -rf {} +;
+    fi
 }
 
 do_install_append_class-nativesdk () {
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index 82b65d2..1839624 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -90,6 +90,11 @@ do_compile() {
 		OPT="${CFLAGS}"
 }
 
+# Some packages include test/ directories and files. Provide option
+# to not include them.
+
+INCLUDE_TESTS ?= "1"
+
 do_install() {
 	# make install needs the original Makefile, or otherwise the inclues would
 	# go to ${D}${STAGING...}/...
@@ -127,6 +132,10 @@ do_install() {
     if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'bdb', d)}" ]; then
         rm -rf ${D}/${libdir}/python${PYTHON_MAJMIN}/bsddb
     fi
+
+    if [ "${INCLUDE_TESTS}" -ne "1" ]; then
+        find ${D}${libdir}/python${PYTHON_MAJMIN} -name test -exec rm -rf {} +;
+    fi
 }
 
 do_install_append_class-nativesdk () {
-- 
2.7.4


