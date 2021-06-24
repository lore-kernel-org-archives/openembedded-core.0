Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.1022.1624497211540733934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 18:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=htwTYZPe;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: weaverjs@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id b3so2969186qtq.6
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 18:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=db4o5K8GPR9JDeabCLcGRrjzJ5jzvy2Ko2QIJtdAI1o=;
        b=htwTYZPecGPQIo6+eW5F47ZXJLgl6pbBrbXZBgnvrMwqlw92p4T01Jl/DqzCXMisJf
         4xjmqd4rhuVeLkps0VPETftpCHHIy9lgdxL3K/4mY4i4WKp9i2Df4vxaDR+/bl7gXnX8
         9N2wIn9jpbwUtpO9u8lyQxZ5NZ449hYEApCPmVm5ZwyzoRbrF6Ns7cGoHKOTmt3WA9L6
         qnHoSV6u/P4cRNBqhrlUubcG2vAOQQb20M7cdmUPWA0y9OQ6uM1/VuFJO+ut33WvnR4W
         NMMXHFNf2GneWYvd5tmjVKuFtf39VAIZLphysPSprQZY29QUzc1D4Xy0lPtomJKtxoNi
         kujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=db4o5K8GPR9JDeabCLcGRrjzJ5jzvy2Ko2QIJtdAI1o=;
        b=U1FoYX7xmzVRGuWCYBRq/5FSloDGBtKtYvesAerf1pxkNAwgtSHGLH3TpC4aZP1n9K
         +5lmQMxu+rCof4EaIH2fb5KWmY4upfuTHZvMHKKaa7pe+wgtLegGM5zvUCmBAhB1MNBx
         QfrgLedSJH2LM49CFiri2EYs/tcShCXtYSuFD65DWw0MsMkHdCPGmPm0Er/i1qOih5LG
         PIDd9roTKEW4xEYj5moVvLUU3duXlCCfZHd3dhjA2V9ZV/bseMqdokLXXlzZ/Up/YKOs
         OrwR2JWeh1MhLlObjQj0WxTSeqX8W7Cx9RqOCwkBQ7lYPSiZoDtbrNdYiy3mbt8EwmIT
         5ffQ==
X-Gm-Message-State: AOAM533UE63K8tAb/LMq0SlT6eGIaGa/lD6Zg8wN9+4CeTYTOrVlzZpa
	TiavDystZttXpM4M5omDQGiIk9WrJspw8d0W3X1QLyg=
X-Google-Smtp-Source: ABdhPJzlSO4nTbBqPEvWrA29K84LOcqjSTJqJzjcVUQHIYV3HCsfDUvvV6zdGyr7a7gQFmm8pdjU6mashYFOR93FuKM=
X-Received: by 2002:ac8:5383:: with SMTP id x3mr2574978qtp.278.1624497210696;
 Wed, 23 Jun 2021 18:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <1686C6B4AE0761BC.32729@lists.openembedded.org>
 <CAJGjTV_yVtjf6sW7vyapmavA=u_Lzw-sVjtiUOURV+Mhdy3O-g@mail.gmail.com> <d34b528f4516de14f2307022856191a6ff1faba7.camel@linuxfoundation.org>
In-Reply-To: <d34b528f4516de14f2307022856191a6ff1faba7.camel@linuxfoundation.org>
From: "Scott Weaver" <weaverjs@gmail.com>
Date: Wed, 23 Jun 2021 21:13:19 -0400
Message-ID: <CAJGjTV-t+iP-pkFiQYHZ+1riZXW4O5UnsZjs=JXv0+jWvXDSHg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] README.skeleton: add readme to meta-skeleton layer
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000002ea63505c578bb70"

--0000000000002ea63505c578bb70
Content-Type: text/plain; charset="UTF-8"

Thanks, Richard.
The issue noted that the distro specific update wasn't working but it's
because they tried SRC_URI_append_poky (which correctly failed) so I didn't
even think to try anything else.
My mistake. I'll make the changes you suggested.

Thanks again for your time!
Scott


