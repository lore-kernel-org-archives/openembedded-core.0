Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id E7A1578371
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 15:03:33 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id u133so50956329vke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yswKMVc3RqsURWmWt3EPECepkBFcMv50D9cTj9mnOWQ=;
	b=Q+uC0pycVKyQVMldbq6XCaEUZITJVtct4KnZYajyCAqn7uX11TFXeqlQWwmkAt7z1i
	V7CkTNGBTUfBS8oqJWBkIx4/Tx3UfJzNKawS2ypIVSKrXJBHGVYgrztqF2o4/pRq3tmm
	to0QHteQz+onKPuBq4HKVjIzpjXj9pNcocyo9yGanFakxSoj182v99UUkMOT0RmzpG8E
	hzh22VQh28aPRa/WAYLAN/FjEBkYBM4lxfP1LRjJJNKj71rJWxCkhcacic5otUT9Vx7e
	qx6u/0jxso4AxTTIwNjlLmAIpze+GCXimmxAqNosbly7y5z05PfHphukZWD0WkSh0xyx
	k20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yswKMVc3RqsURWmWt3EPECepkBFcMv50D9cTj9mnOWQ=;
	b=bc3+y272tCoXH+wbnHCt+8XhrMYPSIyJLdv6CEWudiejr9fateM2HSwvqpYImeP9+D
	MFovG/3k5QVsgYPDI6IXQRSqpmpPyopokCou/WeJxtv5LEa5vJ4JoHmtsC0J5XZvvZAf
	EF2HJGcNef7PANjbx2nuUET6LcHA1dHRlT8LURqzjGdZgOtJsIgAEF9/P45DXslR7hoI
	mkAHcpJne4dQBsXpolo5AlPVL/RCFGvYRzr8SmbZpU100MLt8lIMhWcHxW3K4lrW82tM
	nbP14rxl0TBOTiRHZNZyGGGCS0vm7eUiderkpz9Hk8pTVfQvrTVu2jXsqieWAeuGlTu6
	mw4w==
X-Gm-Message-State: AHYfb5htXyv92OMVVMO4O4dELz4oF+A0HVYggK6HovacFBqwKvTMuTaX
	WkFGYzoHIrrCb6lodMr/qvDuYEEWVg==
X-Received: by 10.31.203.69 with SMTP id b66mr3923560vkg.144.1503327814424;
	Mon, 21 Aug 2017 08:03:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Mon, 21 Aug 2017 08:03:33 -0700 (PDT)
In-Reply-To: <b68f37bbad5940a8bdb7f165a7600f18@XBOX02.axis.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<ab92e7d90c416d6e5cdb17cdba269e09ec967607.1503283308.git.bruce.ashfield@windriver.com>
	<b68f37bbad5940a8bdb7f165a7600f18@XBOX02.axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 Aug 2017 11:03:33 -0400
Message-ID: <CADkTA4Nx3EAgggD2ohyZJpX2ZGUgKvmQK-KFLTnreJSjO830Zw@mail.gmail.com>
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
X-List-Received-Date: Mon, 21 Aug 2017 15:03:34 -0000
Content-Type: multipart/alternative; boundary="001a114dd8f65c1bcc055744c8a0"

--001a114dd8f65c1bcc055744c8a0
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 21, 2017 at 11:00 AM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

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
> > diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> > index 1ca0756c4959..3c6df92131bc 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -143,6 +143,9 @@ do_kernel_metadata() {
> >
> >       # expand kernel features into their full path equivalents
> >       bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE}
> -DKTYPE=${LINUX_KERNEL_TYPE})
> > +     if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
>
> Use $bsp_definition instead of ${bsp_definition} since it is a
> shell variable and not a bitbake variable.
>

I always use ${...}, so I'm going to stay consistent with what is already in
the file.


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

Not something high on my priority list. It's been that way since the
beginning.

Cheers,

Bruce


