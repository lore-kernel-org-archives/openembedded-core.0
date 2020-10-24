Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.11406.1603544332792888162
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2020 05:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RDvOMRPo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id c194so5161882wme.2
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2020 05:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xXmj4KcbImVMRRbqzsf1tNPiXw42UMDvAZCd2vm57qg=;
        b=RDvOMRPoHQmm995dKhW6Pn8OvI/R5kVX3piiipzEzsVVbA+dc8Ark6PEumNu14uUmC
         KCM7VenJAnEhu2PwOa3gEY5zuvKH4THidlxwhxseUPcdNdl9YInzLlWNOofCcxpLB7yK
         a8lUmrqX48hiD36BkHTxCY9u42+onMj8hh+Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xXmj4KcbImVMRRbqzsf1tNPiXw42UMDvAZCd2vm57qg=;
        b=eaeFRpJWSjMubWvxlsIWKPxdEnl0QgTqw5AG2j9ikKdF68Qk6BjmP8Y98vhwnMuVrb
         4kU5ugZVtGviSUfqC2emT3mJYy+yR9Ej5TYZBhn89MyPpDMZDDibMkX1zJLlJG0vcNKP
         D6qlWXLzQ3p1zylabSKLjtd17kNuYpUpvUeQ8RnvGrowpzTk2SU+B5EJdBV+Rre/dPoG
         7qaT3TrJrd7sq7gsHf33crjCc6QKZYGwTdu86SouE1NAnjPdqi/GKjSJOd/IOJxo/XDw
         zXPfj+TMpOFBsJxo0e8fgQh3MwD/C905YW4w02u1RKJOZngZSXFH+jw90lcxOj/TK+s5
         4cPg==
X-Gm-Message-State: AOAM530b55iXLdmlNu8eQDfS+4FhmBoKUvwC0l4h6jTPCWOfWeP8mGSL
	qP7DNhC5Oo+0FZblFJ88adEUKw==
X-Google-Smtp-Source: ABdhPJwymxz0w2CdJkYSTqkqnZ4oi79JpxDlbiDaiXM7h3HZq6BXkkCkLQcX39mqUkMJaFCw9etIXA==
X-Received: by 2002:a1c:9cd8:: with SMTP id f207mr6688184wme.76.1603544331265;
        Sat, 24 Oct 2020 05:58:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.f.3.3.a.5.1.9.5.6.b.0.0.2.c.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.f.3.3.a.5.1.9.5.6.b.0.0.2.c.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c20:b65:915a:33ff])
        by smtp.gmail.com with ESMTPSA id f8sm10321080wrw.85.2020.10.24.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 05:58:50 -0700 (PDT)
Message-ID: <6c5a1b204f52dc52c149b1056276c1acca5eae4d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] Add new recipe for squashfs-tools-ng
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: peter.kjellerstedt@axis.com
Date: Sat, 24 Oct 2020 13:58:49 +0100
In-Reply-To: <20201022113036.2938947-1-luca.boccassi@gmail.com>
References: <20201022092000.2917248-1-luca.boccassi@gmail.com>
	 <20201022113036.2938947-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-22 at 12:30 +0100, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> The main difference with squashfs-tools is the availability
> of a shared library and a programmatic interface, rather
> than just command-line tools.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: added MIT, Zlib and BSD-2-Clause to LICENSE
> v3: fixed CPL-3.0+ tag, removed GPL2 from checksum (not used), changed
>     recipe to be versioned, use bb.utils.filter in PACKAGE_CONFIG
> 
>  .../squashfs-tools-ng_1.0.2.bb                | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
> 
> diff --git a/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
> new file mode 100644
> index 0000000000..293b31cd92
> --- /dev/null
> +++ b/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "New set of tools for working with SquashFS images"
> +SECTION = "base"
> +LICENSE = "GPL-3.0+ & LGPL-3.0+ & MIT & BSD-2-Clause & Zlib"
> +LIC_FILES_CHKSUM = "file://COPYING.md;md5=c0de2c0aca56349dab98e97992316f7e \
> +                    file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
> +                    file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
> +                    file://licenses/LGPLv3.txt;md5=3000208d539ec061b899bce1d9ce9404 \
> +                    file://licenses/LZ4.txt;md5=ebc2ea4814a64de7708f1571904b32cc \
> +                    file://licenses/xxhash.txt;md5=f042a9be092bd6d7fe6f217d8d00f4ca \
> +                    file://licenses/xz.txt;md5=1c389b9610ccfdb25f7abaea6a0bb5a4 \
> +                    file://licenses/zlib.txt;md5=ae27c72096606131f760e5f59cf98b06 \
> +                    file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8"
> +
> +SRCREV = "b96f0fc154feef531be76034bf6e38925636146f"
> +SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGECONFIG ??= "gzip xz lzo lz4 zstd ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
> +PACKAGECONFIG[gzip] = "--with-gzip,--without-gzip,zlib"
> +PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
> +PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
> +PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4"
> +PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"

Testing on the autobuilder showed up:

ERROR: Nothing PROVIDES 'zstd' (but /home/pokybuild/yocto-worker/check-layer/build/meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb DEPENDS on or otherwise requires it)

(zstd isn't in OE-Core)

Cheers,

Richard



