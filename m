Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.1620.1613099588670592375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 19:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=b+LNBv9r;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.47, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f47.google.com with SMTP id n10so6021728wmq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 19:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g6tQ5DwBsE398+oknIsnEQdKUn+H1JJzjdh9MD/VPpM=;
        b=b+LNBv9rle72oSxW7YpuVflipdG2zXW24AFPwY70qmpv2wZZRTslSI5SIx6P5YDzkW
         ALTSrA1KdXSQVaEdXx8JbZUy+wJoH2eb/epFoKJkmuGuvN2Bqk5LKP/6G2wmFZdVgKea
         q+fal5PtGNV6wBfx13k1hoYYjCYeh2C1H8HyAbtj90EJhAH7jL+rUbUYxfgya2AbwyUP
         RUe/itAz89p+ZKxrzJiOrcGw2sNhXUJk/ayg3O0nw1qtMT8Rlx7hr+phYSfWYnkBoyvU
         z5Fm6EuxagEtk/XcKfEOni0mPCu1XQ9CkA8Bkppb37J6OSOtEW8cl3T2hAUQ6G9vOLXn
         gxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g6tQ5DwBsE398+oknIsnEQdKUn+H1JJzjdh9MD/VPpM=;
        b=I8GJKHXkzZM6vcuoXbaA3KUzg9H9xdNz26u88Va6FjDOLb4pX7udE5hXF1DUS4hmN8
         DXDlwFXt54NsnWjWJppUZdzHbjGxquWMU9PzJh6vIwXW42v8ngTyhabEXf6nD2e9AAZE
         PoT9JdHPwcyjI54qtW8zruskNlMOj/DutKkcQA2zPCUwjLAHT63yppMg3KtSgPAa22Xb
         7gNVNbGYCkcwcnBJ7Iv/1wGzDdvRTc1mOvW1jns6FWYbsS+rxa2glpbskZ5A4y+yz2Ms
         hCOcYT0TyfKdDsPj+ouEspBKpjELUZ6hjlHcFPlB1qBEVYN1NY1lmRJqYK8AxpwNaQg1
         pv9Q==
X-Gm-Message-State: AOAM532IFlYuKd1HVbrFE6wdj4f680FZrO/uT7dypgzfhHzU+lc6KTwR
	jTJ3lw2P080mlJCkV4DvzIVD/fOklQmSllvXEwkg1Q==
X-Google-Smtp-Source: ABdhPJz4NITzCHp252YzPq+e9V8ahE2oxvYCca8w7UjTKSajWg5hU1p/Q9g8jjNHf0dKpTzXI5AyHLNB7pDNsfQSb64=
X-Received: by 2002:a05:600c:2056:: with SMTP id p22mr773792wmg.12.1613099587117;
 Thu, 11 Feb 2021 19:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20210211132126.83665-1-chee.yang.lee@intel.com>
In-Reply-To: <20210211132126.83665-1-chee.yang.lee@intel.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 11 Feb 2021 17:12:55 -1000
Message-ID: <CAOSpxdYSGZSbAJ3b-3oYCJe9LY91Q4-zCh+p61pvPpYPv85yoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] sudo: 1.8.31 -> 1.8.32
To: Lee Chee Yang <chee.yang.lee@intel.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 11, 2021 at 3:21 AM Lee Chee Yang <chee.yang.lee@intel.com> wrote:
>
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> release notes:
> https://www.sudo.ws/legacy.html#1.8.32
>
> updates include fixes for
> CVE-2021-23239
> CVE-2021-23240

I'm getting do_compile errors with musl builds:

https://errors.yoctoproject.org/Errors/Details/570494/

In file included from ../../../sudo-1.8.32/lib/util/progname.c:36:
../../../sudo-1.8.32/include/sudo_compat.h:318: warning:
"WIFCONTINUED" redefined

318 | # define WIFCONTINUED(x) 0

Steve

> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  meta/recipes-extended/sudo/sudo.inc                           | 2 +-
>  meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb} | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb} (92%)
>
> diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
> index 5d27d46928..aeedfc1a23 100644
> --- a/meta/recipes-extended/sudo/sudo.inc
> +++ b/meta/recipes-extended/sudo/sudo.inc
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
>  BUGTRACKER = "http://www.sudo.ws/bugs/"
>  SECTION = "admin"
>  LICENSE = "ISC & BSD & Zlib"
> -LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=4d1b44b1576eea036d78b8cc961aa93d \
> +LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=07966675feaddba70cc812895b248230 \
>                      file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
>                      file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
>                      file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
> diff --git a/meta/recipes-extended/sudo/sudo_1.8.31.bb b/meta/recipes-extended/sudo/sudo_1.8.32.bb
> similarity index 92%
> rename from meta/recipes-extended/sudo/sudo_1.8.31.bb
> rename to meta/recipes-extended/sudo/sudo_1.8.32.bb
> index 39d8817c32..af875f5b4c 100644
> --- a/meta/recipes-extended/sudo/sudo_1.8.31.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.8.32.bb
> @@ -7,8 +7,8 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
>
>  PAM_SRC_URI = "file://sudo.pam"
>
> -SRC_URI[md5sum] = "ce17ff6e72a70f8d5dabba8abf3cd2de"
> -SRC_URI[sha256sum] = "7ea8d97a3cee4c844e0887ea7a1bd80eb54cc98fd77966776cb1a80653ad454f"
> +SRC_URI[md5sum] = "a7318202ba391079a0e32933f0fb8bd6"
> +SRC_URI[sha256sum] = "5ce3c18c5efbecd5437a0945f314f1822423eaf9a2d7eb7ecf80857bc32246c5"
>
>  DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>  RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
> --
> 2.17.1
>
>
> 
>
