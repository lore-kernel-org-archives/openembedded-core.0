Return-Path: <anibal.limon@linaro.org>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6D50D79B60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 00:38:12 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id g201so30824713vsd.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 17:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KhW55C0JI0vUZf78ncGTbAYGob23XSTcdxjiwIer6Ik=;
	b=CIMYI78Z0aXwNP80FbSVtwGevX4NdYzR4Fjwqa/3ZrKWCXKMYH5Cf6W2tlnXaMj3Bw
	5/JRProIeZKP1spYsUpVjrDj07cg7jmUBGhcSXlhAGysDpxDlFOlm783iKd1BRrinSsC
	2kg4wBS7HBwYRkrKIdlOcmla4ooeF5ahMxEB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KhW55C0JI0vUZf78ncGTbAYGob23XSTcdxjiwIer6Ik=;
	b=jOkt2fIM8jU1nmXErOz+SLH/I7RVzUYV3pSWBHSXrH7O2m+xH8moNuCYVEeZNbWRbM
	7PE8wy9frotNDUtHwS3tIcb7xmDWeAYGBojw0uL7lD+bzY9Bt1/gKWcfWObyFF0yTE40
	rOoFclt0TFF71eRCGc4VAZ/VkmD1YSaqnqaBSDWeedxpYdd8/X90HMvQUn9GzG7mElbs
	bbOnIHwUA/lDJt69I/ktDHy7XLEOv9xg8UG6lXy2aJ/x285mZVWOirZ06U3cYTlxtiK7
	xZ1iaZNsW+NVZMFLmbaKR57a6ON1bFYAr4rUQvEA9qPTMMXsCsz9w1V6L663z7bRZtCp
	oj7w==
X-Gm-Message-State: ABuFfojO2YUKp0sv4bBzZIfNoBk8mABwfEf/0HRwydFoETFQMtT8APWt
	wuvrsCVFhRi0uF4xBFLbH374r1o5nspLbe2vhue05w==
X-Google-Smtp-Source: ACcGV62gAEoqZBhG7AUG214aYfYj3jI0HzNLxCwek6Plr8yajDSa1U0saj1O33ukBSuUop8V9XQRbCiBwem593f5z0Y=
X-Received: by 2002:a67:6204:: with SMTP id w4mr19891062vsb.154.1540255093140; 
	Mon, 22 Oct 2018 17:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20181016232143.5016-1-anibal.limon@linaro.org>
	<6b883ed64458a2153437d7519adefb513556864c.camel@linuxfoundation.org>
In-Reply-To: <6b883ed64458a2153437d7519adefb513556864c.camel@linuxfoundation.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Mon, 22 Oct 2018 19:38:02 -0500
Message-ID: <CA+_AqisrOphM_bZ=jkfX1boP2aSA-8YR_bAT08EZo5RDHweLtA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/testimage.bbclass: Only validate IMAGE_FSTYPES when is QEMU
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
X-List-Received-Date: Tue, 23 Oct 2018 00:38:12 -0000
Content-Type: multipart/alternative; boundary="000000000000b0c6310578da9517"

--000000000000b0c6310578da9517
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 20 Oct 2018 at 02:11, <richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2018-10-16 at 18:21 -0500, An=C3=ADbal Lim=C3=B3n wrote:
> > When use simpleremote target the flash/boot process is executed
> > manually, the IMAGE_FSTYPES validation is only needed when execute
> > testimage against qemu.
> >
> > The supported_fstypes comes from oeqa.core.target.qemu module.
> >
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> > ---
> >  meta/classes/testimage.bbclass | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/classes/testimage.bbclass
> b/meta/classes/testimage.bbclass
> > index 2642a722e7..734cb7caae 100644
> > --- a/meta/classes/testimage.bbclass
> > +++ b/meta/classes/testimage.bbclass
> > @@ -194,12 +194,13 @@ def testimage_main(d):
> >      machine =3D d.getVar("MACHINE")
> >
> >      # Get rootfs
> > -    fstypes =3D [fs for fs in d.getVar('IMAGE_FSTYPES').split(' ')
> > -                  if fs in supported_fstypes]
> > -    if not fstypes:
> > -        bb.fatal('Unsupported image type built. Add a comptible image
> to '
> > -                 'IMAGE_FSTYPES. Supported types: %s' %
> > -                 ', '.join(supported_fstypes))
> > +    fstypes =3D d.getVar('IMAGE_FSTYPES')
> > +    if d.getVar("TEST_TARGET") =3D=3D "qemu":
> > +        fstypes =3D [fs for fs in fstypes if fs in supported_fstypes]
> > +        if not fstypes:
> > +            bb.fatal('Unsupported image type built. Add a comptible
> image to '
> > +                     'IMAGE_FSTYPES. Supported types: %s' %
> > +                     ', '.join(supported_fstypes))
> >      rootfs =3D '%s.%s' % (image_name, fstypes[0])
> >
> >      # Get tmpdir (not really used, just for compatibility)
>
> This causes the autobuilder to break and there is a bug in the logic
> above:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/32/builds/128/ste=
ps/7/logs/step1c


