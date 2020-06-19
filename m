Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.178.1592602172517846421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 14:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V3IjOTP3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id x6so11000844wrm.13
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 14:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=VG3kyicbUH5pvtaALHIlTPYLixTu3IWu4bERl060uYk=;
        b=V3IjOTP3r498I6ntHkLUoHCpumG64mGyJ2d45CSFDppn7u56G7O4/aV2h9jAa42y8E
         mY6LGGuyZTPQ1C3U+MdUQ8OCI2+YJ+HZM+g0hxdiU39rueUYIXU8LM0s83fbfMhTUQKs
         qG+Vs4HQ7vnWWBrBfKTNUy64Oa3FrOk/xhKxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VG3kyicbUH5pvtaALHIlTPYLixTu3IWu4bERl060uYk=;
        b=uUCnqqlCbHqi5g2Ow8giH/DAvywdAxP5gmy24/6950voBScL9BylEqz4cO51yodlNO
         Dj0vjUi6+ShLyKxzeT6P0I3vuO+cRz4liiKAiXSvlyr9zvOJbOc/HLJiEv+kZzX0CTRx
         hN/l7RSikoc5EDDBi1vOVBiw87bLytieCKYsgJSD/wqeZ/ofp6l0451EifkrItLRVu3X
         xtVmbE/1hZVoW262VlS8UKIc9s7gsh8+G/rfZnzXeuN5hJ2fwWwA2qQ52ajVNfswVAYt
         iHBPIcEtZnblbyEOOY75m2LmR/cyv0ZNVpawF2QfWtjfpAZN7Uyya7mz4M8upKfdO52s
         lvyQ==
X-Gm-Message-State: AOAM533DCet6e1bEZK/aq4APGZ0IvMu22iEgkIpjxFu3x5AECGrGzTtU
	UnIBtYljyH6wFXYesqlOdQwoXw==
X-Google-Smtp-Source: ABdhPJz0ZcWIuK3N8nKNTPAuopQocCTV8bYnKTqJpNHPkYShjyeeyv+/NrGbWzoIgiu5iHvq1FRnWA==
X-Received: by 2002:a5d:6986:: with SMTP id g6mr6234323wru.27.1592602171179;
        Fri, 19 Jun 2020 14:29:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id q128sm8102913wma.38.2020.06.19.14.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 14:29:30 -0700 (PDT)
Message-ID: <b1600f3438c5dbc754d56dff5eeea944cc3b059c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] consolekit: Extend for native/nativesdk
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christian Eggers <ceggers@arri.de>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Jun 2020 22:29:29 +0100
In-Reply-To: <20200619194351.30053-5-ceggers@arri.de>
References: <20200619194351.30053-1-ceggers@arri.de>
	 <20200619194351.30053-5-ceggers@arri.de>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-19 at 21:43 +0200, Christian Eggers wrote:
> consolekit is required by networkmanager.
> 
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  meta/recipes-support/consolekit/consolekit_0.4.6.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
> b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
> index 89f2d77b66..ad35e8c6d6 100644
> --- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
> +++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
> @@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "
> file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                      file://src/main.c;endline=21;md5=0a994e097697802
> 20163255d8f9071c3"
>  
>  DEPENDS = "glib-2.0 glib-2.0-native dbus dbus-glib virtual/libx11"
> -RDEPENDS_${PN} += "base-files"
> +# base-files is only available for target
> +RDEPENDS_${PN}_class-target += "base-files"
>  
>  inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
> @@ -47,3 +48,5 @@ do_install_append() {
>  	# Remove /var/ directories as the daemon creates them as
> required
>  	rm -rf ${D}${localstatedir}
>  }
> +
> +BBCLASSEXTEND = "native nativesdk"

A native or nativesdk consolekit does not make sense.

If you need libs from networkmanager, you'll probably have to patch it
just to generate the libs you need. We don't want builds polluted with
confusing and potentially quite problematic binaries.

Cheers,

Richard

