Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8157E075
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 15:01:36 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id t1so16609823qtc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=otVAQgmr0o+lqENj1tvvEgmvDxeblJnRQIRm4F/Z+1Y=;
	b=p9+aJP3YysW87D7VdKVLxj9fyKek1Itqkqk6HRBfrmQrbQh5nMxQ5tT4x2Ot9guhSl
	/9KzH+zPjIiYdCWUxETAJqqc3YtQpRS4HsFnunoqU/928y+7cLFSH1lC08N777KFCz0L
	RshK4NS442O0ZSIsHu1m3dZbolpzPde5iZSKBBYDbYGcsLs3nYnq/MMG2msRUdjpbws6
	lNEEKfa+sqFpw0szAOIvJ1tI/PeYP37oU5IjuGYE8Z4Jr36HK3FYrGmztS6Nl9cMGhx6
	Zouxz2KX57EIrXLeEIjNwU1sjbUp/i8QeYVeVU053arZDMM5LpO2aDvxb6V9azqp3iM5
	6izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=otVAQgmr0o+lqENj1tvvEgmvDxeblJnRQIRm4F/Z+1Y=;
	b=h3D29553GkZQRfvFDCAUBJPiKkPMY7zZRCtvIbJ3MvicpFL86GrKM9j22/LSs58add
	vGh8Dvezev5B+R5My2Mvj46wSnwqrZG539RQOhlc3S12OQhSFKdOpAdmNisfx4bOPhkH
	f7dnu9hcgolIm50leroag8qFhs/oZCvtNWPLZQaS3c6vsKSTwzJT9cX1M6RVXbPyy6zY
	zAOgyAW3UQPOuUWys7kV/eRKIBV1iELEjTaYajn8fdZfVlxbtns5NL25niK2tNlHxPlb
	ojW3aBTIr9QGGSIhEwMZjDAcZ14hCVyA5uEGgqjaCNvlOt1cwdrptpIdIyWyd4IVvThk
	GZ3w==
X-Gm-Message-State: APjAAAXlcOgVYd7wV2ZMaHOLwLs2MfLQG3PF7J6wHmsB+FuM0KdhbgN7
	FPMRI7T3J9tyeqke4rVu9ntev6rUvrP0fIDWuXw=
X-Google-Smtp-Source: APXvYqy2GSyf8rBLGhSHfMr+KljacnOKW+pHSyfxPyNd98mA5a5eM+yKLpfCjtvNyg99lWlOR2CuRUq1HkWv9eg5X4o=
X-Received: by 2002:aed:3b0a:: with SMTP id p10mr41700393qte.194.1558364497135;
	Mon, 20 May 2019 08:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <1558136952-13094-1-git-send-email-alejandr@xilinx.com>
	<d77e4aca-3f48-5acf-058e-8dc3ffba5cf2@gmail.com>
	<fc518454-2565-ec27-8f0b-8c1c5832c2df@xilinx.com>
	<CAMKF1sqHGoGBJC24_Btcfk3pyV1O_QOmpqy7SzndGZNyJToD=w@mail.gmail.com>
	<f30563b2fc509da84367d21c936b83afc7a84c25.camel@linuxfoundation.org>
In-Reply-To: <f30563b2fc509da84367d21c936b83afc7a84c25.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2019 08:01:25 -0700
Message-ID: <CAMKF1sreQq_JbySZ+FX22rT+vis4VNL_UKZyDM698GcYe+2QbA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-numpy: Avoid installing copy of f2py script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2019 15:01:36 -0000
Content-Type: multipart/alternative; boundary="000000000000484e1c058953024d"