I'm not seeing this error, I executed testimage in qemuarm and qemux86,
I'm looking at the configuration but should not fail because I added only a
conditional to filter only
when the target is qemu.

Regards,
Anibal

>
>
> (one of many failures as everything broke)
>
> Cheers,
>
> Richard
>
>
>

--000000000000b0c6310578da9517
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat=
, 20 Oct 2018 at 02:11, &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Tue, 2018-10-16 at 18:21 -0500, An=C3=ADbal Lim=C3=
=B3n wrote:<br>
&gt; When use simpleremote target the flash/boot process is executed<br>
&gt; manually, the IMAGE_FSTYPES validation is only needed when execute<br>
&gt; testimage against qemu.<br>
&gt; <br>
&gt; The supported_fstypes comes from oeqa.core.target.qemu module.<br>
&gt; <br>
&gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.lim=
on@linaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/testimage.bbclass | 13 +++++++------<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.b=
bclass<br>
&gt; index 2642a722e7..734cb7caae 100644<br>
&gt; --- a/meta/classes/testimage.bbclass<br>
&gt; +++ b/meta/classes/testimage.bbclass<br>
&gt; @@ -194,12 +194,13 @@ def testimage_main(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 machine =3D d.getVar(&quot;MACHINE&quot;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Get rootfs<br>
&gt; -=C2=A0 =C2=A0 fstypes =3D [fs for fs in d.getVar(&#39;IMAGE_FSTYPES&#=
39;).split(&#39; &#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fs =
in supported_fstypes]<br>
&gt; -=C2=A0 =C2=A0 if not fstypes:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&#39;Unsupported image type buil=
t. Add a comptible image to &#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;IM=
AGE_FSTYPES. Supported types: %s&#39; %<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;, =
&#39;.join(supported_fstypes))<br>
&gt; +=C2=A0 =C2=A0 fstypes =3D d.getVar(&#39;IMAGE_FSTYPES&#39;)<br>
&gt; +=C2=A0 =C2=A0 if d.getVar(&quot;TEST_TARGET&quot;) =3D=3D &quot;qemu&=
quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fstypes =3D [fs for fs in fstypes if fs i=
n supported_fstypes]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not fstypes:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&#39;Unsupported i=
mage type built. Add a comptible image to &#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;IMAGE_FSTYPES. Supported types: %s&#39; %<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;, &#39;.join(supported_fstypes))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rootfs =3D &#39;%s.%s&#39; % (image_name, fstypes[=
0])<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Get tmpdir (not really used, just for compatibil=
ity)<br>
<br>
This causes the autobuilder to break and there is a bug in the logic<br>
above:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/32/build=
s/128/steps/7/logs/step1c" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/32/builds/128/steps/7/logs/ste=
p1c</a></blockquote><div><br></div><div>I&#39;m not seeing this error, I ex=
ecuted testimage in qemuarm and qemux86,=C2=A0</div><div>I&#39;m looking at=
 the configuration but should not fail because I added only a conditional t=
o filter only<br></div><div>when the target is qemu.</div><div><br></div><d=
iv>Regards,</div><div>Anibal=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
(one of many failures as everything broke)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--000000000000b0c6310578da9517--
