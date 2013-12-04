Return-Path: <iyadkq@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id E8DFB6D761
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 23:27:47 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id lc6so12462386vcb.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 15:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ebYjqypbHBs+Y6qxE0QfildVNRyk7JRix1dnSVKEbP4=;
	b=AYW39H0kEwDHPY6VRFLMBDbRV6eii6DIERs1JHM15ErHN64o6Vf3bbJNNeNGdLcNQc
	vPVZPZU6hrbIMhWiwlP5d/hFgPaIUtsWV86d0Fh4tDH+oKmAIzBGqn3BKlLQVGdQSXoN
	aZDXDG0/CvEpHgFZ4Q+AmHP2ft18uu2u+KOP2qIn1q1GvEWMPMC1+JYF2t12Q99ijwQc
	EK6aRv3FGNmOW4i8DXu67fIXBa8sOL4d23mTj3iF9UnTXaZpPp52xDa/+obfPmCaNXGg
	lA6qmq9k9yuLJyqxTUBpt13Pw1LhEFn8OMwqpNE22ZwOmi3Jl1zv+t/RCO9e1hpsTl9y
	EkyA==
MIME-Version: 1.0
X-Received: by 10.52.169.227 with SMTP id ah3mr109571vdc.45.1386199667006;
	Wed, 04 Dec 2013 15:27:47 -0800 (PST)
Received: by 10.220.230.195 with HTTP; Wed, 4 Dec 2013 15:27:46 -0800 (PST)
In-Reply-To: <CADL+O9su6+2_COr7J5eHWZjPD1Vwh6NjoMT-Ga1hjabvb7icgw@mail.gmail.com>
References: <1386176874-4286-1-git-send-email-iyadkq@gmail.com>
	<1386176874-4286-2-git-send-email-iyadkq@gmail.com>
	<20131204174349.GI3714@jama>
	<CADL+O9su6+2_COr7J5eHWZjPD1Vwh6NjoMT-Ga1hjabvb7icgw@mail.gmail.com>
Date: Wed, 4 Dec 2013 15:27:46 -0800
Message-ID: <CADL+O9uKOgJ1WELK8FhCRF8qkOwBazPqZhw39jxLJev-yYsTNA@mail.gmail.com>
From: Iyad Qumei <iyadkq@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] icecc-create-env: Upgrade script
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
X-List-Received-Date: Wed, 04 Dec 2013 23:27:49 -0000
Content-Type: multipart/alternative; boundary=089e0160bd36bd929804ecbdc243

--089e0160bd36bd929804ecbdc243
Content-Type: text/plain; charset=ISO-8859-1

After more thinking about this, and rebuilding.  I do see both issues.
Although I did successful build last night, which I still do, quilt-native
guilt find, and icecc-create-env in sysroot is the correct version.  The
difference is how I issued the build core-minimal-image vs quilt-native and
icecc-create-env-native.

I will reinstate both definitions to the recipe. Sorry for the
misunderstanding.


>
> >  DEPENDS = ""
> >  INHIBIT_DEFAULT_DEPS = "1"
> >
> > -FILESPATH = "${FILE_DIRNAME}/${PN}/"
> > -
>
> You cannot drop it without moving file to BPN (see
>
> http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087239.html
>
)
> >  inherit native
> >
> > -PATCHTOOL = "patch"
>
> You cannot drop it without causing dependency loop (see
>
> http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087239.html
>
>
)
>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

>
l

--089e0160bd36bd929804ecbdc243
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
 class=3D"gmail_quote"><div class=3D"im"><div>After more thinking about thi=
s, and rebuilding.=A0 I do see both issues.=A0 Although I did successful bu=
ild last night, which I still do, quilt-native guilt find, and icecc-create=
-env in sysroot is the correct version.=A0 The difference is how I issued t=
he build core-minimal-image vs quilt-native and icecc-create-env-native.<br=
>
<br></div><div>I will reinstate both definitions to the recipe. Sorry for t=
he misunderstanding.<br></div></div><div>=A0<br></div><div class=3D"im"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">

<div><br>
&gt; =A0DEPENDS =3D &quot;&quot;<br>
&gt; =A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt;<br>
&gt; -FILESPATH =3D &quot;${FILE_DIRNAME}/${PN}/&quot;<br>
&gt; -<br>
<br>
</div>You cannot drop it without moving file to BPN (see<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2013-D=
ecember/087239.html" target=3D"_blank">http://lists.openembedded.org/piperm=
ail/openembedded-core/2013-December/087239.html</a> <br></blockquote></div>
<div class=3D"im"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">

<div>)<br>
&gt; =A0inherit native<br>
&gt;<br>
&gt; -PATCHTOOL =3D &quot;patch&quot;<br>
<br>
</div>You cannot drop it without causing dependency loop (see<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2013-D=
ecember/087239.html" target=3D"_blank">http://lists.openembedded.org/piperm=
ail/openembedded-core/2013-December/087239.html</a>=A0<br></blockquote></di=
v>
<div class=3D"im"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
)<br>
<div><br></div>
<span><font color=3D"#888888"><br>
--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><br></div></div>
</blockquote></div><br></div><div class=3D"gmail_extra">l <br></div></div>

--089e0160bd36bd929804ecbdc243--
