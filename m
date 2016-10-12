Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB8B60761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 17:45:49 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id t73so69510967oie.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=sneSRZC5S9Dkaf8uP6Ww6nzAQwXbv67Igy99WtVlKuM=;
	b=WRDO9ZLeprOD2IDyKTiJ2BM1MeBUa9br0LbZODhaot7q78/b7wssWmaxPAxBgtYwJP
	a3+1z7Vi9FcX33DkAhsKXbcZizIpFuf0+Vwm/lDJrYQL79XH61d0Gdkv5fGmuV3ntiFi
	y2nCon8bPqXjBThzBSyA2MuwOvGCv0i1ZUpVxK7QxD68H376EZpZ2cuxQdxO7c5LqPso
	jp27HJyysPVQhcycf/yQ3MhAGczIu0WFV23M9aRmmJwiyZHgnKf4I22Pr+sPc4YrC/lD
	w5e+eDgOvxAFWIXSzEGCYtd5mDiXJDlDkerYMDw87nh440CtxAZli7urYJr6C0P+5A8U
	gfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=sneSRZC5S9Dkaf8uP6Ww6nzAQwXbv67Igy99WtVlKuM=;
	b=fZ51oG47C/NwFuvPKSS9HayH1qOYhcKn0s/5mB5StZ6VlNbBJfbzCYY/z6stpa5PCC
	t4ZCKYbtgkV7KVo7DUU/t64+QMNAV7HSW2cN1HOxT8MbwC1Bum5JwgIJokDqUYJ+LLhh
	G39/VWii6HgJxQeWwnziNsUbfcWaKT/AqCxnzEymhC4a68gDngBqZm6Vv1nCCefnnD1y
	+nt6dFh5oYP7++yaz9tm/+mNWubHE71/k5jIKvlAKyzikgRSPos79PoVHXsFLzu4PLCc
	iYmMr2cEQ+skz/ZqlQKxjS5snd8183PX8z7BI6wyHoLZqW3xVg9Ihn0ONg84g1IMimxy
	PP/g==
X-Gm-Message-State: AA6/9Rl1vUXAmI0cnkWggLaVLAEflSj9RWDXhlxwbaCiHxnedPFl4zs8EkEde3hO01faQkxk9MEbfBumjCGYYw==
X-Received: by 10.157.46.203 with SMTP id w69mr1274691ota.242.1476294351269;
	Wed, 12 Oct 2016 10:45:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Wed, 12 Oct 2016 10:45:30 -0700 (PDT)
In-Reply-To: <1476291665.16008.59.camel@pbcl.net>
References: <1476291665.16008.59.camel@pbcl.net>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 12 Oct 2016 10:45:30 -0700
X-Google-Sender-Auth: BUYks2AMRAF0_H_fP6c7KXidcC0
Message-ID: <CABcZANkZjrz0ce4VDiSRYmNdjGH9-4xZDxafX6Zx6owY-sLB+A@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: File conflicts in DL_DIR
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
X-List-Received-Date: Wed, 12 Oct 2016 17:45:50 -0000
Content-Type: multipart/alternative; boundary=001a113ee1e4643b06053eae90af

--001a113ee1e4643b06053eae90af
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2016 at 10:01 AM, Phil Blundell <pb@pbcl.net> wrote:

> I just ran into an annoying problem with two recipes whose upstreams
> both use the same poor naming scheme for their downloadable tarballs
> which causes the sources to collide in DL_DIR.  One of them is eudev,
> which has:
>
> SRC_URI =3D "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz
>
> This shows up as a source checksum error when the second package finds
> what it thinks are its sources in DL_DIR, but of course they are not
> the files that it wanted.
>
> I couldn't immediately find any easy way to work around this
> difficulty.  Setting "localpath=3Deudev_v{$PV}.tar.gz" in eudev's SRC_URI
> looks superficially like it ought to do the right thing, but although
> this changes the location that the fetcher will search for the
> downloaded file it doesn't actually cause wget to put the file there so
> this doesn't work either.
>

I think that=E2=80=99s just a bug.. The fetcher should fully obey the url
parameters we support, so we should fix the wget fetcher to properly obey
localpath.

