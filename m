Return-Path: <gizero@gmail.com>
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id D06E277D6F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 04:56:39 +0000 (UTC)
Received: by mail-yb0-f177.google.com with SMTP id 84so3589477ybe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 21:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O9nWFg5jjlhDvjWgVYBDOUdaxETg74op6xP+cPJiaVw=;
	b=XgieZ6+Z0ZJ2jfEmAtMftkPuz+/ZWBT1uv71hPoKgb0ubA45/4TPISFj96SHDuaTli
	OPYlBUmNgS70G8bno+2+ud6AAePAH/vsuIOGYTfcMb3Bp5oGfshurP+6OqE1yO5nCYn2
	e6o4mYknP/nxsMEr5hAFkppUn8xisy4qlQpYy+MTcFLb2aQDiy/ODJWkJMF76GXl78S8
	BawDA3xiqIYmdZIVYTCZaXpuOYAMKVDiUhkUjPlZsSENLtoQbjttMja66HqY89+flIu/
	e/4jbmwAAalhcqkI1zStIbn2c9LcQQo5rH8Ig2v5vbQ5D59gwR38s7UKckpvnAcJfoVv
	ME3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O9nWFg5jjlhDvjWgVYBDOUdaxETg74op6xP+cPJiaVw=;
	b=JYDQ70VBGvEWbM8cyq9I6UKrQyVKvkPBL2s4GQ++vdn1cfwmB/NsgN1uR+oV7aSIw9
	93a7bZDU9ForGWY3GFQpQuao9CoQbahzAZqANCpmSq4MpmV/k5fswmynEWu9w7IIaO9y
	L0uzV8VYfvtqUmqywikjNoqHdVCB/U8h10Pel2PaVwDQ8xWqp650/7nA9NXbrtFdFMkP
	0+AxHbodXeyVHAZAD5rFrWyqoKTZr4Fsf9E0LoS6FwuRx573f6pZMP/WXxdrNGqbV5di
	3piTlvDQ/rLmUaZ7mAuHzinHZ3oRNCjqzTzGfN50h7fQ52q4sbv5q3yd32OY8yUAW61f
	fzpg==
X-Gm-Message-State: AIVw1138fOKGUWH4cVVGuLBw9Tx9kywt7Ud+S8iEk2bhyOiqMZ3UK/5P
	NiOq1ky7i8FEvcCz4YarXXzNZtNJcg==
X-Received: by 10.37.30.9 with SMTP id e9mr55027ybe.143.1499835400447; Tue, 11
	Jul 2017 21:56:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Tue, 11 Jul 2017 21:56:39 -0700 (PDT)
In-Reply-To: <CAMKF1so8kJk-L_zyJZOWR866K_hciQ4g4ujyMkyrLUZUq1kV3g@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FuM-jB6f+xN1QOcqAvTUvfehfpWjoSL8N+XiFS9kLX-Q@mail.gmail.com>
	<CAHiDW_GVArsb8O_kgsBLyqC=6sLz8c3+ABsCPD_QSkpU6G5aHQ@mail.gmail.com>
	<CAHiDW_EK4f9PoCnoCzDbNjmKrQeyT-UmJ2jDVqxsmq=CQHLfWg@mail.gmail.com>
	<CAMKF1srwg43QrxOGz7UrqmuQ5ptRNJzYC5p9GAcLN7Ldw0ynuA@mail.gmail.com>
	<CAC+thW3DG03wQZ8WCyvyPYk8HcRP1C-Cq3F77HxC3b1_q4RKeA@mail.gmail.com>
	<CAMKF1so8kJk-L_zyJZOWR866K_hciQ4g4ujyMkyrLUZUq1kV3g@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Wed, 12 Jul 2017 06:56:39 +0200
Message-ID: <CAC+thW0yRO-=x_Of7vF6n9RxiqSUcpzGdVhFndwKSmfg+4JSNQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Jul 2017 04:56:40 -0000
Content-Type: multipart/alternative; boundary="001a11436aea43ebe8055417a457"

--001a11436aea43ebe8055417a457
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 12, 2017 at 12:38 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jul 11, 2017 at 3:02 PM, Andrea Galbusera <gizero@gmail.com>
> wrote:
> >
> >
> > Il 11 lug 2017 8:00 PM, "Khem Raj" <raj.khem@gmail.com> ha scritto:
> >
> > On Tue, Jul 11, 2017 at 1:34 AM, Jussi Kukkonen
> > <jussi.kukkonen@intel.com> wrote:
> >> On 11 July 2017 at 11:27, Jussi Kukkonen <jussi.kukkonen@intel.com>
> wrote:
> >>>
> >>> On 11 July 2017 at 10:42, Jussi Kukkonen <jussi.kukkonen@intel.com>
> >>> wrote:
> >>>>>
> >>>>> Exception: FileExistsError: [Errno 17] File exists:
> >>>>>
> >>>>> '/home/gizero/work/smartliving/distro/repo-master/build-poky/tmp/
> sysroots-components/raspberrypi3/userland/usr/include/KHR/khrplatform.h'
> >>>>> ->
> >>>>>
> >>>>> '/home/gizero/work/smartliving/distro/repo-
> master/build-poky/tmp/work/cortexa7hf-neon-vfpv4-poky-
> linux-gnueabi/gtk+3/3.22.16-r0/recipe-sysroot/usr/include/
> KHR/khrplatform.h'
> >>>>
> >>>>
> >>>> /usr/include/KHR/khrplatform.h is the egl platform header file,
> provided
> >>>> by both mesa and RPI userland. Does mesa end up in your gtk+3
> >>>> recipe-sysroot
> >>>> somehow?
> >>>>
> >>>> For clarity: this could be a bug but it is unlikely to be related to
> the
> >>>> libepoxy change (it does not use or ship the actual header file).
> >>>>
> >>>
> >>>
> >>> Actually this was maybe fixed by Otavios upgrade to mesa 17.1.4 -- mesa
> >>> accidentally shipped khrplatform.h even when egl was disabled (which is
> >>> what
> >>> mesa-gl in oe-core does).
> >>>
> >>
> >> Sorry, I've not had enough  coffee. It was the other way round:
> >> khrplatform.h is the platform header that mesa now thinks is needed
> >> whether
> >> egl is enabled or not -- so they've started installing it in any case
> from
> >> 17.1.4 which means mesa-gl now provides khrplatform.h and thus conflicts
> >> with userland.
> >>
> >> I don't know what the correct fix is yet, just wanted to correct my
> >> original
> >> wrong info.
> >>
> >
> > Post an update to sync this header for userland package.
> >
> >
> > Will this help solving the gtk+3 issue of mesa-gl and userland now both
> > providing the same header and causing recipe-sysroot construction to
> fail?
>
> No it certainly would not. But we can then decide who provides it, in
> a easy way.
>

