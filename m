Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 57ABD71AB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 22:22:42 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id c11so41801059wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 15:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=l4DGVV3dhn5dVbKJNGJA7mwG1EaMGAeEoW4SCMmIrGg=;
	b=jjfA+a5fDLBKDk58R3d0r6cipj1xC03zsEIgq4zjqonFHmNGefbrQqFXQQsQyeaigp
	U/DMq5vHnqK9hw5KOAuUYN33huVod1R76fgeotlKijNrxrBRLLfbtO8shhvFpBt4cOP9
	KqT9thURnj65lWyL5qzu/ofh/TzUrxvjL0yjyO3WRGwsTqhawnSj/Klm+2GF/cist9a8
	cGIUjpSWsm26AW3Da4ILNJytT+xI0wBMCtOn7htFBHBUVymmeuGFXzUBolavCawm7PGZ
	ve1xvlMn+UpwU9pp7hrOxAX41sCqB/9ae/RA+gIYcJ/RipxZuzXGumnJSW1J+ZNt2bYO
	jIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=l4DGVV3dhn5dVbKJNGJA7mwG1EaMGAeEoW4SCMmIrGg=;
	b=qlsMhorZgrhzjI72/c97/KLbj2voekavBNeaINB+ELtkxPLg7OCienja11+YbnxMES
	LbgO6VMjF3M3vI8HG4G1PLi88JbJWKQYAsLW1OHiwZvcBLmdEtchmPfmpE/wnne/x0Zm
	q+Ake2t5qoKzlyKVTv/LyrZryvj8a6wiPlVd8iCOHUv5iS+Mssnoh7u/Ru+TrxJlj/yK
	nwsGyjM0NAqP5ijZJSScKfWTe05RYHwX7XKrV7054rb6MGytYDJRhTHMUgVI0gsNw1Ce
	Rl/3yaQKQa2L/p/HJDDOkJUrdPzbGLLm0YGBMbMKPMFGWWJb9K+A2x6aQVFTYr0Jf/Ch
	bp4w==
X-Gm-Message-State: AKS2vOxl2tWU2PjlSoAFAOVqa8/5NEKO69KeKF3k1R4HeGLtVbwkZdp5
	ON1K3zCgDspm/nd12AnObsA5k86EjA==
X-Received: by 10.80.180.188 with SMTP id w57mr4029013edd.42.1498170162989;
	Thu, 22 Jun 2017 15:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <1498097697-12564-1-git-send-email-Randy.MacLeod@windriver.com>
	<d194290a-fad9-3c63-b3a4-379b50074fd5@windriver.com>
In-Reply-To: <d194290a-fad9-3c63-b3a4-379b50074fd5@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Jun 2017 22:22:32 +0000
Message-ID: <CAMKF1sqNKaRB0Dagz8aKG5HR6QPHcw6XZMGcMrBnFogP3fbhgw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: work-around ppc gold linker error
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
X-List-Received-Date: Thu, 22 Jun 2017 22:22:44 -0000
Content-Type: multipart/alternative; boundary="94eb2c0edf7460cee2055293ec31"

--94eb2c0edf7460cee2055293ec31
Content-Type: text/plain; charset="UTF-8"

What's the link to upstream bug in linker

