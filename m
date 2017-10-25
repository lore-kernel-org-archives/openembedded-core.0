Return-Path: <vomegaz@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFAC6069C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 07:25:08 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id e89so26568118ioi.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 00:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KI2wY6EYlh/+SMH2Hm1DScztkjOGMh+N6rQ2T0icv54=;
	b=QNrvmt1yNXuiz9StYKf4GpemAlEdV1kFwe4HFppj9c/4OR91H4JFXt51lQdafGImej
	emwerVjhXCOOqEqVMVJcvabGFk9AM6uSDLyzyD/CpolSSiE3v1IEyebfEb3lHivlMgnt
	dwh6+UVk6YnXEDvu0+87uHswyMkU4FGmecccKS9fGGUPUcQEOQJQIpyduZzRMIL9lxIj
	7fbActgMCPCBAZVr8oZGGYGSMSQs3sFlb3trVah9SqyoE7vaTKhumqeADjc2+S4PxiJU
	Stp/vHgArxtvDDfD2Cya/SQwvmxYdRxZa+zUGQH1it7+tz4KftIc488v/NRP5TFXLWSo
	eMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=KI2wY6EYlh/+SMH2Hm1DScztkjOGMh+N6rQ2T0icv54=;
	b=C3iUxD5NBQoHitozwz7klX5Gs3B2apUMRevIVUzIxJAnAqsiM7Q97BuMO+6KiSlE2v
	3mjgzQ47spPlX3VCOpkWIkhcebjiLtvd/14PEjq/5u0XK+s/Y+83EAulSbmby3R1PIrw
	t2rFRoUxwb44dos4JMnUJKi9VtJJjjnqa/DIIMKmmX412pczYeSmY48RK8WieIfYn71C
	uOSQNmA6GwMUzMoPObIxFGYFy4sU2oAOuQfSxQZBa50fiL/GYiU8IJDWoD4JdQz4X7tG
	X/2PPd5tkr1kuM8lAC4hIMaHFaBDqQdm52zZn9Yr5hadtF2H2Ift6QJRe6ywxHqKmzok
	BfgQ==
X-Gm-Message-State: AMCzsaWedgUHkie8gxniC24/+UBvYEh7diNIsDxrutt9pj84LUZdpXJW
	bEzw2JzRrnWVCfOw3eazmqAe4i6EK5iM3cmRF8N4zZtk
X-Google-Smtp-Source: ABhQp+RmKAC0Qn1qWGUFo231DmOwO7IZ9cMNnpE8GWM0/z+iOzLP2iVq9O7h8/djkopUEr1hNfCjLliaEUm1N+1kc8U=
X-Received: by 10.107.46.143 with SMTP id u15mr6281667iou.251.1508916309968;
	Wed, 25 Oct 2017 00:25:09 -0700 (PDT)
MIME-Version: 1.0
Reply-To: thomas.perrot@tupi.fr
Sender: vomegaz@gmail.com
Received: by 10.107.167.211 with HTTP; Wed, 25 Oct 2017 00:24:29 -0700 (PDT)
In-Reply-To: <1508832501.13607.13.camel@andred.net>
References: <20171023162325.10686-1-thomas.perrot@tupi.fr>
	<1508832501.13607.13.camel@andred.net>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Wed, 25 Oct 2017 09:24:29 +0200
X-Google-Sender-Auth: g0txxr_i7MLtHZR3O9qBiCO2Ux0
Message-ID: <CAGXeWg=w4r4E4YR4kd+u1vAazTRxSbDFaDtaDkjBdnJ57-w2Tw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta][pyro][PATCHv2] Avoid a circular dependency between do_concat_dtb and do_assemble_fitimage
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
X-List-Received-Date: Wed, 25 Oct 2017 07:25:09 -0000
Content-Type: multipart/alternative; boundary="001a113aa89ca6cdf2055c59f420"

--001a113aa89ca6cdf2055c59f420
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

It is an issue with the fitImage generation when UBOOT_SIGN_ENABLE is
enabled, unrelated to extlinux.

I just update the commit message and push a v3 of this patch.

Best regards,
Thomas P.



