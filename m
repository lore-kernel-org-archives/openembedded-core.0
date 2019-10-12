Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail.openembedded.org (Postfix) with ESMTP id AD8137F45C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 22:30:49 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id x134so12326501qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 15:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QXyc2b3LTETSNtYbbBREhhT0dEJmzz7RIbkfwnQxGbs=;
	b=a6AUr6yS4IlIi0iLbyJPkJkr0hZrSHYkzEObzmjv5xkOw7g/0bvFRlrH2FkOOA0RpL
	gvt6wkst0rxISy8R5nh+KfN3GDafG0yFG6cQAvY3OjGtivgoj49Z9vUroMzlQFVAK+AP
	MT3HqrUkVNyYzp9Xyw0ppOhZZ0JFO10D9qcZ9Z5JOIziwjOf1BkMKv0TA3hWmfwwqmW1
	Hu4iVbwne790/43pFaOO3k0vcQtCGuXc/Usy2/f+SXUWIdfxuj81/DTrJQEy7PGnxF8e
	XVD5VyNnm2OXUm4TtBuqNeVj/VleBoD1xIAFki+sjkSj7w6SFxg/1zn+se+36uR6hj7f
	MTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QXyc2b3LTETSNtYbbBREhhT0dEJmzz7RIbkfwnQxGbs=;
	b=NAIY35oPhTTaAAo2mC1e4+NsKlJhUd7uoXvaEwsFd5ttE81OcbkN0awMxJWWe5pPO+
	ztDETCcUdbFzIq8fJRAUukXSEykrrUpNFh4d/pd+ASkF3sphRmjtLaSp2AiBGotkO5ia
	9vWgqIWzdb3H2a2h9xiA4OOAUWl9ZcpG5G5VXJ5APplQW04YkJEejDv79Ue+poTZc8w5
	LF2iLezPXYvG3rkp/wgHLjWC3V304T51NthundGrA0mMGyx/EJ3Zq4uA/kEQWMNoDUir
	iQsIklJfUVOV6QWUy4cg4j86dxWp7Hq8IHzmzgtEasXxPX4cZrjR0htmaSBHoe0KG4+Q
	YX0A==
X-Gm-Message-State: APjAAAUzbvroCD9gmZ4gd17ZHT012qPWI7rr3aOJ2Xeu01CUlFMtEpsx
	LFcpUagQ1PVEuwHH3LJBjLgqAMZUQDzwu3jBIEw=
X-Google-Smtp-Source: APXvYqwqlx/ipravuC32kq5a+krJuo2R5+F/S612QFTNZNnX8X/z1pPvOfTGY/Z0lJNGeKWx/mCeLiIhiBRJTdjci5M=
X-Received: by 2002:a05:620a:1645:: with SMTP id
	c5mr23465050qko.212.1570919449700; 
	Sat, 12 Oct 2019 15:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190929201359.9837-1-dbaryshkov@gmail.com>
	<20190929201359.9837-5-dbaryshkov@gmail.com>
In-Reply-To: <20190929201359.9837-5-dbaryshkov@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Oct 2019 15:30:23 -0700
Message-ID: <CAMKF1so4un6AvtV1hWiwzmy+zqBNOKAiiEswa9TVAVUb-9zoug@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/5] shim: add first-stage UEFI bootloader implementing MOK protocol
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
X-List-Received-Date: Sat, 12 Oct 2019 22:30:49 -0000
Content-Type: text/plain; charset="UTF-8"

fail on musl/clang/aarch64
https://errors.yoctoproject.org/Errors/Details/273493/

does it depend on gcc being system compiler ?