On Thu, Jun 22, 2017 at 12:34 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> Merge if you like or wait for the real fix to binutils.
>
> This bug has been around for more than a week
> since the binutils upgrade was merged and
> no one else seems to have noticed so it doesn't
> seem urgent.
>
> I needed the work-around to keep our auto-builders happy.
> Oh and I did basic sanity testing to show that booting
> and systemctl status works on qemuppc.
>
> ../Randy
>
> On 2017-06-21 10:14 PM, Randy MacLeod wrote:
> > If you enable systemd and build for qemuppc, then the
> > compile of systemd fails due to a gold linker failure:
> >
> >     .../powerpc-oe-linux-ld.gold:
> >     error: invalid STB_LOCAL symbol in external symbols
> >     error: linker defined: multiple definition of
> '00000001.plt_call.memcpy+8000'
> >     command line: previous definition here
> >
> > A git bisect confirms that the commit:
> >     0b0f545 binutils-2.28: Update to latest on release branch
> > is the problem. This is only known to affect powerpc machines.
> >
> > Work-around this for powerpc by getting configure to use
> > the bfd linker rather than the gold linker.
> >
> > This unblocks powerpc use until the linker bug can be resolved.
> >
> > Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> > ---
> >   .../systemd/systemd/systemd-drop-gold-use-bfd.patch   | 19
> +++++++++++++++++++
> >   meta/recipes-core/systemd/systemd_232.bb              |  2 ++
> >   2 files changed, 21 insertions(+)
> >   create mode 100644
> meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
> >
> > diff --git
> a/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
> b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
> > new file mode 100644
> > index 0000000..e0eb0bd
> > --- /dev/null
> > +++ b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
> > @@ -0,0 +1,19 @@
> > +Upstream-Status: Inappropriate [other]
> > +
> > +The patch is not appropriate for upstream since it's a temporary
> > +work-around for only ppc arches. Once the binutils defect in the
> > +gold linker is resolved, this patch can be dropped.
> > +
> > +Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> > +
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -260,7 +260,7 @@
> > +         -Wl,-z,relro \
> > +         -Wl,-z,now \
> > +         -pie \
> > +-        -Wl,-fuse-ld=gold])
> > ++        -Wl,-fuse-ld=bfd])
> > + AC_SUBST([OUR_LDFLAGS], "$with_ldflags $sanitizer_ldflags")
> > +
> > + AC_CHECK_SIZEOF(pid_t)
> > diff --git a/meta/recipes-core/systemd/systemd_232.bb
> b/meta/recipes-core/systemd/systemd_232.bb
> > index 1007360..1e8dffe 100644
> > --- a/meta/recipes-core/systemd/systemd_232.bb
> > +++ b/meta/recipes-core/systemd/systemd_232.bb
> > @@ -41,6 +41,8 @@ SRC_URI_append_libc-uclibc = "\
> >   "
> >   SRC_URI_append_qemuall = "
> file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
> >
> > +SRC_URI_append_powerpc = " file://systemd-drop-gold-use-bfd.patch"
> > +
> >   PACKAGECONFIG ??= "xz \
> >                      ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam
> selinux ldconfig', d)} \
> >                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'xkbcommon', '', d)} \
> >
>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,
> Canada, K2K 2W5
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0edf7460cee2055293ec31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">What&#39;s the link to upstream bug in linker=C2=A0<=
/div><br><div class=3D"gmail_quote"><div>On Thu, Jun 22, 2017 at 12:34 AM R=
andy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macle=
od@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Mer=
ge if you like or wait for the real fix to binutils.<br>
<br>
This bug has been around for more than a week<br>
since the binutils upgrade was merged and<br>
no one else seems to have noticed so it doesn&#39;t<br>
seem urgent.<br>
<br>
I needed the work-around to keep our auto-builders happy.<br>
Oh and I did basic sanity testing to show that booting<br>
and systemctl status works on qemuppc.<br>
<br>
../Randy<br>
<br>
On 2017-06-21 10:14 PM, Randy MacLeod wrote:<br>
&gt; If you enable systemd and build for qemuppc, then the<br>
&gt; compile of systemd fails due to a gold linker failure:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0.../powerpc-oe-linux-ld.gold:<br>
&gt;=C2=A0 =C2=A0 =C2=A0error: invalid STB_LOCAL symbol in external symbols=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0error: linker defined: multiple definition of &#39;=
00000001.plt_call.memcpy+8000&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0command line: previous definition here<br>
&gt;<br>
&gt; A git bisect confirms that the commit:<br>
&gt;=C2=A0 =C2=A0 =C2=A00b0f545 binutils-2.28: Update to latest on release =
branch<br>
&gt; is the problem. This is only known to affect powerpc machines.<br>
&gt;<br>
&gt; Work-around this for powerpc by getting configure to use<br>
&gt; the bfd linker rather than the gold linker.<br>
&gt;<br>
&gt; This unblocks powerpc use until the linker bug can be resolved.<br>
&gt;<br>
&gt; Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windr=
iver.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../systemd/systemd/systemd-drop-gold-use-bfd.patch=C2=A0 =
=C2=A0| 19 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_232.bb=
" rel=3D"noreferrer" target=3D"_blank">systemd_232.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A02 files changed, 21 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/systemd/systemd/syste=
md-drop-gold-use-bfd.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-b=
fd.patch b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e0eb0bd<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patc=
h<br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +Upstream-Status: Inappropriate [other]<br>
&gt; +<br>
&gt; +The patch is not appropriate for upstream since it&#39;s a temporary<=
br>
&gt; +work-around for only ppc arches. Once the binutils defect in the<br>
&gt; +gold linker is resolved, this patch can be dropped.<br>
&gt; +<br>
&gt; +Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@wind=
river.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
&gt; +<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -260,7 +260,7 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-z,relro \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-z,now \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-pie \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-fuse-ld=3Dgold])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-fuse-ld=3Dbfd])<br>
&gt; + AC_SUBST([OUR_LDFLAGS], &quot;$with_ldflags $sanitizer_ldflags&quot;=
)<br>
&gt; +<br>
&gt; + AC_CHECK_SIZEOF(pid_t)<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_232.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_232.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_232.bb" rel=3D"noreferrer" target=3D"=
_blank">systemd_232.bb</a><br>
&gt; index 1007360..1e8dffe 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_232.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_232.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_232.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_232.bb</a><br>
&gt; @@ -41,6 +41,8 @@ SRC_URI_append_libc-uclibc =3D &quot;\<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0SRC_URI_append_qemuall =3D &quot; file://0001-core-device.=
c-Change-the-default-device-timeout-to-2.patch&quot;<br>
&gt;<br>
&gt; +SRC_URI_append_powerpc =3D &quot; file://systemd-drop-gold-use-bfd.pa=
tch&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG ??=3D &quot;xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;efi pam selinux l=
dconfig&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;=
xkbcommon&#39;, &#39;&#39;, d)} \<br>
&gt;<br>
<br>
<br>
--<br>
# Randy MacLeod. SMTS, Linux, Wind River<br>
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,<br>
Canada, K2K 2W5<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c0edf7460cee2055293ec31--
