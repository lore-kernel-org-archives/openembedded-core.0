Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Td3xu-0007Pa-Sd
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 20:03:34 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so8329609lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 10:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NID/hJMDZa6UBqZqr7P6GWr88Edrtaaz3DsZYR4ux8Q=;
	b=dc5FZtvrP4HgUPFQ2rbVnkG1UNo0E75xlh8qATywOJ5wTPiIy+QuzCBLO1S36M/v9y
	JuHW1A8LuWYm8R7Yx6I+A16RRZzA7EaxSgQ34FspVxBTx2vVoFKBkqOvG0OgyZBtkIGr
	DpMWYQ2+hkGiPaRPH/AMv4/+JewW8tcvMoBKzoDYElGqshuf+8QTxv5hyCfTr1nGrEtK
	lpEvD1YIjVf21HjczhN8VVMjIFyJPHV0sK9o/ZqJ8V++0Lohj69uw1RgdWak0SrPaXzx
	uH/D11cBLxbo3dARDFJi8dKHd94lHixfzMZmA9Kj1HSub9kk/8TyOTyHBzqHnbAKoboA
	PW2A==
MIME-Version: 1.0
Received: by 10.112.46.199 with SMTP id x7mr5483616lbm.109.1353955762720; Mon,
	26 Nov 2012 10:49:22 -0800 (PST)
Received: by 10.114.17.8 with HTTP; Mon, 26 Nov 2012 10:49:22 -0800 (PST)
In-Reply-To: <20121126135758.GB3401@jama.jama.net>
References: <1348318001-18232-1-git-send-email-Martin.Jansa@gmail.com>
	<1353933452-13251-1-git-send-email-Martin.Jansa@gmail.com>
	<CADkTA4N2mbhBgh4o3W9mwa3Jg7ohZEB13FsEGoOLQZ04t1fAcQ@mail.gmail.com>
	<20121126135758.GB3401@jama.jama.net>
Date: Mon, 26 Nov 2012 13:49:22 -0500
Message-ID: <CADkTA4MvN5v4_2OgHY9gj6e+Aj182pmZDQDW=6aKokPPbJRVXw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: use the same versioning schema for modules.tgz and provide link to latest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 19:03:35 -0000
Content-Type: multipart/alternative; boundary=bcaec554056847524f04cf6a64db