On Sun, Sep 29, 2019 at 1:15 PM <dbaryshkov@gmail.com> wrote:
>
> From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
>
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> ---
>  ...ompareMem-on-MokListNode.Type-instea.patch | 69 ++++++++++++++++++
>  meta/recipes-bsp/shim/shim_git.bb             | 72 +++++++++++++++++++
>  2 files changed, 141 insertions(+)
>  create mode 100644 meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
>  create mode 100644 meta/recipes-bsp/shim/shim_git.bb
>
> diff --git a/meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch b/meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
> new file mode 100644
> index 000000000000..12ee342e9f64
> --- /dev/null
> +++ b/meta/recipes-bsp/shim/shim/0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
> @@ -0,0 +1,69 @@
> +From f30cd0b6330be8ea72a93bf25e43829c222ba611 Mon Sep 17 00:00:00 2001
> +From: Gary Lin <glin@suse.com>
> +Date: Tue, 26 Feb 2019 11:33:53 +0800
> +Subject: [PATCH] MokManager: Use CompareMem on MokListNode.Type instead of
> + CompareGuid
> +
> +Fix the errors from gcc9 '-Werror=address-of-packed-member'
> +
> +https://github.com/rhboot/shim/issues/161
> +
> +Signed-off-by: Gary Lin <glin@suse.com>
> +Upstream-Status: Submitted[https://github.com/rhboot/shim/pull/170]
> +---
> + MokManager.c | 14 +++++++++-----
> + 1 file changed, 9 insertions(+), 5 deletions(-)
> +
> +diff --git a/MokManager.c b/MokManager.c
> +index d69b4dbe..05dc1622 100644
> +--- a/MokManager.c
> ++++ b/MokManager.c
> +@@ -1053,7 +1053,8 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
> +                       continue;
> +
> +               DataSize += sizeof(EFI_SIGNATURE_LIST);
> +-              if (CompareGuid(&(list[i].Type), &X509_GUID) == 0)
> ++              if (CompareMem(&(list[i].Type), &X509_GUID,
> ++                             sizeof(EFI_GUID)) == 0)
> +                       DataSize += sizeof(EFI_GUID);
> +               DataSize += list[i].MokSize;
> +       }
> +@@ -1075,7 +1076,8 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
> +               CertList->SignatureType = list[i].Type;
> +               CertList->SignatureHeaderSize = 0;
> +
> +-              if (CompareGuid(&(list[i].Type), &X509_GUID) == 0) {
> ++              if (CompareMem(&(list[i].Type), &X509_GUID,
> ++                             sizeof(EFI_GUID)) == 0) {
> +                       CertList->SignatureListSize = list[i].MokSize +
> +                           sizeof(EFI_SIGNATURE_LIST) + sizeof(EFI_GUID);
> +                       CertList->SignatureSize =
> +@@ -1116,7 +1118,8 @@ static void delete_cert(void *key, UINT32 key_size,
> +       int i;
> +
> +       for (i = 0; i < mok_num; i++) {
> +-              if (CompareGuid(&(mok[i].Type), &X509_GUID) != 0)
> ++              if (CompareMem(&(mok[i].Type), &X509_GUID,
> ++                             sizeof(EFI_GUID)) != 0)
> +                       continue;
> +
> +               if (mok[i].MokSize == key_size &&
> +@@ -1167,7 +1170,7 @@ static void delete_hash_in_list(EFI_GUID Type, UINT8 * hash, UINT32 hash_size,
> +       sig_size = hash_size + sizeof(EFI_GUID);
> +
> +       for (i = 0; i < mok_num; i++) {
> +-              if ((CompareGuid(&(mok[i].Type), &Type) != 0) ||
> ++              if ((CompareMem(&(mok[i].Type), &Type, sizeof(EFI_GUID)) != 0) ||
> +                   (mok[i].MokSize < sig_size))
> +                       continue;
> +
> +@@ -1331,7 +1334,8 @@ static EFI_STATUS delete_keys(void *MokDel, UINTN MokDelSize, BOOLEAN MokX)
> +
> +       /* Search and destroy */
> +       for (i = 0; i < del_num; i++) {
> +-              if (CompareGuid(&(del_key[i].Type), &X509_GUID) == 0) {
> ++              if (CompareMem(&(del_key[i].Type), &X509_GUID,
> ++                             sizeof(EFI_GUID)) == 0) {
> +                       delete_cert(del_key[i].Mok, del_key[i].MokSize,
> +                                   mok, mok_num);
> +               } else if (is_sha2_hash(del_key[i].Type)) {
> diff --git a/meta/recipes-bsp/shim/shim_git.bb b/meta/recipes-bsp/shim/shim_git.bb
> new file mode 100644
> index 000000000000..10769ac75a0a
> --- /dev/null
> +++ b/meta/recipes-bsp/shim/shim_git.bb
> @@ -0,0 +1,72 @@
> +SUMMARY = "shim is a first stage EFI bootloader."
> +DESCRIPTION = "shim is a trivial EFI application that, when run, \
> +attempts to open and execute another application. It will initially \
> +attempt to do this via the standard EFI LoadImage() and StartImage() \
> +calls. If these fail (because secure boot is enabled and the binary \
> +is not signed with an appropriate key, for instance) it will then \
> +validate the binary against a built-in certificate. If this succeeds \
> +and if the binary or signing key are not blacklisted then shim will \
> +relocate and execute the binary."
> +HOMEPAGE = "https://github.com/rhboot/shim.git"
> +SECTION = "bootloaders"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b92e63892681ee4e8d27e7a7e87ef2bc"
> +
> +DEPENDS += "\
> +    gnu-efi \
> +"
> +
> +PV = "15+git${SRCPV}"
> +
> +SRC_URI = "\
> +    git://github.com/rhboot/shim.git \
> +    file://0001-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch \
> +"
> +
> +SRCREV = "a4a1fbe728c9545fc5647129df0cf1593b953bec"
> +
> +S = "${WORKDIR}/git"
> +
> +SHIM_IMAGE = "shim-${EFI_BOOT_IMAGE}"
> +
> +# install to the image as boot*.efi if its the EFI_PROVIDER,
> +# otherwise install as the full name.
> +# This allows multiple bootloaders to coexist in a single image.
> +python __anonymous () {
> +    if d.getVar('EFI_PROVIDER') == "shim":
> +        d.setVar("SHIM_EFI_BOOT_IMAGE", d.getVar("EFI_BOOT_IMAGE"))
> +    else:
> +        d.setVar("SHIM_EFI_BOOT_IMAGE", d.getVar("SHIM_IMAGE"))
> +}
> +
> +inherit deploy
> +
> +TUNE_CCARGS_remove = "-mfpmath=sse"
> +
> +EXTRA_OEMAKE = "\
> +    CROSS_COMPILE="${TARGET_PREFIX}" \
> +    COMPILER="gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
> +    EFI_INCLUDE="${STAGING_INCDIR}/efi" \
> +    EFI_PATH="${STAGING_LIBDIR}" \
> +    LIBDIR="${STAGING_LIBDIR}" \
> +"
> +
> +COMPATIBLE_HOST = "${EFI_COMPATIBLE_HOST}"
> +
> +require conf/image-uefi.conf
> +
> +do_install() {
> +    install -d ${D}${EFI_FILES_PATH}
> +    install -m 0755 mm${EFI_ARCH}.efi fb${EFI_ARCH}.efi ${D}${EFI_FILES_PATH}/
> +    install -m 0755 shim${EFI_ARCH}.efi ${D}${EFI_FILES_PATH}/${SHIM_EFI_BOOT_IMAGE}
> +}
> +
> +# Install the unsigned images for manual signing
> +do_deploy() {
> +    install -m 0755 mm${EFI_ARCH}.efi fb${EFI_ARCH}.efi ${DEPLOYDIR}
> +    install -m 0755 shim${EFI_ARCH}.efi ${DEPLOYDIR}/${SHIM_IMAGE}
> +}
> +addtask deploy after do_install before do_build
> +
> +FILES_${PN} += "${EFI_FILES_PATH}"
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

