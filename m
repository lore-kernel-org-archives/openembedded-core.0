Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TdltQ-0007rJ-Eb
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 18:57:52 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so9691811iad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 09:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1baGCK3ionosGeb7Wek1/6XmHJOM/E/sXxJesARLa5Q=;
	b=W+pRvtaRX2RWSwZPoefDyUJ0bHWTFFWQ8NbkFRgtsUTdrFCzsVgiNdsFqEtum+VyQD
	DjAzFIxKc9MfElFhoXKcVPooCKVT6TdjEw9mKpwna973HdRblzOGMc7y/Ki4waUbBlCu
	35cn32lKqDbwTSBycpL+xp87J7ATN5XVZIltSCPhLwBRa9E1B2jD/jxE0lKC+cXcGJSO
	33Td7cmq6oCQnD6qJWaz9WFQvkPPpC9vLQUCJiGyuEIO+8JlMj8T9jXrW3SMhlQZD6a4
	FEBfaU/NV3n6i1KtgOHaYWPz2CmrDsZsTCvwSBkjHbu2f+5lh12IdUeOyOqPyODgab3b
	kDZA==
Received: by 10.43.92.72 with SMTP id bp8mr17767360icc.49.1354124617340; Wed,
	28 Nov 2012 09:43:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Wed, 28 Nov 2012 09:43:06 -0800 (PST)
In-Reply-To: <50B6301B.3010106@linaro.org>
References: <cover.1354116375.git.raj.khem@gmail.com>
	<50B6301B.3010106@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Nov 2012 09:43:06 -0800
Message-ID: <CAMKF1sr3h8gHmhPbjXa-VfoSfsNsmmWANyNi_Eshp+xcwv5oCw@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Upgrade binutils to 2.23.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 17:57:52 -0000
Content-Type: multipart/alternative; boundary=bcaec517c8c8cc582604cf91b4da

--bcaec517c8c8cc582604cf91b4da
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 28, 2012 at 7:39 AM, Marcin Juszkiewicz <
marcin.juszkiewicz@linaro.org> wrote:

> W dniu 28.11.2012 16:29, Khem Raj pisze:
> > This patchset updates binutils to 2.23 branch I have tested systemd-image
> > meta-toolchain and core-image-sato target with it they all built fine
> > I did not (yet) delete the 2.22 recipes since there must be some time
> > given for folks to try 2.23 in couple of weeks 2.22 recipes will move
> > out of OE-Core. Preferably deleted if need be moved into toolchain-layer
>
> I did builds for AArch64 with 2.23 and they were working fine. Will do
> 2.23.1 build as well.
>


thanks. let me know of any fallouts.


>
> Acked-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec517c8c8cc582604cf91b4da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<font><font face=3D"courier new,monospace"><br></font></font><div class=3D"=
gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Nov 28, 2012 at 7:3=
9 AM, Marcin Juszkiewicz <span dir=3D"ltr">&lt;<a href=3D"mailto:marcin.jus=
zkiewicz@linaro.org" target=3D"_blank">marcin.juszkiewicz@linaro.org</a>&gt=
;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">W dniu 28.11.2012 16:29, Khem Raj pisze:<br>
<div class=3D"im">&gt; This patchset updates binutils to 2.23 branch I have=
 tested systemd-image<br>
&gt; meta-toolchain and core-image-sato target with it they all built fine<=
br>
&gt; I did not (yet) delete the 2.22 recipes since there must be some time<=
br>
&gt; given for folks to try 2.23 in couple of weeks 2.22 recipes will move<=
br>
&gt; out of OE-Core. Preferably deleted if need be moved into toolchain-lay=
er<br>
<br>
</div>I did builds for AArch64 with 2.23 and they were working fine. Will d=
o<br>
2.23.1 build as well.<br></blockquote><div><br></div><div><br></div><div>th=
anks. let me know of any fallouts.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">


<br>
Acked-by: Marcin Juszkiewicz &lt;<a href=3D"mailto:marcin.juszkiewicz@linar=
o.org">marcin.juszkiewicz@linaro.org</a>&gt;<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br></div>

--bcaec517c8c8cc582604cf91b4da--