On Wed, Jun 23, 2021 at 5:12 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2021-06-22 at 17:50 -0400, Scott Weaver wrote:
> > I didn't see that this patch was picked up (but maybe I'm looking in the
> wrong place) and I received the email
> > from Stephen that the issue should be moved to 3.4 M2.
> > Did I send this to the wrong mailing list or is it not the solution
> you're looking for?
> >
> > I elaborated in bugzilla on why I think just adding the readme file to
> close this issue is enough but you may
> > not have seen that comment or agree. :)
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13612
> >
> > Scott
> >
> > On Tue, Jun 8, 2021 at 9:46 PM Scott Weaver via lists.openembedded.org <
> > weaverjs=gmail.com@lists.openembedded.org> wrote:
> > > Added to satisfy the yocto-check-layer tool readme file test.
> > >
> > > [YOCTO #13612]
> > >
> > > Signed-off-by: Scott Weaver <weaverjs@gmail.com>
> > > ---
> > >  meta-skeleton/README.skeleton | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >  create mode 100644 meta-skeleton/README.skeleton
> > >
> > > diff --git a/meta-skeleton/README.skeleton
> b/meta-skeleton/README.skeleton
> > > new file mode 100644
> > > index 0000000000..25468dc87a
> > > --- /dev/null
> > > +++ b/meta-skeleton/README.skeleton
> > > @@ -0,0 +1,7 @@
> > > +meta-skeleton
> > > +=============
> > > +
> > > +The meta-skeleton layer contains example recipes and configuration
> files.
> > > +
> > > +This layer is not intended to demonstrate a Yocto Project Compatible
> software layer.
> > > +Disable the signature check when testing this layer using the
> yocto-check-layer tool.
>
> Sorry, it takes time to page in the context for this.
>
> I think we should fix meta-skeleton to work with yocto-check-layer. I
> think this
> may be relatively simple, we can change the busybox bbappend that is
> causing the
> signature failure to be 'distro' specific, e.g. something like:
>
> -SRC_URI += " \
> +SRC_URI_append_mydistro = " \
>
> and then an example is still there but it doesn't break the checks (and
> isn't
> enabled by default). We could add a comment about it being enabled by a
> custom
> distro called 'mydistro'.
>
> That change, along with your README addition should allow the layer tests
> to pass.
>
> Cheers,
>
> Richard
>
>
>

--0000000000002ea63505c578bb70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, Richard.</div><div></div><div>The issue noted=
 that the distro specific update wasn&#39;t working but it&#39;s because th=
ey tried SRC_URI_append_poky (which correctly failed) so I didn&#39;t even =
think to try anything else.</div><div>My mistake. I&#39;ll make the changes=
 you suggested.</div><div><br></div><div>Thanks again for your time!<br></d=
iv><div></div><div>Scott<br></div><div><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 23, 2021 at 5:=
12 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Tue, 2021-06-22 at 17:50 -0400, Sc=
ott Weaver wrote:<br>
&gt; I didn&#39;t see that this patch was picked up (but maybe I&#39;m look=
ing in the wrong place) and I received the email<br>
&gt; from Stephen that the issue should be moved to 3.4 M2.<br>
&gt; Did I send this to the wrong mailing list or is it not the solution yo=
u&#39;re looking for?<br>
&gt; <br>
&gt; I elaborated in bugzilla on why I think just adding the readme file to=
 close this issue is enough but you may<br>
&gt; not have seen that comment or agree. :)<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13612" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D13612</a><br>
&gt; <br>
&gt; Scott <br>
&gt; <br>
&gt; On Tue, Jun 8, 2021 at 9:46 PM Scott Weaver via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a> &lt;<br>
&gt; weaverjs=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; Added to satisfy the yocto-check-layer tool readme file test.<br>
&gt; &gt; <br>
&gt; &gt; [YOCTO #13612]<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Scott Weaver &lt;<a href=3D"mailto:weaverjs@gmail.=
com" target=3D"_blank">weaverjs@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta-skeleton/README.skeleton | 7 +++++++<br>
&gt; &gt; =C2=A01 file changed, 7 insertions(+)<br>
&gt; &gt; =C2=A0create mode 100644 meta-skeleton/README.skeleton<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-skeleton/README.skeleton b/meta-skeleton/README=
.skeleton<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..25468dc87a<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-skeleton/README.skeleton<br>
&gt; &gt; @@ -0,0 +1,7 @@<br>
&gt; &gt; +meta-skeleton<br>
&gt; &gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; +<br>
&gt; &gt; +The meta-skeleton layer contains example recipes and configurati=
on files.<br>
&gt; &gt; +<br>
&gt; &gt; +This layer is not intended to demonstrate a Yocto Project Compat=
ible software layer.<br>
&gt; &gt; +Disable the signature check when testing this layer using the yo=
cto-check-layer tool.<br>
<br>
Sorry, it takes time to page in the context for this.<br>
<br>
I think we should fix meta-skeleton to work with yocto-check-layer. I think=
 this<br>
may be relatively simple, we can change the busybox bbappend that is causin=
g the<br>
signature failure to be &#39;distro&#39; specific, e.g. something like:<br>
<br>
-SRC_URI +=3D &quot; \<br>
+SRC_URI_append_mydistro =3D &quot; \<br>
<br>
and then an example is still there but it doesn&#39;t break the checks (and=
 isn&#39;t<br>
enabled by default). We could add a comment about it being enabled by a cus=
tom<br>
distro called &#39;mydistro&#39;.<br>
<br>
That change, along with your README addition should allow the layer tests t=
o pass.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--0000000000002ea63505c578bb70--
