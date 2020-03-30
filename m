Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.49895.1585574699825712478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 06:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=aOAKnOA0;
 spf=pass (domain: googlemail.com, ip: 209.85.128.48, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-wm1-f48.google.com with SMTP id f6so15286451wmj.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KUHvCEYp8Yi6V5sJDUi74ODdFnH2xzXnjBqP6aBqOgM=;
        b=aOAKnOA0DS1jQy18qqs9HQE6/HRcSuKMrZYtGJp2AtIEfwcp4Cd4FOGTuBtdh7wGXC
         dYaAASS/MOFkt/U7uLHSkjhmhH+426pSt3vt/Sue65DIFU6c6im87E6PQwAt/HJwwRLc
         zdFaGHZdv22z2rvS2uz0m+NwvaetzUlxFXNm6xyxVvxcK2cjg/30zHY3KIVKAtHgkE24
         clWdpgfCbjajGxqZmXmHJTUuf/WQBYm0lT1oZJd24buAjyFrYZG5XACJ8wtw5xoaKbk7
         Igns+x2/OwwY7hjXXjFaftQNGL6caEuxq/vngMY2AwWD1RkSWSYHffCe/jafF9UCcqiq
         kyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KUHvCEYp8Yi6V5sJDUi74ODdFnH2xzXnjBqP6aBqOgM=;
        b=AgKNF6Bo09EJNS7ypea+wAvoj/9rOwxKkp2Q31xgxWLRH4DMNTdrgXD8uG+ucnBmyf
         xyM1bXxOC0HSn7k7As8A3nxq6+ZMeAxCebelguYn9oDwpPsfrFnLMQaiEtRX1jRz9Q+9
         6c4yEyEfu3laNL2zwCp9iGStUiVDwQrUXuAfef0eiedCdQO6GVY2MFmuygo5m5EiXhr2
         4PapA6pzPxvCLWDku9WzejUfmDUI73UWERVxshlVNw9jHGF0Nitsk5wP0Z/VBV4/4lsv
         2nGNQr5mjYCswLhC0e+Md2M5+8vlaHFvnBNg9PfYwiifIOhqvLRZM3ipnwavlUbhT4fp
         z8YA==
X-Gm-Message-State: ANhLgQ39rYjSewuN1qPIu1qgQghlZAr5h4QzlmO/hKMzuRdtIVFeWXA4
	wh7jlGoEI9wdxQ2htlT0/d61Y0eiXEI=
X-Google-Smtp-Source: ADFU+vsJ7sho9AwIEP8smKBAt1nVAHu1Z97JSzlqfqBu2BJ/9ev7G5hHy8UFTu7yHfYBvgbDnqLYrg==
X-Received: by 2002:a1c:648b:: with SMTP id y133mr12810391wmb.173.1585574697997;
        Mon, 30 Mar 2020 06:24:57 -0700 (PDT)
Return-Path: <matthias.schoepfer@googlemail.com>
Received: from ?IPv6:2003:e5:171f:db00:499a:1c4f:e583:2282? (p200300E5171FDB00499A1C4FE5832282.dip0.t-ipconnect.de. [2003:e5:171f:db00:499a:1c4f:e583:2282])
        by smtp.googlemail.com with ESMTPSA id f187sm16653733wme.9.2020.03.30.06.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 06:24:56 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v2] python3: fixing bpo-36852 patch for builds on i686 architecture
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200330094111.979870-1-matthias.schoepfer@googlemail.com>
 <CANNYZj8X=mLp4M0oAcq8PjDFMFV+9zUmNUcCJsrQv7-Pm+F-kg@mail.gmail.com>
From: "Matthias Schoepfer" <matthias.schoepfer@googlemail.com>
Message-ID: <8385350d-69a5-60aa-3a24-5e6e644f691b@googlemail.com>
Date: Mon, 30 Mar 2020 15:24:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8X=mLp4M0oAcq8PjDFMFV+9zUmNUcCJsrQv7-Pm+F-kg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Alex,

it is already added, it patches an existing patch. Please see