--000000000000484e1c058953024d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2019 at 7:58 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2019-05-20 at 07:52 -0700, Khem Raj wrote:
> > On Sun, May 19, 2019 at 11:56 PM Alejandro Enedino Hernandez
> > Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:
> > > Hey Khem,
> > >
> > >
> > > On 5/18/19 10:09 PM, Khem Raj wrote:
> > > >
> > > >
> > > > On 5/17/19 4:49 PM, Alejandro Enedino Hernandez Samaniego wrote:
> > > >> Both python-numpy and python3-numpy try to install the file:
> > > >>
> > > >> ${D}/${bindir}/f2py
> > > >>
> > > >> which causes an error during do_rootfs since the package
> > > manager
> > > >> complains about that.
> > > >>
> > > >> The numpy packages create basically copies of f2py script with
> > > the
> > > >> following names:
> > > >> f2py (on both)
> > > >> f2py2 (on python 2)
> > > >> f2py2.7 (on python 2)
> > > >> f2py3 (on python 3)
> > > >> f2py3.7 (on python 3)
> > > >>
> > > >> Remove the copy of f2py from python-numpy in favor of using the
> > > one
> > > >> from python3
> > > >> to avoid installation issues at do_rootfs().
> > > >>
> > > >
> > > > what if one does not install py3 ?
> > >
> > >
> > > If you only install py2, you could still execute f2py2 or f2py2.7,
> > > I'm
> > > simply
> > >
> > > favoring the py3 installation by default but it should be mostly
> > > harmless
> > >
> > > since there's still two other copies of the script with different
> > > names.
> >
> > I think it should be such that it=E2=80=99s used from py2 if py3 is not
> > installed since otherwise it might break scripts
>
> Given we're strongly favouring py3 now, I'd hope there aren't many such
> users and if there are, this might encourage them to move to py3? I'm
> not too worried about the lack of a py2 case for this as do we really
> want to add the complexity?
>
> If there are a load of py2 users and this will break things for them,
> fine but are there such users?


Yes I know people using py2 only but then they might not be using this
utility specifically so it might be okay to ignore it for now

>
>
> Cheers,
>
> Richard
>
>

--000000000000484e1c058953024d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto"><br></div></div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 20, 2019 at 7:58 AM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Mon, 2019-05-20 at 07:52 -0700, Khem Raj wrote:<br>
&gt; On Sun, May 19, 2019 at 11:56 PM Alejandro Enedino Hernandez<br>
&gt; Samaniego &lt;<a href=3D"mailto:alejandro.enedino.hernandez-samaniego@=
xilinx.com" target=3D"_blank">alejandro.enedino.hernandez-samaniego@xilinx.=
com</a>&gt; wrote:<br>
&gt; &gt; Hey Khem,<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; On 5/18/19 10:09 PM, Khem Raj wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 5/17/19 4:49 PM, Alejandro Enedino Hernandez Samaniego wr=
ote:<br>
&gt; &gt; &gt;&gt; Both python-numpy and python3-numpy try to install the f=
ile:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; ${D}/${bindir}/f2py<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; which causes an error during do_rootfs since the package=
<br>
&gt; &gt; manager <br>
&gt; &gt; &gt;&gt; complains about that.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; The numpy packages create basically copies of f2py scrip=
t with<br>
&gt; &gt; the <br>
&gt; &gt; &gt;&gt; following names:<br>
&gt; &gt; &gt;&gt; f2py (on both)<br>
&gt; &gt; &gt;&gt; f2py2 (on python 2)<br>
&gt; &gt; &gt;&gt; f2py2.7 (on python 2)<br>
&gt; &gt; &gt;&gt; f2py3 (on python 3)<br>
&gt; &gt; &gt;&gt; f2py3.7 (on python 3)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Remove the copy of f2py from python-numpy in favor of us=
ing the<br>
&gt; &gt; one <br>
&gt; &gt; &gt;&gt; from python3<br>
&gt; &gt; &gt;&gt; to avoid installation issues at do_rootfs().<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; what if one does not install py3 ?<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; If you only install py2, you could still execute f2py2 or f2py2.7=
,<br>
&gt; &gt; I&#39;m <br>
&gt; &gt; simply<br>
&gt; &gt; <br>
&gt; &gt; favoring the py3 installation by default but it should be mostly<=
br>
&gt; &gt; harmless<br>
&gt; &gt; <br>
&gt; &gt; since there&#39;s still two other copies of the script with diffe=
rent<br>
&gt; &gt; names.<br>
&gt; <br>
&gt; I think it should be such that it=E2=80=99s used from py2 if py3 is no=
t<br>
&gt; installed since otherwise it might break scripts <br>
<br>
Given we&#39;re strongly favouring py3 now, I&#39;d hope there aren&#39;t m=
any such<br>
users and if there are, this might encourage them to move to py3? I&#39;m<b=
r>
not too worried about the lack of a py2 case for this as do we really<br>
want to add the complexity?<br>
<br>
If there are a load of py2 users and this will break things for them,<br>
fine but are there such users?</blockquote><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Yes I know people using py2 only but then they might not be u=
sing this utility specifically so it might be okay to ignore it for now=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000484e1c058953024d--
