Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7806022F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 20:28:49 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id z16so13608294qtn.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 13:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r7O8rB80XhsMY8lOf4lCTeBbYeD1JJYCoDl5vmr1D18=;
	b=WDgQ7iAGivdVAvdkT6Fqb3WPN4pvi66J4KEkrneE8dHOpBtJFdtKmhylAxG/DOjXlG
	VzATxHjce3iHi+N6LaQ8tvRVotmX1ibTJQQYvo96WA9LiQ+T0N+R32I2Tot5llOYfOaC
	Ilcgz9w4Vb4rfP4OS1/MaL4sDpVsuW4kKeTyVJLTm58RSBelXb4imY8vPdqDchBRYHUD
	Ygk95IWE57XsOUfPkcQulqQqGAVL/1QGsm1h0CpjsJKQJG/7qJ02BH+XWYAgGM+TEnr9
	CqiUPDmUTcalB/4Sc44Zg8HG5omBTIU+pq4Q49fENVq+BhwF/oFt/q5JQ8fEDZC6etj3
	QsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r7O8rB80XhsMY8lOf4lCTeBbYeD1JJYCoDl5vmr1D18=;
	b=t0qm+28tG7MT5NdgEqNlUDWoR0k+0M3sKQcGcRqfRfROldApQNmtkgDG0r/kLO73yD
	WvEmo2zaJVUrlhfoYBveLqz6e7zcJBksWzV081i8nC25cUrwjRdsRUc8gjsbyu7M6DEw
	pKhHUhUW7yU/Klr/FPolI6HkJxoLaMOHPS7pmSrVkVjkajKxmuvUZF9NJJXJ1sc6vywU
	Ak/7Wqyc4X12j0Z1uB9FWaIFcdi31uCpci9w+XQyXJabQ4/MEaiO6m3UaOO9lQRSIKg+
	gQ4rU9ZpBJtuBfLIXg28aAB/HuOKDi8aJeWbkR05hf/NJUZni7ZdjF7nQ0uS9NT7EUSS
	Ldig==
X-Gm-Message-State: APjAAAUBqP9scUSz/p5pnZ9/PZWcy5nqreqyD9nNyrSMmw8Vh4PhkeNb
	RG/JrG8sfsUJ4xTGVCcRlXvdiZF7Y865ovHVi3o=
X-Google-Smtp-Source: APXvYqyn9XIAbistv2u4WAw1bVGl1d/ezHdrTa3elCfz1LPZZHekSnkO7DdTMxWj0CVnoeARBvIV+qbsZl/sdctoOC8=
X-Received: by 2002:a0c:b0a5:: with SMTP id o34mr16596552qvc.42.1555964929966; 
	Mon, 22 Apr 2019 13:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1496979431.git.raj.khem@gmail.com>
	<c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
	<CAJTo0La6u=Tzzsow5ZYwqmWHY8RzyvgVqT=J4J9UpKy8uKbb9A@mail.gmail.com>
	<CAMKF1srdVU0p-e4gPJx5rNEhk4aQdsiELuz+-1AsD_tgG6b_Gw@mail.gmail.com>
	<1497026309.2435.5.camel@iki.fi>
	<CAMKF1soH0BshzDQorBw7mmXGCgCg_OF=uc5pX1q=J_-ZPqtGMg@mail.gmail.com>
	<49993ca438e2a8b32473ad524404d8927c12d23e.camel@iki.fi>
In-Reply-To: <49993ca438e2a8b32473ad524404d8927c12d23e.camel@iki.fi>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Apr 2019 14:28:39 -0600
Message-ID: <CAMKF1so+LSFMd8+E1E7O1KGGNt2CZSdbC8sGfjVtNE9iDdNw1A@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] pulseaudio: disable PIE flags when hardened flags are enabled
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
X-List-Received-Date: Mon, 22 Apr 2019 20:28:49 -0000
Content-Type: multipart/alternative; boundary="000000000000ef081305872450fb"

--000000000000ef081305872450fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2019 at 6:33 AM Tanu Kaskinen <tanuk@iki.fi> wrote:

