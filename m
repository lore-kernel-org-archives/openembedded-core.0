Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.9541.1602633669369019069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 17:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=UsSWKRCr;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.181, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f181.google.com with SMTP id b69so1369062qkg.8
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 17:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GvAQRDZ62RQdkfA3v9EjBpX24t994YIpKcpGx410qcM=;
        b=UsSWKRCrhs/7gVm0zUWm3d5h7qcM74PpNWDwLuiyTOGHiGywWEeMhtyUC4uk/lHCxr
         2KlImMMqEc2T7T18M3fEcy8q6DpQupBm2rla25avuKPH/quUywD3HTcc1Ue2DPZo/dgo
         hAkCIAmmb2F4gJdLBLRJGE5wTw21m/P8HPCuqDUb3zAVevRiKoKhS8YEJUvQwUsJCMjk
         tNEb9xAAoqcv8seB7JN58TXiUz/lOZSyE8pBxZ595OqA2Lgcup9cYjpRztX+Nrw9us5T
         royaS8e3FMy8yE4IhPidEQGRdnXblbwmPyhRAJHxbyAAuBaFJDgGwaJIDIje/tjZleh5
         OJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GvAQRDZ62RQdkfA3v9EjBpX24t994YIpKcpGx410qcM=;
        b=URCnnIUfEWg/jJADePrsSY82tBFP5zVEZBnxZ2RzXa+f7wSGiFUAKaCUh3y2k0Annk
         knzvyaXQYEGtmodwztlNifdYsUJYMhqWWEvBIxS2k9R4qPhh6+RuIVT9R4UwRImLmkQn
         KJmBjE2Osq9K38K5nY3j3YErVCWUnpyKPnzgVfN+swahyFf/99Xn5gBL/Gam/g4YA+7q
         YNTTWMBa7w1L1sz12dbKU1L3tdvTOSmkHOumfbo8pYit96jnkzncZ5xhQaVROEtu238F
         YuzWe+rpMTNdkwFRz0oqupaqHo2ABtuIECHqobzLTV1ce8MMVrGrEDyaAs41SBRX8bFS
         Gq0g==
X-Gm-Message-State: AOAM533hDJIxbcpevWa3We2ZDi1sSq729y06ushpYuxQI8gzBqTHDLVM
	q8AeiSladHs27IuatWssYGAAT+sCSiSOYZap
X-Google-Smtp-Source: ABdhPJzJiIuGqVjJXD6sGRoQBExxvUDi/TSa1oPfLlXlblo8wnkFKaqImFIWne0ncnglGcp6bSD8rQ==
X-Received: by 2002:a05:620a:570:: with SMTP id p16mr2706739qkp.396.1602633668121;
        Tue, 13 Oct 2020 17:01:08 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id x75sm620909qka.59.2020.10.13.17.01.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 17:01:07 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f172.google.com with SMTP id q63so1397226qkf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 17:01:07 -0700 (PDT)
X-Received: by 2002:a37:9c06:: with SMTP id f6mr2574671qke.197.1602633666854;
 Tue, 13 Oct 2020 17:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201013234452.2294860-1-quaresma.jose@gmail.com> <20201013234452.2294860-2-quaresma.jose@gmail.com>
In-Reply-To: <20201013234452.2294860-2-quaresma.jose@gmail.com>
Date: Tue, 13 Oct 2020 21:00:55 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpoU+3vk8_5VGJ-sGPrht-zbbEbtok9TxVk-SAtcu2UxQ@mail.gmail.com>
Message-ID: <CAP9ODKpoU+3vk8_5VGJ-sGPrht-zbbEbtok9TxVk-SAtcu2UxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/4] spirv-tools: enable native build and install more header files
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 13 de out. de 2020 =C3=A0s 20:45, Jose Quaresma
<quaresma.jose@gmail.com> escreveu:
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/recipes-graphics/spir/spirv-tools_git.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipe=
s-graphics/spir/spirv-tools_git.bb
> index 8e8388e8d4..89ebd72d31 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_git.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
> @@ -28,8 +28,12 @@ EXTRA_OECMAKE +=3D "-DSPIRV_WERROR=3DOFF"
>
>  do_install_append() {
>         install -d ${D}/${includedir}/spirv
> -       install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${=
D}/${includedir}/spirv
> +       install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${=
D}/${includedir}/spirv
> +       install -d ${D}/${includedir}/spirv/unified1
> +       install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1=
/* ${D}/${includedir}/spirv/unified1

Indenting changes; please follow the recipe style.

>  }
>
>  FILES_SOLIBSDEV =3D ""
>  FILES_${PN} +=3D "${libdir}/*.so"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.28.0
>
>
>=20
>


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
