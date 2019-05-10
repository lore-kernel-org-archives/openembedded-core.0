Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7652A7E08F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 13:23:29 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 14so5092663ljj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 06:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S0UZGDhDRzmWqoy+XRLnhtUaBfAYWXPVpXunabKHm/M=;
	b=nuLt/knxDtDux83nd2huEshUwwusXNn+f03zs8k6shryOmv4QB+uHGKkBV5hb1RTkE
	3neBtCEWrm6MZpHha64yVIb4/KfaCir+ZstPXnwAwhkEA2XmftRHlZAcNAdnsqfQdSWz
	rOabT0RkyzWAixZqZxe63yEDBtz9jrB3WZg4VGg42Hbb9EsKJzldvwLyH1F5KCbLKUw2
	M56eabVkvf2+2Ag2G0oNKcIRCL3QBQkt4fOEBa27vnYuC7xti3eZSAk+Z/CTEgI0B3Hr
	CXuxarsgmJJo08TqradEuMxj9C60iRwyiZfkv2HB75QRo0rYxcnSfkL0qaaPOgZZWO2y
	5bBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S0UZGDhDRzmWqoy+XRLnhtUaBfAYWXPVpXunabKHm/M=;
	b=jMGLA28pxkkk3ZrDtDOs3oCm1x74EBuNLEZ6H9PrvqmyCRDmpc4ZK7MZHyucMctsUJ
	9hSZe/FlagKAkemdUD1PydLxueXbquy9/hp0U9O9wdmKguuTt0o/oSsX+DhOcXC1keJK
	BjDwbkGlWB8d1JRwO0kQn3f2zJ6P8ga3BoVj0mS588afPKruWuKyVjHjr98YVPSXzP4n
	/bPEYdyI7kTBTF42MUrPODsX9/MgP9me5NG5VgEv/fydicIsdDIo3Kqpa5JMjapCMNX2
	lw0tSXzstnVAqkjNQElGRxa5HIYMUQLqiQFspb2O0EhZclD9sr//6ViOftMF6xbznPDW
	VxIQ==
X-Gm-Message-State: APjAAAWVnF+GiPA0EneOI10J5vgj/CWSuyXsK7uw1KQmj8FYxfWL/sTY
	7hSpHfNowVt8pzqTxNe0FNMr526ECXbfzHn+5SY=
X-Google-Smtp-Source: APXvYqyzxHDlJ4ojOO4OZwsYKgvlO2drXfKP0dgIDtoiTBn1NzH4r2vkiHugAHyY4wEFLXuc6q8WfUnyCUqnQK0QimU=
X-Received: by 2002:a2e:7d19:: with SMTP id y25mr4005825ljc.101.1557494609786; 
	Fri, 10 May 2019 06:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
	<1557321969-28686-2-git-send-email-mikko.rapeli@bmw.de>
	<20190508140708.GC25917@localhost> <20190508142232.GC3459@hiutale>
	<24616adf-6d73-ec86-e506-85f860f43731@prevas.dk>
	<CAJTo0LZLLOQGunyBmUeYiZs=qgUTaptnQcW4NfrzvoYjYkH_OQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZLLOQGunyBmUeYiZs=qgUTaptnQcW4NfrzvoYjYkH_OQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 May 2019 09:23:18 -0400
Message-ID: <CADkTA4OAigpsbRgugFrJx93PPj2rx5uDB9MxKQVkJ4jbKOR_0A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"bunk@stusta.de" <bunk@stusta.de>
Subject: Re: [PATCH 2/2] openssh: usable sshd depends on rngd from rng-tools
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
X-List-Received-Date: Fri, 10 May 2019 13:23:30 -0000
Content-Type: multipart/alternative; boundary="000000000000f4bc1305888878b7"

--000000000000f4bc1305888878b7
Content-Type: text/plain; charset="UTF-8"

On Fri, May 10, 2019 at 8:18 AM Burton, Ross <ross.burton@intel.com> wrote:

> I'm very dubious of the need to make this a dependency, as the
> hardware RNG should be used.  Note that there's been a slew of fixes
> to the kernel to enable this with modern stacks, for example:
>
>
> https://github.com/torvalds/linux/commit/62f95ae805fa9e1e84d47d3219adddd97b2654b7
>
> Maybe the IMX driver needs the same patch?
>

In my experience, not all boards have a usable hw RNG that can solve the
problem.

That being said, I have no strong opinion on it being a RRECOMMENDS, or not
mentioned
at all. Since a BSP really is the place that knows if a usable hwrng is
available, and some sort
of machine feature or distro layer could pull in the dependency for boards
that know they
need the daemons.

Bruce