On Tue, Oct 24, 2017 at 10:08 AM, Andr=C3=A9 Draszik <git@andred.net> wrote=
:

> Hi,
>
> On Mon, 2017-10-23 at 18:23 +0200, Thomas Perrot wrote:
> > Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
>
> Your commit message doesn't explain what problem you're trying to solve.
>
> I can only guess that it's the same as this:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-September/142619.html
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-September/142621.html
>
> ? If so, just submit requests for backporting, or explain why this doesn'=
t
> work in pyro.
>
>
> > ---
> >  meta/classes/kernel-fitimage.bbclass |  2 +-
> >  meta/classes/uboot-sign.bbclass      | 21 +++++++++------------
> >  2 files changed, 10 insertions(+), 13 deletions(-)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel=
-
> > fitimage.bbclass
> > index abbc309b09..5ad439e82d 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -31,7 +31,7 @@ python __anonymous () {
> >          # the fitImage:
> >          if d.getVar('UBOOT_SIGN_ENABLE') =3D=3D "1":
> >              uboot_pn =3D d.getVar('PREFERRED_PROVIDER_u-boot') or
> 'u-boot'
> > -            d.appendVarFlag('do_assemble_fitimage', 'depends', '
> > %s:do_deploy' % uboot_pn)
> > +            d.appendVarFlag('do_assemble_fitimage', 'depends', '
> > %s:do_deploy_dtb' % uboot_pn)
>
> You should also update the description of the executed tasks at the top o=
f
> uboot-sign.bbclass if you're changing this.
>
> Cheers,
> Andre'
>
>
> >  }
> >
> >  # Options for the device tree compiler passed to mkimage '-D' feature:
> > diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-
> > sign.bbclass
> > index 8ee904e7df..2f616bf2a9 100644
> > --- a/meta/classes/uboot-sign.bbclass
> > +++ b/meta/classes/uboot-sign.bbclass
> > @@ -47,16 +47,14 @@ do_deploy_dtb () {
> >       cd ${DEPLOYDIR}
> >
> >       if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
> > -             install ${B}/${UBOOT_DTB_BINARY}
> > ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
> > -             rm -f ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SYMLINK}
> > -             ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_SYMLINK}
> > -             ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_BINARY}
> > +             install ${B}/${UBOOT_DTB_BINARY}
> > ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}
> > +             ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}
> > ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_SYMLINK}
> > +             ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}
> > ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}
> >       fi
> >       if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then
> > -             install ${B}/${UBOOT_NODTB_BINARY}
> > ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
> > -             rm -f ${UBOOT_NODTB_BINARY} ${UBOOT_NODTB_SYMLINK}
> > -             ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
> > -             ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
> > +             install ${B}/${UBOOT_NODTB_BINARY}
> > ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> > +             ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> > ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_SYMLINK}
> > +             ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> > ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_BINARY}
> >       fi
> >  }
> >
> > @@ -70,11 +68,10 @@ do_concat_dtb () {
> >                       oe_runmake
> > EXT_DTB=3D${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
> >                       install ${B}/${UBOOT_BINARY}
> > ${DEPLOYDIR}/${UBOOT_IMAGE}
> >                       install ${B}/${UBOOT_BINARY}
> > ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
> > -             elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e
> > "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
> > -                     cd ${DEPLOYDIR}
> > -                     cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee
> > ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
> > +             elif [ -e "${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}" -a
> > -e "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}" ]; then
> > +                     cat ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> > ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} >
> > ${UBOOT_IMAGE}
> >               else
> > -                     bbwarn "Failure while adding public key to u-boot
> > binary. Verified boot won't be available."
> > +                     bbfatal "Failure while adding public key to u-
> > boot binary. Verified boot won't be available."
> >               fi
> >       fi
> >  }
> > --
> > 2.13.6
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113aa89ca6cdf2055c59f420
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>It is an issue with the fi=
tImage generation when UBOOT_SIGN_ENABLE is enabled, <span id=3D"gmail-resu=
lt_box" class=3D"gmail-short_text" tabindex=3D"-1" lang=3D"en"><span>unrela=
ted to extlinux.<br></span></span></div><div><span id=3D"gmail-result_box" =
class=3D"gmail-short_text" tabindex=3D"-1" lang=3D"en"><span><br></span></s=
pan></div><div><span id=3D"gmail-result_box" class=3D"gmail-short_text" tab=
index=3D"-1" lang=3D"en"><span>I just update the commit message and push a =
v3 of this patch.<br></span></span></div><div><span id=3D"gmail-result_box"=
 class=3D"gmail-short_text" tabindex=3D"-1" lang=3D"en"><span><br></span></=
