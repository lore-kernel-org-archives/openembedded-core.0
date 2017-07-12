Return-Path: <gizero@gmail.com>
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 111087198E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 05:22:34 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id f194so3662250yba.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 22:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+9RVp8/IY2SX9zxO4eCNfYb+iRbmPCraFUuSH58k1co=;
	b=AdhRKY6UhOgWCGV7mYXgTrMzls9KFrzr7kwVfVhYoB6xDlaXMpo8ng/5ueWRIxnrq/
	ASGvJZ3nya+DRve5Es4rQwE747vY8+dWf2TpXxE1Bvri3ecQ3Th0QPYmQw48KwgtXCbv
	EFpAo0qVH6BQBoVI0Gvk53EKRRIZZp8N1IN0a9P9MmhZ1Y016983MJ+3SgXqccUUXTZZ
	C4N1rMt2ZWbpCiSKicxAUiKUIL0Ysho6p2kOax4R268piL4WNi6nh/Wj18l/rBLPCMAc
	5HmX8IknpDMpjzviiczz8VHkKMSqjpACkMtIrNi6LdK/Cf+BgmY1Kqv/ZIKUJ9jekovZ
	l98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+9RVp8/IY2SX9zxO4eCNfYb+iRbmPCraFUuSH58k1co=;
	b=C47yFxwzILqu0qNH3IOCncL+mxXDLbK4wj+aUcdgPjkJMTNmm0dMmylrDlFJWNgh3G
	nUTCtmcJgLL2lSykmGNp2B0XVkTfJwq2iHAYtB4QtjLyRR85hvaSebzGAaRvgeQoem0F
	gIicvrc0t0DHtma0njBGOFHtC4luqfajCTW6KZZ+6HEPhJRSs9kGozCorvOddiEIscK1
	Bg0isQZyQTDmMhoKj1ytb/N5CEnhlLedP5sWCJvRZAT8ZlQ7n+Ynfr2TUMzHaRqJdH1s
	36W6L9tC+146umUT2Uc2FLO4OHeVeAl1INbpOd9ffiwLXdDmapHbqnRIWeDQiznww1GX
	5ZvA==
X-Gm-Message-State: AIVw111aeW4LhRxM8esP5S+z0tzHCSKRo+LvwQ8O/StFcFkmsyFGNrYe
	yfpwY4SSjLhHppKq+5z0fMlDgyH/dQ==
X-Received: by 10.37.128.130 with SMTP id n2mr91879ybk.128.1499836955761; Tue,
	11 Jul 2017 22:22:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Tue, 11 Jul 2017 22:22:35 -0700 (PDT)
In-Reply-To: <CAMKF1sqe6wH+HfWLvzfYV=Ozg0YYDzfF9eRrUGGn98EB8f2bQA@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
	<CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
	<CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
	<CAMKF1srwg43QrxOGz7UrqmuQ5ptRNJzYC5p9GAcLN7Ldw0ynuA@mail.gmail.com>
	<CAC+thW3DG03wQZ8WCyvyPYk8HcRP1C-Cq3F77HxC3b1_q4RKeA@mail.gmail.com>
	<CAMKF1so8kJk-L_zyJZOWR866K_hciQ4g4ujyMkyrLUZUq1kV3g@mail.gmail.com>
	<CAC+thW0yRO-=x_Of7vF6n9RxiqSUcpzGdVhFndwKSmfg+4JSNQ@mail.gmail.com>
	<CAMKF1sqe6wH+HfWLvzfYV=Ozg0YYDzfF9eRrUGGn98EB8f2bQA@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Wed, 12 Jul 2017 07:22:35 +0200
Message-ID: <CAC+thW3-Vjq0bz_20epZ-jcgzqusmsCVm64uOT=B4tVF3rBJDw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libepoxy: Upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Wed, 12 Jul 2017 05:22:35 -0000
Content-Type: multipart/alternative; boundary="089e0822ed5cf8237d055418008b"

