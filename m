Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.18738.1624088689435229290
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jun 2021 00:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lmphdslB;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id x22so4298385uap.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Jun 2021 00:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xKBewPXHsEgXcf1j/k8zTrMaQF+HLgf2Eb7y9njlvMM=;
        b=lmphdslBaeR6FvXsfXC2kx1xHu5UO0wUAkwFcKSyD+FM3bkJP8Lk7zzqbShPpsCSmj
         3MfelyCXLsA2FSnCCtQFsa91dvMCPOKZH84S9kRN1uBEP55IQQDAlk/HZOGOYS8Lt+kU
         Hzk3LTnfNT0E9lGRjBoxhugLDzhBuA2cRp5y+WB0lVBGsekYRsDBn0iQW7wS6HDieydG
         I2G0KqmxM+EgEV/7VtFjkqt8BjeJFtj3Bdba6NHeh1BCzVRUybao/vcYZrYz6ds7bQkA
         oah/9V9hZApxVbdlnkYVqgni+H5iH7IMqQ2iwGna5ugD0ZHnRtsa1FuNDutXt1ep79ua
         pRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xKBewPXHsEgXcf1j/k8zTrMaQF+HLgf2Eb7y9njlvMM=;
        b=TGYLrQgxhC65k+79knwcF9G/qGv2MHLHj0tawu7pYX3EY34DDYRUgHGdBRdRcMMZ3F
         1hgM0ZInmQoGOi69x1GQaxjdnvVUbjHvFt/t7Y1g8oPKdxnmF7uLf6/okmn9ajS0bcK6
         NFUJ3DeM66hv/OX+D7Df+dtNtnCB43RRCsQVlPqCKHczk6TVYYbKv+fUH4Vb5yVU3Kj9
         BBA+gf2B+oh60PJZklyobVnwzVXvmMG11ZFJ68gSq74JxYQ9e/2ujqoDtI/LQQQPjnSB
         FfULSWJfJuNgtcgtjTQgmM8aS78ekz5M2hHQa3p36tuYz5gzHBN4ytB6qJMRr3G40VNj
         v7XA==
X-Gm-Message-State: AOAM530ouH0UyOOHQ8pXWlSn8BYbHhRmKFr4W6IAOtTX+szzMS1AijZ1
	MnSMjgvB7XMLNxfk+s9tFRM3g8rO0+T3DEWGsss=
X-Google-Smtp-Source: ABdhPJw8+qmJ9IFi91iTON7WMhzAO5GoztaK3l1ar75xQYOkgQg1Agsu/yS4OkT+HAhnjIl9T2Kie4N4JZBo+5ZhbUE=
X-Received: by 2002:a9f:31b1:: with SMTP id v46mr15337170uad.22.1624088688645;
 Sat, 19 Jun 2021 00:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <1688B34361FD8BD3.6379@lists.openembedded.org> <16890800366CFBBE.20493@lists.openembedded.org>
 <1689153CED767CA8.15085@lists.openembedded.org> <CANNYZj-dOgJrNXNkTgT144RcdgGn4fDdoR47URAuSZzUTghefA@mail.gmail.com>
 <CAMKF1sr-FSHjibWVqsdaMOPPzeso3e6a+DKB0pRbnw8CJ0T4zg@mail.gmail.com>
In-Reply-To: <CAMKF1sr-FSHjibWVqsdaMOPPzeso3e6a+DKB0pRbnw8CJ0T4zg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 19 Jun 2021 09:44:36 +0200
Message-ID: <CANNYZj8syBYM7bV2LyL_0iCCVLJh8B7MKP3qbE5R5OFQC6tznw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/31] core-image-weston: bump QB_MEM to 1G in qemuarm64
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005ede8805c5199d5d"

--0000000000005ede8805c5199d5d
Content-Type: text/plain; charset="UTF-8"

Right, I'll adjust to a PACKAGECONFIG. ARM folks should investigate what
looks like a copy-on-write breakage.

Alex

On Sat, 19 Jun 2021 at 00:14, Khem Raj <raj.khem@gmail.com> wrote:

