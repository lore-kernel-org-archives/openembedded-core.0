Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE53C433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 21:44:00 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.11909.1632606238990989047
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 14:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f1LYzU6c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id g16so38645200wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 14:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xm8X3BS/a7e9fd0xzb5ylPpbO1GKLIcfBbrgJyVUyFA=;
        b=f1LYzU6c1AwV5Y4pmqVNcfqFCifXGZjz4z/Z310jkKENdIQNEUXHH1dIlSt9235e2I
         VvIuEh2OS5nPUltfsK1xJhy0tmIqODad9k+XF4VcgvGdSlmW/mQw7VzV99K+w3VNeMeL
         f6XrtgGQ0BrJs8UuSl9f14DEM3Doz5mfWxLWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xm8X3BS/a7e9fd0xzb5ylPpbO1GKLIcfBbrgJyVUyFA=;
        b=UFqvA5qZIdyFQTArO3gPwsc4NPfHfOz2ExtcbIzdGJmLm7v2sEiZWHj4JweCGjOuPA
         bmAqYtbjKa43XtmExyPwrD87oqV/CvL5JL9g7A897y83IQ4GXIcFfOMY6pPAtBB38SoM
         fbo/pOStxO8Z7LG8SOrEX6/AVPeItag1adelLbJ154SEQHhZLrj/Vf8vqnPHIt7OLMWu
         SZzzf7hJISxkTNN997tgWnkXJqNzh17v0m7AbG0EtkcG43QhVqp/1mJ7Xt9GD5tcWlHZ
         M3MI8fuH54cneh+UGbLXOBPbJo5vWSw9eUGGSGUUiNeWBTwcEABA6Wk+awW/yPWqRHzH
         2cEQ==
X-Gm-Message-State: AOAM531oM9S6sje7CyAmCo8Jphi5Bt8XdciEgsm0uVRZ+SWFeyhjaM34
	b+Muf1RoEDvg8hAtIJnp5XcahA==
X-Google-Smtp-Source: 
 ABdhPJyiR8zb+OhLWhQRwlc/09PhZZt/Am7xVzjT0MssL/qaGlytS97cOdwU35gDQDz6SaMW8aYQow==
X-Received: by 2002:a05:6000:550:: with SMTP id
 b16mr19340842wrf.297.1632606237242;
        Sat, 25 Sep 2021 14:43:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ea95:6e9a:b58c:3d3e?
 ([2001:8b0:aba:5f3c:ea95:6e9a:b58c:3d3e])
        by smtp.gmail.com with ESMTPSA id
 r4sm13391820wma.48.2021.09.25.14.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 14:43:57 -0700 (PDT)
Message-ID: 
 <b8091408cf8c31f5c5e6dafcfd1b1f9cb649fd5b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] curl: Update tls backend PACKAGECONFIG options
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Pollard <tom.pollard@codethink.co.uk>,
	openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Date: Sat, 25 Sep 2021 22:43:54 +0100
In-Reply-To: <20210924160026.145611-1-tom.pollard@codethink.co.uk>
References: <20210924160026.145611-1-tom.pollard@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 21:44:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156357

On Fri, 2021-09-24 at 17:00 +0100, Tom Pollard wrote:
> curl 7.77.0 made the tls backend configuration explicit. openssl
> is now a specific option replacing the default `--with-ssl`, and
> `--without-ssl` is required to build without any tls, overriding any
> other tls config. Adding 'without-ssl` as a mutually exclusive
> option against the existing tls options should prevent users
> silently disabling other enabled tls backends.
> 
> https://curl.se/changes.html#7_77_0
> 
> Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
> ---
>  meta/recipes-support/curl/curl_7.78.0.bb | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-support/curl/curl_7.78.0.bb b/meta/recipes-support/curl/curl_7.78.0.bb
> index dece0babb2..315755c9b1 100644
> --- a/meta/recipes-support/curl/curl_7.78.0.bb
> +++ b/meta/recipes-support/curl/curl_7.78.0.bb
> @@ -20,16 +20,17 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
>  
>  inherit autotools pkgconfig binconfig multilib_header
>  
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} ssl libidn proxy threaded-resolver verbose zlib"
> -PACKAGECONFIG:class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
> -PACKAGECONFIG:class-nativesdk = "ipv6 proxy ssl threaded-resolver verbose zlib"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} openssl libidn proxy threaded-resolver verbose zlib"
> +PACKAGECONFIG:class-native = "ipv6 proxy openssl threaded-resolver verbose zlib"
> +PACKAGECONFIG:class-nativesdk = "ipv6 proxy openssl threaded-resolver verbose zlib"
>  
>  # 'ares' and 'threaded-resolver' are mutually exclusive
> +# 'without-ssl' explicitly disables tls, silently overriding other tls config and is required if no backend(s) are configured
>  PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
>  PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
>  PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
>  PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
> -PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
> +PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls,,,without-ssl"
>  PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
>  PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> @@ -39,7 +40,7 @@ PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
>  PACKAGECONFIG[libgsasl] = "--with-libgsasl,--without-libgsasl,libgsasl"
>  PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
>  PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
> -PACKAGECONFIG[mbedtls] = "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
> +PACKAGECONFIG[mbedtls] = "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls,,,without-ssl"
>  PACKAGECONFIG[mqtt] = "--enable-mqtt,--disable-mqtt,"
>  PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
>  PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
> @@ -48,12 +49,13 @@ PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
>  PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
>  PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
>  PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
> -PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
> -PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
> +PACKAGECONFIG[openssl] = "--with-openssl --with-random=/dev/urandom,,openssl,,,without-ssl"
> +PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss,,,without-ssl"
>  PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
>  PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
>  PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
>  PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
> +PACKAGECONFIG[without-ssl] = "--without-ssl,,,,,gnutls mbedtls openssl nss"
>  PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
>  
>  EXTRA_OECONF = " \

I think this change breaks mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4055

Cheers,

Richard



