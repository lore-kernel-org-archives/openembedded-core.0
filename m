Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3E5DA719CF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 00:41:12 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id u15so6922735oie.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 16:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=z5lBYQA7T/kuoVAipwb9zvUU7QB1XSxG38yZw9AuK/8=;
	b=kMU6wpA100VCzyrplxeIGWx4cPIbd9rQKlpFVnC/u8b1SlYryW0lyUNB4TuB7bUWg3
	e0kOAK614xLemKbbgQBWdkRK70id7JRrwLdeNnQiOJMRmu0Y2XR5tFvxvzU0s8eV5TWd
	OTGtk/JqeJsOlvUQnRX3mh9O47zFK8c8a/43iWU6z5q/cXtNvDutIUz5jA8YcoAQe07E
	WbxP5YOQhJ4njVABbepZK5sHiH4+imFFLzxokHp4Zlntw9KLQ8CzBOvA8V+FLjJz5XCc
	A3MsOLieODFHJyRYbqPRBco4foEoslh5rKvR9NGhNrASdRvXHXibX0yCOGYWYQ7GjePj
	SKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=z5lBYQA7T/kuoVAipwb9zvUU7QB1XSxG38yZw9AuK/8=;
	b=PYT51hBYRSIjStziyITiX0zXtOdMpUUBFpgGSu/+m+Sw8glb6KOfrrqinFdRHROt55
	klaxgsaUFQgGZGP+KtY3HcahuZrT4yYVuWHQKpZBVxHEh3zIytXbuiluUqHrbBaCpkpC
	HCjCRFMx0AZm4Mhs2cMnBROE/WVtdb21/6hpqqh0NH2vvlEUAh17cPPSc7Z+Jk7Ma3ri
	jahcFQ143NniJr0YcKEv2QwW7VheUU+za57+vTiBEongIryKay9qoyTUwI2pVIh288cC
	MUY2o+rdYxhQoLcBb/N5ywvSqbvlqTMj7FosAEkeZQSzKRHLiexWXlTTbD1q0B4Gh9Zu
	JUAA==
X-Gm-Message-State: AKaTC03TOVC8CHPmPebgEOEx5BhbyYk/rDzIZfdmY5oRjXIzObue2nunID/aDxl0Gr/Yp5LsgHSYf98fkXdQZw==
X-Received: by 10.157.40.151 with SMTP id s23mr47625815ota.68.1481416874075;
	Sat, 10 Dec 2016 16:41:14 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.14.20 with HTTP; Sat, 10 Dec 2016 16:40:53 -0800 (PST)
In-Reply-To: <CAMKF1sqeW4cxaj1yK_TbpyyZriuL3z3N4QY=nrpy4JV=tNRPCQ@mail.gmail.com>
References: <1481305586-11873-1-git-send-email-ed.bartosh@linux.intel.com>
	<CABcZANk5QnzFAWwAjbaHAQvCw=XXViOnh5jg=cvRiD_B=mEpKA@mail.gmail.com>
	<CAMKF1sqeW4cxaj1yK_TbpyyZriuL3z3N4QY=nrpy4JV=tNRPCQ@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 10 Dec 2016 17:40:53 -0700
X-Google-Sender-Auth: ZXAWsF0sA2irh5xpch-mlvooFfI
Message-ID: <CABcZANmx8+rWdxurcCEdM2gkzvaiPOBfA9fLZj42-2eNUk0T+A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] edgerouter.conf: enable generation of wic.bmap
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
X-List-Received-Date: Sun, 11 Dec 2016 00:41:18 -0000
Content-Type: multipart/alternative; boundary=001a11c1494a8b2ee40543573e8f

--001a11c1494a8b2ee40543573e8f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 10, 2016 at 1:57 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Dec 10, 2016 at 10:40 AM, Christopher Larson
> <clarson@kergoth.com> wrote:
> >
> > On Fri, Dec 9, 2016 at 10:46 AM, Ed Bartosh <ed.bartosh@linux.intel.com=
>
> > wrote:
> >>
> >> Enabled generation of block map(bmap) files for wic images
> >> built for edgerouter machine. This should simplify flashing
> >> images with bmaptool.
> >>
> >> [YOCTO #10621]
> >>
> >> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> >
> >
> > I think this is more of a distro decision than machine, whether they
> want to
> > support use of bmaptool for their users/customers. It=E2=80=99d be nice=
 if it was
> > easier to control compression from the distro, too. For example, if we
> want
> > to distribute wic.bz2+wic.bmap in our installers, it=E2=80=99d be nice =
to be
> able to
> > switch to that for all machines that use wic. I=E2=80=99m not sure how =
best to
> pull
> > that off, however. Something to think about for the future.
>
> I think thats a good point, however, distro should be able to define
> something like
> if machine is capable of supporting feature X then lets enable it. I
> dont think we
> should add machine knowledge into distros either.


Agreed. We do that already with features variables, but there=E2=80=99s no
equivalent for IMAGE_FSTYPES, of course. Presumably IMAGE_FSTYPES_append =
=3D
=E2=80=9C ${@=E2=80=98wic.bmap=E2=80=99 if =E2=80=98${USING_WIC}=E2=80=99 e=
lse =E2=80=98=E2=80=99}=E2=80=9D or so would get part of the way
there. Replacing wic with wic.bz2 or vice versa would be slightly more
complex.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a11c1494a8b2ee40543573e8f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sat, Dec 10, 2016 at 1:57 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Sat, Dec 1=
0, 2016 at 10:40 AM, Christopher Larson<br>
&lt;<a href=3D"mailto:clarson@kergoth.com">clarson@kergoth.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; On Fri, Dec 9, 2016 at 10:46 AM, Ed Bartosh &lt;<a href=3D"mailto:ed.b=
artosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Enabled generation of block map(bmap) files for wic images<br>
&gt;&gt; built for edgerouter machine. This should simplify flashing<br>
&gt;&gt; images with bmaptool.<br>
&gt;&gt;<br>
&gt;&gt; [YOCTO #10621]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.i=
ntel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; I think this is more of a distro decision than machine, whether they w=
ant to<br>
&gt; support use of bmaptool for their users/customers. It=E2=80=99d be nic=
e if it was<br>
&gt; easier to control compression from the distro, too. For example, if we=
 want<br>
&gt; to distribute wic.bz2+wic.bmap in our installers, it=E2=80=99d be nice=
 to be able to<br>
&gt; switch to that for all machines that use wic. I=E2=80=99m not sure how=
 best to pull<br>
&gt; that off, however. Something to think about for the future.<br>
<br>
</span>I think thats a good point, however, distro should be able to define=
<br>
something like<br>
if machine is capable of supporting feature X then lets enable it. I<br>
dont think we<br>
should add machine knowledge into distros either.</blockquote></div><br>Agr=
eed. We do that already with features variables, but there=E2=80=99s no equ=
ivalent for IMAGE_FSTYPES, of course. Presumably IMAGE_FSTYPES_append =3D =
=E2=80=9C ${@=E2=80=98wic.bmap=E2=80=99 if =E2=80=98${USING_WIC}=E2=80=99 e=
lse =E2=80=98=E2=80=99}=E2=80=9D or so would get part of the way there. Rep=
lacing wic with wic.bz2 or vice versa would be slightly more complex.<br>--=
 <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Chri=
stopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbe=
dded, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11c1494a8b2ee40543573e8f--
