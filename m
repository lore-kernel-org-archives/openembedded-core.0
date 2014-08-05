Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 241D665CD4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 00:06:49 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so6233236igb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 17:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=t75I+wrmvQfItRkKRHQ4+eBO4fPBR/V+90GcEBOn/j8=;
	b=oG/LZIPLtdswILKxoC7cTLMoa+Vn+g+mm8aNhudhTxm3avUFX203Kbl1QmVoiOII6l
	FT60ETmGCVevpWWXHqUmKb8JTEblTmw5tO/Ny92t/Adk5JFWlq+plnt4X/MOjpG3jKLO
	CIH2t+XAyFRP0MojmBFEgurrUTYWn81Shw6KuVwz7MHdTaD1OnPUS7HivfUMplsXCq6M
	0Z0cFMZqXW86G1QnjQ+Kg+Et63CNBbFKKAf+lcOWQeV0CPeNKmZZpuosM8QAjYV+6H1L
	cqoTe9yxy0iFq9ESynamRGDXOX7E7lhsyHopBPEo9iWzt4KsusoSER+9dEVtpvy8nVq7
	bXug==
MIME-Version: 1.0
X-Received: by 10.50.134.136 with SMTP id pk8mr42230192igb.20.1407197210104;
	Mon, 04 Aug 2014 17:06:50 -0700 (PDT)
Received: by 10.50.126.103 with HTTP; Mon, 4 Aug 2014 17:06:49 -0700 (PDT)
Received: by 10.50.126.103 with HTTP; Mon, 4 Aug 2014 17:06:49 -0700 (PDT)
In-Reply-To: <20140804234536.GA18459@bshelton-desktop>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
	<20140804224419.GD11951@haswell>
	<20140804234536.GA18459@bshelton-desktop>
Date: Mon, 4 Aug 2014 17:06:49 -0700
Message-ID: <CAMKF1soZKWb8cr4cXHSxbVw5Nk2XbCkgHLiL8=djWHNN=9s_Qg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/20] udev-cache: Compress the cache
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
X-List-Received-Date: Tue, 05 Aug 2014 00:06:51 -0000
Content-Type: multipart/alternative; boundary=047d7b3a9c16d65b6704ffd6a17d

--047d7b3a9c16d65b6704ffd6a17d
Content-Type: text/plain; charset=UTF-8

On Aug 4, 2014 4:45 PM, "Ben Shelton" <ben.shelton@ni.com> wrote:
>
> On 08/04, Khem Raj wrote:
> > On 14-08-04 13:40:53, Ben Shelton wrote:
> > > From: Richard Tollerton <rich.tollerton@ni.com>
> > >
> > > $DEVCACHE is observed to be 100k uncompressed; compressing it reduces
> > > its size to ~5k.
> > >
> > > Natinst-Rally-ID: TA44427
> > > Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> > > Natinst-ReviewBoard-ID: 58620
> > > Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> > > ---
> > >  meta/recipes-core/udev/udev/init               | 2 +-
> > >  meta/recipes-core/udev/udev/udev-cache         | 2 +-
> > >  meta/recipes-core/udev/udev/udev-cache.default | 2 +-
> > >  3 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/udev/udev/init
b/meta/recipes-core/udev/udev/init
> > > index f2c84d5..1e69861 100644
> > > --- a/meta/recipes-core/udev/udev/init
> > > +++ b/meta/recipes-core/udev/udev/init
> > > @@ -69,7 +69,7 @@ case "$1" in
> > >                 readfiles /etc/udev/cache.data
> > >                 OLDDATA="$READDATA"
> > >                 if [ "$OLDDATA" = "$NEWDATA" ]; then
> > > -                            (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
> > > +                            (cd /; tar xzf $DEVCACHE > /dev/null
2>&1)
> >
> > wouldnt cf still handle gz and xz or any other compression ?
>
> Do you mean xf?  If so, then yes, I think it would.
>
> What would be the advantage of doing it that way?  Just one fewer
> change?

yes and tomorrow you might want to use different compression this wont
change
>
> Thanks,
> Ben
>

--047d7b3a9c16d65b6704ffd6a17d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Aug 4, 2014 4:45 PM, &quot;Ben Shelton&quot; &lt;<a href=3D"mailto:ben.s=
helton@ni.com">ben.shelton@ni.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 08/04, Khem Raj wrote:<br>
&gt; &gt; On 14-08-04 13:40:53, Ben Shelton wrote:<br>
&gt; &gt; &gt; From: Richard Tollerton &lt;<a href=3D"mailto:rich.tollerton=
@ni.com">rich.tollerton@ni.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; $DEVCACHE is observed to be 100k uncompressed; compressing i=
t reduces<br>
&gt; &gt; &gt; its size to ~5k.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Natinst-Rally-ID: TA44427<br>
&gt; &gt; &gt; Acked-by: Gratian Crisan &lt;<a href=3D"mailto:gratian.crisa=
n@ni.com">gratian.crisan@ni.com</a>&gt;<br>
&gt; &gt; &gt; Natinst-ReviewBoard-ID: 58620<br>
&gt; &gt; &gt; Signed-off-by: Richard Tollerton &lt;<a href=3D"mailto:rich.=
tollerton@ni.com">rich.tollerton@ni.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0meta/recipes-core/udev/udev/init =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt; &gt; =C2=A0meta/recipes-core/udev/udev/udev-cache =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt; &gt; =C2=A0meta/recipes-core/udev/udev/udev-cache.default | 2 +-<=
br>
&gt; &gt; &gt; =C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes=
-core/udev/udev/init<br>
&gt; &gt; &gt; index f2c84d5..1e69861 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-core/udev/udev/init<br>
&gt; &gt; &gt; +++ b/meta/recipes-core/udev/udev/init<br>
&gt; &gt; &gt; @@ -69,7 +69,7 @@ case &quot;$1&quot; in<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read=
files /etc/udev/cache.data<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OLDD=
ATA=3D&quot;$READDATA&quot;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [=
 &quot;$OLDDATA&quot; =3D &quot;$NEWDATA&quot; ]; then<br>
&gt; &gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd /; tar xf $DEVCACHE &gt; /dev/=
null 2&gt;&amp;1)<br>
&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd /; tar xzf $DEVCACHE &gt; /dev=
/null 2&gt;&amp;1)<br>
&gt; &gt;<br>
&gt; &gt; wouldnt cf still handle gz and xz or any other compression ?<br>
&gt;<br>
&gt; Do you mean xf? =C2=A0If so, then yes, I think it would.<br>
&gt;<br>
&gt; What would be the advantage of doing it that way? =C2=A0Just one fewer=
<br>
&gt; change?</p>
<p dir=3D"ltr">yes and tomorrow you might want to use different compression=
 this wont change<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Ben<br>
&gt;<br>
</p>

--047d7b3a9c16d65b6704ffd6a17d--
