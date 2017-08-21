Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA457831F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 15:18:14 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id n125so51174266vke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MbfHDrYOG1IhV4Aq0jb9JnvrFMBTYeV3ZEbuRdnHHwo=;
	b=kS2McXz0ZPIkeaM2chflze7HkRpAZkC9d7pu3kK5wG0ziVBwMDdnplcNKln65j3atc
	srHDF82YcMKs9/PVoT/8byKsCYErd/DEMFSlXkaJyWV87R2l1F8gHTX+GU7EbphE7JWQ
	b/eSsMVnnhzRAarIgK5TAdKeEOq9FZ0JKzUUp+9gexQdisxwmL6zalX/MhHhH4SlL9nv
	L/iy0Y1PIV8L+Y2e5m2MWAMBn536fIPKyou30renjMnfs9QRjou41jCSRyqfj7cvj0tM
	VMtc9B5PAUU5dyRjmdBRXNz8PTt7aIhzaGoIaiFx3VSeB93mM+5UwkdSRtcb3RS/HML/
	q4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MbfHDrYOG1IhV4Aq0jb9JnvrFMBTYeV3ZEbuRdnHHwo=;
	b=GTC/y17bHTTTJgf6j6jwHPhna+iJ0ZrXF4aO4Jh83YTQ0mdEeW5pDCx+3eRBxVnEJV
	pMusT1sBvc89VbIamt+D7oDoVP/jhjFQqMfNqQZvMfTFFLhCwvznDRGAHx6cWbNKiPGv
	hB4e73O84dfC1iAJbpXfZFxaImoAWtx9ysqpNZerX5/hyXljAAzkQVOlzohHq6xmQ3fg
	49/7IZVN1+H5uTxd/OZn0+lit+qUCn/n35jbgJh//QIx7smq8ts8r//VfWDffNiugS1i
	EyS9FpIKLPRVjmOzI2uP3fW01/c7i6EM/dZIrrBZR5FTpP4Mu0XUGfRbIqH0oDsmcuNg
	9cFw==
X-Gm-Message-State: AHYfb5gkV3mpukYwNo7qAs8twR9lkKJkzX2ItFMPCz9s/bI38KXSGDbK
	GT8uXJxvnyF/tVgs9TmQBxfNJaq5/g==
X-Received: by 10.31.209.71 with SMTP id i68mr10018475vkg.188.1503328696158;
	Mon, 21 Aug 2017 08:18:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Mon, 21 Aug 2017 08:18:15 -0700 (PDT)
In-Reply-To: <0e7ac88f282741288f27b4c7774b5f9a@XBOX02.axis.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<ab92e7d90c416d6e5cdb17cdba269e09ec967607.1503283308.git.bruce.ashfield@windriver.com>
	<b68f37bbad5940a8bdb7f165a7600f18@XBOX02.axis.com>
	<CADkTA4Nx3EAgggD2ohyZJpX2ZGUgKvmQK-KFLTnreJSjO830Zw@mail.gmail.com>
	<CADkTA4PdZwrfh_u44auWAR4r0KV2oVp1VJu=56Uvpv6xocEp1g@mail.gmail.com>
	<0e7ac88f282741288f27b4c7774b5f9a@XBOX02.axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 Aug 2017 11:18:15 -0400
Message-ID: <CADkTA4M2KkRnYx0W=NVn0f_MmCmsn1tj5FkV5abSsK6iCMqK_w@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] kernel-yocto: ensure that only valid BSPs are built
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
X-List-Received-Date: Mon, 21 Aug 2017 15:18:15 -0000
Content-Type: multipart/alternative; boundary="001a114e2482ea4e46055744fcd1"

--001a114e2482ea4e46055744fcd1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2017 at 11:16 AM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> Just in case you missed it (as you didn=E2=80=99t comment on my comment a=
bout it),
> there was a typo in the log message as well.
>

Yup. Noticed that, it isn't the only typo ;)

This is a resend of a patch I sent a few weeks ago, so I'm not too worried
if it sits or not.

Cheers,

Bruce


