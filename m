Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.1141.1610740466788228628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 11:54:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=G5eWyB9h;
 spf=pass (domain: google.com, ip: 209.85.166.51, mailfrom: gmouse@google.com)
Received: by mail-io1-f51.google.com with SMTP id q2so18771646iow.13
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 11:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EXRsCgZ5dtDGn6mOdsOIrK/kkyfZQVpgClUmOfSLtKM=;
        b=G5eWyB9hK7BVPCngnTV7KcIC2GnApMh2jVVUaXadebRHVf3GUjq49DgH8/SHgxVlgr
         33Xwx05PtrOrYweCP2rljFHcxl2Tc03otIlRT6BUdYo9B06ZAJ6s6zngRr7prAvbiJf8
         OPSRwLLt3BRnWfJavfyifT8apsQRLi+oVj36MMrEkhTZsUcgb+QmYFsGGsbh6fe8u3cI
         iAiUhTFsnL3+DhgBx8nLPy2X6PCtpvlug/7Nxp2XHCJjQZaAEmTvNRktEhkGAN1yekc6
         krrMWaFiKaSjnaBZqbMHiWij+NrVtUhw2pxRUbUiHDjJR1VWxceWeabfDWswFXjppWI3
         LmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EXRsCgZ5dtDGn6mOdsOIrK/kkyfZQVpgClUmOfSLtKM=;
        b=eGSEPrH81tBFpMfAbK0BAXrVzr7V7gufqKF1agXx2Y/ZsY6p+bVuwQWcDTpl6eLwiA
         sCHp1nR3qeMT4Z9cXz3iOsEv8rlxdAfRurU5m1Bh7Dk6GUMo14ugIUrJKJPXp5icYBlo
         sQhUXfHkAGbMUsVp68kXGBYghxhapPMFbj93LIQNdktpAgnoDbjn+NbQ8q72JSNwXenl
         Ooe6Z6OKVB0x9h9Y4jCZrEu8vpjn7O3eQTJS/lHm+eO8hGCitTVf+GnvIB7eNhd26mUf
         y2neRWStUC0wPVX19cgJ2JVzSBhsV0XOM2iE/fFgeeMAcNtWN8oQTIXuzafEWORZfr5e
         DxNw==
X-Gm-Message-State: AOAM531d7i1i39avuArpw1A+2Sd1FUOGmnVhvBMY99ZaU/KJDOV0GcKK
	dGor5VczJ+PCsfuHMXycu8rF7Nr+8rpPfykXTPSZUQ==
X-Google-Smtp-Source: ABdhPJyxXtFU6wTNSmPr/K/UqiYhflkBRv766N5h3A0FCDB73zz+cNYgHirdtm+v6O8G8Fv+KWZWKlNrXV5GKATjlGM=
X-Received: by 2002:a6b:dc17:: with SMTP id s23mr5123677ioc.170.1610740465924;
 Fri, 15 Jan 2021 11:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20210107215121.3901938-1-gmouse@google.com> <CADVsX8-dMLvuccRjzU73=-reDjEBRq5PZZ+S6ZeugSvTy-iqog@mail.gmail.com>
 <CADVsX8924shMc+PFUQ6jsmnUqsF+VAeRfn0xM+4G406EgvGFCg@mail.gmail.com>
 <63d70805b829d08faf3e73865ed7f9c2ad9a1366.camel@linuxfoundation.org>
 <CADVsX89HCqKYNOyDMK1czkfaOw_TdrwVLK=bi_RanOKgDd=ZuQ@mail.gmail.com>
 <bfb21f1ec874e5d9638885885eb2530104c28ac5.camel@linuxfoundation.org>
 <3810611592a344cbaeb1b907e150c2c5@XBOX03.axis.com> <CADVsX8_otuGr+Ct3pAWHmSAPwEGgXMxpA8=qUdQ1N3-Z1S+nsg@mail.gmail.com>
 <05fabb770ffbd897dfb0771efc9ed62c7637fa89.camel@linuxfoundation.org> <dd7b90af3a41bd76856c1610309e7657336db343.camel@linuxfoundation.org>
