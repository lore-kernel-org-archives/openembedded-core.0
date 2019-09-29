Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id E7C767F260
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 10:15:32 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f5so6485765ljg.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 03:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wNsQYkd3s78SqZ8wtc4+pwnfw3CDOvTMxYrMVKvkNw8=;
	b=K4vAOaE1lPQo87p7VJJhOe9QbjZowOpD8WkLMx8N2ajY4QE8OJFl1Z+pB6y+hydgZr
	HF3it/6ddR9yrbmFuqn6WFeOYim3dNjQuaNYorqafRrSCckHj2QN9iisjfo54goJ8U7Z
	9z1MQh9sPI3Tgux5fWGpMlbH0rdHocWN4QPh6hExPUrgLwLzOF2Vr24qb/BnGPXegbpY
	/8IrAbMdSXuIC425RC/Af0nw9BsoVh6EmrIjkLjosx2ddky9QWruI0/qGhUavdybDO5i
	Ke44PDGXKxcZ3NtUd46AVezHjNGhaamBSVaxDBIongkS4Mz8vukpUY02sCTUCsMH12Yf
	oxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wNsQYkd3s78SqZ8wtc4+pwnfw3CDOvTMxYrMVKvkNw8=;
	b=tcn1a3ufRmnQhHbOXqCYCD/QRJ+Di8ZlP7HKpDyQAkFRQPyyinSGrO1ZlOZPcylb61
	xLoS8iLgz+6vpRUCdJjUSORyNFWEpmtuNtKJg9RSv94K1klha3CK/DW2e7KxVB4pIhML
	CxGbnUjC1vqPZBbXS31tb1lhtHiNI7zTz+LBU8xBUb0UwNcCft5+p+cAAuJgMr3JFIEk
	1jeuxDigrilPa3VJC+vHQEv1LBfK50dhLq+CWnj1tzakNtLYmy38hi7oXtAhZ8fvIkPr
	5/DncEmV106KlkDPpcl0HeqVolx+5cgtsIdGHLv0gW5KGGf1aJ/U5sKJrTZ1qQYTjq6N
	wQoA==
X-Gm-Message-State: APjAAAX5OYVqWKus57+EC6yi63EDYsdwLZjHhLcC+dYRgBjv30EYmx3z
	hYUCxDXVtB+TUvMPqnLKjcZSHzpO
X-Google-Smtp-Source: APXvYqy4xCfcDEbMkOUvmjtvzZ5n1oF+2JBxM3rNeZHhKp7ynJZ27Yy17aci1G1f/sY9029+iKZ3Dw==
X-Received: by 2002:a2e:7606:: with SMTP id r6mr8216270ljc.192.1569752133102; 
	Sun, 29 Sep 2019 03:15:33 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.202])
	by smtp.gmail.com with ESMTPSA id
	d28sm2012918lfq.88.2019.09.29.03.15.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 03:15:32 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 13:15:26 +0300
Message-Id: <20190929101526.2061-5-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929101526.2061-1-dbaryshkov@gmail.com>
References: <20190929101526.2061-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 5/5] shim: add first-stage UEFI bootloader implementing MOK protocol
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
X-List-Received-Date: Sun, 29 Sep 2019 10:15:33 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 ...ompareMem-on-MokListNode.Type-instea.patch | 68 ++++++++++++++++++
 meta/recipes-bsp/shim/shim_git.bb             | 72 +++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
 create mode 100644 meta/recipes-bsp/shim/shim_git.bb

