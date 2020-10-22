Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.1721.1603393828784091645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 12:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g4lAEfTy;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id s22so1509858pga.9
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 12:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OvWMNJRQgW89tUsdYIBPAX44uuvQiAYkN5awbh2JRIk=;
        b=g4lAEfTyDxoh6IkVLeuL/PvV1suS6CunpQKmnQKMZjnvl4CUGyCXghLk3sUEMRAy5W
         JiA2FlgxUmhyvyxOLQ3YGfKt5jgo5Sz2w0AIJgkX0LasnZFbnXXjvhS/VEPGU3FlOuaT
         8tkSzIhLRAMmjegw/gQaY9+Uwd0gjc0SGCkauUyRsUART4QhKwdAaLQqxfRLIguODDNi
         FTmoGN07SZzvWfvTY3wlwPhm4/jYdBVF08Iqz9ppDma0Pczj4Wwae69r34KPn9YgEU3E
         o2/V84ZvrxbUAwJbrea2BgIcBR5u8XcWYl9GMxHZhYiyy9znHUv/xlPbnSBZvW+gZpSK
         v7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OvWMNJRQgW89tUsdYIBPAX44uuvQiAYkN5awbh2JRIk=;
        b=is4OmJGcVT9Ism461U+qFS3DZVV0jZ8pgcdOt148ICHnNDrQgqFt74kedI7efw72on
         VBbe/dqdZyYo9OwgL45IZlVVvDvw1OZjUdbBwYZP/3t2qett9EKU4QaLW3JB3LkFeSTM
         W5gXEbyaFcC+69sYVMDi4tAaDxa6P2fEuxFWsGvjoVm622RvSJygyd3nA3t5LfdcTD07
         m9wYc8HMw+WvsWHdR0pCIV34QmJJnPOqiwqiXIkNc8Vc+kB09pWhkApXtait+plaDTf6
         bxpdMXCBC9t9Hx8RbDM1p3vFcweVWRcaMqikLAp70pWMiXQ6pHjZp5JK/cvkqmwYn1a2
         VRmw==
X-Gm-Message-State: AOAM531r1xyzoJSkryR9KEOjlXtcKdGtlZdBkFbaxZpeAK+pxFNnFhkq
	MaxvIXs4e7hDPeuZCysvsgU=
X-Google-Smtp-Source: ABdhPJwCZilIcFcRR18SFQFu5WDCmTPkutt8DWoNtcUzhtAcyTveiPkmGKWXP79E864uMKNr9Cv3Kg==
X-Received: by 2002:a63:d19:: with SMTP id c25mr3582639pgl.208.1603393828133;
        Thu, 22 Oct 2020 12:10:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:913f:dc36:bf23:12ab? ([2601:646:9200:4e0:913f:dc36:bf23:12ab])
        by smtp.gmail.com with ESMTPSA id x10sm3201643pfc.88.2020.10.22.12.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 12:10:27 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v3] Add new recipe for squashfs-tools-ng
To: Luca Bocassi <luca.boccassi@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: peter.kjellerstedt@axis.com
References: <20201022092000.2917248-1-luca.boccassi@gmail.com>
 <20201022113036.2938947-1-luca.boccassi@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e5d55a34-2ec4-64d4-2d6d-8961b4bc6ba8@gmail.com>
Date: Thu, 22 Oct 2020 12:10:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201022113036.2938947-1-luca.boccassi@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 10/22/20 4:30 AM, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> The main difference with squashfs-tools is the availability
> of a shared library and a programmatic interface, rather
> than just command-line tools.

Can you clarify which parts are under GPL-3.0+ & LGPL-3.0+ licenses.
is it possible to ship traditional functionality from squashfs-tools 
without using code under these licenses.

> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: added MIT, Zlib and BSD-2-Clause to LICENSE
> v3: fixed CPL-3.0+ tag, removed GPL2 from checksum (not used), changed
>      recipe to be versioned, use bb.utils.filter in PACKAGE_CONFIG
> 
>   .../squashfs-tools-ng_1.0.2.bb                | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.0.2.bb
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
> +PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
> +
> +PACKAGES =+ "libsquashfs"
> +FILES_libsquashfs = "${libdir}/libsquashfs*${SOLIBS}"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +CVE_PRODUCT = "squashfs"
> 
> 
> 
> 
> 