I may be in the need to craft something locally to unbreak building with
current master... Could you please shed some light on how this should be
done then? Is this a matter of completely removing either mesa-gl or
userland from gtk+3 deps or a more selective change to avoid the clash in
recipe-sysroot?

--001a11436aea43ebe8055417a457
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jul 12, 2017 at 12:38 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=
=3D"h5">On Tue, Jul 11, 2017 at 3:02 PM, Andrea Galbusera &lt;<a href=3D"ma=
ilto:gizero@gmail.com">gizero@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; Il 11 lug 2017 8:00 PM, &quot;Khem Raj&quot; &lt;<a href=3D"mailto:raj=
.khem@gmail.com">raj.khem@gmail.com</a>&gt; ha scritto:<br>
&gt;<br>
&gt; On Tue, Jul 11, 2017 at 1:34 AM, Jussi Kukkonen<br>
&gt; &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.c=
om</a>&gt; wrote:<br>
&gt;&gt; On 11 July 2017 at 11:27, Jussi Kukkonen &lt;<a href=3D"mailto:jus=
si.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 11 July 2017 at 10:42, Jussi Kukkonen &lt;<a href=3D"mailto=
:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Exception: FileExistsError: [Errno 17] File exists:<br=
>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; &#39;/home/gizero/work/<wbr>smartliving/distro/repo-<w=
br>master/build-poky/tmp/<wbr>sysroots-components/<wbr>raspberrypi3/userlan=
d/usr/<wbr>include/KHR/khrplatform.h&#39;<br>
&gt;&gt;&gt;&gt;&gt; -&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; &#39;/home/gizero/work/<wbr>smartliving/distro/repo-<w=
br>master/build-poky/tmp/work/<wbr>cortexa7hf-neon-vfpv4-poky-<wbr>linux-gn=
ueabi/gtk+3/3.22.16-<wbr>r0/recipe-sysroot/usr/include/<wbr>KHR/khrplatform=
.h&#39;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; /usr/include/KHR/khrplatform.h is the egl platform header =
file, provided<br>
&gt;&gt;&gt;&gt; by both mesa and RPI userland. Does mesa end up in your gt=
k+3<br>
&gt;&gt;&gt;&gt; recipe-sysroot<br>
&gt;&gt;&gt;&gt; somehow?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; For clarity: this could be a bug but it is unlikely to be =
related to the<br>
&gt;&gt;&gt;&gt; libepoxy change (it does not use or ship the actual header=
 file).<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Actually this was maybe fixed by Otavios upgrade to mesa 17.1.=
4 -- mesa<br>
&gt;&gt;&gt; accidentally shipped khrplatform.h even when egl was disabled =
(which is<br>
&gt;&gt;&gt; what<br>
&gt;&gt;&gt; mesa-gl in oe-core does).<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Sorry, I&#39;ve not had enough=C2=A0 coffee. It was the other way =
round:<br>
&gt;&gt; khrplatform.h is the platform header that mesa now thinks is neede=
d<br>
&gt;&gt; whether<br>
&gt;&gt; egl is enabled or not -- so they&#39;ve started installing it in a=
ny case from<br>
&gt;&gt; 17.1.4 which means mesa-gl now provides khrplatform.h and thus con=
flicts<br>
&gt;&gt; with userland.<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t know what the correct fix is yet, just wanted to corre=
ct my<br>
&gt;&gt; original<br>
&gt;&gt; wrong info.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Post an update to sync this header for userland package.<br>
&gt;<br>
&gt;<br>
&gt; Will this help solving the gtk+3 issue of mesa-gl and userland now bot=
h<br>
&gt; providing the same header and causing recipe-sysroot construction to f=
ail?<br>
<br>
</div></div>No it certainly would not. But we can then decide who provides =
it, in<br>
a easy way.<br>
</blockquote></div><br></div><div class=3D"gmail_extra">I may be in the nee=
d to craft something locally to unbreak building with current master... Cou=
ld you please shed some light on how this should be done then? Is this a ma=
tter of completely removing either mesa-gl or userland from gtk+3 deps or a=
 more selective change to avoid the clash in recipe-sysroot?</div></div>

--001a11436aea43ebe8055417a457--