>
> Ross
>
> On Thu, 9 May 2019 at 09:46, Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
> >
> > On 08/05/2019 16.22, Mikko.Rapeli@bmw.de wrote:
> > > On Wed, May 08, 2019 at 05:07:08PM +0300, Adrian Bunk wrote:
> > >> On Wed, May 08, 2019 at 04:26:09PM +0300, Mikko Rapeli wrote:
> > >>> Since openssl 1.1.1 and openssh which uses it, sshd
> > >>> startup is delayed. The delays range from few seconds
> > >>> to minutes and even to hours. The delays are visible
> > >>> in host keys generation and when sshd process is started
> > >>> in response to incoming TCP connection but is failing
> > >>> to provide SSH version string and clients or tests time out.
> > >>>
> > >>> In all cases traces show that sshd is waiting for getentropy()
> > >>> system call to return from Linux kernel, which returns only
> > >>> after kernel side random number pool is initialized. The pool
> > >>> is initialized via various entropy source which may be
> > >>> missing on embedded development boards or via rngd from
> > >>> rng-tools package from userspace. HW random number generation
> > >>> and kernel support help but rngd is till needed to feed that data
> > >>> back to the Linux kernel.
> > >>>
> > >>> Example from an NXP imx8 board shows that kernel random number pool
> > >>> initialization can take over 400 seconds without rngd,
> > >>> and with rngd it is initialized at around 4 seconds after boot.
> > >>> The completion of initialization is visible in kernel dmesg with line
> > >>> "random: crng init done".
> > >>> ...
> > >>> --- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> > >>> +++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> > >>> @@ -148,6 +148,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
> > >>>
> > >>>  RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> > >>>  RDEPENDS_${PN}-sshd += "${PN}-keygen
> ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit
> pam-plugin-loginuid', '', d)}"
> > >>> +RDEPENDS_${PN}-sshd += "rng-tools"
> > >>> ...
> > >>
> > >> This should only be an RRECOMMENDS so that people can opt out of it.
> > >>
> > >> E.g. CONFIG_RANDOM_TRUST_CPU in the kernel can solve the same
> > >> problem without using rng-tools on some platforms.
> > >
> > > I think this is a stronger dependency than just RRECOMMENDS. We build
> > > images and disable recommends but we care that sshd starts as fast as
> in
> > > sumo and earlier yocto releases for testing etc purposes.
> >
> > But why should boards without a hwrng be forced to spend disk space and
> > run-time resources on a daemon which they don't benefit from at all?
> >
> > I don't think RANDOM_TRUST_CPU works, though. That's just for stuff like
> > rdrand(), i.e. instructions built into the CPU - not for some other
> > on-chip hwrng. Whether those are used for seeding early on (i.e.,
> > without rngd doing its thing) depends on the ->quality parameter set by
> > the individual hwrng drivers. Very few set one, so they get assigned the
> > default_quality, which is a module parameter that defaults to 0.
> >
> > IOW, I think (but I haven't got around to testing this) one should set
> > rng_core.default_quality=512 (or something) on the kernel command line
> > to make the kernel start the hwrng_fill thread that will seed the
> > entropy pool from the hwrng. At least if I'm reading
> > drivers/char/hw_random/core.c correctly.
> >
> > Rasmus
> >
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f4bc1305888878b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 10, 2019 at 8:18 AM Burton, Ross &lt;<a=
 href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m very du=
bious of the need to make this a dependency, as the<br>
hardware RNG should be used.=C2=A0 Note that there&#39;s been a slew of fix=
es<br>
to the kernel to enable this with modern stacks, for example:<br>
<br>
<a href=3D"https://github.com/torvalds/linux/commit/62f95ae805fa9e1e84d47d3=
219adddd97b2654b7" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
torvalds/linux/commit/62f95ae805fa9e1e84d47d3219adddd97b2654b7</a><br>
<br>
Maybe the IMX driver needs the same patch?<br></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">In my experience=
, not all boards have a usable hw RNG that can solve the problem.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">That being said, I have no strong =
opinion on it being a RRECOMMENDS, or not mentioned</div><div class=3D"gmai=
l_default" style=3D"font-size:small">at all. Since a BSP really is the plac=
e that knows if a usable hwrng is available, and some sort</div><div class=
=3D"gmail_default" style=3D"font-size:small">of machine feature or distro l=
ayer could pull in the dependency for boards that know they</div><div class=
=3D"gmail_default" style=3D"font-size:small">need the daemons.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Ross<br>
<br>
On Thu, 9 May 2019 at 09:46, Rasmus Villemoes<br>
&lt;<a href=3D"mailto:rasmus.villemoes@prevas.dk" target=3D"_blank">rasmus.=
villemoes@prevas.dk</a>&gt; wrote:<br>
&gt;<br>
&gt; On 08/05/2019 16.22, <a href=3D"mailto:Mikko.Rapeli@bmw.de" target=3D"=
_blank">Mikko.Rapeli@bmw.de</a> wrote:<br>
&gt; &gt; On Wed, May 08, 2019 at 05:07:08PM +0300, Adrian Bunk wrote:<br>
&gt; &gt;&gt; On Wed, May 08, 2019 at 04:26:09PM +0300, Mikko Rapeli wrote:=
<br>
&gt; &gt;&gt;&gt; Since openssl 1.1.1 and openssh which uses it, sshd<br>
&gt; &gt;&gt;&gt; startup is delayed. The delays range from few seconds<br>
&gt; &gt;&gt;&gt; to minutes and even to hours. The delays are visible<br>
&gt; &gt;&gt;&gt; in host keys generation and when sshd process is started<=
br>
&gt; &gt;&gt;&gt; in response to incoming TCP connection but is failing<br>
&gt; &gt;&gt;&gt; to provide SSH version string and clients or tests time o=
ut.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; In all cases traces show that sshd is waiting for getentr=
opy()<br>
&gt; &gt;&gt;&gt; system call to return from Linux kernel, which returns on=
ly<br>
&gt; &gt;&gt;&gt; after kernel side random number pool is initialized. The =
pool<br>
&gt; &gt;&gt;&gt; is initialized via various entropy source which may be<br=
>
&gt; &gt;&gt;&gt; missing on embedded development boards or via rngd from<b=
r>
&gt; &gt;&gt;&gt; rng-tools package from userspace. HW random number genera=
tion<br>
&gt; &gt;&gt;&gt; and kernel support help but rngd is till needed to feed t=
hat data<br>
&gt; &gt;&gt;&gt; back to the Linux kernel.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Example from an NXP imx8 board shows that kernel random n=
umber pool<br>
&gt; &gt;&gt;&gt; initialization can take over 400 seconds without rngd,<br=
>
&gt; &gt;&gt;&gt; and with rngd it is initialized at around 4 seconds after=
 boot.<br>
&gt; &gt;&gt;&gt; The completion of initialization is visible in kernel dme=
sg with line<br>
&gt; &gt;&gt;&gt; &quot;random: crng init done&quot;.<br>
&gt; &gt;&gt;&gt; ...<br>
&gt; &gt;&gt;&gt; --- a/meta/recipes-connectivity/openssh/<a href=3D"http:/=
/openssh_7.9p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_7.9p1.bb</a=
><br>
&gt; &gt;&gt;&gt; +++ b/meta/recipes-connectivity/openssh/<a href=3D"http:/=
/openssh_7.9p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_7.9p1.bb</a=
><br>
&gt; &gt;&gt;&gt; @@ -148,6 +148,7 @@ FILES_${PN}-keygen =3D &quot;${bindir=
}/ssh-keygen&quot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 RDEPENDS_${PN} +=3D &quot;${PN}-scp ${PN}-ssh ${PN}=
-sshd ${PN}-keygen&quot;<br>
&gt; &gt;&gt;&gt;=C2=A0 RDEPENDS_${PN}-sshd +=3D &quot;${PN}-keygen ${@bb.u=
tils.contains(&#39;DISTRO_FEATURES&#39;, &#39;pam&#39;, &#39;pam-plugin-key=
init pam-plugin-loginuid&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt;&gt;&gt; +RDEPENDS_${PN}-sshd +=3D &quot;rng-tools&quot;<br>
&gt; &gt;&gt;&gt; ...<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This should only be an RRECOMMENDS so that people can opt out=
 of it.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; E.g. CONFIG_RANDOM_TRUST_CPU in the kernel can solve the same=
<br>
&gt; &gt;&gt; problem without using rng-tools on some platforms.<br>
&gt; &gt;<br>
&gt; &gt; I think this is a stronger dependency than just RRECOMMENDS. We b=
uild<br>
&gt; &gt; images and disable recommends but we care that sshd starts as fas=
t as in<br>
&gt; &gt; sumo and earlier yocto releases for testing etc purposes.<br>
&gt;<br>
&gt; But why should boards without a hwrng be forced to spend disk space an=
d<br>
&gt; run-time resources on a daemon which they don&#39;t benefit from at al=
l?<br>
&gt;<br>
&gt; I don&#39;t think RANDOM_TRUST_CPU works, though. That&#39;s just for =
stuff like<br>
&gt; rdrand(), i.e. instructions built into the CPU - not for some other<br=
>
&gt; on-chip hwrng. Whether those are used for seeding early on (i.e.,<br>
&gt; without rngd doing its thing) depends on the -&gt;quality parameter se=
t by<br>
&gt; the individual hwrng drivers. Very few set one, so they get assigned t=
he<br>
&gt; default_quality, which is a module parameter that defaults to 0.<br>
&gt;<br>
&gt; IOW, I think (but I haven&#39;t got around to testing this) one should=
 set<br>
&gt; rng_core.default_quality=3D512 (or something) on the kernel command li=
ne<br>
&gt; to make the kernel start the hwrng_fill thread that will seed the<br>
&gt; entropy pool from the hwrng. At least if I&#39;m reading<br>
&gt; drivers/char/hw_random/core.c correctly.<br>
&gt;<br>
&gt; Rasmus<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000f4bc1305888878b7--
