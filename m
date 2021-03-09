Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.12173.1615308467803098843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 08:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ElalMLP4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id 7so17012229wrz.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Hs20MbZkYOYYyfPus2P1kDgLXH73LGLcRluQeqK+/6g=;
        b=ElalMLP4FCeM9O35KGVGY4CvVEoGg1iwVFDl3EuaDV2jJJ97/Bb6ivA+p+8dRT86fS
         1DGpWTiddJ4VD4ap4WTJB2nFj600O1A/ZTzUoEoA8378BnBMK3x/1UA/5C40TYbNouXa
         Ut9W8j9ur12zM8YBrW5B+LFpbmyr1sxx1Pg8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Hs20MbZkYOYYyfPus2P1kDgLXH73LGLcRluQeqK+/6g=;
        b=RyONLEE5C5QKCsQferiJWFQw+vEuf9Lhp/DXTtTlm612z9MgFCqhi6fG6T9kQbkrT/
         02HwKOSOpgFdbhosk078d1prSj3Ek3kXffqcoUJeBJ20R+Cy1dpTL69WD2Vt+oyUTwIB
         ir6JNkscB3S91opd8nur5MdgeCs0Ty+oLMTO9vwUMBIeLEF6/hDg3FM9tD7rxxdnx/3B
         agTJpQPTSmsBUZJ+BvIRvfSWoQGC/YkgVMq4wJeNnCrm3Du93f0uryUVl2KQJd0f/dly
         dD0VcCZy2PyV7cDtfhsVPYDByRPEi/PS7mMBub9ICSLdDkxi1iqZ+m/onY+dCeagQQT5
         cqLw==
X-Gm-Message-State: AOAM531qdwgPxF6dG5iroLYwakaSpDuotSpUyt3GpABrnT/aIrkrwan4
	conEQfXcpYxk5PWRKGv1FgOIz8/d2ME5ew==
X-Google-Smtp-Source: ABdhPJwOLgBtsNiE6ExQpocpLSOIH33aEZRupic69SB9gtU3FKxYckRBgT37C3P4d1dEVb13QPeuQQ==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr28823332wrv.329.1615308466225;
        Tue, 09 Mar 2021 08:47:46 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e1d9:50e9:2ad6:a226? ([2001:8b0:aba:5f3c:e1d9:50e9:2ad6:a226])
        by smtp.gmail.com with ESMTPSA id o10sm23317153wrx.5.2021.03.09.08.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:47:46 -0800 (PST)
Message-ID: <db7558f9b4279027b8f920e70157fce70fea29af.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5] meta/recipes-devtools: Add HOMEPAGE / DESCRIPTION
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Dorinda <dorindabassey@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Mar 2021 16:47:45 +0000
In-Reply-To: <20210309113551.13691-1-dorindabassey@gmail.com>
References: <20210309113551.13691-1-dorindabassey@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-03-09 at 12:35 +0100, Dorinda wrote:
> Added missing HOMEPAGE and DESCRIPTION found using the test command
> `oe-selftest -r distrodata.Distrodata.test_missing_homepg`
> 
> [YOCTO #13471]
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>  meta/recipes-devtools/python/python-cython.inc               | 2 ++
>  meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb      | 2 ++
>  meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb      | 2 ++
>  meta/recipes-devtools/python/python3-jinja2_2.11.3.bb        | 1 +
>  meta/recipes-devtools/python/python3-pygobject_3.38.0.bb     | 2 ++
>  meta/recipes-devtools/python/python3-pytest_6.2.2.bb         | 2 ++
>  meta/recipes-devtools/python/python3-scons_3.1.2.bb          | 1 +
>  meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb | 2 ++
>  8 files changed, 14 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
> index da6eba254f..0e6bac06a7 100644
> --- a/meta/recipes-devtools/python/python-cython.inc
> +++ b/meta/recipes-devtools/python/python-cython.inc
> @@ -1,3 +1,5 @@
> +SUMMARY = "The Cython language"
> +HOMEPAGE = "https://pypi.org/project/Cython/"
>  DESCRIPTION = "Cython is a language specially designed for writing Python extension modules. \
>  It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
>  and the messy, low-level world of C."
> diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
> index b1feee8416..6dc376efe6 100644
> --- a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
> +++ b/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
> @@ -1,4 +1,6 @@
>  SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
> +HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
> +DESCRIPTION = "${SUMMARY}"

I believe this is already the default from bitbake.conf so we don't 
need to add this?

Cheers,

Richard