https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3_3.8.2.bb

line 24.

Or what am I missing here?!

Regards,

   Matthias

On 3/30/20 11:43 AM, Alexander Kanavin wrote:
> The patch is not added to the recipe (please test the build after you do 
> that).
> 
> Alex
> 
> On Mon, 30 Mar 2020 at 11:41, Matthias Schoepfer via 
> Lists.Openembedded.Org <http://Lists.Openembedded.Org> 
> <matthias.schoepfer=googlemail.com@lists.openembedded.org 
> <mailto:googlemail.com@lists.openembedded.org>> wrote:
> 
>     From: Matthias Schoepfer <matthias.schoepfer@ithinx.io
>     <mailto:matthias.schoepfer@ithinx.io>>
> 
>     The original patch "bpo-36852: proper detection of mips architecture
>     for soft float" uses AC_CANONICAL_TARGET to determine the platform
>     triplet. While AC_CANONICAL_TARGET exports i686 as target_cpu, gcc
>     is using i386 instead. We fall back here to i386, as it is conform
>     to the previous behavior.
> 
>     Upstream Status: Submitted
>     [https://github.com/python/cpython/pull/13196]
> 
>     Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io
>     <mailto:matthias.schoepfer@ithinx.io>>
>     ---
>       ...-detection-of-mips-architecture-for-.patch | 20 +++++++++++++------
>       1 file changed, 14 insertions(+), 6 deletions(-)
> 
>     diff --git
>     a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
>     b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
>     index fe0aa8aabe..c4fae09a5b 100644
>     ---
>     a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
>     +++
>     b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
>     @@ -1,4 +1,4 @@
>     -From 2581ebe3cd9686089aed223651e1b8bf0b862b48 Mon Sep 17 00:00:00 2001
>     +From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon Sep 17 00:00:00 2001
>       From: Matthias Schoepfer <matthias.schoepfer@ithinx.io
>     <mailto:matthias.schoepfer@ithinx.io>>
>       Date: Fri, 31 May 2019 15:34:34 +0200
>       Subject: [PATCH] bpo-36852: proper detection of mips architecture
>     for soft
>     @@ -13,15 +13,16 @@ to do this in a more autoconf/autotools manner.
>       Upstream-Status: Submitted
>     [https://github.com/python/cpython/pull/13196]
>       Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io
>     <mailto:matthias.schoepfer@ithinx.io>>
> 
>     +%% original patch:
>     0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
>       ---
>     - configure.ac <http://configure.ac> | 171
>     +++++----------------------------------------------
>     - 1 file changed, 17 insertions(+), 154 deletions(-)
>     + configure.ac <http://configure.ac> | 175
>     +++++++--------------------------------------------
>     + 1 file changed, 21 insertions(+), 154 deletions(-)
> 
>       diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     -index 0f85486..0ca7e24 100644
>     +index ede710e..bc81b0b 100644
>       --- a/configure.ac <http://configure.ac>
>       +++ b/configure.ac <http://configure.ac>
>     -@@ -704,160 +704,23 @@ fi
>     +@@ -710,160 +710,27 @@ fi
>        MULTIARCH=$($CC --print-multiarch 2>/dev/null)
>        AC_SUBST(MULTIARCH)
> 
>     @@ -193,9 +194,16 @@ index 0f85486..0ca7e24 100644
>       +      PLATFORM_TRIPLET=vxworks
>       +      ;;
>       +     *)
>     -+      PLATFORM_TRIPLET=${target_cpu}-${target_os}
>     ++        if test "${target_cpu}" != "i686"; then
>     ++              PLATFORM_TRIPLET=${target_cpu}-${target_os}
>     ++      else
>     ++              PLATFORM_TRIPLET=i386-${target_os}
>     ++      fi
>       +      ;;
>       +esac
> 
>        if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
>          if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
>     +--
>     +2.24.1
>     +
>     -- 
>     2.24.1
> 
>     
> 


-- 

Dr.-Ing. Matthias Schoepfer
Mobile: +49 175 2062739
email: matthias.schoepfer@googlemail.com
