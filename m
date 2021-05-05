Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.805.1620239151375087866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 11:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ryGwdGTk;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id q5so1741243qvv.6
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 11:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dzGZX/ccC02UFPvaGCH8LWwrnAFt6ddbLBUXyELzKaM=;
        b=ryGwdGTkOeiY6krDZ2fHxOxIWLfqQtIo/TM/VNNv7uqNWPwIVQDOdQuuhcfGORUeHS
         1pqwFMWpuxNMo5n71xit3frDAm2XRdvmZqhieKS6ebVjl9K4EHEYDcQdgu5M2fUDbAPE
         vuYtgrMQmybqOfVcOqvp6VAZbvfSZeWa93lx3dWqkAMHbQgslBdQi24HjcmtdwsV2+3D
         NcoKIrYudrtVv+RQOAilSt2jr1AU0FIXe/gtvf7DDinCUAn/C1Bygj/7rca/Ft7pMEja
         1RwZEkbLhL07MA5lIIuxndeUcfGzgxkuJlIfQL5DFsrM73SKmEzQHpBxGy3gyZN6PU34
         aNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dzGZX/ccC02UFPvaGCH8LWwrnAFt6ddbLBUXyELzKaM=;
        b=jzfaOQ61kDdf5pbN3JjrkyB+Zc5O8boBxX6SBlEEPDqJRBdEEjtsTbMdjXKlSPQtgU
         bBHUqivGq1gZDENzaCfZEoNdPRcIMy4qym8QjRm1kk1Z2jFhQO8Z9F0IcqvjUiYNUtyp
         MLXZeKmI6Wt8Ng8oqec8qpxl/T+uPIDOaAk+x8L7+UIkZBJmFAv5jlFwebyYdbe/OWGp
         OmPvqlni3awePQUJPWw9q8Kw4CIwkpxm4LdLkZNQ1NJsQXLdXW8fGiTaBt7YUQkNwZOJ
         a50oygMrVxBFemrKIpt+5JYDK2RmUFvzH6mhboVaHn72ZsxpaDrWLN4Btt/UsQDSfmmz
         Bogg==
X-Gm-Message-State: AOAM531LAw4XkQsuUR1vdg3GUsfsPPD2rGw3fzQDXPl9/Qjkq72TNJV0
	qdrachko/snN8lQ/xH9mf3qaS016i780mrjaxZU=
X-Google-Smtp-Source: ABdhPJziL1Qdg/uenzjokG9Suk/O8uuhvRHDYr0ePrsA2gWnhikHw48YFUGtFFofmlKAuD7D01bNtj9hBpiLtDkSeGc=
X-Received: by 2002:ad4:4dc8:: with SMTP id cw8mr16353qvb.16.1620239150545;
 Wed, 05 May 2021 11:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com> <20210505151850.660512-22-alex.kanavin@gmail.com>
In-Reply-To: <20210505151850.660512-22-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 11:25:24 -0700
Message-ID: <CAMKF1spN4wQfxxiVoMmavZ+7v+gKzyU9H0wK4YAJWNV9qv7RVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 22/61] ffmpeg: update 4.3.2 -> 4.4
To: Alexander Kanavin <alex.kanavin@gmail.com>, Trevor Gamblin <Trevor.Gamblin@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Drop mips64_cpu_detection.patch as upstream
> has changed the code in a way that's difficult
> to rebase.
>

Trevor was working on it and he has being trying to fix it for mips
case as well. So lets leave this to him

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../ffmpeg/ffmpeg/mips64_cpu_detection.patch  | 32 -------------------
>  .../ffmpeg/{ffmpeg_4.3.2.bb => ffmpeg_4.4.bb} |  3 +-
>  2 files changed, 1 insertion(+), 34 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.3.2.bb => ffmpeg_4.4.bb} (98%)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
> deleted file mode 100644
> index 69429af8f0..0000000000
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -It will add -mips64r6 and -mips64r2 to cmdline which will
> -cause conflicts
> -
> -in OE we user mips32r2 and mips64r2 for mips arch versions
> -so there is no benefit of detecting it automatically by
> -poking at tools especially in cross env
> -
> -Fixes errors like
> -
> -linking -mnan=2008 module with previous -mnan=legacy modules
> -failed to merge target specific data of file
> -
> --Khem
> -Upstream-Status: Inappropriate [OE-Specific]
> -
> -Index: ffmpeg-3.1.1/configure
> -===================================================================
> ---- ffmpeg-3.1.1.orig/configure
> -+++ ffmpeg-3.1.1/configure
> -@@ -5220,12 +5220,9 @@ elif enabled mips; then
> -
> -     # Enable minimum ISA based on selected options
> -     if enabled mips64; then
> --        enabled mips64r6 && check_inline_asm_flags mips64r6 '"dlsa $0, $0, $0, 1"' '-mips64r6'
> -         enabled mips64r2 && check_inline_asm_flags mips64r2 '"dext $0, $0, 0, 1"' '-mips64r2'
> -         disabled mips64r6 && disabled mips64r2 && check_inline_asm_flags mips64r1 '"daddi $0, $0, 0"' '-mips64'
> -     else
> --        enabled mips32r6 && check_inline_asm_flags mips32r6 '"aui $0, $0, 0"' '-mips32r6'
> --        enabled mips32r5 && check_inline_asm_flags mips32r5 '"eretnc"' '-mips32r5'
> -         enabled mips32r2 && check_inline_asm_flags mips32r2 '"ext $0, $0, 0, 1"' '-mips32r2'
> -         disabled mips32r6 && disabled mips32r5 && disabled mips32r2 && check_inline_asm_flags mips32r1 '"addi $0, $0, 0"' '-mips32'
> -     fi
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> similarity index 98%
> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> index 08be38ca50..19a8e58370 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> @@ -24,10 +24,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
>
>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
> -           file://mips64_cpu_detection.patch \
>             file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
>             "
> -SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
> +SRC_URI[sha256sum] = "06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909"
>
>  # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>  ARM_INSTRUCTION_SET_armv4 = "arm"
> --
> 2.31.1
>
>
> 
>
