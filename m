Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7128EC433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 18:32:59 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.9757.1635013978906235747
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 11:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DlMwttmF;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id ba39so3075956vkb.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 11:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OukpywoyX9EswCafVXD9HmHC6V0uVqZM9CejByWpSDc=;
        b=DlMwttmFudO4hO96jvAEG+XsouPoousUXILdjeuafI26h9+HQJ/b6heMoYfguW1Rpn
         dn9GShSqEd5yjQHD/QnhwMRGdVEGjdTBF7SMTQJrR3/d1lFXGRteQsKZ1cl5SStDpuug
         qwxgSxknSDxuroX82JF4YrIuFhxhEJ5EiwQme4V4AqOUuuES7oD+UOJf/k4ojqnGuHNz
         0N7xJy8HEBnSwqjC6DmBs25yU4uLU3cLnGZ9QvMzYNxdY5qSqKcHbZg990Q+YIya/GV9
         CTfERT0IyEZsnhAYuMGAO2ickI0Pf7chy4HnfOY7eiMQGYzZN+sViBACvOMzv71R8Ld8
         b6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OukpywoyX9EswCafVXD9HmHC6V0uVqZM9CejByWpSDc=;
        b=AUTy2CvoU+t7Bpn7FxfKMilAPhnl6ERX4F5ZCJuhdn1YLydjWdGLjzCowaUwoEk/9C
         MClGficT1mrbMR9vkKNFHhwXPhyP+NxJ/3WIp/6fEqIjGobzXEOPfbDXivdmdrdQS4Db
         1u+G3TOe+VcwzU/PvnuXag4iRUkfBNmo9/aFWLvP/aIr4kmkF9VfsqfTpDY2+jdjc3hZ
         ebeG9YJrN6kXXaFw8NMmkZ52eZbRSsBfgUgAgfTOKBUmYbsr+xNHEwclQIXYvNE7UO4u
         rE1xcRefHMstZ62UZp/ic8OeWvQ0CeydgJKcBFYmUHH6YDe+ukRqSSF8C3t5cS/fPOcs
         ypJw==
X-Gm-Message-State: AOAM531HsTE/Nve/8kyvlCEhJpeegz4aIhYfcctA4CQjNtd3/KSpMnU+
	LiwkQuJtwRZ37ww/btPQ7dkoX6PNlfBkCePwqJY=
X-Google-Smtp-Source: 
 ABdhPJxyaogJ6WocPM+NlPFUkF43zTnAz8h4hanaE5mXQ5pd4iHsEcmxINgY25nY0M3AoACOdLbZT0R7ytgx3zPrpwg=
X-Received: by 2002:a05:6122:1354:: with SMTP id
 f20mr7518749vkp.15.1635013978043;
 Sat, 23 Oct 2021 11:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211023181641.424368-1-raj.khem@gmail.com>
In-Reply-To: <20211023181641.424368-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Oct 2021 20:32:46 +0200
Message-ID: 
 <CANNYZj-iVUHn1kkBP_9nJKiJ5eAUgrUaW+HzROS=T6_HTqvYSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: Disable 64bit atomics in crossbeam for
 rv32
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005d38a005cf095bad"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 18:32:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157307

--0000000000005d38a005cf095bad
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Oct 2021 at 20:16, Khem Raj <raj.khem@gmail.com> wrote:

> +         println!("cargo:rustc-cfg=crossbeam_no_atomic_64");
> +     } else {
> +         // Otherwise, assuming `"max-atomic-width" == 64`.
> ++        println!("cargo:rustc-cfg=crossbeam_no_atomic_64");
> +     }
> +SRC_URI:append:riscv32 = " file://riscv32-no-64bit-atomics.patch"
>

The correct way to fix this is to adjust the target list in
vendor/crossbeam-utils/no_atomic.rs.

Alex

--0000000000005d38a005cf095bad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, 23 Oct 2021 at 20:16, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0println=
!(&quot;cargo:rustc-cfg=3Dcrossbeam_no_atomic_64&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Otherwise, assuming `&quot;max-atomic=
-width&quot; =3D=3D 64`.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rustc-cfg=3Dcrossbeam_no=
_atomic_64&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>+SRC_URI:append:riscv32 =3D &quot; file://riscv32=
-no-64bit-atomics.patch&quot;<br></blockquote><div><br></div><div>The corre=
ct way to fix this is to adjust the target list in vendor/crossbeam-utils/<=
a href=3D"http://no_atomic.rs">no_atomic.rs</a>. <br></div><div><br></div><=
div>Alex<br></div></div></div>

--0000000000005d38a005cf095bad--

