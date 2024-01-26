Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A331C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 17:05:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.3471.1706288714325083069
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 09:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pxfkst73;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3367a304091so877068f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 09:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1706288713; x=1706893513; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMuPDyYkKMErvLXlWbny1vffHBVCEgjkcVdkuQZvHLA=;
        b=Pxfkst73Eob6LuWrJAE50XmboR/5TLUCYE9VIMQCNlOmdefI6XjVGwR++w8wNjU5Sw
         yfeg+OqPv5G/21Uor2panGOb33QXK7I4G93m+YfuGSLiZhXpmQR+eRLm28+is7YBcVKl
         OaDBVTqyqStieYiufMsTUiz19Ui3i5204hBg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706288713; x=1706893513;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMuPDyYkKMErvLXlWbny1vffHBVCEgjkcVdkuQZvHLA=;
        b=mVvhVsTF5qBtPX+iIcgY9iPi7A6F3tx2tcbXvOjvhDUuQsBzt8JfTM5TGdhFM3Eo+Q
         qumV4tn0/gnLdKnBn1ZellLNpQHkcV881BkQNCQEyXJNXB2utTsh+6CyvsFj0Mpo1YkI
         puOr2V9P3K4ENo2wCgzwF68/pIMUJE3tkyu8GdWQ1od1FGvsvo1nadoS9eZ7bZh+r85k
         qVkpFrsjXLw7EzHJZ+j2BsnPRkJRSq49tjpzttq8fXMh0bUUyVSWhChjYOtysYB76FN9
         hAvoZCu1s1tVVvphTbvX72DZb3zzlD5ZRSdSVt89zNDZk8P+RP35S6N9hfxdF5ZG28JK
         WQ0w==
X-Gm-Message-State: AOJu0YxZonnL69si9j2fMY4Ri1Aw0DIw6PWPhMUpK2ozIo45AmuBSRC9
	a+KrzhDyzSxknwvShkZjyWreF7Al1WdMFtgPgA+d5qzR5wPKILimzyvDQ+N2O4yDwoB8BSrKFAE
	o
X-Google-Smtp-Source: AGHT+IE+h87De6KAd8H31xxqAUAYiafkI/UptbfFBtUj5IFs6cv4Yjx9ifc+irB/DVttsvtxQkvZ3g==
X-Received: by 2002:adf:a30e:0:b0:339:3f40:ffc3 with SMTP id c14-20020adfa30e000000b003393f40ffc3mr731402wrb.207.1706288712568;
        Fri, 26 Jan 2024 09:05:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:eef:5a49:b13d:a655? ([2001:8b0:aba:5f3c:eef:5a49:b13d:a655])
        by smtp.gmail.com with ESMTPSA id b8-20020a5d6348000000b003392cb66714sm1630720wrw.61.2024.01.26.09.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:05:12 -0800 (PST)
Message-ID: <12ffb6f38cba0eacf365bb36806a1bd2f69771d2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 4/4] uboot-sign: support to load optee-os
 and TFA images
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jamin_lin@aspeedtech.com, openembedded-core@lists.openembedded.org
Date: Fri, 26 Jan 2024 17:05:11 +0000
In-Reply-To: <20240119061937.1368163-4-jamin_lin@aspeedtech.com>
References: <20240119061937.1368163-1-jamin_lin@aspeedtech.com>
	 <20240119061937.1368163-4-jamin_lin@aspeedtech.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 17:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194397

