Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web09.54477.1629294139104777833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 06:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LUAN8KZ+;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id y9so1546091qtv.7
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 06:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cj5tep7n9FwTf1B9qjSU2D08moGmsyjO/uRlcoFUR1Y=;
        b=LUAN8KZ+lyPQQOQK9p7hGkSOK14ktOhiF2Mib+eXyUbWD/18WRUOC++0bKWtMiKQEU
         Gmeq/SlVSiPGugKLRVr33MDe6Lx/cMSn5A3Wn40JY8CaYCXRsdsVB1z9Ztas57SQ5ueg
         cqbOxHGiKnkDZWGs/Tjg+VHgVyyJoH76EXDPDpV/7BfJQ0LKr4JqJhaUjIfds9TeVztj
         m8ccztjOCiP628T5bHp5q/M8mLxXLin3BmXYvlZI+iWsASTr1CrxvMOQDkYNVJm71320
         WJwx6FGHmvD89fDpxUFBImWkSIgxwk6JBu6XCOz69jja+dlo6cxqSNcCuJL0l8UR4YXA
         9Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cj5tep7n9FwTf1B9qjSU2D08moGmsyjO/uRlcoFUR1Y=;
        b=ZC3AV/Hhe4SU84ksgjCOK/S5yMY8YPwmRNcZRC6w3XkcfKTvFcW0Ovzq2c6Np+X5zC
         CEAKcWUWk1E03HIiMtzlWFfEJycsafiV6Zzw7IpPbvr9Eom5ExRulJ5bpeRpvBraWzwv
         S9WIQJTYC9DgOq2FswklD5d0FVxglaCaIYt1KsogIAatlTUvtOj7LCHx7GqXmios79RD
         vUu3Rify8sioD8Fj3IDmL9zeQyLJZrq/ffhPVMdrQL7A9XzLtkOFKuQPCcEgAThTJpa2
         BVyRy+CdYg6NzBOzoiKY3GcbAPYl+uLAP4+NkfbjTtj9nKXcD9ycI4Mfiw8VUMz0d6qz
         B4dw==
X-Gm-Message-State: AOAM533K2ciXVIqPHTyheuuDYeckTrmyf2nLvUMtoC6fMN5Y0Bf+SQCF
	wifYFeYab27OnnBy2pLyLzwKoLHeDyWzQTxPY7s=
X-Google-Smtp-Source: ABdhPJxW2JyZOt3pK2vJU8fuQrkEpx5c6IGRMJ/WoenZJQKtXeZ8iZqo2vQO/ThXHql3Hs1lh+HrpCSyLHJx4HleOSk=
X-Received: by 2002:a05:622a:354:: with SMTP id r20mr7871706qtw.289.1629294138131;
 Wed, 18 Aug 2021 06:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210817222919.2170420-1-ross.burton@arm.com> <CAMKF1sp83v6TkKLAAMdDExij9ZceOaCGpSrp=cLPJEkQUCB-pQ@mail.gmail.com>
 <CAMKF1soAhzSgaYfuJarzoj6VEkAwcm1+51ymGprGwB=Sn53XZw@mail.gmail.com> <fb8ec5484f790866114c755b47f677746e42dab6.camel@linuxfoundation.org>
In-Reply-To: <fb8ec5484f790866114c755b47f677746e42dab6.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 18 Aug 2021 06:42:07 -0700
Message-ID: <CAMKF1sq_A2e2oLeuT9nHRPinUxoHtez0gVe6BL+eYHdtWcykbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: package the stub .a libaries into glibc-dev
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="000000000000568c5205c9d59a8e"

--000000000000568c5205c9d59a8e
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 12:00 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2021-08-17 at 17:40 -0700, Khem Raj wrote:
> > hmm I am seeing pseudo build failures on master-next on all arches see
> > [1].  I wonder if this is related
> >
> > https://errors.yoctoproject.org/Errors/Details/601473/
>
> I think that would be an issue with my patch in master-next to try and fix
> other pseudo issues with 2.34 hosts.
>
> Basically we need pseudo to work with older glibc where the
> dlsym/dlvsym/dlerror
> functions are in libdl. This is because libpseudo may be loaded against
> host binaries
> which were not linked with glibc 2.34 but something older.
>
> To do that, we need to inject older versioning but the version to use is
> arch
> specific. I have a patch covering 32/64 bit x86 and arm but I haven't got
> further
> than that:
>
>
> ++#if defined (__aarch64__)
> ++#define DLSYMVER "2.17"
> ++#define DLSYMVER2 "2.17"
> ++#elif defined(__i386__)
> ++#define DLSYMVER "2.0"
> ++#define DLSYMVER2 "2.1"
> ++#else
> ++#define DLSYMVER "2.2.5"
> ++#define DLSYMVER2 "2.2.5"
> ++#endif
> ++
> ++__asm__(".symver dlerror,dlerror@GLIBC_" DLSYMVER);
> ++__asm__(".symver dlvsym,dlvsym@GLIBC_" DLSYMVER2);
> ++__asm__(".symver dlsym,dlsym@GLIBC_" DLSYMVER);
>
>
> I may need help finishing this off for other arches people are building it
> for. So far
> I was using this as a test to see if this would even work!


I think we should disable building pseudo for targets which are not used as
build hosts so essentially your patch is good with another addition of
compatible host string


>
> Cheers,
>
> Richard
>
>

--000000000000568c5205c9d59a8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 18, 2021 at 12:00 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 2021-=
08-17 at 17:40 -0700, Khem Raj wrote:<br>
&gt; hmm I am seeing pseudo build failures on master-next on all arches see=
<br>
&gt; [1].=C2=A0 I wonder if this is related<br>
&gt; <br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/601473/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/601473/</a><br>
<br>
I think that would be an issue with my patch in master-next to try and fix<=
br>
other pseudo issues with 2.34 hosts.<br>
<br>
Basically we need pseudo to work with older glibc where the dlsym/dlvsym/dl=
error<br>
functions are in libdl.=C2=A0This is because libpseudo may be loaded agains=
t host binaries<br>
which were not linked with glibc 2.34 but something older.<br>
<br>
To do that, we need to inject older versioning but the version to use is ar=
ch=C2=A0<br>
specific. I have a patch covering 32/64 bit x86 and arm but I haven&#39;t g=
ot further<br>
than that:<br>
<br>
<br>
++#if defined (__aarch64__)<br>
++#define DLSYMVER &quot;2.17&quot;<br>
++#define DLSYMVER2 &quot;2.17&quot;<br>
++#elif defined(__i386__)<br>
++#define DLSYMVER &quot;2.0&quot;<br>
++#define DLSYMVER2 &quot;2.1&quot;<br>
++#else<br>
++#define DLSYMVER &quot;2.2.5&quot;<br>
++#define DLSYMVER2 &quot;2.2.5&quot;<br>
++#endif<br>
++<br>
++__asm__(&quot;.symver dlerror,dlerror@GLIBC_&quot; DLSYMVER);<br>
++__asm__(&quot;.symver dlvsym,dlvsym@GLIBC_&quot; DLSYMVER2);<br>
++__asm__(&quot;.symver dlsym,dlsym@GLIBC_&quot; DLSYMVER);<br>
<br>
<br>
I may need help finishing this off for other arches people are building it =
for. So far<br>
I was using this as a test to see if this would even work!</blockquote><div=
 dir=3D"auto"><br></div><div dir=3D"auto">I think we should disable buildin=
g pseudo for targets which are not used as build hosts so essentially your =
patch is good with another addition of compatible host string=C2=A0</div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000568c5205c9d59a8e--