> I think we should disable this by default, its a good feature during
> development though to catch memory bugs. So please turn it into a
> PACKAGECONFIG which is disabled
> by default instead of revert.
>
> On Fri, Jun 18, 2021 at 1:49 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Sadly, I can confirm: weston swelling to double size on qemuarm64 is
> caused by this recent change in glibc:
> >
> > +EXTRA_OECONF_append_aarch64 = " --enable-memory-tagging"
> >
> > You can verify with this innocent looking program. Run 'free' while it
> is running and compare with and without tagging:
> >
> > main()
> > {
> >    for (int i=0; i<768; i++)
> >        calloc(1,262368);
> >    sleep(200);
> > }
> >
> > I'll queue a revert.
> >
> > Alex
> >
> > On Wed, 16 Jun 2021 at 16:08, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> >>
> >> It seems that mesa, for some reason, allocates a lot more RAM in
> qemuarm64 (150 Mb more or so), than it does in qemux86_64. I'll investigate.
> >>
> >> Alex
> >>
> >> On Wed, 16 Jun 2021 at 12:06, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> >>>
> >>> I'd like to take a deeper look at this, please hold.
> >>>
> >>> Alex
> >>>
> >>> On Tue, 15 Jun 2021 at 10:12, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> >>>>
> >>>> weston tests start additional compositors, other tests are also
> >>>> heavy on RAM, weston itself takes 256M with opengl enabled,
> >>>> so 512M causes OOM errors on arm64.
> >>>>
> >>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >>>> ---
> >>>>  meta/recipes-graphics/images/core-image-weston.bb | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/meta/recipes-graphics/images/core-image-weston.bb
> b/meta/recipes-graphics/images/core-image-weston.bb
> >>>> index 62305cc1ce..e332e19368 100644
> >>>> --- a/meta/recipes-graphics/images/core-image-weston.bb
> >>>> +++ b/meta/recipes-graphics/images/core-image-weston.bb
> >>>> @@ -10,3 +10,4 @@ CORE_IMAGE_BASE_INSTALL += "gtk+3-demo"
> >>>>  CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
> >>>>
> >>>>  QB_MEM = "-m 512"
> >>>> +QB_MEM_qemuarm64 = "-m 1024"
> >>>> --
> >>>> 2.31.1
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> >>>
> >>>
> >>
> >> 
> >>
>

--0000000000005ede8805c5199d5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, I&#39;ll adjust to a PACKAGECONFIG. ARM folks =
should investigate what looks like a copy-on-write breakage.</div><div><br>=
</div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat, 19 Jun 2021 at 00:14, Khem Raj &lt;<a href=
=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">I think we should disable=
 this by default, its a good feature during<br>
development though to catch memory bugs. So please turn it into a<br>
PACKAGECONFIG which is disabled<br>
by default instead of revert.<br>
<br>
On Fri, Jun 18, 2021 at 1:49 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Sadly, I can confirm: weston swelling to double size on qemuarm64 is =
caused by this recent change in glibc:<br>
&gt;<br>
&gt; +EXTRA_OECONF_append_aarch64 =3D &quot; --enable-memory-tagging&quot;=
<br>
&gt;<br>
&gt; You can verify with this innocent looking program. Run &#39;free&#39;=
 while it is running and compare with and without tagging:<br>
&gt;<br>
&gt; main()<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 for (int i=3D0; i&lt;768; i++)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 calloc(1,262368);<br>
&gt;=C2=A0 =C2=A0 sleep(200);<br>
&gt; }<br>
&gt;<br>
&gt; I&#39;ll queue a revert.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Wed, 16 Jun 2021 at 16:08, Alexander Kanavin via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; It seems that mesa, for some reason, allocates a lot more RAM in =
qemuarm64 (150 Mb more or so), than it does in qemux86_64. I&#39;ll investi=
gate.<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 16 Jun 2021 at 12:06, Alexander Kanavin via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;d like to take a deeper look at this, please hold.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Alex<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, 15 Jun 2021 at 10:12, Alexander Kanavin via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">li=
sts.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lis=
ts.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>=
&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; weston tests start additional compositors, other tests ar=
e also<br>
&gt;&gt;&gt;&gt; heavy on RAM, weston itself takes 256M with opengl enable=
d,<br>
&gt;&gt;&gt;&gt; so 512M causes OOM errors on arm64.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 meta/recipes-graphics/images/<a href=3D"http://core=
-image-weston.bb" rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb=
</a> | 1 +<br>
&gt;&gt;&gt;&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/meta/recipes-graphics/images/<a href=3D"http=
://core-image-weston.bb" rel=3D"noreferrer" target=3D"_blank">core-image-we=
ston.bb</a> b/meta/recipes-graphics/images/<a href=3D"http://core-image-wes=
ton.bb" rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a><br>
&gt;&gt;&gt;&gt; index 62305cc1ce..e332e19368 100644<br>
&gt;&gt;&gt;&gt; --- a/meta/recipes-graphics/images/<a href=3D"http://core=
-image-weston.bb" rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb=
</a><br>
&gt;&gt;&gt;&gt; +++ b/meta/recipes-graphics/images/<a href=3D"http://core=
-image-weston.bb" rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb=
</a><br>
&gt;&gt;&gt;&gt; @@ -10,3 +10,4 @@ CORE_IMAGE_BASE_INSTALL +=3D &quot;gtk+=
3-demo&quot;<br>
&gt;&gt;&gt;&gt;=C2=A0 CORE_IMAGE_BASE_INSTALL +=3D &quot;${@bb.utils.cont=
ains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;weston-xwayland matchbo=
x-terminal&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 QB_MEM =3D &quot;-m 512&quot;<br>
&gt;&gt;&gt;&gt; +QB_MEM_qemuarm64 =3D &quot;-m 1024&quot;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; 2.31.1<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div>

--0000000000005ede8805c5199d5d--