I suppose I could define DL_DIR in terms of ${PN}, which would
> presumably fix this problem at the cost of causing all my previous
> downloads to be repeated.  Or I could stop using eudev, or wait for one
> of the two packages to release a new version. :-)  Any better
> suggestions?
>

One option would be to change DL_DIR, but use PREMIRRORS for compatibility
with existing DL_DIRs, i.e.:
DL_DIR_BASE =3D =E2=80=9C${TOPDIR}/downloads=E2=80=9D
DL_DIR =3D =E2=80=9C${DL_DIR_BASE}/${BPN}=E2=80=9D
PREMIRRORS_prepend =3D =E2=80=9Cfile://.*/ file://${DL_DIR_BASE}/\n =E2=80=
=9C

or similar (untested).

Of course, this conflict will occur on a mirror too, so that=E2=80=99s a co=
ncern if
you care about mirror population.

Long term, I=E2=80=99d like to see our DL_DIR as a more capable download ca=
che.
Download every file to a unique name based on its checksum, then link those
into a ${BPN}-separated area with their real names. Then add a separate
tool to populate a mirror from DL_DIR.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ee1e4643b06053eae90af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Oct 12, 2016 at 10:01 AM, Phil Blundell <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":3a0" class=3D"a3s aXjCH m1=
57b9d9b95a0881a">I just ran into an annoying problem with two recipes whose=
 upstreams<br>
both use the same poor naming scheme for their downloadable tarballs<br>
which causes the sources to collide in DL_DIR.=C2=A0 One of them is eudev,<=
br>
which has:<br>
<br>
SRC_URI =3D &quot;<a href=3D"https://github.com/gentoo/${BPN}/archive/v${PV=
}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/gentoo/${=
<wbr>BPN}/archive/v${PV}.tar.gz</a><br>
<br>
This shows up as a source checksum error when the second package finds<br>
what it thinks are its sources in DL_DIR, but of course they are not<br>
the files that it wanted.<br>
<br>
I couldn&#39;t immediately find any easy way to work around this<br>
difficulty.=C2=A0 Setting &quot;localpath=3Deudev_v{$PV}.tar.<wbr>gz&quot; =
in eudev&#39;s SRC_URI<br>
looks superficially like it ought to do the right thing, but although<br>
this changes the location that the fetcher will search for the<br>
downloaded file it doesn&#39;t actually cause wget to put the file there so=
<br>
this doesn&#39;t work either.<br></div></blockquote><div><br></div><div>I t=
hink that=E2=80=99s just a bug.. The fetcher should fully obey the url para=
meters we support, so we should fix the wget fetcher to properly obey local=
path.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3a0" c=
lass=3D"a3s aXjCH m157b9d9b95a0881a">
I suppose I could define DL_DIR in terms of ${PN}, which would<br>
presumably fix this problem at the cost of causing all my previous<br>
downloads to be repeated.=C2=A0 Or I could stop using eudev, or wait for on=
e<br>
of the two packages to release a new version. :-) =C2=A0Any better<br>
suggestions?</div></blockquote></div><br>One option would be to change DL_D=
IR, but use PREMIRRORS for compatibility with existing DL_DIRs, i.e.:</div>=
<div class=3D"gmail_extra">DL_DIR_BASE =3D =E2=80=9C${TOPDIR}/downloads=E2=
=80=9D</div><div class=3D"gmail_extra">DL_DIR =3D =E2=80=9C${DL_DIR_BASE}/$=
{BPN}=E2=80=9D</div><div class=3D"gmail_extra">PREMIRRORS_prepend =3D =E2=
=80=9Cfile://.*/ file://${DL_DIR_BASE}/\n =E2=80=9C</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">or similar (untested).</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Of course, t=
his conflict will occur on a mirror too, so that=E2=80=99s a concern if you=
 care about mirror population.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Long term, I=E2=80=99d like to see our DL_DIR as a=
 more capable download cache. Download every file to a unique name based on=
 its checksum, then link those into a ${BPN}-separated area with their real=
 names. Then add a separate tool to populate a mirror from DL_DIR.</div><di=
v class=3D"gmail_extra">-- <br><div class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>F=
ounder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior =
Software Engineer, Mentor Graphics</div>
</div></div>

--001a113ee1e4643b06053eae90af--
