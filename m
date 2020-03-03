Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id A172561927
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 14:25:51 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id x21so3689101iox.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 06:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h/87i6TUj/GfYWDpowlkMtN1dvPZELKRNhe0UYnCjhI=;
	b=r9A07ESLBZ3G+tf4tscoikIIJYEaRk5FApbUfa7bZ8Ycv4zaiVnJbVjOwU1ogkR1Ux
	znAYDCW0Ka6wzm6WB/9dfkifAPpzzGJPJwYUyv7HDVhJ32Wx1OcP0rrJstyrbhMuRoRg
	NaCwnbdPUrpFT8Qt2fRJwHup26icXUJ2N/jCK4VV1OroJfhaWI9FUSd6DPR9B99ov394
	sbuKHgBVOg/ewArp+83ypXIiAWsKQFsYPCUGU8R+UETEsipbKTaEElBoecOT1lLUqPLQ
	gS0NOrKiTmDhUvfF2wSgUHJYc7/pl2IO7fd1iWia4wS59ytLS22ilZk7yMX1FGNfPxNt
	jQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h/87i6TUj/GfYWDpowlkMtN1dvPZELKRNhe0UYnCjhI=;
	b=C1R42nXFOWGrmRdScvimCuHz/xqUO1sZOlQWrB48vuvQ6Oj8oH3sqKHZImSdiBai3Q
	8u202gZ2ZXIb28XO7s++GsZIepcpdgCSoZyIbrDQV6QawEhBnyn9M+KqWkOMK2xilS7b
	tZCT7LSIEAH9AsDEk48vEosij5jZBdINNEr0+F9z5xJn8O3tLNaHPAxFSyQFC8/EITRY
	wuq9yWhnGX++qMTq6sq3kbkbl42OpultgMPKkyCeiJin1FHoyZI12/YNHVSdvJOXsvpK
	nEPEhitCs606w3IUGJjD4qghi6Co8LlfMANeCPDTtC0KHa3fdjH12UHvNp6odmu+FOV2
	r/ng==
X-Gm-Message-State: ANhLgQ15L55gWtDugvhGcURIeZf8QE7Y1AzvRgS2RUXP4EMMHkaDrC/0
	jqLC/+BBE3QXKzRS/5TIjAwiXJN42xaEwutCxvU=
X-Google-Smtp-Source: ADFU+vsj/b+DG1nJ+HlpYiDKz9OkQPzE4b8W4vDwRqmPrbLW+SLxKhyZpuDjtz75bNxzDrRfCt3/jDwZW6modY6Ukuc=
X-Received: by 2002:a5d:9e0f:: with SMTP id h15mr4153518ioh.151.1583245552410; 
	Tue, 03 Mar 2020 06:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20200302074035.Horde.5xguZSt_-_Yd241eE1Zo8Pb@crashcourse.ca>
	<52350a7bd080413c9dbc6e1783f14e2c@XBOX03.axis.com>
In-Reply-To: <52350a7bd080413c9dbc6e1783f14e2c@XBOX03.axis.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 3 Mar 2020 06:25:41 -0800
Message-ID: <CANx9H-Ci4Rsw3WDkYdwzw1AYeZMhiHrZWkiTkHp7WG1j5hhFUQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to cleanly centralize a zillion BBCLASSEXTEND += "nativesdk" settings?
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
X-List-Received-Date: Tue, 03 Mar 2020 14:25:51 -0000
Content-Type: multipart/alternative; boundary="000000000000be6509059ff41480"

--000000000000be6509059ff41480
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 3, 2020 at 4:32 AM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> <openembedded-core-
> > bounces@lists.openembedded.org> On Behalf Of rpjday@crashcourse.ca
> > Sent: den 2 mars 2020 13:41
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] how to cleanly centralize a zillion BBCLASSEXTEND +=
> > "nativesdk" settings?
> >
> > layer i'm currently perusing has many, many bbappend files, of which
> > quite a number are nothing more than the single line:
> >
> >    BBCLASSEXTEND += "nativesdk"
> >
> > literally, at least a hundred append files are like that. so rather
> > than clutter up the layer with all those trivial .bbappend files,
> > can one cram all that into a single .conf file? as i read it, can i
> > do something like:
> >
> >    BBCLASSEXTEND_append_pn-pkg1 = " nativesdk"
> >    BBCLASSEXTEND_append_pn-pkg2 = " nativesdk"
> >    ... and on and on ...
> >
> > and toss all that into a distro.conf file or something?
> >
> >    and even if that works, is it considered good coding style?
> >
> > rday
>
> Sounds perfectly fine. We do something similar, but in our case we need
> to add "native" to BBCLASSEXTEND for a whole bunch of recipes.
>

Should patches be sent to add native and nativesdk? Drop the technical debt
by upstreaming...

>
> //Peter
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000be6509059ff41480
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 3, 2020 at 4:32 AM Peter Kjellerstedt &lt;<a hr=
ef=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; -----Original Messag=
e-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a> =
&lt;openembedded-core-<br>
&gt; <a href=3D"mailto:bounces@lists.openembedded.org" target=3D"_blank">bo=
unces@lists.openembedded.org</a>&gt; On Behalf Of <a href=3D"mailto:rpjday@=
crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a><br>
&gt; Sent: den 2 mars 2020 13:41<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: [OE-core] how to cleanly centralize a zillion BBCLASSEXTEND +=
=3D<br>
&gt; &quot;nativesdk&quot; settings?<br>
&gt; <br>
&gt; layer i&#39;m currently perusing has many, many bbappend files, of whi=
ch<br>
&gt; quite a number are nothing more than the single line:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 BBCLASSEXTEND +=3D &quot;nativesdk&quot;<br>
&gt; <br>
&gt; literally, at least a hundred append files are like that. so rather<br=
>
&gt; than clutter up the layer with all those trivial .bbappend files,<br>
&gt; can one cram all that into a single .conf file? as i read it, can i<br=
>
&gt; do something like:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 BBCLASSEXTEND_append_pn-pkg1 =3D &quot; nativesdk&quot;<b=
r>
&gt;=C2=A0 =C2=A0 BBCLASSEXTEND_append_pn-pkg2 =3D &quot; nativesdk&quot;<b=
r>
&gt;=C2=A0 =C2=A0 ... and on and on ...<br>
&gt; <br>
&gt; and toss all that into a distro.conf file or something?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 and even if that works, is it considered good coding styl=
e?<br>
&gt; <br>
&gt; rday<br>
<br>
Sounds perfectly fine. We do something similar, but in our case we need <br=
>
to add &quot;native&quot; to BBCLASSEXTEND for a whole bunch of recipes.<br=
>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Should patches b=
e sent to add native and nativesdk? Drop the technical debt by upstreaming.=
..</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br>
//Peter<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000be6509059ff41480--
