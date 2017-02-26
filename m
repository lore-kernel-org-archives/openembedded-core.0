Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1567C71BA0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 21:02:13 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id n127so71713901qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 13:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XyV0uIS2J+qxkcRjHC40poEaGdi1z9MyCDYxl4Pfxz4=;
	b=p+xZxrv5qVsujwfbUH9PDAYE6QpwQhc9CDJCUe1vFfrBEQKHFyxN2v54MwOynjY8Iu
	fqdqKfEy588o8bGv+Ou3nHfTyjI/DyTP9ZjF9TXMyzusD0cV5T8n96I+7AJNrixbG3Pk
	LPVVEr9tkAE1KwlOwV5ew0/peOFUKwvCfs3m9T3zk4DcagmUD733ET1pENjALNbObXjU
	6dZaeU9BsTQY8LfTLYvUL3TlU6FOoc9ddRBckMIlTXOO7bi/HvH2wViTfWIrkj6QT9hs
	AOj2WFpA3h4k+CQE3b/Ix2/m/G+Dz1fBg5c6vO5rZ7yZ3a+USgGsavpdW0ja1DTxlNLT
	69/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XyV0uIS2J+qxkcRjHC40poEaGdi1z9MyCDYxl4Pfxz4=;
	b=Px7VX2Lwf1qy5IlL5GSjt2wfBwVtBciPEzBtgLybwg17Ah/ON9lDH8kdOtKYKbRW5I
	DjTbXmTKTLoVNuNGwfC8ocMlkZB9woGzChVqBXnlBWZ0JnWK3YQTw8IECeEziJTufZpT
	kYRqRpkz4hPPbWwHDGdbrm2BNoqyoND1CNWMsjm7NpALo0+0Inc/UutkBvSC5VNRsXJI
	tbsXwqG2kGYN6bcM7PwsuITpQ40oOFEeur/f9zw65pY1/FkXaWeOyoWgPcmJ97mqUwKR
	UQ223ln6vJTAgaki6DTXJH1G1gdbhk0JVMBbqfcEL7HJ4zphQIVccaaRW16risH915Oj
	9szA==
X-Gm-Message-State: AMke39nQqSllaOSEGh5dRcnYb08gkBN19bt9m2wxpVJP5MDL9+tWWSdlOVWc8LcQA9G884SOjgd9Vu31hpUaQw==
X-Received: by 10.237.56.68 with SMTP id j62mr13516088qte.185.1488142934653;
	Sun, 26 Feb 2017 13:02:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.132.68 with HTTP; Sun, 26 Feb 2017 13:02:14 -0800 (PST)
In-Reply-To: <871sultwa4.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
References: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
	<1484089620-19725-4-git-send-email-nathan_lynch@mentor.com>
	<CADkTA4NZCsXM9eE4PyQmdsLa4sDdqawirzisZQmzw-mHZV63Qw@mail.gmail.com>
	<871sultwa4.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 26 Feb 2017 16:02:14 -0500
Message-ID: <CADkTA4P3jXb8ZHiTUjg+ToxHGK1d6hfXjRX0TvD9zdd4ywWyZA@mail.gmail.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] lttng-modules: upgrade to 2.9.0
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
X-List-Received-Date: Sun, 26 Feb 2017 21:02:14 -0000
Content-Type: multipart/alternative; boundary=001a1137ac14fef54e05497546a4

--001a1137ac14fef54e05497546a4
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 25, 2017 at 11:23 PM, Nathan Lynch <nathan_lynch@mentor.com>
wrote:

> Bruce Ashfield <bruce.ashfield@gmail.com> writes:
>
> > Following up on this old patch .. since it causing a problem with my
> > introduction of
> > the 4.10 kernel.
> >
> > I'm going to have to switch back to the git fetching of lttng to easily
> > pull in the latest
> > changes to adapt to the 4.10 kernel.
>
> I don't see why.  Support for 4.10 has been in lttng-modules' stable-2.9
> branch since January, and is included in the v2.9.1 release, which was
> tagged a week ago, right before the 4.10 release.  I had intended to
> send the update for lttng-modules on Monday but since I've got it ready
> I'll send it in a few minutes.
>
> You should not need to use lttng-modules' master branch to work with
> released Linux versions.
>

Yup. If you look at the history of our lttng recipe .. I've ben hacking on
it for quite some time.


>
>
> > lttng just doesn't release often enough for bleeding edge kernels,
>
> That's not my impression at all. The LTTng project diligently tracks
> upstream kernel development and ensures that the latest stable branch of
> lttng-modules supports the latest released kernel.
>