In-Reply-To: <dd7b90af3a41bd76856c1610309e7657336db343.camel@linuxfoundation.org>
From: "Anton Kachalov" <rnouse@google.com>
Date: Fri, 15 Jan 2021 20:54:14 +0100
Message-ID: <CADVsX8_czjA4pVQ=WqG3WzSsNzphXz5bOVnZ5Pa=y2Pk85wYuA@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH] bitbake: remove /usr from pseudo ignore paths
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004c5e8b05b8f5bd5d"

--0000000000004c5e8b05b8f5bd5d
Content-Type: text/plain; charset="UTF-8"

Perhaps, I'm doing something wrong, but setting this variable in
build/conf/local.conf makes packages fail to build (do_install): only those
which fail with pseudo before (linux-libc-headers and base-files).

On Fri, 15 Jan 2021 at 18:15, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-01-15 at 17:09 +0000, Richard Purdie wrote:
> > On Fri, 2021-01-15 at 18:04 +0100, Anton Kachalov wrote:
> > > nope, setting the entire PSEUDO_IGNORE_PATHS without "/usr" doesn't
> > > work. The do_install task fails with error code 134 without any log
> > > file. Neither temp/run.do_install file exists. The pseudo.log doesn't
> > > have any errors.
> >
> > Right, Peter is correct and _remove is space delimited, the variable is
> > comma delimited. Sorry, I'm getting confused.
> >
> > There is the rather uglier:
> >
> > PSEUDO_IGNORE_PATHS :=
> "${@d.getVar('PSEUDO_IGNORE_PATHS').replace('/usr/,','')}"
> >
> > which should work (I did test this time!).
>
> Thinking more, this is safer:
>
> PSEUDO_IGNORE_PATHS := "${@d.getVar('PSEUDO_IGNORE_PATHS',
> False).replace('/usr/,','')}"
>
> I did test it parses and gave the right value with bitbake -e however I
> not expanding it will be much safer as I suspect the first version
> won't work in recipe context at build time.
>
> Cheers,
>
> Richard
>
>

--0000000000004c5e8b05b8f5bd5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Perhaps, I&#39;m doing something=C2=A0wrong, but setting t=
his variable in build/conf/local.conf makes packages fail to build (do_inst=
all): only those which fail=C2=A0with pseudo before (linux-libc-headers and=
 base-files).</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, 15 Jan 2021 at 18:15, Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Fri, 2021-01-15 at 17:09 +0000, Richard Purdie wrote:<br>
&gt; On Fri, 2021-01-15 at 18:04 +0100, Anton Kachalov wrote:<br>
&gt; &gt; nope, setting the entire PSEUDO_IGNORE_PATHS without &quot;/usr&q=
uot; doesn&#39;t<br>
&gt; &gt; work. The do_install task fails with error code 134 without any l=
og<br>
&gt; &gt; file. Neither temp/run.do_install file exists. The pseudo.log doe=
sn&#39;t<br>
&gt; &gt; have any errors.<br>
&gt; <br>
&gt; Right, Peter is correct and _remove is space delimited, the variable i=
s<br>
&gt; comma delimited. Sorry, I&#39;m getting confused.<br>
&gt; <br>
&gt; There is the rather uglier:<br>
&gt; <br>
&gt; PSEUDO_IGNORE_PATHS :=3D &quot;${@d.getVar(&#39;PSEUDO_IGNORE_PATHS&#3=
9;).replace(&#39;/usr/,&#39;,&#39;&#39;)}&quot;<br>
&gt; <br>
&gt; which should work (I did test this time!).<br>
<br>
Thinking more, this is safer:<br>
<br>
PSEUDO_IGNORE_PATHS :=3D &quot;${@d.getVar(&#39;PSEUDO_IGNORE_PATHS&#39;, F=
alse).replace(&#39;/usr/,&#39;,&#39;&#39;)}&quot;<br>
<br>
I did test it parses and gave the right value with bitbake -e however I<br>
not expanding it will be much safer as I suspect the first version<br>
won&#39;t work in recipe context at build time.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000004c5e8b05b8f5bd5d--
