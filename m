Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A54C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 11:11:09 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.4900.1642590667972444687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 03:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sgk+0XZM;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id m90so3842901uam.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 03:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F+0zx8z+MC/Tve5kuKqzZvg8Tb0WtrGoLnDtTKNWrJ4=;
        b=Sgk+0XZMTHJ7YhVcJq2SP4LdJ15Mk8urXnZ6fyxfXVvCHQL83aG/UJZXI0qV0s+JOe
         1CSGtvzYB7m5C0nRyLZxas8RUPi5u6Ym46ystRDrQN0+99Yo28eikTD4EagDsUIO+NWw
         FlhJN53sUMja9RpYgDljMkj7f+q8k0JnOiliK/UKtbe2wnPn4PodDhqY2bArBY1iOwVZ
         GgR3zp+uvy4v6CsLChJ9U4Nzo/T6lqOWZHfMTSP0uCGGrBDZwhYWwAwqx5ZhUNUE7iYy
         Fqr9b5m2ik+QnJmkkR8RjqRMDRxZYz6GkqS+nVRc6+HTD34f9lFCGu7og3VZ/5+K9hpI
         TAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F+0zx8z+MC/Tve5kuKqzZvg8Tb0WtrGoLnDtTKNWrJ4=;
        b=WvzDREq8kdUmLfWckT877QgvnEWpPRQus9rtEpEBGgUhw1ZoadVPGZBULnJV8M7DC2
         +erZkA93scUYbIx2J1M64tHPTj96pbXbah9Imd3ZLnGmhhL4DiPfAT7OvEsoL0XDuMNm
         gtLm2hoOAlMIvXmzMxxMEmsZ6/CA5f7xLdap2avZNdleXH+spLznsf59ywNDTnm67B1e
         p2usXAa2XuTu00hPqGmNNyxFRNKpsU29Wy6pf8mZnlgtO77u/lkyjwZeyrNkLFP2GBfe
         nOpDVJ8laGgVz7HHitpQZzXBSvbr9ItkJHpTK19/wLwZWP6audmsGOjfkNpx37lRWobj
         +Y/g==
X-Gm-Message-State: AOAM5306XcEMz+4Qc/K2h/1Tq6sjI/VEz8OhubihGsad7dvsC519ldla
	uuDNVuBaXLaEIsWUjUk0oHIHOmZdHU4INyc3iRA=
X-Google-Smtp-Source: 
 ABdhPJydMhIbNeq0A9VXO3rv2GuevrZAh0Z3VuVtF3inQfOFgN3wbyOe4OJF0+LpjP/XRZOvPwCylXiJ8U35ouFSUOs=
X-Received: by 2002:a67:d706:: with SMTP id p6mr8650535vsj.80.1642590667039;
 Wed, 19 Jan 2022 03:11:07 -0800 (PST)
MIME-Version: 1.0
References: <20220118013139.62641-1-changhyeok.bae@gmail.com>
 <CAMKF1srwct2MrLnRnL=vfUJDpZ_wjsGKWpWjX_V0G+UpTbTWoA@mail.gmail.com>
 <acceb76c7b8b83fa32f4a7ba7685b342848c468e.camel@linuxfoundation.org>
In-Reply-To: 
 <acceb76c7b8b83fa32f4a7ba7685b342848c468e.camel@linuxfoundation.org>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Wed, 19 Jan 2022 12:10:56 +0100
Message-ID: 
 <CACrLJgCkDUr_9b=wxUZ+=9CQeH=Swb6EWWvp0jXv+KmO9GhTsw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] iproute2: update 5.15.0 to 5.16.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000038686605d5ed7121"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 11:11:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160733

--00000000000038686605d5ed7121
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you.

2022=EB=85=84 1=EC=9B=94 19=EC=9D=BC (=EC=88=98) 11:41, Richard Purdie <ric=
hard.purdie@linuxfoundation.org>=EB=8B=98=EC=9D=B4
=EC=9E=91=EC=84=B1:

> On Tue, 2022-01-18 at 10:54 -0800, Khem Raj wrote:
> > On Mon, Jan 17, 2022 at 5:31 PM Changhyeok Bae <changhyeok.bae@gmail.co=
m>
> wrote:
> > >
> > > 0001-lib-fix-ax25.h-include-for-musl.patch is the fix for musl and
> comes
> > > from upstream.
> > >
> > > Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> > > ---
> > >  ...0001-lib-fix-ax25.h-include-for-musl.patch | 37 +++++++++++++++++=
++
> > >  ...{iproute2_5.15.0.bb =3D> iproute2_5.16.0.bb} |  3 +-
> > >  2 files changed, 39 insertions(+), 1 deletion(-)
> > >  create mode 100644
> meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-f=
or-musl.patch
> > >  rename meta/recipes-connectivity/iproute2/{iproute2_5.15.0.bb =3D>
> iproute2_5.16.0.bb} (64%)
> > >
> > > diff --git
> a/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include=
-for-musl.patch
> b/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include=
-for-musl.patch
> > > new file mode 100644
> > > index 0000000000..338def399e
> > > --- /dev/null
> > > +++
> b/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include=
-for-musl.patch
> > > @@ -0,0 +1,37 @@
> > > +From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:00 20=
01
> > > +From: Sam James <sam@gentoo.org>
> > > +Date: Thu, 13 Jan 2022 08:14:13 +0000
> > > +Subject: [PATCH] lib: fix ax25.h include for musl
> > > +
> > > +ax25.h isn't guaranteed to be avilable in netax25/*;
> > > +it's dependent on our choice of libc (it's not available
> > > +on musl at least) [0].
> > > +
> > > +Let's use the version from linux-headers.
> > > +
> > > +[0] https://sourceware.org/glibc/wiki/Synchronizing_Headers
> > > +Bug: https://bugs.gentoo.org/831102
> > > +
> > > +Signed-off-by: Sam James <sam@gentoo.org>
> > > +Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> > > +
> > > +Upstream-Status: Backport
> >
> > please mention
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=
=3D8bced38a941a181f1468fa39541e872e51b6022f
> > here to point to backport link from upstream
>
> Thanks, I tweaked the patch to add that.
>
> Cheers,
>
> Richard
>
> --
Thanks
Changhyeok

