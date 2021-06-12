Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.11007.1623535743580329463
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jun 2021 15:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VgmUqiio;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id k5so7622670pjj.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Jun 2021 15:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZqSMZc1T6iGqivycHwsxMpYjn5zSTgdIGno5IpaUViY=;
        b=VgmUqiioCdmPBEBYYtEeymzPu7PUIIkSX1+013p1J7sVs7TotK1nRgtBJkDj1MeFDo
         UgA/4Rs30BJJmM9AY9XHbw96P/slPVl6MuvX6xWpJpiNRZpFi4L8HYsdMIZ0BOwOJV98
         lM4xjB4gf1pRMwLwsC6G2VdmsO6EyBjBuLxul6FuNctdMf3rjpxtprCYkbCkkuX3AYbG
         HhWqemQRRuPJM0pqXxYACjo2UfSVyIqK8RPFPvksnxsHc9R8+ek7WN8TYQcBdKqDAJ5C
         6WgrIkM+ab0K07x0aFsvMifXZgLnXDOVNw32bnFxAa6Pl9IdZx7mZg25FUkvUzwxMm1t
         Y5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZqSMZc1T6iGqivycHwsxMpYjn5zSTgdIGno5IpaUViY=;
        b=AX8wShyfCJ+mq+64QWGKvi0igXcNTsTpL0Hp+dybOERjlFRP/3hM516lQ/zkt1JRzY
         pgJ2FbjQpmGApBcnH6G9ae8llWQUCz7woPtbXqUZbLpPUuQDK9bToHsQlou4HMR6gZt5
         Awbq9UHDhlk6DW9aRp23RQi/bHtgq0tok3eGeP3JZN9lFjHQJtHXPLf9zW5I2UXpe2Yg
         XHmErtV8zWAIkA/h4mdYOD1xC7K0K5fHXgD+Z6jRA8j9GclwAgLRSWhy0IAu1d/7KJ3+
         EQ6FqtJacQuSJu8koV1zHPGpGPrQj3VnzAUZNMk6glhyqLI8gEI07WgYpnNyzT/QNV/z
         nbGA==
X-Gm-Message-State: AOAM531wp4XXPW/mfYHmN847UuDcLKJnvh/7HJq1Y/BggzjiDD/BACr3
	TnBoQ531+rVcOdm/yDPWqhY=
X-Google-Smtp-Source: ABdhPJxKDG2/yStI/cEJoM6/2Of0dGJTjHIbYHDppRg5E6DIP7pocDuOUMWuCG+5jSYFEJVeJKfROw==
X-Received: by 2002:a17:90a:5907:: with SMTP id k7mr3229478pji.46.1623535743010;
        Sat, 12 Jun 2021 15:09:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::195f? ([2601:646:9200:a0f0::195f])
        by smtp.gmail.com with ESMTPSA id gg22sm12689265pjb.17.2021.06.12.15.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 15:09:02 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] gcompat: Add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Andrea Adami <andrea.adami@gmail.com>
References: <20210612194315.676681-1-raj.khem@gmail.com>
 <CANNYZj9J3eM9vaoCQuU02uPLad-WhZXVD_+PiZ1egqEUohcx8A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ee873998-67bb-f202-69f9-0152456bd743@gmail.com>
Date: Sat, 12 Jun 2021 15:09:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9J3eM9vaoCQuU02uPLad-WhZXVD_+PiZ1egqEUohcx8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/12/21 1:23 PM, Alexander Kanavin wrote:
> Please ensure that PV is set so that upstream version check works (I'm 
> not sure if it does, looking at it):
> 
> devtool check-upgrade-status gcompat

its working fine, PV is set ( just below SRC_URI),

