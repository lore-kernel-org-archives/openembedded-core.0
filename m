Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 099F07FA34
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 23:20:06 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id y10so24819191qto.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 15:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZAgQNRMzJztSIaDaeHuXCZl4N/WUaitz0Jv6MmxDZck=;
	b=mtu6pHR0CdtVIKfSjh0Bkrn1ZEl6qbOqjy74cxQIl5pYTT7oE+2xz3nnfsw8x7It1W
	ND8GXp5kj05b5tYVHYfXJsQEGalL762Dv71vyvYAFCuDT8/YwrZ8eD69lSncQs1ECGDr
	D0ubgnh7BkP3zV7LyGKXNrt+Uifl7aICcwzZpzJknD7KK3PPCYeAqNZyxwAkl7CU6zzD
	mEgMqwLa4gquIzUVf3gPFVsVW2sPbEGMQh2fuxfhMXuUzB6hIt29wMdGIP4kZVvAyB3k
	CVPYnf2DG0s0PbMyEFYIy94N5MGmeQQPD1xng+nVHl1j8rPXL6ND6uKz0xN6QBAVcH9N
	saTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZAgQNRMzJztSIaDaeHuXCZl4N/WUaitz0Jv6MmxDZck=;
	b=OSBt6boyozuR/aIHjWXK95VV0kGE+yAaK1mmLxY8SteIRR46VmodQPdxKT9U4eXT60
	zGSO5b1UmoF3FcEnfJn5QGiCcX9Myi1oNKx+dOSsFIVF0UEVBY5evByBMqyNmJhiZW+N
	9CWUQPnB5cnhnB9piIch+Hg5dojqsYKyxz5izwWIld28upB7gS3bJlsELWnDxtI/9kWR
	7AGX6zZrFsuZ15XgMS4KTudvZi5E2WeD427J72aYC+CTyYqbtL8wB1WQ8UDi8Rr9sZVq
	CbbGMdDIKXYd8y91s2VbvFCIDARPtWS7mUBgMaeVAPowrMRnslBzNeTlRGpXHHfi73Jp
	ojAA==
X-Gm-Message-State: APjAAAWKXOxtB14zo1kZrIm7sxeqFvCCaO9UJOmkEPugVgBvYlHzhRYW
	BRE/pIUeQUqrEt5rXFdrSVAtcT28U6q8kcGZZf4Ue1zD
X-Google-Smtp-Source: APXvYqz3bE0pe9jyje3dEmQxc5vevwpXJPqTNXnXyTSDN8L5FTNHwH8ZdCYTNsoKb/eYlS4tszwefKYTktLmW6Rc9pE=
X-Received: by 2002:ac8:2476:: with SMTP id d51mr20673962qtd.378.1572996007635;
	Tue, 05 Nov 2019 15:20:07 -0800 (PST)
MIME-Version: 1.0
References: <20191105231253.15448-1-stefan@agner.ch>
In-Reply-To: <20191105231253.15448-1-stefan@agner.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 15:19:41 -0800
Message-ID: <CAMKF1srQF8eMLYyayLuBXHsOBbDePZ+1YK1cTsCCefvepJFN-A@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: add Zstandard conversion support
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
X-List-Received-Date: Tue, 05 Nov 2019 23:20:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 5, 2019 at 3:13 PM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Add Zstandard (or just Zstd) compression support. This allows to
> create Zstd compressed tarballs by using tar.zst as IMAGE_FSTYPES.
>

this would need documentation changes too I guess

> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  meta/classes/image_types.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 2eeffbb366..eeae652e02 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -269,7 +269,7 @@ IMAGE_TYPES = " \
>      hddimg \
>      squashfs squashfs-xz squashfs-lzo squashfs-lz4 \
>      ubi ubifs multiubi \
> -    tar tar.gz tar.bz2 tar.xz tar.lz4 \
> +    tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
>      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
>      wic wic.gz wic.bz2 wic.lzma \
>      container \
> @@ -282,7 +282,7 @@ IMAGE_TYPES = " \
>  # CONVERSION_CMD/DEPENDS.
>  COMPRESSIONTYPES ?= ""
>
> -CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
> +CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
>  CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>  CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> @@ -290,6 +290,7 @@ CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=
>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>  CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> +CONVERSION_CMD_zst = "zstd -f -k -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"
>  CONVERSION_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>  CONVERSION_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
>  CONVERSION_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
> @@ -310,6 +311,7 @@ CONVERSION_DEPENDS_xz = "xz-native"
>  CONVERSION_DEPENDS_lz4 = "lz4-native"
>  CONVERSION_DEPENDS_lzo = "lzop-native"
>  CONVERSION_DEPENDS_zip = "zip-native"
> +CONVERSION_DEPENDS_zst = "zstd-native"
>  CONVERSION_DEPENDS_sum = "mtd-utils-native"
>  CONVERSION_DEPENDS_bmap = "bmap-tools-native"
>  CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

