Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web12.2141.1588227040481700334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 23:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWzZnRJf;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id b6so1895216uak.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 23:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=z+N3nYuVfrXL1lFDUK9Pm6AnqQqRHC9+gzm3qCAhU8M=;
        b=jWzZnRJf3JwQJyf2xmVTQC7nAMhIzdQqb3QE78ZK/+v/ZWQQ2u+HYoW3LmWAfy9Bak
         gnjOLx65ssrJczizzKiro2wlUEB+zyOLjR0VOzg/plekY4Qr17hAv2U9aOkxVIxxuCaM
         Y+AvnUK0kFMy4TvXgnAax8IAVs7fLYv95mEDKWviMRU3V6NiP3TVc5Pwo6ZEmigOLM71
         42WE77Hj3zvjhPM4p7JlToUcswEut/Xozppj1tnJrboCaw1JRVwouwyLqQG8rMjF4VGv
         BSq3R85JhzRPqGpQrW0wzd3Wc1LRIrG014J1CRIwlmSojZy88pf0nNEGlhDS6xLM4+xM
         xWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=z+N3nYuVfrXL1lFDUK9Pm6AnqQqRHC9+gzm3qCAhU8M=;
        b=Js+LY/B3Ouc8AwaI+mABNw8EJqwqX1lm5DDb5manBDWS7jy/iicf3SaPU6phbpnWxV
         w/QqJv5BTxq5JdzUeABYVMoJtDNlVVkyf2YoDU2e80hCOHRk+tWl/gJL2+xjgi4C82D0
         zyLzUCLwv4wL06EsEM07b1/+hqd5eLUgv5h2OeDpESk6qVml8y5FrCb8vYRaTPqhy0ST
         9mXgPxWIU2w/DfljtT1yxYeXkJfpm6VntHVYyxcAT2kcs/jM4+qT8+550oiW+WMXbrRW
         mKeTXrnkDV7TJc+EtIKPrDYIOxnKy7lzy+lBqYf/bEtxwSa+/4emnpGULwsKgeL+IeKs
         Jclg==
X-Gm-Message-State: AGi0PuZ53rYBA5VUhg1lB4+/58dDK+oLWo0Q7eWmbU+gv+itjUzFAmvg
	TqcAqm6y8quwkRvh9+b6y4ayx/wGO5nD1D1EiXqCAQ==
X-Google-Smtp-Source: APiQypKZILd5oHJi4E4MnpL3OcFw76HVnmpZUMUp3rlTlOSpZsw2l9RptEmQIp3RVSVMA6ktWDtn42JRb998DHOyYOY=
X-Received: by 2002:a9f:31c5:: with SMTP id w5mr1121023uad.89.1588227039384;
 Wed, 29 Apr 2020 23:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200429220156.1300336-1-richard.purdie@linuxfoundation.org>
 <20200429234101.GS11927@denix.org> <CAGDS+nkG-R+zm=vO4QgffnP5tKS9LzB_17axa3gYhJmnHT7jrQ@mail.gmail.com>
In-Reply-To: <CAGDS+nkG-R+zm=vO4QgffnP5tKS9LzB_17axa3gYhJmnHT7jrQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 30 Apr 2020 08:10:28 +0200
Message-ID: <CANNYZj_aqcHzuH28iN_ySprQuhuve_9G4caTOtN-pJs4A4Sqow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: Require gcc 6 or later
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000081591b05a47bec13"

--00000000000081591b05a47bec13
Content-Type: text/plain; charset="UTF-8"

Ubuntu 16.04 will continue to be supported even with this change, you just
need to set up builtools-extended-tarball to provide a recent compiler,
which is a couple of easy commands suggested by bitbake.

Alex

On Thu 30. Apr 2020 at 2.04, Steve Sakoman <sakoman@gmail.com> wrote:

