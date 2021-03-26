Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.1920.1616784891990466343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 11:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bQILOVSu;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id x14so6249008qki.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jQeyykXrvzhM+tcSZUSTTryXIuWzQZWeFxPlpuJJq8s=;
        b=bQILOVSuoMJyQuYcXQhW+pVg7fusimm/WGsitiPkDatb2gz3GG+NUz8nKq3oADZkqz
         6bDqbAdXxIcCddeSG6K83tu5F1QxpJs96fomhv9cupgy2uJNaApzEUVxdpRVw0jW2s4k
         MxRONPpq+ebtLFxio9ceNwwv35oSLUQBkhbANeyoFvCmbe1kJtzuqruO+G3CRNskbTT7
         J++rWL0OVDEn72C7lqke0dmIA+go/EWWuEa71am4KGct0oZy5sNo3bQGprnNUSeOgh1Z
         gtEOCl1lkikSJgWewavjuSlEj/EgcYWq+RjyUny9U8nL9eMxaCJkcuONoJwzxTPBRbNU
         vYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jQeyykXrvzhM+tcSZUSTTryXIuWzQZWeFxPlpuJJq8s=;
        b=lSnDKI56jGaRy0ZASOqpmS6nBa7kb2X//rGybm+FAmUCkM3BytLzsRAvt4RQdhIy0k
         lpvJczcn4y2HR0IUTGzbJcexhHKVRiFvVkNPnbE2GCojEySYYhbwRTDFbf2juWQG1mIH
         4mufofQBK49eGH57Fv5Sm1ptukd8Nrn5EQwQ1IBsVkSrEMzzIf/Y/WqyavmnVMO5XRBZ
         3/mTm2kl/fmRD7U61G2fhw/LFZHdQRaz2hO7CzdLnkgFwkGqSsT6jnWoufXbfN/ZlmZo
         p89RJ+En1aDBxn6UanZDvcAz572ilbB9SPpbmN0/fF9XeMSJS7GGfFWd5iCdIqdm3NPv
         cgSw==
X-Gm-Message-State: AOAM532n8/UlPNY7IpD6/BCuO1M/EWJnlY5cx/ykf6RNraFTwbVZhJoa
	qM6m9t8ak9nvQreDOEANei/hlGvQDqXDaJGa0f8=
X-Google-Smtp-Source: ABdhPJz22Rn47ByInPzzGi13tiFwPdQlrhitl9j0xFdvug08WQ8zITdg/diM/M1Oasv6URtv/Bzl4t4mlmx4bbAY79Q=
X-Received: by 2002:a37:a350:: with SMTP id m77mr14113259qke.146.1616784891139;
 Fri, 26 Mar 2021 11:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210325192052.2976-1-mikko.rapeli@bmw.de>
In-Reply-To: <20210325192052.2976-1-mikko.rapeli@bmw.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 26 Mar 2021 11:54:25 -0700
Message-ID: <CAMKF1sry10GxKxwSOoyPd87wXA4=r4Nb-YXHEV+3TxCcHaANzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][gatesgarth][dunfell] openssl: update to 1.1.1k to fix CVE-2021-3450 and CVE-2021-3449
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

do we need this on dunfell too?

On Thu, Mar 25, 2021 at 12:20 PM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>
> Only security issues fixed in this release according to
> https://www.openssl.org/news/cl111.txt
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  .../openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb} (98%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
> similarity index 98%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
> index f054d2fdba..5f281197c9 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
> @@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] = "aaf2fcb575cdf6491b98ab4829abf78a3dec8402b8b81efc8f23c00d443981bf"
> +SRC_URI[sha256sum] = "892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5"
>
>  inherit lib_package multilib_header multilib_script ptest
>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> --
> 2.20.1
>
>
> 
>