--00000000000038686605d5ed7121
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you.</div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">2022=EB=85=84 1=EC=9B=94 19=EC=9D=BC (=EC=
=88=98) 11:41, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;=EB=8B=98=EC=9D=B4 =
=EC=9E=91=EC=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 2022-01=
-18 at 10:54 -0800, Khem Raj wrote:<br>
&gt; On Mon, Jan 17, 2022 at 5:31 PM Changhyeok Bae &lt;<a href=3D"mailto:c=
hanghyeok.bae@gmail.com" target=3D"_blank">changhyeok.bae@gmail.com</a>&gt;=
 wrote:<br>
&gt; &gt; <br>
&gt; &gt; 0001-lib-fix-ax25.h-include-for-musl.patch is the fix for musl an=
d comes<br>
&gt; &gt; from upstream.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Changhyeok Bae &lt;<a href=3D"mailto:changhyeok.ba=
e@gmail.com" target=3D"_blank">changhyeok.bae@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...0001-lib-fix-ax25.h-include-for-musl.patch | 37 ++++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 ...{<a href=3D"http://iproute2_5.15.0.bb" rel=3D"noreferrer=
" target=3D"_blank">iproute2_5.15.0.bb</a> =3D&gt; <a href=3D"http://iprout=
e2_5.16.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_5.16.0.bb</a>} =
|=C2=A0 3 +-<br>
&gt; &gt;=C2=A0 2 files changed, 39 insertions(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-connectivity/iproute2/iprou=
te2/0001-lib-fix-ax25.h-include-for-musl.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-connectivity/iproute2/{<a href=3D"http:=
//iproute2_5.15.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_5.15.0.=
bb</a> =3D&gt; <a href=3D"http://iproute2_5.16.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">iproute2_5.16.0.bb</a>} (64%)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-lib=
-fix-ax25.h-include-for-musl.patch b/meta/recipes-connectivity/iproute2/ipr=
oute2/0001-lib-fix-ax25.h-include-for-musl.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..338def399e<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax=
25.h-include-for-musl.patch<br>
&gt; &gt; @@ -0,0 +1,37 @@<br>
&gt; &gt; +From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Sam James &lt;<a href=3D"mailto:sam@gentoo.org" target=3D"=
_blank">sam@gentoo.org</a>&gt;<br>
&gt; &gt; +Date: Thu, 13 Jan 2022 08:14:13 +0000<br>
&gt; &gt; +Subject: [PATCH] lib: fix ax25.h include for musl<br>
&gt; &gt; +<br>
&gt; &gt; +ax25.h isn&#39;t guaranteed to be avilable in netax25/*;<br>
&gt; &gt; +it&#39;s dependent on our choice of libc (it&#39;s not available=
<br>
&gt; &gt; +on musl at least) [0].<br>
&gt; &gt; +<br>
&gt; &gt; +Let&#39;s use the version from linux-headers.<br>
&gt; &gt; +<br>
&gt; &gt; +[0] <a href=3D"https://sourceware.org/glibc/wiki/Synchronizing_H=
eaders" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/glibc/w=
iki/Synchronizing_Headers</a><br>
&gt; &gt; +Bug: <a href=3D"https://bugs.gentoo.org/831102" rel=3D"noreferre=
r" target=3D"_blank">https://bugs.gentoo.org/831102</a><br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Sam James &lt;<a href=3D"mailto:sam@gentoo.org" t=
arget=3D"_blank">sam@gentoo.org</a>&gt;<br>
&gt; &gt; +Signed-off-by: Stephen Hemminger &lt;<a href=3D"mailto:stephen@n=
etworkplumber.org" target=3D"_blank">stephen@networkplumber.org</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport<br>
&gt; <br>
&gt; please mention <a href=3D"https://git.kernel.org/pub/scm/network/iprou=
te2/iproute2.git/commit/?id=3D8bced38a941a181f1468fa39541e872e51b6022f" rel=
=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/network/ip=
route2/iproute2.git/commit/?id=3D8bced38a941a181f1468fa39541e872e51b6022f</=
a><br>
&gt; here to point to backport link from upstream<br>
<br>
Thanks, I tweaked the patch to add that.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Thanks<div>Changhyeok</=
div></div></div>

--00000000000038686605d5ed7121--