> On Wed, Apr 29, 2020 at 1:41 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> > So, this is for master, rigth? No plans to backport it to dunfell
> (hence, no
> > rpm backport either), correct? Trying to make sure Yocto LTS will still
> work
> > on Ubuntu 16.04 LTS...
>
> I have the same goal, so no plans to backport to dunfell!
>
> Steve
>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/classes/sanity.bbclass | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > > index 9e871017389..292c5591dd3 100644
> > > --- a/meta/classes/sanity.bbclass
> > > +++ b/meta/classes/sanity.bbclass
> > > @@ -527,7 +527,7 @@ def check_wsl(d):
> > >              bb.warn("You are running bitbake under WSLv2, this works
> properly but you should optimize your VHDX file eventually to avoid running
> out of storage space")
> > >      return None
> > >
> > > -# Require at least gcc version 5.0.
> > > +# Require at least gcc version 6.0.
> > >  #
> > >  # This can be fixed on CentOS-7 with devtoolset-6+
> > >  # https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
> > > @@ -541,8 +541,8 @@ def check_gcc_version(sanity_data):
> > >
> > >      build_cc, version =
> oe.utils.get_host_compiler_version(sanity_data)
> > >      if build_cc.strip() == "gcc":
> > > -        if LooseVersion(version) < LooseVersion("5.0"):
> > > -            return "Your version of gcc is older than 5.0 and will
> break builds. Please install a newer version of gcc (you could use the
> project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
> > > +        if LooseVersion(version) < LooseVersion("6.0"):
> > > +            return "Your version of gcc is older than 6.0 and will
> break builds. Please install a newer version of gcc (you could use the
> project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
> > >      return None
> > >
> > >  # Tar version 1.24 and onwards handle overwriting symlinks correctly
> > > --
> > > 2.25.1
> > >
> >
> > >
> >
> >
> 
>

--00000000000081591b05a47bec13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Ubuntu 16.04 will continue to be supported even with=
 this change, you just need to set up builtools-extended-tarball to provide=
 a recent compiler, which is a couple of easy commands suggested by bitbake=
.</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu =
30. Apr 2020 at 2.04, Steve Sakoman &lt;<a href=3D"mailto:sakoman@gmail.com=
">sakoman@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On Wed, Apr 29, 2020 at 1:41 PM Denys Dmytriyenko &lt;<a href=3D"mailto:den=
is@denix.org" target=3D"_blank">denis@denix.org</a>&gt; wrote:<br>
<br>
&gt; So, this is for master, rigth? No plans to backport it to dunfell (he=
nce, no<br>
&gt; rpm backport either), correct? Trying to make sure Yocto LTS will sti=
ll work<br>
&gt; on Ubuntu 16.04 LTS...<br>
<br>
I have the same goal, so no plans to backport to dunfell!<br>
<br>
Steve<br>
<br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.or=
g</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes/sanity.bbclass | 6 +++---<br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.b=
bclass<br>
&gt; &gt; index 9e871017389..292c5591dd3 100644<br>
&gt; &gt; --- a/meta/classes/sanity.bbclass<br>
&gt; &gt; +++ b/meta/classes/sanity.bbclass<br>
&gt; &gt; @@ -527,7 +527,7 @@ def check_wsl(d):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Yo=
u are running bitbake under WSLv2, this works properly but you should optim=
ize your VHDX file eventually to avoid running out of storage space&quot;)<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return None<br>
&gt; &gt;<br>
&gt; &gt; -# Require at least gcc version 5.0.<br>
&gt; &gt; +# Require at least gcc version 6.0.<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 # This can be fixed on CentOS-7 with devtoolset-6+<br>
&gt; &gt;=C2=A0 # <a href=3D"https://www.softwarecollections.org/en/scls/r=
hscl/devtoolset-6/" rel=3D"noreferrer" target=3D"_blank">https://www.softwa=
recollections.org/en/scls/rhscl/devtoolset-6/</a><br>
&gt; &gt; @@ -541,8 +541,8 @@ def check_gcc_version(sanity_data):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 build_cc, version =3D oe.utils.get_host_comp=
iler_version(sanity_data)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if build_cc.strip() =3D=3D &quot;gcc&quot;:<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if LooseVersion(version) &lt; Loose=
Version(&quot;5.0&quot;):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;Your ver=
sion of gcc is older than 5.0 and will break builds. Please install a newer=
 version of gcc (you could use the project&#39;s buildtools-extended-tarbal=
l or use scripts/install-buildtools).\n&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if LooseVersion(version) &lt; Loose=
Version(&quot;6.0&quot;):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;Your ver=
sion of gcc is older than 6.0 and will break builds. Please install a newer=
 version of gcc (you could use the project&#39;s buildtools-extended-tarbal=
l or use scripts/install-buildtools).\n&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return None<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # Tar version 1.24 and onwards handle overwriting symlinks=
 correctly<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000081591b05a47bec13--