span></div><span id=3D"gmail-result_box" class=3D"gmail-short_text" tabinde=
x=3D"-1" lang=3D"en"><span>Best regards,<br></span></span></div><span id=3D=
"gmail-result_box" class=3D"gmail-short_text" tabindex=3D"-1" lang=3D"en"><=
span>Thomas P.</span></span><br><br><br><br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote">On Tue, Oct 24, 2017 at 10:08 AM, Andr=C3=A9 Draszik=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:git@andred.net" target=3D"_blank">=
git@andred.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<=
br>
<span class=3D""><br>
On Mon, 2017-10-23 at 18:23 +0200, Thomas Perrot wrote:<br>
&gt; Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@tupi.=
fr">thomas.perrot@tupi.fr</a>&gt;<br>
<br>
</span>Your commit message doesn&#39;t explain what problem you&#39;re tryi=
ng to solve.<br>
<br>
I can only guess that it&#39;s the same as this:<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2017-S=
eptember/142619.html" rel=3D"noreferrer" target=3D"_blank">http://lists.ope=
nembedded.org/<wbr>pipermail/openembedded-core/<wbr>2017-September/142619.h=
tml</a><br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2017-S=
eptember/142621.html" rel=3D"noreferrer" target=3D"_blank">http://lists.ope=
nembedded.org/<wbr>pipermail/openembedded-core/<wbr>2017-September/142621.h=
tml</a><br>
<br>
? If so, just submit requests for backporting, or explain why this doesn&#3=
9;t<br>
work in pyro.<br>
<span class=3D""><br>
<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-fitimage.<wbr>bbclass |=C2=A0 2 +-<br>
&gt;=C2=A0 meta/classes/uboot-sign.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 | 21 ++=
+++++++------------<br>
&gt;=C2=A0 2 files changed, 10 insertions(+), 13 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel-<wbr>fitimage.bbclass b/meta/classes/=
kernel-<br>
&gt; fitimage.bbclass<br>
&gt; index abbc309b09..5ad439e82d 100644<br>
&gt; --- a/meta/classes/kernel-<wbr>fitimage.bbclass<br>
&gt; +++ b/meta/classes/kernel-<wbr>fitimage.bbclass<br>
&gt; @@ -31,7 +31,7 @@ python __anonymous () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the fitImage:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&#39;UBOOT_SIGN_ENABLE&#=
39;) =3D=3D &quot;1&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uboot_pn =3D d.getVar(=
&#39;PREFERRED_PROVIDER_<wbr>u-boot&#39;) or &#39;u-boot&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_ass=
emble_<wbr>fitimage&#39;, &#39;depends&#39;, &#39;<br>
&gt; %s:do_deploy&#39; % uboot_pn)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_ass=
emble_<wbr>fitimage&#39;, &#39;depends&#39;, &#39;<br>
&gt; %s:do_deploy_dtb&#39; % uboot_pn)<br>
<br>
</span>You should also update the description of the executed tasks at the =
top of<br>
uboot-sign.bbclass if you&#39;re changing this.<br>
<br>
Cheers,<br>
Andre&#39;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 # Options for the device tree compiler passed to mkimage &#39;-D=
&#39; feature:<br>
&gt; diff --git a/meta/classes/uboot-sign.<wbr>bbclass b/meta/classes/uboot=
-<br>
&gt; sign.bbclass<br>
&gt; index 8ee904e7df..2f616bf2a9 100644<br>
&gt; --- a/meta/classes/uboot-sign.<wbr>bbclass<br>
&gt; +++ b/meta/classes/uboot-sign.<wbr>bbclass<br>
&gt; @@ -47,16 +47,14 @@ do_deploy_dtb () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${DEPLOYDIR}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/${UBOOT_=
DTB_BINARY}<br>
&gt; ${DEPLOYDIR}/${UBOOT_DTB_<wbr>IMAGE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${UBOOT_DTB_BIN=
ARY} ${UBOOT_DTB_SYMLINK}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UBOOT_DTB_IM=
AGE} ${UBOOT_DTB_SYMLINK}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UBOOT_DTB_IM=
AGE} ${UBOOT_DTB_BINARY}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/${UBOOT_=
DTB_BINARY}<br>
&gt; ${DEPLOY_DIR_IMAGE}/${UBOOT_<wbr>DTB_IMAGE}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${DEPLOY_DIR_I=
MAGE}/${UBOOT_<wbr>DTB_IMAGE}<br>
&gt; ${DEPLOY_DIR_IMAGE}/${UBOOT_<wbr>DTB_SYMLINK}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${DEPLOY_DIR_I=
MAGE}/${UBOOT_<wbr>DTB_IMAGE}<br>
&gt; ${DEPLOY_DIR_IMAGE}/${UBOOT_<wbr>DTB_BINARY}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/${UBOOT_=
NODTB_BINARY}<br>
&gt; ${DEPLOYDIR}/${UBOOT_NODTB_<wbr>IMAGE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${UBOOT_NODTB_B=
INARY} ${UBOOT_NODTB_SYMLINK}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UBOOT_NODTB_=
IMAGE} ${UBOOT_NODTB_SYMLINK}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UBOOT_NODTB_=
IMAGE} ${UBOOT_NODTB_BINARY}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/${UBOOT_=
NODTB_BINARY}<br>
&gt; ${DEPLOY_DIR_IMAGE}/${UBOOT_<wbr>NODTB_IMAGE}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${DEPLOY_DIR_I=
MAGE}/${UBOOT_<wbr>NODTB_IMAGE}<br>
&gt; ${DEPLOY_DIR_IMAGE}/${UBOOT_<wbr>NODTB_SYMLINK}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${DEPLOY_DIR_I=
MAGE}/${UBOOT_<wbr>NODTB_IMAGE}<br>
&gt; ${DEPLOY_DIR_IMAGE}/${UBOOT_<wbr>NODTB_BINARY}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; @@ -70,11 +68,10 @@ do_concat_dtb () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0oe_runmake<br>
&gt; EXT_DTB=3D${DEPLOYDIR}/${UBOOT_<wbr>DTB_IMAGE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0install ${B}/${UBOOT_BINARY}<br>
&gt; ${DEPLOYDIR}/${UBOOT_IMAGE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0install ${B}/${UBOOT_BINARY}<br>
&gt; ${DEPLOY_DIR_IMAGE}/${UBOOT_<wbr>IMAGE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -e &quot;${DEP=
LOYDIR}/${UBOOT_NODTB_<wbr>IMAGE}&quot; -a -e<br>
&gt; &quot;${DEPLOYDIR}/${UBOOT_DTB_<wbr>IMAGE}&quot; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cd ${DEPLOYDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee<br>
&gt; ${B}/${UBOOT_BINARY} &gt; ${UBOOT_IMAGE}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -e &quot;${DEP=
LOY_DIR_IMAGE}/${UBOOT_<wbr>NODTB_IMAGE}&quot; -a<br>
&gt; -e &quot;${DEPLOY_DIR_IMAGE}/${UBOOT_<wbr>DTB_IMAGE}&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cat ${DEPLOY_DIR_IMAGE}/${UBOOT_<wbr>NODTB_IMAGE}<br>
&gt; ${DEPLOY_DIR_IMAGE}/${UBOOT_<wbr>DTB_IMAGE} | tee ${B}/${UBOOT_BINARY}=
 &gt;<br>
&gt; ${UBOOT_IMAGE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bbwarn &quot;Failure while adding public key to u-boot<br>
&gt; binary. Verified boot won&#39;t be available.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bbfatal &quot;Failure while adding public key to u-<br>
&gt; boot binary. Verified boot won&#39;t be available.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.13.6<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a113aa89ca6cdf2055c59f420--
