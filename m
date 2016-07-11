Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Jul 2016 13:06:41 UTC
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 048B8607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 13:06:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1468242402; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=nUP97GG9KYLrey6Db5TPPtpNdVgAKvPicbJn6Peux98=;
	b=H/vGDr9jafLwKtw/6JO0ZyJ/pjVIhzseH3XVtRIVKHN3BXMs98KBeOLv6iGZ0vV6Hg7l0h47
	k7CvqnRW8TZYX/r4voquzkQ6uzjNwWTu4+ZC5a73XqGMuyfCHmVwxBX0roH3XNuX/PxA5cne
	Aeg1UkOb0VRQnyQ4n9BN3fzSQkk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=aiKMcoM6y6sh/oGkeGaGLSMelSjKrB2Ea6FSiNJ7gdRpileLDe8IYZoUE7rQJjfLIxYl5c
	rWUStVf00yiMfp7lqWtNH9UV6oafQzWDlQ36Zmkkx4klfTCa4BSPxNUEBo9S6Z7Rkv60Cv4P
	WuKbLNHZ6qr/OkVfBF18GiD4c4nLQ=
Sender: derek@asterius.io
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mxa.mailgun.org with ESMTP id 578398ad.7f2b3428de30-in3;
	Mon, 11 Jul 2016 13:01:33 -0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id b62so2910146iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 06:01:33 -0700 (PDT)
X-Gm-Message-State: ALyK8tIaB1MITY1ZSBGJjTYULDaeJFS0OH/RQiKJ5wZlCN+awhXMfmW3VDEbI2QJL9V22fdwK8fd3gRQRupDNA==
X-Received: by 10.107.183.85 with SMTP id h82mr2150685iof.63.1468242092866;
	Mon, 11 Jul 2016 06:01:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.178.215 with HTTP; Mon, 11 Jul 2016 06:01:32 -0700 (PDT)
In-Reply-To: <1468226297.28829.72.camel@linuxfoundation.org>
References: <1468075833-13999-1-git-send-email-derek@asterius.io>
	<1468226297.28829.72.camel@linuxfoundation.org>
From: Derek Straka <derek@asterius.io>
Date: Mon, 11 Jul 2016 09:01:32 -0400
X-Gmail-Original-Message-ID: <CADNbA1qdBnzefvyLKU=UjT_5NkUACeLt0xYmtHunUcmQ=w64uA@mail.gmail.com>
Message-ID: <CADNbA1qdBnzefvyLKU=UjT_5NkUACeLt0xYmtHunUcmQ=w64uA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python3: update manifest RDEPENDS for importlib and compression packages
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
X-List-Received-Date: Mon, 11 Jul 2016 13:06:42 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b8e4a63c72d05375bc073

--94eb2c0b8e4a63c72d05375bc073
Content-Type: text/plain; charset=UTF-8

Sure.  I can pull out the pieces that are required by importlib out of
-misc and into their own package instead of including all of items in
-misc.  Thanks.

-Derek

On Mon, Jul 11, 2016 at 4:38 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2016-07-09 at 10:50 -0400, Derek Straka wrote:
> >     * zipfile has dependencies on threading and importlib
> >     * importlib has a dependency on operator via types import
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--
> >  scripts/contrib/python/generate-manifest-3.5.py      | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc
> > b/meta/recipes-devtools/python/python-3.5-manifest.inc
> > index 335c3ff..846e2a9 100644
> > --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> > +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> > @@ -30,7 +30,7 @@ RDEPENDS_${PN}-compile="${PN}-core"
> >  FILES_${PN}-compile="${libdir}/python3.5/py_compile.*
> > ${libdir}/python3.5/compileall.* "
> >
> >  SUMMARY_${PN}-compression="Python high-level compression support"
> > -RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs"
> > +RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs ${PN}-importlib
> > ${PN}-threading"
> >  FILES_${PN}-compression="${libdir}/python3.5/gzip.*
> > ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.*
> > ${libdir}/python3.5/lib-dynload/bz2.*.so "
> >
> >  SUMMARY_${PN}-core="Python interpreter and core modules"
> > @@ -106,7 +106,7 @@ RDEPENDS_${PN}-image="${PN}-core"
> >  FILES_${PN}-image="${libdir}/python3.5/colorsys.*
> > ${libdir}/python3.5/imghdr.* ${libdir}/python3.5/lib
> > -dynload/imageop.*.so ${libdir}/python3.5/lib-dynload/rgbimg.*.so "
> >
> >  SUMMARY_${PN}-importlib="Python import implementation library"
> > -RDEPENDS_${PN}-importlib="${PN}-core"
> > +RDEPENDS_${PN}-importlib="${PN}-core ${PN}-misc"
> >  FILES_${PN}-importlib="${libdir}/python3.5/importlib "
>
> I suspect this means we need to split something off from -misc since
> that package is quite large and we likely don't want to pull in all of
> it here.
>
> Cheers,
>
> Richard
>

