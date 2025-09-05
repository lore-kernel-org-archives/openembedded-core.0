Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EED8CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 17:30:10 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.web11.1023.1757093403385782273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 10:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L1BoPYY0;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-60f476e97c3so41310d50.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 10:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757093402; x=1757698202; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYnmo2+U+IoNW+A+uiTHmQVFhrUbdEsHYJnjWzvAA8A=;
        b=L1BoPYY0wFWyQALDrW7kzygtzz/ckAkyoUczHDjb78cQzdS9Fg2CD4I9QU4pH1XJIs
         +lBzx7CCjvwtplhkfPj8aF2n7FiwxwSl9xDb/qZnTm/ulc+Zpu0r5XFuc/6yqqgzXBak
         mhDBJvIDnQ/44vTQzFnFpee3lUnv0iqtajY0nMzvMN021UHlwGi80uyj7M64oIYGUeBE
         aJTgRT6fe2ZGcnQMeY8R/hu1i6zc9EEnvjJyeFlfNQh+/nYIMAT00TSijU5WiZtOpUHq
         L0o/fHAQAZWiKYL6HXicvIEWkVKVDMa1qJ9ieHZ71NDT36xAsbs5Dkibmr7zc/junrjX
         E7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757093402; x=1757698202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYnmo2+U+IoNW+A+uiTHmQVFhrUbdEsHYJnjWzvAA8A=;
        b=KTA5E6+JAzvieVRrEklcniOiO92lMA8AIAnA64gYs9bSTCOcAXSxDtTRgW9Nhj+a2e
         zrSVSk39i8RxgjKOjt2rI72ADpn+4YgeYRbzSdtMc/xp1U8KywORzfXcEzI0hIZdjE5w
         vMsXg7CGt9q8WsSq74635XeGNbCSwZAcpUo5M+2puR9vyUw8GDsDFdTtS3RUaSeboNzr
         YjkyOPHk6GCj5vDbPZ2++IGOdQuEShg/4olBz4xIV0MOhBRvrmEqgse+7MixtJ60nm2I
         xdiNHm+PA9bzwDNKdFj6vUHHOOjWEqqjdnbAd4vSKsy9ipKIgmGWqaqJHs4DI3Qsg4gX
         IhQQ==
X-Gm-Message-State: AOJu0YxauOYDwoe9gaTD5ce373yScv/fpKTlvhuIvipc1IKpzDJFnVH5
	+lAPsPVoPMLLM2qK8ZEvChJQ32M6yUBZlLrBfVTNLHLnwDziNjPJBBHFQBKSy6lFlVsSJqrA9Rc
	CskOIbOfZ2mfCvxI71wcH6OwNDPQ+8jo=
X-Gm-Gg: ASbGnct9GrGVdWb011e4ghoCrQWxdaUk3hJmRa3Jok0adFkrVFIoiOa5s+h0Hhtf/LS
	JGxmZwu4kD8bj2Ioq8xt+0qmjFEAbQfUGqJLJjUgjZrK9H8SRa+C9QID+aGvPAOwL0ixGtxTk28
	5PqvSuCZpD2S3I+bGM2nRXtLXoReK4I3S/AUT8a4knbsHLSKbAeh9EP5mpB/HsUjburhhDkFYYP
	zBhokfwOwQEZo5q0Co0fc7wNekMkwa63Txat4OiVRdcxMUBcKycEu+++UQHdBuITytw6NuHG9c/
	NuY3krA71vc5HoxDkbxyQ8QQYpQYUE4OYy95bBuzUu0MFax5p4bS+9smn14yYPV9JEY=
X-Google-Smtp-Source: AGHT+IEWqpydwi5jSKD99taQoTWn7ZrhfKxXlDeTSi5JaM62slDrXp1HafcxCQOyYlOj1Wjjx1eT5Y0n5xYjqatOM6w=
X-Received: by 2002:a05:690e:4194:b0:5fc:229:51c9 with SMTP id
 956f58d0204a3-601756acdb8mr5856986d50.5.1757093402230; Fri, 05 Sep 2025
 10:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250905110845.3139349-1-ross.burton@arm.com>
In-Reply-To: <20250905110845.3139349-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Sep 2025 10:29:35 -0700
X-Gm-Features: Ac12FXxXJbDTWE0UkVJEiKlD19mEUEK1R-C72hUzQwmo6XoODYC-Od4LKk0GqTw
Message-ID: <CAMKF1spNYnEkpVEDM4W=tZRgVTU3Yh4Z4QmwD6+ChZJEvcLecw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] spirv-llvm-translator: small recipe cleanup
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 17:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223033

what is the effect of

-    -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
-    -DCMAKE_SKIP_RPATH=3DON \

On Fri, Sep 5, 2025 at 4:08=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> - There is no need for python3native, as this recipe doesn't depend on
>   other python modules.
>
> - Inherit lib_package so the llvm-spirv binary is in a separate package
>   to the libLLVMSPIRVLib.so library.
>
> - Remove obsolete CMake options that no longer appear to be required.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../spir/spirv-llvm-translator_20.1.4.bb               | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb b=
/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> index 64a73ce55aa..3a090b7b5cb 100644
> --- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> +++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> @@ -15,18 +15,10 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+=
)"
>
>  DEPENDS =3D "llvm spirv-tools spirv-headers"
>
> -inherit cmake pkgconfig python3native
> +inherit cmake pkgconfig lib_package
>
> -# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> -# for CMAKE_SHARED_LIBS=3DOFF see https://github.com/KhronosGroup/SPIRV-=
LLVM-Translator/issues/1868
>  EXTRA_OECMAKE =3D "\
>      -DBUILD_SHARED_LIBS=3DON \
> -    -DCMAKE_BUILD_TYPE=3DRelease \
> -    -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
> -    -DCMAKE_SKIP_RPATH=3DON \
> -    -DLLVM_EXTERNAL_LIT=3Dlit \
> -    -DLLVM_INCLUDE_TESTS=3DON \
> -    -Wno-dev \
>      -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=3D${STAGING_INCDIR}/.. \
>  "
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222992): https://lists.openembedded.org/g/openembedde=
d-core/message/222992
> Mute This Topic: https://lists.openembedded.org/mt/115080036/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

