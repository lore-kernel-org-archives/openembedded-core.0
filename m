Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.2310.1617126425116968701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 10:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SNnScnD5;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id x21so19194641eds.4
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 10:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yYB3GkBB1xMK1QeS9ODf1DzHt0BNeO6nRFeFq6thVTk=;
        b=SNnScnD5zfrud8kDN5kf1DkN/6OsimWr0deTAyNN4SKOFQGxGC/k0Kt6w7l6U02Kr4
         YBasNK4u3e7Z30lyEfyduoBVEngWPwCYAxbtdnSreePecdUuGMnoxuQPB5GnP43vkUfR
         wVb0R+eG52z4zZW7QyWj5IBuuDUYBRz8+AJNENmgNMDBfwMMUY+D06X/MCwh9pGxHl3L
         THlz+jix7oi3JD76wQNTmWhT9TfgVTe5rnCibQz6+1Mm8DkzSYEAfnPxmke7DbB1wCgT
         bExPwfzcOwVCChYvEXCLxRBtv5+4LzIELvlSEkiKQau7G62teW66UknxICDnjMZlZjzx
         GRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yYB3GkBB1xMK1QeS9ODf1DzHt0BNeO6nRFeFq6thVTk=;
        b=EinxesR/L7uLw8tIecq1ThZzZS/AXtnEtfo/mhXBRQlulevdOt33mgI14om9bXJVMu
         L6tNkEHNwcrxPSLwjlbTFzYASxfpNwnmb24WCkSr3m6aNU49H2DQNFHQGvkKCYtytt2A
         pu8PZqA13VV1r0FIkuAlp81xlRwqmPB6xBxTiOs5Abf8nancvdjINQT94rewm3/CFvhZ
         0nUs3+2G7OukDAa2SQVCgWQsG2ryaI6jF8lh1XWaHKSN6PjbHy+U3WILGu4rn73sVbpN
         NwcKdn4m4kebLROB1fzqb6lSMe1LG9bNrNY10HSxOFyg4rghrf4TtZGsLnF0LppaGA4O
         vadg==
X-Gm-Message-State: AOAM530Em5QONWr5X3ce1ZdmBaB5AFQvDKomhSGvWNde2ZzSDHq3sncv
	xqIDrIDZpLc0/4e0nScj+QvEMfL1V7pZg2rptWw=
X-Google-Smtp-Source: ABdhPJzJFa5hYbivZmm5QhVPfmUjKIymUVAnCSPyXzMWluoxrPaytOBvLJe6i7ZgV6nPPocsptb5+J8k4EuG300MFEU=
X-Received: by 2002:a05:6402:22b5:: with SMTP id cx21mr35062714edb.27.1617126423634;
 Tue, 30 Mar 2021 10:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210330172713.753008-1-yann@blade-group.com>
In-Reply-To: <20210330172713.753008-1-yann@blade-group.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 30 Mar 2021 13:46:52 -0400
Message-ID: <CADkTA4OzuvmXAHtyBaeqxG0k1wtW7eZJco2Q511Ekbjo_-RtZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: log some kmeta information to assist in developing a bsp
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 30, 2021 at 1:27 PM Yann Dirson <yann.dirson@blade-group.com> wrote:
>
> From: Yann Dirson <yann@blade-group.com>
>
> This is not quite enough for the lack of a BSP to stand out clearly to
> an unsuspecting user's eyes, but at least this line in the logs should
> help some of us to get a clue:
>
>   NOTE: Using kmeta BSP ''

Sorry, but no on this.

There are already logs that are kept in the build directories
themselves. They can be further exposed via some of the existing debug
knobs that I have, but this is just noise in the general logs.

Cheers,

Bruce

>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 35587dd564..c6228ad0b8 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -234,6 +234,7 @@ do_kernel_metadata() {
>                     KMETA_EXTERNAL_BSPS="t"
>                 fi
>         fi
> +       bbnote "Using kmeta BSP '$bsp_definition'"
>         meta_dir=$(kgit --meta)
>
>         KERNEL_FEATURES_FINAL=""
> @@ -264,6 +265,7 @@ do_kernel_metadata() {
>         if [ "$mode" = "config" ]; then
>                 # run1: pull all the configuration fragments, no matter where they come from
>                 elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
> +               bbnote "config: kmeta configuration fragments: $elements"
>                 if [ -n "${elements}" ]; then
>                         echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
>                         scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL
> @@ -283,6 +285,7 @@ do_kernel_metadata() {
>         if [ "$mode" = "patch" ]; then
>                 # run2: only generate patches for elements that have been passed on the SRC_URI
>                 elements="`echo -n ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
> +               bbnote "patch: kmeta configuration fragments: $elements"
>                 if [ -n "${elements}" ]; then
>                         scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} $KERNEL_FEATURES_FINAL
>                         if [ $? -ne 0 ]; then
> --
> 2.30.2
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
