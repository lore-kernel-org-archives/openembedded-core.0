Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.1910.1585039061757387452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 01:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=THhYne4d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id a81so2359320wmf.5
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 01:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qFhPtNZScJusR7jsLb0H9771+JwfHOxoIWS7Jp6dFvY=;
        b=THhYne4dG5zLpbCYMJ0br/nC2Eyg+spS+5LyHH/ttN7TqIb6ASCgbiATjKcoaDW4+F
         NzeWpsArrPF3LcTagf9rdCaObiypB0d7DAfgU9mZOslydS0PX+vdP2kpNDelYjW/Oash
         z/B+qaS91aRUHgWtZ8Ey7mu87OTpts1KBmaYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qFhPtNZScJusR7jsLb0H9771+JwfHOxoIWS7Jp6dFvY=;
        b=WZr+QDgtUmPj7s0XibX3A6YKlxqorWoHQKl9n8DRvb2sc6n4cMeDI2QuWjsZvXb8Cr
         HZrUm2jEI+aHjkPvL3nl5CxhxtEHs2P/gi8F/Z6RC9sxdawc8JxVVSdzAkeI5U+704XA
         NRcyyoOa7fgHStaXhOxJOqDxm6nTC3svDtK7VEBMZdeiJ+2DK/1B5IitF+CDs0LfT5Zj
         jebeuvU/Pj/AbGz2a7+DSTVe6eZgjOO1qcKLmcMv+Afuk1fXYF7qLl2RdVKp37QRGB2r
         BdAr0UDTDqyO01hH7px9jNOoenaldYqgOhNnkOMjPg3O4VJKJqMLiBU++5YDJnvNmHMh
         UF6g==
X-Gm-Message-State: ANhLgQ2bpU8cg2bhjcdDOPi8aR2ouLQvrHFYkj8+T0KW/hqZ91YhgyKb
	ipoCwZfePnK0QN4avhmQhMHXBg==
X-Google-Smtp-Source: ADFU+vu0vL9CNTZQAC2LZbTHiNaj1hiSf5KLHbLY7qB9TVq/jIa3izthaMOO3gt2A1i7VZso8FhVVg==
X-Received: by 2002:a05:600c:2311:: with SMTP id 17mr1107954wmo.64.1585039060252;
        Tue, 24 Mar 2020 01:37:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z6sm26197414wrp.95.2020.03.24.01.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 01:37:39 -0700 (PDT)
Message-ID: <abaddad171ffa75900059fffee546157544befae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lto.inc: Add global LTO distro policy file
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2020 08:37:38 +0000
In-Reply-To: <20200323232529.3658577-1-raj.khem@gmail.com>
References: <20200323232529.3658577-1-raj.khem@gmail.com>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-23 at 16:25 -0700, Khem Raj wrote:
> Distros which want to enable LTO can utilize this file, it only
> covers
> packages from OE-Core, other layers should include there own
> exclusion
> list for recipe which dont work with LTO
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/lto.inc | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta/conf/distro/include/lto.inc
> 
> diff --git a/meta/conf/distro/include/lto.inc
> b/meta/conf/distro/include/lto.inc
> new file mode 100644
> index 0000000000..0cedc8deca
> --- /dev/null
> +++ b/meta/conf/distro/include/lto.inc
> @@ -0,0 +1,23 @@
> +LTO_pn-glibc = ""
> +LTO_pn-gcc-runtime = ""
> +LTO_pn-libgcc-initial = ""
> +LTO_pn-libgcc = ""
> +LTO_pn-libpam = ""
> +LTO_pn-elfutils = ""
> +LTO_pn-perl = ""
> +LTO_pn-busybox = ""
> +LTO_pn-libxcrypt = ""
> +LTO_pn-curl = ""
> +LTO_pn-libcap = ""
> +LTO_pn-python3 = ""
> +LTO_pn-libproxy = ""
> +LTO_pn-libbsd = ""
> +
> +LTO ?= "-flto"
> +
> +SELECTED_OPTIMIZATION_append_class-target = " ${LTO}"
> +TARGET_LDFLAGS_append_class-target = " ${LTO}"
> +
> +SELECTED_OPTIMIZATION[vardeps] += "LTO"
> +
> +PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"

Why do we need to specify the debug split style here?

Cheers,

Richard


