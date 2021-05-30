Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.36255.1622407680489488042
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 13:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GYqHniT4;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id ss26so13523356ejb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xtsO3VoYWG59kZK3XOxdUaczObOS/ibddh+ryc/CLSI=;
        b=GYqHniT4sSdx94+k8Clk6HEYh30Tk2lIVS47pmsFKDbzahW+YZ97f8xodkbz9gfsO1
         +LIKrnGF+Ngo5gOVlbqT9MuubyTEO6Xp1oou3CTv6DA/ypvOfj4JuKk8O91Eue3t8VD/
         DHi8uaJtneXNyzmYjMpmq1vBTS4UGvyUTNWi69EcWeE/8H+m8Ue4G94aSszQ9S3Uqm51
         B/iki0IAmSIkkpjfT/vFrD+obdH7QS1LAkRjY4zal77jqsOlMLiDkezz2VTZa8UOsHmA
         cRTqK3/lb54WkNMWAS8pynbXYdTFb0ckuFjRdv8ISM+ehGUrx4UUC2D+ksncRzTmn6ll
         bQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xtsO3VoYWG59kZK3XOxdUaczObOS/ibddh+ryc/CLSI=;
        b=BppLTKeblkU/zUYcGfnoS/xS66Ksnxam751aypaatDIQsMt1fKrHw4AKDTbJb3TODq
         Zlc+JsGZCAHiaFmcQQ32KUNLAvh6xmxpZK2S3NPBd4pkT1/1TzVgLnXap7DfDTANNc44
         0qRthgjdp83mNWqZ9iYeM6A1HeW/Q3dt4oInJmM6SqbivPVm2cxseipYRnp5oV46SxkD
         Lv/OYysv/BgO6fupwfPg1jYW4bVeI/gnUaR8bZlelcViaBc8kDDgwjbjlF7M0PsEsV6k
         D4Qw7ONlIWdgUs5mEgJ94Ly7s9K0Rn7hFOMmltTzKwPsXhiXpORqtebADPNIu4+tMGnY
         pI6A==
X-Gm-Message-State: AOAM5326Vao7vYrTjA0NuSPf3wg9sTwmE4Vpx/yNWu8ySr0rVYxznsr3
	3hg/s3uTDCZhNhgBkJ/aj1RqFPCbS17PF79zqcw=
X-Google-Smtp-Source: ABdhPJwrKonb+0DmVnBv+NVatRfXhpTsTwk0fAYgY0JddyBTzjA5oz6+QRs9BGaPh8tfeYwiy28mpNlKJg+NGDTHcjI=
X-Received: by 2002:a17:906:c211:: with SMTP id d17mr19731075ejz.247.1622407678917;
 Sun, 30 May 2021 13:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210530180552.580308-1-akuster808@gmail.com>
In-Reply-To: <20210530180552.580308-1-akuster808@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 30 May 2021 16:47:47 -0400
Message-ID: <CADkTA4ORQc2j9W9QgRJUhDY=q1ZLUdKxctJj=HLdkPPm9iGoTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] kernel-kfrag: add new class
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 30, 2021 at 2:06 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> This provides a common place to define kernel fragments
> that may be usefull to the larger community.

Not a bad idea at all, but what about calling the class
"kernel-features", versus kfrag ? That describes the purpose, versus
what the mechanism does.

A 2nd suggestion would be to bbwarn if this is inherited, but
kernel-yocto is not.

Note: as mentioned during the yocto summit, I do have patches that
make fragments more universally available, when I get them ready, we
could remove the bbwarn.

Bruce

>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/classes/kernel-kfrag.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta/classes/kernel-kfrag.bbclass
>
> diff --git a/meta/classes/kernel-kfrag.bbclass b/meta/classes/kernel-kfrag.bbclass
> new file mode 100644
> index 00000000000..c0c5667b519
> --- /dev/null
> +++ b/meta/classes/kernel-kfrag.bbclass
> @@ -0,0 +1,8 @@
> +#
> +# Class to place yocto-kernel-cache fragments
> +# selections usfull to anyone
> +#
> +
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "apparmor", " features/apparmor/apparmor.scc", "" ,d)}"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "smack", " features/smack/smack.scc", "" ,d)}"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "dm-verity", " features/device-mapper/dm-verity.scc", "" ,d)}"
> --
> 2.24.3
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