On Fri, 2024-01-19 at 14:19 +0800, Jamin Lin via lists.openembedded.org
wrote:
> Currently, u-boot FIT image only support to load u-boot image.
> To support optee-os and trusted-firmware-a, update ITS file generation
> scripts, so users are able to use u-boot FIT image to load
> u-boot, optee-os and treustred-firmware-a images
>=20
> Add a variable "UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A" to
> enable trusted-firmware-a image and it is disable by default.
>=20
> Add a variable "UBOOT_FIT_OPTEE_OS" to enable optee-os image
> and it is disable by default.
>=20
> The ITS file creation looks like as following.
> 1. Both optee-os and trusted-firmware-a are disabled.
> '''
> /dts-v1/;
>=20
> / {
>     images {
>         uboot {
>         };
>         fdt {
>         };
>     };
>=20
>     configurations {
>         default =3D "conf";
>         conf {
>             loadables =3D "uboot";
>             fdt =3D "fdt";
>         };
>     };
> };
> '''
>=20
> 2. Only enable optee-os
> '''
> /dts-v1/;
>=20
> / {
>     images {
>         uboot {
>         };
>         fdt {
>         };
>         optee {
>         };
>     };
>=20
>     configurations {
>         default =3D "conf";
>         conf {
>             firmware =3D "optee";
>             loadables =3D "uboot";
>             fdt =3D "fdt";
>         };
>     };
> };
> '''
>=20
> 3. Both optee-os and trusted-firmware-a are enabled
> '''
> /dts-v1/;
>=20
> / {
>     images {
>         uboot {
>         };
>         fdt {
>         };
>         atf {
>         };
>         optee {
>         };
>     };
>=20
>     configurations {
>         default =3D "conf";
>         conf {
>             firmware =3D "atf";
>             loadables =3D "uboot", "optee";
>             fdt =3D "fdt";
>         };
>     };
> };
> '''
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  meta/classes-recipe/uboot-sign.bbclass | 91 +++++++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
> index 7a0b8047e4..d2b1013b93 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -91,6 +91,18 @@ KERNEL_PN =3D "${PREFERRED_PROVIDER_virtual/kernel}"
>  UBOOT_FIT_UBOOT_LOADADDRESS ?=3D "${UBOOT_LOADADDRESS}"
>  UBOOT_FIT_UBOOT_ENTRYPOINT ?=3D "${UBOOT_ENTRYPOINT}"
> =20
> +# Trusted Firmware-A (TF-A) provides a reference implementation of
> +# secure world software for Armv7-A and Armv8-A,
> +# including a Secure Monitor executing at Exception Level 3 (EL3)
> +# ATF is used as the initial start code on ARMv8-A cores for all K3 plat=
forms
> +UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A ?=3D "0"
> +UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_IMAGE ?=3D "bl31.bin"
> +
> +# OP-TEE is a Trusted Execution Environment (TEE) designed as
> +# companion to a non-secure Linux kernel running on Arm
> +UBOOT_FIT_OPTEE_OS ?=3D "0"
> +UBOOT_FIT_OPTEE_OS_IMAGE ?=3D "tee-raw.bin"
> +
>  python() {
>      # We need u-boot-tools-native if we're creating a U-Boot fitImage
>      sign =3D d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1'
> @@ -237,6 +249,20 @@ addtask uboot_generate_rsa_keys before do_uboot_asse=
mble_fitimage after do_compi
>  # Create a ITS file for the U-boot FIT, for use when
>  # we want to sign it so that the SPL can verify it
>  uboot_fitimage_assemble() {
> +	conf_loadables=3D"\"uboot\""
> +	conf_firmware=3D""
> +
> +	if [ "${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A}" =3D "1" ]; then
> +		conf_firmware=3D"\"atf\""
> +		if [ "${UBOOT_FIT_OPTEE_OS}" =3D "1" ]; then
> +			conf_loadables=3D"\"uboot\", \"optee\""
> +		fi
> +	else
> +		if [ "${UBOOT_FIT_OPTEE_OS}" =3D "1" ]; then
> +			conf_firmware=3D"\"optee\""
> +		fi
> +	fi
> +
>  	rm -f ${UBOOT_ITS} ${UBOOT_FITIMAGE_BINARY}
> =20
>  	# First we create the ITS script
> @@ -289,13 +315,76 @@ EOF
> =20
>  	cat << EOF >> ${UBOOT_ITS}
>          };
> +EOF
> +	if [ "${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A}" =3D "1" ] ; then
> +		cat << EOF >> ${UBOOT_ITS}
> +        atf {
> +            description =3D "ARM Trusted Firmware-A";
> +            data =3D /incbin/("${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_IMAGE}=
");
> +            type =3D "firmware";
> +            arch =3D "${UBOOT_ARCH}";
> +            os =3D "arm-trusted-firmware";
> +            load =3D <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_LOADADDRESS}>;
> +            entry =3D <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_ENTRYPOINT}>;
> +            compression =3D "none";
> +EOF
> +
> +		if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
> +			cat << EOF >> ${UBOOT_ITS}
> +            signature {
> +                algo =3D "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
> +                key-name-hint =3D "${SPL_SIGN_KEYNAME}";
> +            };
> +EOF
> +		fi
> +
> +	cat << EOF >> ${UBOOT_ITS}
> +        };
> +EOF
> +	fi
> +
> +	if [ "${UBOOT_FIT_OPTEE_OS}" =3D "1" ] ; then
> +		cat << EOF >> ${UBOOT_ITS}
> +        optee {
> +            description =3D "OPTEE OS Image";
> +            data =3D /incbin/("${UBOOT_FIT_OPTEE_OS_IMAGE}");
> +            type =3D "tee";
> +            arch =3D "${UBOOT_ARCH}";
> +            os =3D "tee";
> +            load =3D <${UBOOT_FIT_OPTEE_OS_LOADADDRESS}>;
> +            entry =3D <${UBOOT_FIT_OPTEE_OS_ENTRYPOINT}>;
> +            compression =3D "none";
> +EOF
> +
> +		if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
> +			cat << EOF >> ${UBOOT_ITS}
> +            signature {
> +                algo =3D "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
> +                key-name-hint =3D "${SPL_SIGN_KEYNAME}";
> +            };
> +EOF
> +		fi
> +
> +	cat << EOF >> ${UBOOT_ITS}
> +        };
> +EOF
> +	fi
> +
> +	cat << EOF >> ${UBOOT_ITS}
>      };
> =20
>      configurations {
>          default =3D "conf";
>          conf {
>              description =3D "Boot with signed U-Boot FIT";
> -            loadables =3D "uboot";
> +EOF
> +	if [ -n "${conf_firmware}" ]; then
> +	cat << EOF >> ${UBOOT_ITS}
> +            firmware =3D ${conf_firmware};
> +EOF
> +	fi
> +	cat << EOF >> ${UBOOT_ITS}
> +            loadables =3D ${conf_loadables};
>              fdt =3D "fdt";
>          };
>      };

These changes look good thanks. I'm just a bit worried they don't have
any test coverage so they're easily going to regress?

There are also no documentation patches?

Cheers,

Richard