>
>
> //Peter
>
>
>
> *From:* Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> *Sent:* den 21 augusti 2017 17:14
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* richard.purdie@linuxfoundation.org; openembedded-core@lists.
> openembedded.org
> *Subject:* Re: [OE-core] [PATCH 8/9] kernel-yocto: ensure that only valid
> BSPs are built
>
>
>
>
>
>
>
> On Mon, Aug 21, 2017 at 11:03 AM, Bruce Ashfield <bruce.ashfield@gmail.co=
m>
> wrote:
>
>
>
>
>
> On Mon, Aug 21, 2017 at 11:00 AM, Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Bruce Ashfield
> > Sent: den 21 augusti 2017 04:58
> > To: richard.purdie@linuxfoundation.org
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 8/9] kernel-yocto: ensure that only valid
> > BSPs are built
> >
> > There was a bug in the search routines responsible for locating
> > BSP definitions which returned a valid match if only the ktype
> > matched.
> >
> > This meant that someone looking for "qemux86foo" (which is an
> > invalid definition) would potentially end up building "qemuarm"
> > and be none the wiser (until it didn't boot).
> >
> > With this fix to the tools search routine, and improved return
> > code testing, we will now stop the build and report and error to
> > the user.
> >
> > [YOCTO: #11878]
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass                       | 3 +++
> >  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/
> kernel-yocto.bbclass
> > index 1ca0756c4959..3c6df92131bc 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -143,6 +143,9 @@ do_kernel_metadata() {
> >
> >       # expand kernel features into their full path equivalents
> >       bsp_definition=3D$(spp ${includes} --find -DKMACHINE=3D${KMACHINE=
}
> -DKTYPE=3D${LINUX_KERNEL_TYPE})
> > +     if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
>
> Use $bsp_definition instead of ${bsp_definition} since it is a
> shell variable and not a bitbake variable.
>
>
>
> I always use ${...}, so I'm going to stay consistent with what is already
> in
>
> the file.
>
>
>
>
> Actually, after looking at the code in that bbclass, I see this
> used for a number of shell variables all over the place. This is
> actually bad, and you should rewrite the code to not use ${variable}
> for shell variables. The reason this is bad is because these
> variables unnecessarily end up in the sstate hash for these functions,
> and if someone actually happens to define a bitbake variable with the
> same name as one of those shell variables, the result will not be what
> is expected...
>
>
>
> Not something high on my priority list. It's been that way since the
> beginning.
>
>
>
> .. but I will loop back and take care of the issues before M4 closes. Jus=
t
> a bit busy
>
> pushing out the new kernels and a slew of bug fixes.
>
>
>
> This patch can be ignored (if needed) until I get back around to that.
>
>
>
> Cheers,
>
>
>
> Bruce
>
>
>
>
>
> Cheers,
>
>
>
> Bruce
>
>
>
>
> > +             bbfatal_log "Could not locate BSP definiton for
> ${KMACHINE}/${LINUX_KERNEL_TYPE}."
>
> Change "definiton" to "definition".
>
> > +     fi
> >       meta_dir=3D$(kgit --meta)
> >
> >       # run1: pull all the configuration fragments, no matter where the=
y
> come from
> > diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > index 2217a31076a2..4a78b897d34f 100644
> > --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://git/tools/kgit;
> beginline=3D5;endline=3D9;md5=3Da6c2fa8aef1b
> >
> >  DEPENDS =3D "git-native"
> >
> > -SRCREV =3D "9cd2b626d652bec10c6bc75275b35bfee74d447c"
> > +SRCREV =3D "0571411cc033c11df7827508dd786876ce2f8c83"
> >  PR =3D "r12"
> >  PV =3D "0.2+git${SRCPV}"
> >
> > --
> > 2.5.0
>
> //Peter
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
>
> --
>
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
>
>
>
>
> --
>
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114e2482ea4e46055744fcd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 21, 2017 at 11:16 AM, Peter Kjellerstedt <span dir=3D"ltr">=
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">





<div lang=3D"SV" link=3D"blue" vlink=3D"purple">
<div class=3D"m_7766708495539309522WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634">Just in case you misse=
d it (as you didn=E2=80=99t comment on my comment about it), there was a ty=
po in the log message as well.</span></p></div></div></blockquote><div><br>=
</div><div>Yup. Noticed that, it isn&#39;t the only typo ;)</div><div><br><=
/div><div>This is a resend of a patch I sent a few weeks ago, so I&#39;m no=
t too worried if it sits or not.</div><div><br></div><div>Cheers,</div><div=
><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div lang=3D"SV" link=3D"blue" vlink=3D"purple"><div class=3D"m_77667084955=
39309522WordSection1"><p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"=
font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634"><u></u>=C2=A0<u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634">//Peter<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634"><u></u>=C2=A0<u></u></=
span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Bruce Ashfield [mailto:<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.<wbr>com</a>]
<br>
<b>Sent:</b> den 21 augusti 2017 17:14<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"=
_blank">richard.purdie@<wbr>linuxfoundation.org</a>; <a href=3D"mailto:open=
embedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@l=
ists.<wbr>openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH 8/9] kernel-yocto: ensure that only va=
lid BSPs are built<u></u><u></u></span></p>
</div>
</div><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Mon, Aug 21, 2017 at 11:03 AM, Bruce Ashfield &lt=
;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfie=
ld@gmail.com</a>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Aug 21, 2017 at 11:00 AM, Peter Kjellerstedt=
 &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter=
.kjellerstedt@axis.com</a>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">&gt; -----Original Me=
ssage-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg" target=3D"_blank">
openembedded-core-bounces@<wbr>lists.openembedded.org</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org" target=3D"_blank">openembedded-core-<wbr>bounces@lists.openembedded.o=
rg</a><wbr>] On Behalf Of<br>
&gt; Bruce Ashfield<br>
&gt; Sent: den 21 augusti 2017 04:58<br>
&gt; To: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@<wbr>linuxfoundation.org</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Subject: [OE-core] [PATCH 8/9] kernel-yocto: ensure that only valid<br=
>
&gt; BSPs are built<br>
&gt;<br>
&gt; There was a bug in the search routines responsible for locating<br>
&gt; BSP definitions which returned a valid match if only the ktype<br>
&gt; matched.<br>
&gt;<br>
&gt; This meant that someone looking for &quot;qemux86foo&quot; (which is a=
n<br>
&gt; invalid definition) would potentially end up building &quot;qemuarm&qu=
ot;<br>
&gt; and be none the wiser (until it didn&#39;t boot).<br>
&gt;<br>
&gt; With this fix to the tools search routine, and improved return<br>
&gt; code testing, we will now stop the build and report and error to<br>
&gt; the user.<br>
&gt;<br>
&gt; [YOCTO: #11878]<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@win=
driver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-yocto.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt;=C2=A0 meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools=
-native_git.bb" target=3D"_blank">kern-tools-native_git.bb</a> | 2 +-<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/<a href=3D"http://kernel-yocto.bb" target=3D=
"_blank">kernel-yocto.bb</a><wbr>class b/meta/classes/<a href=3D"http://ker=
nel-yocto.bb" target=3D"_blank">kernel-yocto.bb</a><wbr>class<br>
&gt; index 1ca0756c4959..3c6df92131bc 100644<br>
&gt; --- a/meta/classes/<a href=3D"http://kernel-yocto.bb" target=3D"_blank=
">kernel-yocto.bb</a><wbr>class<br>
&gt; +++ b/meta/classes/<a href=3D"http://kernel-yocto.bb" target=3D"_blank=
">kernel-yocto.bb</a><wbr>class<br>
&gt; @@ -143,6 +143,9 @@ do_kernel_metadata() {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# expand kernel features into their full pat=
h equivalents<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bsp_definition=3D$(spp ${includes} --find -D=
KMACHINE=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE})<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ] || [ -z &quot;${bsp_definition}&q=
uot; ]; then<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">Use $bsp_definition instead of ${bsp_definition} sin=
ce it is a<br>
shell variable and not a bitbake variable.<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
<div>
<p class=3D"MsoNormal">I always use ${...}, so I&#39;m going to stay consis=
tent with what is already in<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">the file.=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal"><br>
Actually, after looking at the code in that bbclass, I see this<br>
used for a number of shell variables all over the place. This is<br>
actually bad, and you should rewrite the code to not use ${variable}<br>
for shell variables. The reason this is bad is because these<br>
variables unnecessarily end up in the sstate hash for these functions,<br>
and if someone actually happens to define a bitbake variable with the<br>
same name as one of those shell variables, the result will not be what<br>
is expected...<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Not something high on my priority list. It&#39;s bee=
n that way since the beginning.<u></u><u></u></p>
</div>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">.. but I will loop back and take care of the issues =
before M4 closes. Just a bit busy<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">pushing out the new kernels and a slew of bug fixes.=
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">This patch can be ignored (if needed) until I get ba=
ck around to that.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Cheers,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Cheers,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Cou=
ld not locate BSP definiton for ${KMACHINE}/${LINUX_KERNEL_<wbr>TYPE}.&quot=
;<br>
<br>
Change &quot;definiton&quot; to &quot;definition&quot;.<br>
<br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt; +=C2=A0 =
=C2=A0 =C2=A0fi</span><br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0meta_dir=3D$(kgit --meta)</span><br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt;</span><br=
>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0# run1: pull all the configuration fragments, no matter wh=
ere they come from</span><br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt; diff --gi=
t a/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools-native=
_git.bb" target=3D"_blank">kern-tools-native_git.bb</a> b/meta/recipes-kern=
el/kern-<wbr>tools/<a href=3D"http://kern-tools-native_git.bb" target=3D"_b=
lank">kern-tools-native_git.bb</a></span><br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt; index 221=
7a31076a2..4a78b897d34f 100644</span><br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt; --- a/met=
a/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools-native_git.bb=
" target=3D"_blank">kern-tools-native_git.bb</a></span><br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt; +++ b/met=
a/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools-native_git.bb=
" target=3D"_blank">kern-tools-native_git.bb</a></span><br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt; @@ -4,7 +=
4,7 @@ LIC_FILES_CHKSUM =3D &quot;<a>file://git/tools/kgit;<wbr>beginline=
=3D5;endline=3D9;md5=3D<wbr>a6c2fa8aef1b<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D </a>&quot;git-native&quot;</span><br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt;</span><br=
>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt; -SRCREV =
=3D &quot;<wbr>9cd2b626d652bec10c6bc75275b35b<wbr>fee74d447c&quot;</span><b=
r>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt; +SRCREV =
=3D &quot;<wbr>0571411cc033c11df7827508dd7868<wbr>76ce2f8c83&quot;</span><b=
r>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt;=C2=A0 PR =
=3D &quot;r12&quot;</span><br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt;=C2=A0 PV =
=3D &quot;0.2+git${SRCPV}&quot;</span><br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt;</span><br=
>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt; --</span>=
<br>
<span class=3D"m_7766708495539309522m-6619940750513795977im">&gt; 2.5.0</sp=
an><br>
<br>
<span class=3D"m_7766708495539309522m-6619940750513795977hoenzb"><span styl=
e=3D"color:#888888">//Peter</span></span><u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/ope=
nembedded-<wbr>core</a><u></u><u></u></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#888888"><br>
<br clear=3D"all">
<span class=3D"m_7766708495539309522hoenzb"><u></u><u></u></span></span></p=
>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_7766708495539309522hoenzb"><span st=
yle=3D"color:#888888">-- </span><u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#888888">&quot;Thou shalt not f=
ollow the NULL pointer, for chaos and madness await thee at its end&quot;</=
span><u></u><u></u></p>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><br>
<br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal">-- <u></u><u></u></p>
<div>
<p class=3D"MsoNormal">&quot;Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end&quot;<u></u><u></u></p>
</div>
</div>
</div>
</div></div></div>
</div>
</div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a114e2482ea4e46055744fcd1--
