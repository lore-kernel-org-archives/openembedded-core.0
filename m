Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id F0E1070100
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 02:23:43 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id v84so10053433oie.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 19:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=XEk2t+KP7XVgVcceHAqtK8UwtFYZTXb7tgatP79KJh4=;
	b=k2Jvp8r7+SrUxkDe8hhbqJnfcxarYuohH5lkJGQ52eqlWTW+gZzkl0ayQarCKicjS1
	/lBJDh8+XPeBb6cXFZbt1MP0QL3mkHspgQORnY3NMj9nwFwi18TtzvRQAtXwz4txDW63
	e8Nvo96egJnfokouFYKcBpl7x0WBwzLb8WEjOg3Y2Hljelh+QyEfJRJ3IKEh8qfvOZwf
	IiPlBMqCU6t6XWuaBxlP4+y04DzO9IsTPOGvEyQFNEmtY40bm/Wk5TEOl41kJqjrJN4C
	wd7YXdcyE5eMeLJvuqhKvvT/WYqHXQt7UB52JKyq1b8WJWMql40wXOr/GceMfZ9xlc5c
	4Xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=XEk2t+KP7XVgVcceHAqtK8UwtFYZTXb7tgatP79KJh4=;
	b=RjHoTP4lPckrdt6rwxmCnVdjERCn5+TWm/vfDUa0Lk7IcBo98UPhd1F2eehUZgPhoC
	//6smBY/O2SjqtfpE2v0m133qSnaGFJg00kkaSapFg+h+JvSI/jvdqC3yYewDYDqj6Vv
	nDwWO4C6B3474f8AB1UnN5qoHaih7bRLB0qRjuzcsFxQVyOa32coXYKRYs1M8Gkw0oia
	jvqSpYH0zi+mTHACyYS0jNdP8S1DXp1Dq/1kGt1uRSRLuSyBHnfZSSxn9wadok5Q/rwE
	KzMCNb56Dg5djwDqpKF/quQdVzy4heneJzgTd/MZjO/ofVZzrvdanUUXjX6w3cZneeN2
	NOAw==
X-Gm-Message-State: ABUngvf7/Q8WkhzKM2Dv5RI3+4FMY5dFb1cnueE8cGPEevwP+FCaEhqMbEv6RX1HPgRtrd/WbXbBReHrFceOlA==
X-Received: by 10.202.74.88 with SMTP id x85mr11505060oia.77.1478226225015;
	Thu, 03 Nov 2016 19:23:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Thu, 3 Nov 2016 19:23:24 -0700 (PDT)
In-Reply-To: <CD1ACFFA-619F-4C36-99AC-76D6A6068E74@gmail.com>
References: <1477910801-9169-1-git-send-email-ed.bartosh@linux.intel.com>
	<CD1ACFFA-619F-4C36-99AC-76D6A6068E74@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 3 Nov 2016 19:23:24 -0700
X-Google-Sender-Auth: RWiFFI_stMphKhtLHT7vS6bhFRM
Message-ID: <CABcZANkm7CbH8pOHi5Wo3oN=usiCfX9kmOr6fPp9j9-M7E0AMg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mkefidisk.sh: add deprecation warning to the output
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
X-List-Received-Date: Fri, 04 Nov 2016 02:23:44 -0000
Content-Type: multipart/alternative; boundary=001a113db3500a33d90540705d64

--001a113db3500a33d90540705d64
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 3, 2016 at 2:42 PM, Khem Raj <raj.khem@gmail.com> wrote:

> > On Oct 31, 2016, at 3:46 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
> wrote:
> >
> > mkefidisk.sh will soon be deprecated in favor of .wic images.
> >
> > Added deprecation warning to the script to inform users that
> > this script will soon be removed from the codebase.
> >
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> > scripts/contrib/mkefidisk.sh | 5 +++++
> > 1 file changed, 5 insertions(+)
> >
> > diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.s=
h
> > index d8db3c0..a175895 100755
> > --- a/scripts/contrib/mkefidisk.sh
> > +++ b/scripts/contrib/mkefidisk.sh
> > @@ -20,6 +20,11 @@
> >
> > LANG=3DC
> >
> > +echo
> > +echo "WARNING: This script is deprecated and will be removed soon."
> > +echo "Please consider using wic EFI images instead."
> > +echo
> > +
>
> is .wic image dd=E2=80=99able directly ?
>

Yes, that=E2=80=99s the point :) Though I prefer bmaptool w/ IMAGE_FSTYPES =
+=3D
=E2=80=9Cwic.bmap=E2=80=9D personally, don=E2=80=99t have to rely on the fi=
le keeping its
sparseness when scp=E2=80=99ing it around and whatnot.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113db3500a33d90540705d64
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 3, 2016 at 2:42 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; On Oct 31=
, 2016, at 3:46 AM, Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel=
.com">ed.bartosh@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; mkefidisk.sh will soon be deprecated in favor of .wic images.<br>
&gt;<br>
&gt; Added deprecation warning to the script to inform users that<br>
&gt; this script will soon be removed from the codebase.<br>
&gt;<br>
&gt; Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel=
.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt; scripts/contrib/mkefidisk.sh | 5 +++++<br>
&gt; 1 file changed, 5 insertions(+)<br>
&gt;<br>
&gt; diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.=
sh<br>
&gt; index d8db3c0..a175895 100755<br>
&gt; --- a/scripts/contrib/mkefidisk.sh<br>
&gt; +++ b/scripts/contrib/mkefidisk.sh<br>
&gt; @@ -20,6 +20,11 @@<br>
&gt;<br>
&gt; LANG=3DC<br>
&gt;<br>
&gt; +echo<br>
&gt; +echo &quot;WARNING: This script is deprecated and will be removed soo=
n.&quot;<br>
&gt; +echo &quot;Please consider using wic EFI images instead.&quot;<br>
&gt; +echo<br>
&gt; +<br>
<br>
</span>is .wic image dd=E2=80=99able directly ?<br></blockquote><div><br></=
div><div>Yes, that=E2=80=99s the point :) Though I prefer bmaptool w/ IMAGE=
_FSTYPES +=3D =E2=80=9Cwic.bmap=E2=80=9D personally, don=E2=80=99t have to =
rely on the file keeping its sparseness when scp=E2=80=99ing it around and =
whatnot.</div></div>-- <br><div class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Found=
er - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Soft=
ware Engineer, Mentor Graphics</div>
</div></div>

--001a113db3500a33d90540705d64--