>
> > +             bbfatal_log "Could not locate BSP definiton for
> ${KMACHINE}/${LINUX_KERNEL_TYPE}."
>
> Change "definiton" to "definition".
>
> > +     fi
> >       meta_dir=$(kgit --meta)
> >
> >       # run1: pull all the configuration fragments, no matter where they
> come from
> > diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > index 2217a31076a2..4a78b897d34f 100644
> > --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;
> beginline=5;endline=9;md5=a6c2fa8aef1b
> >
> >  DEPENDS = "git-native"
> >
> > -SRCREV = "9cd2b626d652bec10c6bc75275b35bfee74d447c"
> > +SRCREV = "0571411cc033c11df7827508dd786876ce2f8c83"
> >  PR = "r12"
> >  PV = "0.2+git${SRCPV}"
> >
> > --
> > 2.5.0
>
> //Peter
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114dd8f65c1bcc055744c8a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 21, 2017 at 11:00 AM, Peter Kjellerstedt <span dir=3D"ltr">=
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div class=3D"HOEnZb"><div class=3D"h5">&gt; -----Original Message-----<=
br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg">openembedded-core-bounces@<wbr>lists.openembedded.org</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org">openembedded-core-<wbr>bounces@lists.openembedded.org</a><wbr>] On Be=
half Of<br>
&gt; Bruce Ashfield<br>
&gt; Sent: den 21 augusti 2017 04:58<br>
&gt; To: <a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@<wbr>linuxfoundation.org</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
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
driver.com">bruce.ashfield@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-yocto.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt;=C2=A0 meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools=
-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.=
bb</a> | 2 +-<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel-yocto.<wbr>bbclass b/meta/classes/ker=
nel-yocto.<wbr>bbclass<br>
&gt; index 1ca0756c4959..3c6df92131bc 100644<br>
&gt; --- a/meta/classes/kernel-yocto.<wbr>bbclass<br>
&gt; +++ b/meta/classes/kernel-yocto.<wbr>bbclass<br>
&gt; @@ -143,6 +143,9 @@ do_kernel_metadata() {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# expand kernel features into their full pat=
h equivalents<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bsp_definition=3D$(spp ${includes} --find -D=
KMACHINE=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE})<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ] || [ -z &quot;${bsp_definition}&q=
uot; ]; then<br>
<br>
</div></div>Use $bsp_definition instead of ${bsp_definition} since it is a<=
br>
shell variable and not a bitbake variable.<br></blockquote><div><br></div><=
div>I always use ${...}, so I&#39;m going to stay consistent with what is a=
lready in</div><div>the file.=C2=A0</div><div>=C2=A0<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
Actually, after looking at the code in that bbclass, I see this<br>
used for a number of shell variables all over the place. This is<br>
actually bad, and you should rewrite the code to not use ${variable}<br>
for shell variables. The reason this is bad is because these<br>
variables unnecessarily end up in the sstate hash for these functions,<br>
and if someone actually happens to define a bitbake variable with the<br>
same name as one of those shell variables, the result will not be what<br>
is expected...<br></blockquote><div><br></div><div>Not something high on my=
 priority list. It&#39;s been that way since the beginning.</div><div><br><=
/div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Cou=
ld not locate BSP definiton for ${KMACHINE}/${LINUX_KERNEL_<wbr>TYPE}.&quot=
;<br>
<br>
</span>Change &quot;definiton&quot; to &quot;definition&quot;.<br>
<span class=3D"im HOEnZb"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta_dir=3D$(kgit --meta)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# run1: pull all the configuration fragments=
, no matter where they come from<br>
&gt; diff --git a/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://ker=
n-tools-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-nati=
ve_git.bb</a> b/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-=
tools-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native=
_git.bb</a><br>
&gt; index 2217a31076a2..4a78b897d34f 100644<br>
&gt; --- a/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools=
-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.=
bb</a><br>
&gt; +++ b/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools=
-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.=
bb</a><br>
&gt; @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D &quot;file://git/tools/kgit;<wbr>=
beginline=3D5;endline=3D9;md5=3D<wbr>a6c2fa8aef1b<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;git-native&quot;<br>
&gt;<br>
&gt; -SRCREV =3D &quot;<wbr>9cd2b626d652bec10c6bc75275b35b<wbr>fee74d447c&q=
uot;<br>
&gt; +SRCREV =3D &quot;<wbr>0571411cc033c11df7827508dd7868<wbr>76ce2f8c83&q=
uot;<br>
&gt;=C2=A0 PR =3D &quot;r12&quot;<br>
&gt;=C2=A0 PV =3D &quot;0.2+git${SRCPV}&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.5.0<br>
<br>
</span><span class=3D"HOEnZb"><font color=3D"#888888">//Peter<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a114dd8f65c1bcc055744c8a0--