--bcaec554056847524f04cf6a64db
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 26, 2012 at 8:57 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Mon, Nov 26, 2012 at 08:49:32AM -0500, Bruce Ashfield wrote:
> > On Mon, Nov 26, 2012 at 7:37 AM, Martin Jansa <martin.jansa@gmail.com
> >wrote:
> >
> > > * so it will work look KERNEL_IMAGE
> > > * also we were recreating modules.tgz with every kernel build, but
> > >   overwritting the same output file
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/classes/kernel.bbclass | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > index ee59aaf..9c70e70 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -497,6 +497,10 @@ KERNEL_IMAGE_BASE_NAME ?=
> > > "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DA
> > >  # Don't include the DATETIME variable in the sstate package signatures
> > >  KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
> > >  KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
> > > +MODULE_TARBALL_BASE_NAME ?=
> > > "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}.tgz"
> > > +# Don't include the DATETIME variable in the sstate package signatures
> > > +MODULE_TARBALL_BASE_NAME[vardepsexclude] = "DATETIME"
> > > +MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
> > >
> > >  do_uboot_mkimage() {
> > >         if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> > > @@ -526,7 +530,8 @@ addtask uboot_mkimage before do_install after
> > > do_compile
> > >  kernel_do_deploy() {
> > >         install -m 0644 ${KERNEL_OUTPUT}
> > > ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> > >         if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> > > -               tar -cvzf
> > > ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
> > > +               tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C
> ${D}
> > > lib
> > > +               ln -sf ${MODULE_TARBALL_BASE_NAME}.bin
> > > ${MODULE_TARBALL_SYMLINK_NAME}
> > >
> >
> > Just a quick question, are there any concerns about existing users of the
> > old tgz name ? Obviously, if they were in oe-core, we'd know about them
> > and update them, but I have no idea myself how much (if anything) was
> based
> > on the old name. I'm not sure of the best practices oe-core/oe uses for
> > cases
> > like this in the past, so I thought I'd ask.
>
> I remember seeing some thread about making whole modules tarball
> creation optional and disabled by default, so I guess there is only a
> few users of this.
>

Agreed. It isn't common, the modules package yes .. the tarball, not that
I've
heard much about.


>
> > The old shorter name was nice, but I agree that having it different than
> > the image
> > name makes it non obvious how to associate the image and modules, and
> that's
> > a nice thing to fix.
>
> True, but since oldname was the same for different kernel images I
> always found misleading to see 5 different uImages and only one modules
> tarball (which we know was created during build of latest uImage - but
> maybe not newest uImage version wise - so quite confusing for someone
> just trying to download matching uImage and modules).
>

I definitely agree.


>
> > Since we are already making a symlink, I guess we could consider
> > a transnational
> > symlink with the old name ? (but then again, if the link is there, people
> > will continue
> > to have dependencies on it and not update their own code).
>
> I don't mind having 2 symlinks if there is the need for old name.
>

I'd wait to see if anyone pops up with a strong opinion. I'm all for making
the
file names consistent, but having a temporary symlink to catch any outliers
might be a good thing too.

So I'm a solid "maybe" :) I'm hoping RP has a stronger opinion on the
migration
path from the existing name.

Cheers,

Bruce


>
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec554056847524f04cf6a64db
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2012 at 8:57 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Mon, Nov 26, 2012 at 08:49:32AM =
-0500, Bruce Ashfield wrote:<br>
&gt; On Mon, Nov 26, 2012 at 7:37 AM, Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;wrote:<br>
&gt;<br>
&gt; &gt; * so it will work look KERNEL_IMAGE<br>
&gt; &gt; * also we were recreating modules.tgz with every kernel build, bu=
t<br>
&gt; &gt; =A0 overwritting the same output file<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gm=
ail.com">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =A0meta/classes/kernel.bbclass | 7 ++++++-<br>
&gt; &gt; =A01 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bb=
class<br>
&gt; &gt; index ee59aaf..9c70e70 100644<br>
&gt; &gt; --- a/meta/classes/kernel.bbclass<br>
&gt; &gt; +++ b/meta/classes/kernel.bbclass<br>
&gt; &gt; @@ -497,6 +497,10 @@ KERNEL_IMAGE_BASE_NAME ?=3D<br>
&gt; &gt; &quot;${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DA<br>
&gt; &gt; =A0# Don&#39;t include the DATETIME variable in the sstate packag=
e signatures<br>
&gt; &gt; =A0KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D &quot;DATETIME&quot=
;<br>
&gt; &gt; =A0KERNEL_IMAGE_SYMLINK_NAME ?=3D &quot;${KERNEL_IMAGETYPE}-${MAC=
HINE}&quot;<br>
&gt; &gt; +MODULE_TARBALL_BASE_NAME ?=3D<br>
&gt; &gt; &quot;modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}.tgz&quot;<=
br>
&gt; &gt; +# Don&#39;t include the DATETIME variable in the sstate package =
signatures<br>
&gt; &gt; +MODULE_TARBALL_BASE_NAME[vardepsexclude] =3D &quot;DATETIME&quot=
;<br>
&gt; &gt; +MODULE_TARBALL_SYMLINK_NAME ?=3D &quot;modules-${MACHINE}.tgz&qu=
ot;<br>
&gt; &gt;<br>
&gt; &gt; =A0do_uboot_mkimage() {<br>
&gt; &gt; =A0 =A0 =A0 =A0 if test &quot;x${KERNEL_IMAGETYPE}&quot; =3D &quo=
t;xuImage&quot; ; then<br>
&gt; &gt; @@ -526,7 +530,8 @@ addtask uboot_mkimage before do_install after=
<br>
&gt; &gt; do_compile<br>
&gt; &gt; =A0kernel_do_deploy() {<br>
&gt; &gt; =A0 =A0 =A0 =A0 install -m 0644 ${KERNEL_OUTPUT}<br>
&gt; &gt; ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin<br>
&gt; &gt; =A0 =A0 =A0 =A0 if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39; =
.config); then<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -cvzf<br>
&gt; &gt; ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${=
D} lib<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tar -cvzf ${DEPLOYDIR}/${MODULE_TAR=
BALL_BASE_NAME} -C ${D}<br>
&gt; &gt; lib<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln -sf ${MODULE_TARBALL_BASE_NAME}.=
bin<br>
&gt; &gt; ${MODULE_TARBALL_SYMLINK_NAME}<br>
&gt; &gt;<br>
&gt;<br>
&gt; Just a quick question, are there any concerns about existing users of =
the<br>
&gt; old tgz name ? Obviously, if they were in oe-core, we&#39;d know about=
 them<br>
&gt; and update them, but I have no idea myself how much (if anything) was =
based<br>
&gt; on the old name. I&#39;m not sure of the best practices oe-core/oe use=
s for<br>
&gt; cases<br>
&gt; like this in the past, so I thought I&#39;d ask.<br>
<br>
</div></div>I remember seeing some thread about making whole modules tarbal=
l<br>
creation optional and disabled by default, so I guess there is only a<br>
few users of this.<br></blockquote><div><br></div><div>Agreed. It isn&#39;t=
 common, the modules package yes .. the tarball, not that I&#39;ve</div><di=
v>heard much about.</div><div>=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D"im"><br>
&gt; The old shorter name was nice, but I agree that having it different th=
an<br>
&gt; the image<br>
&gt; name makes it non obvious how to associate the image and modules, and =
that&#39;s<br>
&gt; a nice thing to fix.<br>
<br>
</div>True, but since oldname was the same for different kernel images I<br=
>
always found misleading to see 5 different uImages and only one modules<br>
tarball (which we know was created during build of latest uImage - but<br>
maybe not newest uImage version wise - so quite confusing for someone<br>
just trying to download matching uImage and modules).<br></blockquote><div>=
<br></div><div>I definitely agree.</div><div>=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

<div class=3D"im"><br>
&gt; Since we are already making a symlink, I guess we could consider<br>
&gt; a transnational<br>
&gt; symlink with the old name ? (but then again, if the link is there, peo=
ple<br>
&gt; will continue<br>
&gt; to have dependencies on it and not update their own code).<br>
<br>
</div>I don&#39;t mind having 2 symlinks if there is the need for old name.=
<br></blockquote><div><br></div><div>I&#39;d wait to see if anyone pops up =
with a strong opinion. I&#39;m all for making the</div><div>file names cons=
istent, but having a temporary symlink to catch any outliers<br>
might=A0be a good thing too.</div><div><br></div><div>So I&#39;m a solid &q=
uot;maybe&quot; :) I&#39;m hoping RP has a stronger opinion on the migratio=
n</div><div>path from the existing name.</div><div><br></div><div>Cheers,</=
div>
<div><br></div><div>Bruce</div><div>=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<br>
Cheers,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;<br>
</div>

--bcaec554056847524f04cf6a64db--