diff --git a/meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch b/meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
new file mode 100644
index 000000000000..cee7713ca82b
--- /dev/null
+++ b/meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
@@ -0,0 +1,68 @@
+From f30cd0b6330be8ea72a93bf25e43829c222ba611 Mon Sep 17 00:00:00 2001
+From: Gary Lin <glin@suse.com>
+Date: Tue, 26 Feb 2019 11:33:53 +0800
+Subject: [PATCH] MokManager: Use CompareMem on MokListNode.Type instead of
+ CompareGuid
+
+Fix the errors from gcc9 '-Werror=address-of-packed-member'
+
+https://github.com/rhboot/shim/issues/161
+
+Signed-off-by: Gary Lin <glin@suse.com>
+---
+ MokManager.c | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/MokManager.c b/MokManager.c
+index d69b4dbe..05dc1622 100644
+--- a/MokManager.c
++++ b/MokManager.c
+@@ -1053,7 +1053,8 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ 			continue;
+ 
+ 		DataSize += sizeof(EFI_SIGNATURE_LIST);
+-		if (CompareGuid(&(list[i].Type), &X509_GUID) == 0)
++		if (CompareMem(&(list[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) == 0)
+ 			DataSize += sizeof(EFI_GUID);
+ 		DataSize += list[i].MokSize;
+ 	}
+@@ -1075,7 +1076,8 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ 		CertList->SignatureType = list[i].Type;
+ 		CertList->SignatureHeaderSize = 0;
+ 
+-		if (CompareGuid(&(list[i].Type), &X509_GUID) == 0) {
++		if (CompareMem(&(list[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) == 0) {
+ 			CertList->SignatureListSize = list[i].MokSize +
+ 			    sizeof(EFI_SIGNATURE_LIST) + sizeof(EFI_GUID);
+ 			CertList->SignatureSize =
+@@ -1116,7 +1118,8 @@ static void delete_cert(void *key, UINT32 key_size,
+ 	int i;
+ 
+ 	for (i = 0; i < mok_num; i++) {
+-		if (CompareGuid(&(mok[i].Type), &X509_GUID) != 0)
++		if (CompareMem(&(mok[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) != 0)
+ 			continue;
+ 
+ 		if (mok[i].MokSize == key_size &&
+@@ -1167,7 +1170,7 @@ static void delete_hash_in_list(EFI_GUID Type, UINT8 * hash, UINT32 hash_size,
+ 	sig_size = hash_size + sizeof(EFI_GUID);
+ 
+ 	for (i = 0; i < mok_num; i++) {
+-		if ((CompareGuid(&(mok[i].Type), &Type) != 0) ||
++		if ((CompareMem(&(mok[i].Type), &Type, sizeof(EFI_GUID)) != 0) ||
+ 		    (mok[i].MokSize < sig_size))
+ 			continue;
+ 
+@@ -1331,7 +1334,8 @@ static EFI_STATUS delete_keys(void *MokDel, UINTN MokDelSize, BOOLEAN MokX)
+ 
+ 	/* Search and destroy */
+ 	for (i = 0; i < del_num; i++) {
+-		if (CompareGuid(&(del_key[i].Type), &X509_GUID) == 0) {
++		if (CompareMem(&(del_key[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) == 0) {
+ 			delete_cert(del_key[i].Mok, del_key[i].MokSize,
+ 				    mok, mok_num);
+ 		} else if (is_sha2_hash(del_key[i].Type)) {
diff --git a/meta/recipes-bsp/shim/shim_git.bb b/meta/recipes-bsp/shim/shim_git.bb
new file mode 100644
index 000000000000..10769ac75a0a
--- /dev/null
+++ b/meta/recipes-bsp/shim/shim_git.bb
@@ -0,0 +1,72 @@
+SUMMARY = "shim is a first stage EFI bootloader."
+DESCRIPTION = "shim is a trivial EFI application that, when run, \
+attempts to open and execute another application. It will initially \
+attempt to do this via the standard EFI LoadImage() and StartImage() \
+calls. If these fail (because secure boot is enabled and the binary \
+is not signed with an appropriate key, for instance) it will then \
+validate the binary against a built-in certificate. If this succeeds \
+and if the binary or signing key are not blacklisted then shim will \
+relocate and execute the binary."
+HOMEPAGE = "https://github.com/rhboot/shim.git"
+SECTION = "bootloaders"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b92e63892681ee4e8d27e7a7e87ef2bc"
+
+DEPENDS += "\
+    gnu-efi \
+"
+
+PV = "15+git${SRCPV}"
+
+SRC_URI = "\
+    git://github.com/rhboot/shim.git \
+    file://0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch \
+"
+
+SRCREV = "a4a1fbe728c9545fc5647129df0cf1593b953bec"
+
+S = "${WORKDIR}/git"
+
+SHIM_IMAGE = "shim-${EFI_BOOT_IMAGE}"
+
+# install to the image as boot*.efi if its the EFI_PROVIDER,
+# otherwise install as the full name.
+# This allows multiple bootloaders to coexist in a single image.
+python __anonymous () {
+    if d.getVar('EFI_PROVIDER') == "shim":
+        d.setVar("SHIM_EFI_BOOT_IMAGE", d.getVar("EFI_BOOT_IMAGE"))
+    else:
+        d.setVar("SHIM_EFI_BOOT_IMAGE", d.getVar("SHIM_IMAGE"))
+}
+
+inherit deploy
+
+TUNE_CCARGS_remove = "-mfpmath=sse"
+
+EXTRA_OEMAKE = "\
+    CROSS_COMPILE="${TARGET_PREFIX}" \
+    COMPILER="gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
+    EFI_INCLUDE="${STAGING_INCDIR}/efi" \
+    EFI_PATH="${STAGING_LIBDIR}" \
+    LIBDIR="${STAGING_LIBDIR}" \
+"
+
+COMPATIBLE_HOST = "${EFI_COMPATIBLE_HOST}"
+
+require conf/image-uefi.conf
+
+do_install() {
+    install -d ${D}${EFI_FILES_PATH}
+    install -m 0755 mm${EFI_ARCH}.efi fb${EFI_ARCH}.efi ${D}${EFI_FILES_PATH}/
+    install -m 0755 shim${EFI_ARCH}.efi ${D}${EFI_FILES_PATH}/${SHIM_EFI_BOOT_IMAGE}
+}
+
+# Install the unsigned images for manual signing
+do_deploy() {
+    install -m 0755 mm${EFI_ARCH}.efi fb${EFI_ARCH}.efi ${DEPLOYDIR}
+    install -m 0755 shim${EFI_ARCH}.efi ${DEPLOYDIR}/${SHIM_IMAGE}
+}
+addtask deploy after do_install before do_build
+
+FILES_${PN} += "${EFI_FILES_PATH}"
-- 
2.23.0