I didn't say they didn't do that. I'm saying that they don't spin enough
tarballs at times.


>
>
> > while maintaining
> > a set of patches on top of the released version is possible .. I don't
> see
> > the point.
>
> Maintaining a set of patches on top of the released version of
> lttng-modules should not be necessary.
>

It is .. I'm always ahead of released kernels. So when I work with a -dev
kernel, waiting for lttng to release doesn't work. I would have put out 4.10
a few weeks ago, but instead I kept waiting.


>
> > I missed the discussion on this one when it first came out, so I missed
> the
> > reason that
> > we switched away from git to the release tarballs ?
>
> I know there's a diversity of opinion on the subject in general, but in
> the absence of a need to use git, I think using a release tarball should
> be preferred.
>

In this case, I'm switching back to git, since for anyone working on newer
or in-devel kernels, the release process is just too slow. I'll avoid it
since
you just put out the update, but when I start tracking 4.11 in a few weeks
.. it will again break the builds.

Bruce




-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1137ac14fef54e05497546a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Feb 25, 2017 at 11:23 PM, Nathan Lynch <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:nathan_lynch@mentor.com" target=3D"_blank">nathan_lynch@men=
tor.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>Bruce=
 Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank"=
>bruce.ashfield@gmail.com</a>&gt; writes:<br>
<br>
&gt; Following up on this old patch .. since it causing a problem with my<b=
r>
&gt; introduction of<br>
&gt; the 4.10 kernel.<br>
&gt;<br>
&gt; I&#39;m going to have to switch back to the git fetching of lttng to e=
asily<br>
&gt; pull in the latest<br>
&gt; changes to adapt to the 4.10 kernel.<br>
<br>
</span>I don&#39;t see why.=C2=A0 Support for 4.10 has been in lttng-module=
s&#39; stable-2.9<br>
branch since January, and is included in the v2.9.1 release, which was<br>
tagged a week ago, right before the 4.10 release.=C2=A0 I had intended to<b=
r>
send the update for lttng-modules on Monday but since I&#39;ve got it ready=
<br>
I&#39;ll send it in a few minutes.<br>
<br>
You should not need to use lttng-modules&#39; master branch to work with<br=
>
released Linux versions.<br></blockquote><div><br></div><div>Yup. If you lo=
ok at the history of our lttng recipe .. I&#39;ve ben hacking on</div><div>=
it for quite some time.</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<span><br>
<br>
&gt; lttng just doesn&#39;t release often enough for bleeding edge kernels,=
<br>
<br>
</span>That&#39;s not my impression at all. The LTTng project diligently tr=
acks<br>
upstream kernel development and ensures that the latest stable branch of<br=
>
lttng-modules supports the latest released kernel.<br></blockquote><div><br=
></div><div>I didn&#39;t say they didn&#39;t do that. I&#39;m saying that t=
hey don&#39;t spin enough=C2=A0</div><div>tarballs at times.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<span><br>
<br>
&gt; while maintaining<br>
&gt; a set of patches on top of the released version is possible .. I don&#=
39;t see<br>
&gt; the point.<br>
<br>
</span>Maintaining a set of patches on top of the released version of<br>
lttng-modules should not be necessary.<br></blockquote><div><br></div><div>=
It is .. I&#39;m always ahead of released kernels. So when I work with a -d=
ev</div><div>kernel, waiting for lttng to release doesn&#39;t work. I would=
 have put out 4.10</div><div>a few weeks ago, but instead I kept waiting.</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<span><br>
<br>
&gt; I missed the discussion on this one when it first came out, so I misse=
d the<br>
&gt; reason that<br>
&gt; we switched away from git to the release tarballs ?<br>
<br>
</span>I know there&#39;s a diversity of opinion on the subject in general,=
 but in<br>
the absence of a need to use git, I think using a release tarball should<br=
>
be preferred.<br></blockquote><div><br></div><div>In this case, I&#39;m swi=
tching back to git, since for anyone working on newer</div><div>or in-devel=
 kernels, the release process is just too slow. I&#39;ll avoid it since</di=
v><div>you just put out the update, but when I start tracking 4.11 in a few=
 weeks</div><div>.. it will again break the builds.</div><div><br></div><di=
v>Bruce</div><div>=C2=A0</div></div><br><br clear=3D"all"><div><br></div>--=
 <br><div class=3D"m_9193072267414708295gmail_signature" data-smartmail=3D"=
gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chaos an=
d madness await thee at its end&quot;</div>
</div></div>

--001a1137ac14fef54e05497546a4--