--089e0822ed5cf8237d055418008b
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 12, 2017 at 7:11 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jul 11, 2017 at 9:56 PM, Andrea Galbusera <gizero@gmail.com>
> wrote:
> > On Wed, Jul 12, 2017 at 12:38 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Tue, Jul 11, 2017 at 3:02 PM, Andrea Galbusera <gizero@gmail.com>
> >> wrote:
> >> >
> >> >
> >> > Il 11 lug 2017 8:00 PM, "Khem Raj" <raj.khem@gmail.com> ha scritto:
> >> >
> >> > On Tue, Jul 11, 2017 at 1:34 AM, Jussi Kukkonen
> >> > <jussi.kukkonen@intel.com> wrote:
> >> >> On 11 July 2017 at 11:27, Jussi Kukkonen <jussi.kukkonen@intel.com>
> >> >> wrote:
> >> >>>
> >> >>> On 11 July 2017 at 10:42, Jussi Kukkonen <jussi.kukkonen@intel.com>
> >> >>> wrote:
> >> >>>>>
> >> >>>>> Exception: FileExistsError: [Errno 17] File exists:
> >> >>>>>
> >> >>>>>
> >> >>>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/
> sysroots-components/raspberrypi3/userland/usr/include/KHR/khrplatform.h'
> >> >>>>> ->
> >> >>>>>
> >> >>>>>
> >> >>>>> '/home/gizero/work/smartliving/distro/repo-
> master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-
> linux-gnueabi/gtk+3/3.22.16-r0/recipe-sysroot/usr/include/
> KHR/khrplatform.h'
> >> >>>>
> >> >>>>
> >> >>>> /usr/include/KHR/khrplatform.h is the egl platform header file,
> >> >>>> provided
> >> >>>> by both mesa and RPI userland. Does mesa end up in your gtk+3
> >> >>>> recipe-sysroot
> >> >>>> somehow?
> >> >>>>
> >> >>>> For clarity: this could be a bug but it is unlikely to be related
> to
> >> >>>> the
> >> >>>> libepoxy change (it does not use or ship the actual header file).
> >> >>>>
> >> >>>
> >> >>>
> >> >>> Actually this was maybe fixed by Otavios upgrade to mesa 17.1.4 --
> >> >>> mesa
> >> >>> accidentally shipped khrplatform.h even when egl was disabled (which
> >> >>> is
> >> >>> what
> >> >>> mesa-gl in oe-core does).
> >> >>>
> >> >>
> >> >> Sorry, I've not had enough  coffee. It was the other way round:
> >> >> khrplatform.h is the platform header that mesa now thinks is needed
> >> >> whether
> >> >> egl is enabled or not -- so they've started installing it in any case
> >> >> from
> >> >> 17.1.4 which means mesa-gl now provides khrplatform.h and thus
> >> >> conflicts
> >> >> with userland.
> >> >>
> >> >> I don't know what the correct fix is yet, just wanted to correct my
> >> >> original
> >> >> wrong info.
> >> >>
> >> >
> >> > Post an update to sync this header for userland package.
> >> >
> >> >
> >> > Will this help solving the gtk+3 issue of mesa-gl and userland now
> both
> >> > providing the same header and causing recipe-sysroot construction to
> >> > fail?
> >>
> >> No it certainly would not. But we can then decide who provides it, in
> >> a easy way.
> >
> >
> > I may be in the need to craft something locally to unbreak building with
> > current master... Could you please shed some light on how this should be
> > done then? Is this a matter of completely removing either mesa-gl or
> > userland from gtk+3 deps or a more selective change to avoid the clash in
> > recipe-sysroot?
>
> Firstly, determine where this file belongs to. If it is part of
> egl/gles then it should go to userland, otherwise it should be
> provided by mesa when using userland for graphics
>

If I understand correctly your point, you mean it is about having the two
upstream agreeing on where the header belongs to and fixing either one or
the other to stop providing it. In the meanwhile, from an oe perspective,
having such a patch in place for any of the two or even removing the file
in an appropriate do_install_append should do the job, right?

--089e0822ed5cf8237d055418008b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jul 12, 2017 at 7:11 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div=
 class=3D"h5">On Tue, Jul 11, 2017 at 9:56 PM, Andrea Galbusera &lt;<a href=