> On Fri, 2017-06-09 at 10:10 -0700, Khem Raj wrote:
> > On Fri, Jun 9, 2017 at 9:38 AM, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > On Fri, 2017-06-09 at 13:07 +0000, Khem Raj wrote:
> > > > On Fri, Jun 9, 2017 at 5:56 AM Burton, Ross <ross.burton@intel.com>
> wrote:
> > > >
> > > > > On 9 June 2017 at 04:41, Khem Raj <raj.khem@gmail.com> wrote:
> > > > >
> > > > > > +SECURITY_CFLAGS =3D "${SECURITY_NO_PIE_CFLAGS}"
> > > > > >
> > > > >
> > > > > These tend to go into security-flags.inc, not the recipe.
> > > > >
> > > >
> > > > I know that's been the case but I think having a global file is
> error prone
> > > > its better to have it in recipe context since it can get attention =
at
> > > > upgrade time to test if this has been fixed in new release etc
> > >
> > > Do you mean that there's some bug in pulseaudio, and this is a
> > > workaround for it? Is the bug that there are textrels? Ross saw
> > > textrels in pulseaudio before (see the discussion starting at [1]), b=
ut
> > > I was unable to reproduce that. If you give instructions for
> > > reproducing the problem, I'll see if I can fix pulseaudio (until then
> > > I'm fine with having a workaround).
> > >
> >
> > yes there is a bug lurking when compiling with hardening flags are
> turned on
> > so you can do something like
> >
> > in local.conf
> >
> > require conf/distro/include/security_flags.inc
> >
> > then
> >
> > MACHINE=3Dqemux86 bitbake pulseaudio
> >
> > it also happens on arm so qemuarm will reproduce it too.
> >
> > some assembly code is probably missing using GOT relative accesses
>
> Resurrecting this ancient thread... I finally tried to reproduce this
> problem with the given instructions. No success. Have you still been
> running into this issue?


I don=E2=80=99t know for sure if this still exists but we did disable assem=
bly in
few packages which addresses this issue since in assembly PIC has to be
respected
In hand written code

You might have to check if we did something similar for pulseaudio

>
>
> --
> Tanu
>
> https://www.patreon.com/tanuk
> https://liberapay.com/tanuk
>
>

--000000000000ef081305872450fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 22, 2019 at 6:33 AM Tanu Kaskinen &lt;<a href=
=3D"mailto:tanuk@iki.fi">tanuk@iki.fi</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Fri, 2017-06-09 at 10:10 -0700, Khem Raj wrote:<br>
&gt; On Fri, Jun 9, 2017 at 9:38 AM, Tanu Kaskinen &lt;<a href=3D"mailto:ta=
nuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt; wrote:<br>
&gt; &gt; On Fri, 2017-06-09 at 13:07 +0000, Khem Raj wrote:<br>
&gt; &gt; &gt; On Fri, Jun 9, 2017 at 5:56 AM Burton, Ross &lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
; wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On 9 June 2017 at 04:41, Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; +SECURITY_CFLAGS =3D &quot;${SECURITY_NO_PIE_CFLAG=
S}&quot;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; These tend to go into security-flags.inc, not the recip=
e.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I know that&#39;s been the case but I think having a global =
file is error prone<br>
&gt; &gt; &gt; its better to have it in recipe context since it can get att=
ention at<br>
&gt; &gt; &gt; upgrade time to test if this has been fixed in new release e=
tc<br>
&gt; &gt; <br>
&gt; &gt; Do you mean that there&#39;s some bug in pulseaudio, and this is =
a<br>
&gt; &gt; workaround for it? Is the bug that there are textrels? Ross saw<b=
r>
&gt; &gt; textrels in pulseaudio before (see the discussion starting at [1]=
), but<br>
&gt; &gt; I was unable to reproduce that. If you give instructions for<br>
&gt; &gt; reproducing the problem, I&#39;ll see if I can fix pulseaudio (un=
til then<br>
&gt; &gt; I&#39;m fine with having a workaround).<br>
&gt; &gt; <br>
&gt; <br>
&gt; yes there is a bug lurking when compiling with hardening flags are tur=
ned on<br>
&gt; so you can do something like<br>
&gt; <br>
&gt; in local.conf<br>
&gt; <br>
&gt; require conf/distro/include/security_flags.inc<br>
&gt; <br>
&gt; then<br>
&gt; <br>
&gt; MACHINE=3Dqemux86 bitbake pulseaudio<br>
&gt; <br>
&gt; it also happens on arm so qemuarm will reproduce it too.<br>
&gt; <br>
&gt; some assembly code is probably missing using GOT relative accesses<br>
<br>
Resurrecting this ancient thread... I finally tried to reproduce this<br>
problem with the given instructions. No success. Have you still been<br>
running into this issue?</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I don=E2=80=99t know for sure if this still exists but we did dis=
able assembly in few packages which addresses this issue since in assembly =
PIC has to be respected</div><div dir=3D"auto">In hand written code=C2=A0</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">You might have to check i=
f we did something similar for pulseaudio=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><br>
<br>
-- <br>
Tanu<br>
<br>
<a href=3D"https://www.patreon.com/tanuk" rel=3D"noreferrer" target=3D"_bla=
nk">https://www.patreon.com/tanuk</a><br>
<a href=3D"https://liberapay.com/tanuk" rel=3D"noreferrer" target=3D"_blank=
">https://liberapay.com/tanuk</a><br>
<br>
</blockquote></div></div>

--000000000000ef081305872450fb--
