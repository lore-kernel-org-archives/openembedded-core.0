Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.29359.1595771898352353176
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 06:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uOnWr9g5;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id di5so6221343qvb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 06:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Emn8rPZpq9O3XEAvXBAlBUxcRPCY4wDi3SOxh+ktOzM=;
        b=uOnWr9g5XvX4V/JtzGiR/EorXHpDZ4Qp3CAxmMyuJC+3sg1ypwTGvuR1ecXNMcuNX8
         YxNJ5ZcYXcwKMF7mzJhfsuKzXCPI+dkCDDytyxPFgWVDPlXA9Cy5QVg+dS6yL+y7C70E
         kkWtC073PTcZUVLmVl5UIm9HnJPJr1rdTkFfgjH7PbdQPaC34hBIPxaetHc+vxhtGpaL
         fyU2uCYmtarQ20kJBZ9fhHlOfoO3joLacs7Fv1unkqPXn/znQkLPCladHNkCNQO+uMw5
         5rtPYmYUiEl6StvdA0lJC6EBxC1sNakOBzBp0Mpt/iNp2pLRGbjzMnLemGb9LwL65JFk
         6DuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Emn8rPZpq9O3XEAvXBAlBUxcRPCY4wDi3SOxh+ktOzM=;
        b=mO0OiF2w6EzdO7/3UHtjy5qodVUiB1rJUcDYydbmVPKyHAfSMr77OnnN1Biq0yutqY
         fFdQi21m9+35CV0M6oX9vcAnwNVC2KPDtJRUT4JNB6HH+2toLVk1webztJHAlZw07/By
         yNYSwXFi2MUJCHZJdQa8pYyNhVr5onsy8lzicAtN5jnkCC3HO3BeuFniTwkDF5XP1nrK
         6hmWVEMVDyqSvTNjNx5c/AnSyClv2L1pQ/fgxCz+nnTZgnb3VfyCqi5SBtU2gGjSYoU0
         eOLFrzz+HvbT7ZAESMgIX1Rv7I1hBQlYG6/WT9uKa4l9jGTYq3W1/CwqeVAqRYFSSjRl
         IDuQ==
X-Gm-Message-State: AOAM532UxV3qUIdTV0GikiqFWz3h2hS+k+MgjORtGbUIQLC+EwKP8Dqa
	8DYXbcp+9iU6w0XP4JbC96cuYZfkEFJyHaMKirc=
X-Google-Smtp-Source: ABdhPJx6SSS/A6A/+2Cf/FqjOGPMjOn/BQl/PlZrlP9zerwbc5YK8ccfx7wlQQgZZFtPoiAkwkCKHt26sguT1IxiPxw=
X-Received: by 2002:a05:6214:18f:: with SMTP id q15mr18805354qvr.23.1595771897452;
 Sun, 26 Jul 2020 06:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200725153705.127723-1-raj.khem@gmail.com> <21b69e046379ce7d55e0dfacd42d6e77d175d23b.camel@linuxfoundation.org>
In-Reply-To: <21b69e046379ce7d55e0dfacd42d6e77d175d23b.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 26 Jul 2020 06:58:06 -0700
Message-ID: <CAMKF1soPti8cfhEkWC8Yq28vQ7cAzrR5iwxahERXB4vixA_4xg@mail.gmail.com>
Subject: Re: [OE-core] [RFT][PATCH] glibc: Upgrade to upcoming 2.32
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000171b5305ab58992e"

--000000000000171b5305ab58992e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Richard I will see if I can reproduce the ppc issue locally and see
what could be the problem

