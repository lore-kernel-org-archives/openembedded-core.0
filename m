Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web08.33639.1605040653158684324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 12:37:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ODUrk9z7;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id q68so3346uaq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 12:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sR3kl5Q8XOltiC9rn8B1nmqurls+TIt4ebJssW76ym8=;
        b=ODUrk9z7VzylZI/u8TRsJtxWdo4CNUP3oHVmHuxLojxul5c7fjtcueET96K5TGEj3V
         Gojri2SEYkAdlzBqs2+7WRUbQcRMeV3l8aY/TxdLri+bMZcY6OBemHb7RQXVpkLiyfmg
         A3UGTW1wPGyPIR7Gv098AmMPWBNHxze83xdU106MC8F/Cqp0qwfnPZ20ri+O2aLWiAc7
         VBA/s4MrLOibbMsOcW7uf29t/cefYClgUzEBzUWHX/972pAg1CnADZnBwZEw7opyS/GO
         EaXINr7A4FpAmWzIbO7vlhYG8GSxwlr5JnPe5WOYlaKd/FT6TnH2TowsJ4O4O+4HKepV
         rPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sR3kl5Q8XOltiC9rn8B1nmqurls+TIt4ebJssW76ym8=;
        b=jmuzr0Gs9QleMs02lMClSn+n6M4FYpUFshp+ua7FbrhU6j6FLu87VTcnQ3rLUTty5k
         bvBFFV8SU7YbIg5x5zia1/sVbZiS7BzwJKPq+ooGTVuDQ19ay2ABDY+wlnLjIzSbDELX
         KQXBEHze3VO30Yg7CwsJ6G1sjNgGvxJXn5Kkm0WzwKn9Qsqm3JHOnZP++lJjVRwEpgoo
         5Z4kxrksZImOhR7KlB6Q60rnSJ1wIkAq2gKWlyiwqV/DHSfE8VmyiBAfDU4DjzroA2Kh
         14Mkoy5wMI/JY2fRTw7hvmLEUGWs0198o7u0cMP4vt8V56SpERwNCrJO7f/x9C6pdJWl
         3nPw==
X-Gm-Message-State: AOAM5323W9nbqu3019LS7FBmtEPC9WlMoicpHZtnoH5uQo9pZBjEhufD
	2EvpfqrR6XKsJN1LaVbLGz14bD2NNJbx1rPQIAM=
X-Google-Smtp-Source: ABdhPJyWo9KOmbHU5Zwgc/c3yaDAqALZgfvmhxwWECkWwJQU5gC6rVlL4JRsyZV4tmENoy6RI0HT++7XZ3c6AB26VRU=
X-Received: by 2002:ab0:64cf:: with SMTP id j15mr11324335uaq.106.1605040652238;
 Tue, 10 Nov 2020 12:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20201109003123.31494-1-kai.kang@windriver.com>
 <CANNYZj9dT6GBpFCkfGobL1tJ8K1GRLe9VuJJPaNR4Ubnyr0cCg@mail.gmail.com>
 <15a325ef-c583-1afa-ae19-750a0927f2f9@windriver.com> <CANNYZj_ku_fWOyn_pkTsC0ygCRXT7QrTS8AedH-VEhvAcr+t4Q@mail.gmail.com>
 <8b13424d-115a-037b-cdd8-16c264a48ff7@windriver.com> <CAMKF1sqjqtN0BcoVg8xM5SrXLmZS_RNTCYG6iVLtWuHQ+VY58Q@mail.gmail.com>
 <7ccfb0c8-bea9-f511-aee4-bc931f7b7472@windriver.com>
In-Reply-To: <7ccfb0c8-bea9-f511-aee4-bc931f7b7472@windriver.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 10 Nov 2020 12:37:22 -0800
Message-ID: <CAJ86T=UiodkMcqg-VBttoidAYMAvw5EY=AToA6QkpbHE7Me8yA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: remove '-fno-omit-frame-pointer' for x86
To: kai <kai.kang@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2020 at 5:53 PM kai <kai.kang@windriver.com> wrote:
>
> On 11/10/20 2:58 AM, Khem Raj wrote:
>
> On Mon, Nov 9, 2020 at 12:18 AM kai <kai.kang@windriver.com> wrote:
>
> On 11/9/20 4:07 PM, Alexander Kanavin wrote:
>
> Right, but then adding _remove to the upstream recipe doesn't seem right - rather you should use _pn-webkitgtk override in your custom config.
>
> I suppose '-fomit-frame-pointer' is common compile flag that other people may also meet this error.
>
> Regards,
> Kai
>
>
> Alex
>
> On Mon, 9 Nov 2020 at 08:52, kai <kai.kang@windriver.com> wrote:
>
> On 11/9/20 3:32 PM, Alexander Kanavin wrote:
>
> This is not seen on the autobuilder, which does world builds on qemux86. Something might be wrong on your side?
>
> Just the option '-fno-omit-frame-pointer' which is not set by default. We have a build with an extra config in local.conf:
>
> SELECTED_OPTIMIZATION = "${PROFILING_OPTIMIZATION}"
>
> which expands to
>
> SELECTED_OPTIMIZATION = "${FULL_OPTIMIZATION} -fno-omit-frame-pointer -fvisibility=default"
>
> then it fails to compile webkitgtk. It could be reproduced with upper config line.
>
> since we do not have global file to control this its fine if you alter
> PROFILING_OPTIMIZATION inside this recipe
> something like PROFILING_OPTIMIZATION_remove = "..."
>-fno-omit-frame-pointer
> OK. I'll follow the snippet such as:
>
> recipes-devtools/binutils/binutils_2.35.bb:SELECTED_OPTIMIZATION_remove_mipsarch = "-O2"

If you want to ensure that something is built without frame pointers
then appending "-fomit-frame-pointer" is clearer (and more robust)
than trying to remove "-fno-omit-frame-pointer".

> Thanks,
> Kai
>
>
>
> Regards,
> Kai
>
>
>
>
> Alex
>
> On Mon, 9 Nov 2020 at 01:32, kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> It fails to compile webkitgtk for qemux86 if compile option
> '-fno-omit-frame-pointer' is applied:
>
> | TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/webkitgtk-2.30.1/
>     Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:
> | internal compiler error: in find_oldest_value_reg, at regcprop.c:438
> |    47 | }
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.30.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
> index 1acba6be1d..11fdb59034 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
> @@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
>  # which is not enough for binaries larger than 32 MiB
>  CFLAGS_append_arc = " -mlong-calls"
>  CXXFLAGS_append_arc = " -mlong-calls"
> +CXXFLAGS_remove_x86 = "-fno-omit-frame-pointer"
>
>  # Javascript JIT is not supported on powerpc
>  EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
> --
> 2.17.1
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> 
>