--94eb2c0b8e4a63c72d05375bc073
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure.=C2=A0 I can pull out the pieces that are required by=
 importlib out of -misc and into their own package instead of including all=
 of items in -misc.=C2=A0 Thanks.<div><br></div><div>-Derek</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jul 11, 2016 =
at 4:38 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.=
purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundatio=
n.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D=
"HOEnZb"><div class=3D"h5">On Sat, 2016-07-09 at 10:50 -0400, Derek Straka =
wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0* zipfile has dependencies on threading and importl=
ib<br>
&gt;=C2=A0 =C2=A0 =C2=A0* importlib has a dependency on operator via types =
import<br>
&gt;<br>
&gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">d=
erek@asterius.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/python/python-3.5-manifest.inc | 4 ++--<br=
>
&gt;=C2=A0 scripts/contrib/python/<a href=3D"http://generate-manifest-3.5.p=
y" rel=3D"noreferrer" target=3D"_blank">generate-manifest-3.5.py</a>=C2=A0 =
=C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc<br>
&gt; b/meta/recipes-devtools/python/python-3.5-manifest.inc<br>
&gt; index 335c3ff..846e2a9 100644<br>
&gt; --- a/meta/recipes-devtools/python/python-3.5-manifest.inc<br>
&gt; +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc<br>
&gt; @@ -30,7 +30,7 @@ RDEPENDS_${PN}-compile=3D&quot;${PN}-core&quot;<br>
&gt;=C2=A0 FILES_${PN}-compile=3D&quot;${libdir}/python3.5/py_compile.*<br>
&gt; ${libdir}/python3.5/compileall.* &quot;<br>
&gt;<br>
&gt;=C2=A0 SUMMARY_${PN}-compression=3D&quot;Python high-level compression =
support&quot;<br>
&gt; -RDEPENDS_${PN}-compression=3D&quot;${PN}-core ${PN}-codecs&quot;<br>
&gt; +RDEPENDS_${PN}-compression=3D&quot;${PN}-core ${PN}-codecs ${PN}-impo=
rtlib<br>
&gt; ${PN}-threading&quot;<br>
&gt;=C2=A0 FILES_${PN}-compression=3D&quot;${libdir}/python3.5/gzip.*<br>
&gt; ${libdir}/python3.5/zipfile.* ${libdir}/python3.5/tarfile.*<br>
&gt; ${libdir}/python3.5/lib-dynload/bz2.*.so &quot;<br>
&gt;<br>
&gt;=C2=A0 SUMMARY_${PN}-core=3D&quot;Python interpreter and core modules&q=
uot;<br>
&gt; @@ -106,7 +106,7 @@ RDEPENDS_${PN}-image=3D&quot;${PN}-core&quot;<br>
&gt;=C2=A0 FILES_${PN}-image=3D&quot;${libdir}/python3.5/colorsys.*<br>
&gt; ${libdir}/python3.5/imghdr.* ${libdir}/python3.5/lib<br>
&gt; -dynload/imageop.*.so ${libdir}/python3.5/lib-dynload/rgbimg.*.so &quo=
t;<br>
&gt;<br>
&gt;=C2=A0 SUMMARY_${PN}-importlib=3D&quot;Python import implementation lib=
rary&quot;<br>
&gt; -RDEPENDS_${PN}-importlib=3D&quot;${PN}-core&quot;<br>
&gt; +RDEPENDS_${PN}-importlib=3D&quot;${PN}-core ${PN}-misc&quot;<br>
&gt;=C2=A0 FILES_${PN}-importlib=3D&quot;${libdir}/python3.5/importlib &quo=
t;<br>
<br>
</div></div>I suspect this means we need to split something off from -misc =
since<br>
that package is quite large and we likely don&#39;t want to pull in all of<=
br>
it here.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--94eb2c0b8e4a63c72d05375bc073--
