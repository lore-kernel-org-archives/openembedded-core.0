Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7590ECCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 20:40:09 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.454.1759869602289209720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 13:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/7SvfKL;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-637a2543127so12404251a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 13:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759869600; x=1760474400; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VZ5aN2x5gqt+42CklaZxBvb5qtBS9b24mdIQ8GTs1NQ=;
        b=J/7SvfKLK437SQcw5EbtUXOdxV54tMkv3v4YbqamOI6B+kEP8PIRra57G2KRd6Pzlb
         Zu+5W6JiuT6R3MVBaQ8c86/y054leryzC1lJgzuICVQJDrUyTZDvMBH9Go3k5HjLRlKl
         FZFliGCqsKneglsNb5FKYEJXXF+3uu8YwoRRgo0JlvFgwMuFKxWfn3SGykzPLvgJaaJY
         dBQQOzvnZAYb2aa6qyv0zhORglrLT3c2dDgl57wwdqz56Vba1WXmP0IzEvSKCS4vM2Rz
         tpux+PfJ01edTdUD4myZQphoLhxO2uczd1k0bIPUW89HP8Nx18B1HVG/XfMID84wR9MF
         OK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759869600; x=1760474400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZ5aN2x5gqt+42CklaZxBvb5qtBS9b24mdIQ8GTs1NQ=;
        b=lXpD2vqjfKvq3DrhpJ20ZGH92lqPyT4CFTYEegrBM73AE5z3dIRRZC6AEROURbhhNC
         wcMwlVxJhkrWCf7saAcB3Yj4pWiQ9Z180HUgI/GuzCIybMxSfHq/tLOE0zkzOOFabTu1
         rM/gl7Df6+jG9+AINcIh+/R+FvkUGfCYotk2iHk0nAMWWA5mc1sypyuxh9wgL6K1Wxcq
         2koLERVLF3De4bXQTJA5KfIfVRLFeB8ojVAsJ+V2/eD3f9kk4ti1q9l1uJpQPBCPO+6N
         /tYAiqLkuQpKLRD8+GhAXhOHrlbj59OmG8MkGKQnkA7Dlr7FWGOKxC806YIfb20cJqsu
         xDhg==
X-Forwarded-Encrypted: i=1; AJvYcCWofz3RVi42kN005XT2wpp4i+aK3+tXSUgpk+OGhzdRSMKNgY1rH5ZFFTPpKx7WN4EH7Z5QAjiSX10SPpNmMgZ5nA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtLl0hysWIWKsWEqlOGJqLzIkR9ndtUQBdEFd+2st9mvYZwQT/
	kpERSfYQJBwWc8O4zpy5nW3eypds04TCNMJJ5Ms9NGsgVMO8aiyufoa/
X-Gm-Gg: ASbGncu+HEuRpLyorjUA9EK20LirrkQVXBinGrNSl4+VhU/FXsMdsUhu3huxsZd8CXc
	VeuNKRkVMAzdz0qgdWllirqsmP8M+WEkKXKeENqX4DRoJ3J6IboO19p3Mxfgm6KQnUgrcSw46Uv
	czuxHTWe4yRUzGRRR+fUDQL4qjcHGWJ3fst8/2AaqsBmLLlzJ0lBTF126324JJJ80Ct02dBl2NH
	e0Qpj6xJtzZBZWjqqVdsYXQVzAFQXUH+MEFHFEzf88Dw3+xm0MxbfrzDcSTmehcBlxPP5Bd2VZz
	XC7y8oae8c3jTa4wgahOIZYmmV7xooep0GFtZev4E6u5WSICAMiZiD2vSIDRrgkSiWeLQsVYo4O
	kGhwmAUu4Tp3fgkDuyGq8JP3bBgd0s0qr9wM18diLAuobekI1I504/oE=
X-Google-Smtp-Source: AGHT+IEkhX7LmFCyoKEgVApQ710fZHQOGsqSVUJCotmH2c3Nou8m99W4V4RAPDbTCZ4On3PMHrJLuA==
X-Received: by 2002:a05:6402:84a:b0:62f:50cb:764c with SMTP id 4fb4d7f45d1cf-639d5c699efmr700265a12.35.1759869600459;
        Tue, 07 Oct 2025 13:40:00 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3abcd7sm13082293a12.2.2025.10.07.13.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 13:39:59 -0700 (PDT)
Message-ID: <f733467a-2cbb-4cb2-976c-2ce06da28737@gmail.com>
Date: Tue, 7 Oct 2025 22:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] gawk: disable persistent memory allocator due to
 licensing
To: Randy.MacLeod@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, Liezhi.Yang@windriver.com,
 peter.kjellerstedt@axis.com, ross.burton@arm.com
References: <20251007200944.323467-1-Randy.MacLeod@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251007200944.323467-1-Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 20:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224559

On 10/7/25 22:09, Randy.MacLeod@windriver.com wrote:
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> In gawk-5.2, a feature that allows gawk to preserve memory between runs:
>    https://www.gnu.org/software/gawk/manual/html_node/Persistent-Memory.html
> was added. The files that implement this, support/pma.[ch], are licensed
> under the AGPL3 which some entities perfer to avoid. Force people to knowingly
> opt into using this feature and license using:
>    PACKAGECONFIG:append:pn-gawk = " pma-if-64bit"
> where pma is an abbreviation for persistent memory allocator and the
> "-if-64bit" suffix is a indicator to users that the feature only works
> for 64 bit targets. Also add AGPL to LICENSE and LICENSE:${PN}, when using pma.
>
> Correct the license to be AGPL-3.0-or-later. There hasn't been a change in
> the license terms, at least for main.c, haven't changed significantly in
> the last 15 years:
>
> License-Update: Reflects conditional AGPL use and more as described above.
>
> Testing requires a non-root account and following the example in the link above:
>   $ truncate -s <size> data.pma
>   $ chmod 0600 data.pma
>   $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>   1
>   $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>   2
>   $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>   3
>
> This works on qemu[x86-|arm|riscv]64 but not on qemu[arm|x86] where the
> --enable-pma is ignored because there is a requirement and build-time test
> for 8 byte void pointers in m4/pma.m4:
>   if test "$SKIP_PERSIST_MALLOC" = no && test $ac_cv_sizeof_void_p -eq 8
>
> Finally, remove an old comment about GPLv2, GPLv3 versions of gawk
> since this is no longer important as the GPLv2 version is not maintained.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-extended/gawk/gawk_5.3.2.bb | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
> index 833fe78bf9..ffaef93e8a 100644
> --- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
> @@ -6,14 +6,21 @@ HOMEPAGE = "https://www.gnu.org/software/gawk/"
>  BUGTRACKER  = "bug-gawk@gnu.org"
>  SECTION = "console/utils"
>  
> -# gawk <= 3.1.5: GPL-2.0-only
> -# gawk >= 3.1.6: GPL-3.0-only
> -LICENSE = "GPL-3.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +LICENSE = "GPL-3.0-or-later & AGPL-3.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19 \
> +                    file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19"
> +
> +LICENSE:${PN} = "GPL-3.0-or-later"
> +LICENSE${PN}:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma-if-64bit', ' & AGPL-3.0-or-later', '', d)}"

Thanks, but this has the same typo :)

>  
>  PACKAGECONFIG ??= "readline mpfr"
>  PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
>  PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
> +# pma: persistent memory allocator:
> +# Disabled by default due to AGPL license.
> +# Note that PMA works only for 64-bit targets and is automatically disabled at configure time otherwise.
> +PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
>  
>  SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>             file://run-ptest \