On Sun, Jul 26, 2020 at 1:22 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2020-07-25 at 08:37 -0700, Khem Raj wrote:
> > Drop 0001-localedef-Add-hardlink-resolver-to-build.patch as its
> > applied
> > to localedef upstream
> >
> > Drop CVE patches which are already part of 2.32 release
> >
> > Drop unused attribute patch as its fixed differently in 2.32
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Doesn't look too bad however both qemuppc and qemuppc-alt builds are
> hanging building gobject-introspection while running:
>
> qemu-ppc -r 3.2.0 -cpu 7400 -L
> /home/pokybuild/yocto-worker/qemuppc/build/build/tmp/work/ppc7400-poky-li=
nux/gobject-introspection/1.64.1-r0/recipe-sysroot
> -E
> LD_LIBRARY_PATH=3D/home/pokybuild/yocto-worker/qemuppc/build/build/tmp/wo=
rk/ppc7400-poky-linux/gobject-introspection/1.64.1-r0/build/.libs:.libs:/ho=
me/pokybuild/yocto-worker/qemuppc/build/build/tmp/work/ppc7400-poky-linux/g=
object-introspection/1.64.1-r0/recipe-sysroot//usr/lib:/home/pokybuild/yoct=
o-worker/qemuppc/build/build/tmp/work/ppc7400-poky-linux/gobject-introspect=
ion/1.64.1-r0/recipe-sysroot//lib
> /home/pokybuild/yocto-worker/qemuppc/build/build/tmp/work/ppc7400-poky-li=
nux/gobject-introspection/1.64.1-r0/build/tmp-introspectng7y7pc4/GLib-2.0
> --introspect-dump=3D/home/pokybuild/yocto-worker/qemuppc/build/build/tmp/=
work/ppc7400-poky-linux/gobject-introspection/1.64.1-r0/build/tmp-introspec=
tng7y7pc4/functions.txt,/home/pokybuild/yocto-worker/qemuppc/build/build/tm=
p/work/ppc7400-poky-linux/gobject-introspection/1.64.1-r0/build/tmp-introsp=
ectng7y7pc4/dump.xml
>
> (https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/743
>  and
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/2199)
>
> Also, qemumips failed with a date issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/754
>
> not sure if that is related to this patch or not. Its rerunning to get
> a second opinion:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/754
>
> There were also two perl failures but I don't think those are from this
> patch.
>
> Cheers,
>
> Richard
>
>

--000000000000171b5305ab58992e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Thanks=C2=A0Richard I will see if I can reproduce th=
e ppc issue locally and see what could be the=C2=A0problem</div></div><div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun=
, Jul 26, 2020 at 1:22 AM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Sat, 2020-07-25 at 08:37 -0700, K=
hem Raj wrote:<br>
&gt; Drop 0001-localedef-Add-hardlink-resolver-to-build.patch as its<br>
&gt; applied<br>
&gt; to localedef upstream<br>
&gt; <br>
&gt; Drop CVE patches which are already part of 2.32 release<br>
&gt; <br>
&gt; Drop unused attribute patch as its fixed differently in 2.32<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
Doesn&#39;t look too bad however both qemuppc and qemuppc-alt builds are<br=
>
hanging building gobject-introspection while running:<br>
<br>
qemu-ppc -r 3.2.0 -cpu 7400 -L /home/pokybuild/yocto-worker/qemuppc/build/b=
uild/tmp/work/ppc7400-poky-linux/gobject-introspection/1.64.1-r0/recipe-sys=
root -E LD_LIBRARY_PATH=3D/home/pokybuild/yocto-worker/qemuppc/build/build/=
tmp/work/ppc7400-poky-linux/gobject-introspection/1.64.1-r0/build/.libs:.li=
bs:/home/pokybuild/yocto-worker/qemuppc/build/build/tmp/work/ppc7400-poky-l=
inux/gobject-introspection/1.64.1-r0/recipe-sysroot//usr/lib:/home/pokybuil=
d/yocto-worker/qemuppc/build/build/tmp/work/ppc7400-poky-linux/gobject-intr=
ospection/1.64.1-r0/recipe-sysroot//lib /home/pokybuild/yocto-worker/qemupp=
c/build/build/tmp/work/ppc7400-poky-linux/gobject-introspection/1.64.1-r0/b=
uild/tmp-introspectng7y7pc4/GLib-2.0 --introspect-dump=3D/home/pokybuild/yo=
cto-worker/qemuppc/build/build/tmp/work/ppc7400-poky-linux/gobject-introspe=
ction/1.64.1-r0/build/tmp-introspectng7y7pc4/functions.txt,/home/pokybuild/=
yocto-worker/qemuppc/build/build/tmp/work/ppc7400-poky-linux/gobject-intros=
pection/1.64.1-r0/build/tmp-introspectng7y7pc4/dump.xml<br>
<br>
(<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/107/bui=
lds/743" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/107/builds/743</a><br>
=C2=A0and <br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/63/build=
s/2199" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/63/builds/2199</a>)<br>
<br>
Also, qemumips failed with a date issue:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/102/buil=
ds/754" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/102/builds/754</a><br>
<br>
not sure if that is related to this patch or not. Its rerunning to get<br>
a second opinion:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/102/buil=
ds/754" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/102/builds/754</a><br>
<br>
There were also two perl failures but I don&#39;t think those are from this=
<br>
patch.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000171b5305ab58992e--