> 
> 
> Alex
> 
> On Sat, 12 Jun 2021 at 21:43, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     This is a compat library which helps running pre-compiled binaries
>     which were
>     compiled for glibc but needs to run on musl systems, this is quite
>     common case where pre-existing binaries are supplied and can not be
>     recompiled immediately
> 
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     Cc: Andrea Adami <andrea.adami@gmail.com
>     <mailto:andrea.adami@gmail.com>>
>     ---
>       meta/conf/distro/include/maintainers.inc |  1 +
>       meta/recipes-core/musl/gcompat_git.bb <http://gcompat_git.bb>    |
>     42 ++++++++++++++++++++++++
>       2 files changed, 43 insertions(+)
>       create mode 100644 meta/recipes-core/musl/gcompat_git.bb
>     <http://gcompat_git.bb>
> 
>     diff --git a/meta/conf/distro/include/maintainers.inc
>     b/meta/conf/distro/include/maintainers.inc
>     index 71943ffe26..e59f01d66a 100644
>     --- a/meta/conf/distro/include/maintainers.inc
>     +++ b/meta/conf/distro/include/maintainers.inc
>     @@ -229,6 +229,7 @@ RECIPE_MAINTAINER_pn-gobject-introspection =
>     "Alexander Kanavin <alex.kanavin@gm
>       RECIPE_MAINTAINER_pn-gperf = "Alexander Kanavin
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
>       RECIPE_MAINTAINER_pn-gpgme = "Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>"
>       RECIPE_MAINTAINER_pn-gptfdisk = "Alexander Kanavin
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
>     +RECIPE_MAINTAINER_pn-gcompat = "Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>"
>       RECIPE_MAINTAINER_pn-grep = "Denys Dmytriyenko <denis@denix.org
>     <mailto:denis@denix.org>>"
>       RECIPE_MAINTAINER_pn-groff = "Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>"
>       RECIPE_MAINTAINER_pn-grub = "Anuj Mittal <anuj.mittal@intel.com
>     <mailto:anuj.mittal@intel.com>>"
>     diff --git a/meta/recipes-core/musl/gcompat_git.bb
>     <http://gcompat_git.bb> b/meta/recipes-core/musl/gcompat_git.bb
>     <http://gcompat_git.bb>
>     new file mode 100644
>     index 0000000000..6792c0be70
>     --- /dev/null
>     +++ b/meta/recipes-core/musl/gcompat_git.bb <http://gcompat_git.bb>
>     @@ -0,0 +1,42 @@
>     +# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +# Released under the MIT license (see COPYING.MIT for the terms)
>     +
>     +SUMMARY = "A library which provides glibc-compatible APIs for use
>     on musl libc systems"
>     +HOMEPAGE = "https://git.adelielinux.org/adelie/gcompat
>     <https://git.adelielinux.org/adelie/gcompat>"
>     +
>     +LICENSE = "NCSA"
>     +LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=eb33ef4af05a9c7602843afb7adfe792"
>     +
>     +SRC_URI =
>     "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current
>     <http://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current>"
>     +
>     +PV = "1.0.0+1.1+git${SRCPV}"
>     +SRCREV = "af5a49e489fdc04b9cf02547650d7aeaccd43793"
>     +
>     +S = "${WORKDIR}/git"
>     +
>     +inherit pkgconfig linuxloader
>     +
>     +DEPENDS += "musl-obstack"
>     +
>     +GLIBC_LDSO = "${@get_glibc_loader(d)}"
>     +MUSL_LDSO = "${@get_musl_loader(d)}"
>     +
>     +EXTRA_OEMAKE = "LINKER_PATH=${MUSL_LDSO} LOADER_NAME=`basename
>     ${@get_glibc_loader(d)}`"
>     +
>     +do_configure () {
>     +       :
>     +}
>     +
>     +do_compile () {
>     +       oe_runmake
>     +}
>     +
>     +do_install () {
>     +       oe_runmake install 'DESTDIR=${D}'
>     +}
>     +#
>     +# We will skip parsing for non-musl systems
>     +#
>     +COMPATIBLE_HOST = ".*-musl.*"
>     +
>     +UPSTREAM_CHECK_COMMITS = "1"
>     -- 
>     2.32.0
> 
> 
>     
> 