=3D"mailto:gizero@gmail.com">gizero@gmail.com</a>&gt; wrote:<br>
&gt; On Wed, Jul 12, 2017 at 12:38 AM, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jul 11, 2017 at 3:02 PM, Andrea Galbusera &lt;<a href=3D"m=
ailto:gizero@gmail.com">gizero@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Il 11 lug 2017 8:00 PM, &quot;Khem Raj&quot; &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; ha scritto:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue, Jul 11, 2017 at 1:34 AM, Jussi Kukkonen<br>
&gt;&gt; &gt; &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkone=
n@intel.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; On 11 July 2017 at 11:27, Jussi Kukkonen &lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt;&gt; &gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On 11 July 2017 at 10:42, Jussi Kukkonen &lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt;&gt; &gt;&gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; Exception: FileExistsError: [Errno 17] File e=
xists:<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; &#39;/home/gizero/work/<wbr>smartliving/distr=
o/repo-<wbr>master/build-poky/tmp/<wbr>sysroots-components/<wbr>raspberrypi=
3/userland/usr/<wbr>include/KHR/khrplatform.h&#39;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; -&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; &#39;/home/gizero/work/<wbr>smartliving/distr=
o/repo-<wbr>master/build-poky/tmp/work/<wbr>cortexa7hf-neon-vfpv4-poky-<wbr=
>linux-gnueabi/gtk+3/3.22.16-<wbr>r0/recipe-sysroot/usr/include/<wbr>KHR/kh=
rplatform.h&#39;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; /usr/include/KHR/khrplatform.h is the egl platfor=
m header file,<br>
&gt;&gt; &gt;&gt;&gt;&gt; provided<br>
&gt;&gt; &gt;&gt;&gt;&gt; by both mesa and RPI userland. Does mesa end up i=
n your gtk+3<br>
&gt;&gt; &gt;&gt;&gt;&gt; recipe-sysroot<br>
&gt;&gt; &gt;&gt;&gt;&gt; somehow?<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; For clarity: this could be a bug but it is unlike=
ly to be related to<br>
&gt;&gt; &gt;&gt;&gt;&gt; the<br>
&gt;&gt; &gt;&gt;&gt;&gt; libepoxy change (it does not use or ship the actu=
al header file).<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Actually this was maybe fixed by Otavios upgrade to m=
esa 17.1.4 --<br>
&gt;&gt; &gt;&gt;&gt; mesa<br>
&gt;&gt; &gt;&gt;&gt; accidentally shipped khrplatform.h even when egl was =
disabled (which<br>
&gt;&gt; &gt;&gt;&gt; is<br>
&gt;&gt; &gt;&gt;&gt; what<br>
&gt;&gt; &gt;&gt;&gt; mesa-gl in oe-core does).<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Sorry, I&#39;ve not had enough=C2=A0 coffee. It was the o=
ther way round:<br>
&gt;&gt; &gt;&gt; khrplatform.h is the platform header that mesa now thinks=
 is needed<br>
&gt;&gt; &gt;&gt; whether<br>
&gt;&gt; &gt;&gt; egl is enabled or not -- so they&#39;ve started installin=
g it in any case<br>
&gt;&gt; &gt;&gt; from<br>
&gt;&gt; &gt;&gt; 17.1.4 which means mesa-gl now provides khrplatform.h and=
 thus<br>
&gt;&gt; &gt;&gt; conflicts<br>
&gt;&gt; &gt;&gt; with userland.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I don&#39;t know what the correct fix is yet, just wanted=
 to correct my<br>
&gt;&gt; &gt;&gt; original<br>
&gt;&gt; &gt;&gt; wrong info.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Post an update to sync this header for userland package.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Will this help solving the gtk+3 issue of mesa-gl and userlan=
d now both<br>
&gt;&gt; &gt; providing the same header and causing recipe-sysroot construc=
tion to<br>
&gt;&gt; &gt; fail?<br>
&gt;&gt;<br>
&gt;&gt; No it certainly would not. But we can then decide who provides it,=
 in<br>
&gt;&gt; a easy way.<br>
&gt;<br>
&gt;<br>
&gt; I may be in the need to craft something locally to unbreak building wi=
th<br>
&gt; current master... Could you please shed some light on how this should =
be<br>
&gt; done then? Is this a matter of completely removing either mesa-gl or<b=
r>
&gt; userland from gtk+3 deps or a more selective change to avoid the clash=
 in<br>
&gt; recipe-sysroot?<br>
<br>
</div></div>Firstly, determine where this file belongs to. If it is part of=
<br>
egl/gles then it should go to userland, otherwise it should be<br>
provided by mesa when using userland for graphics<br></blockquote><div><br>=
</div><div>If I understand correctly your point, you mean it is about havin=
g the two upstream agreeing on where the header belongs to and fixing eithe=
r one or the other to stop providing it. In the meanwhile, from an oe persp=
ective, having such a patch in place for any of the two or even removing th=
e file in an appropriate do_install_append should do the job, right? =C2=A0=
</div></div></div></div>

--089e0822ed5cf8237d055418008b--
