Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4FAC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 09:53:23 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web09.3683.1657187600033302465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g+ftN3W4;
 spf=pass (domain: gmail.com, ip: 209.85.128.171,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-31bf3656517so164388277b3.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c/LxcPuPhVXPQzn57stEGHpSah/gYbnTpXAc6m9kb4M=;
        b=g+ftN3W4t7pRNU6kmkb21R+00wkfbZK/lfD6/V4g+/WXu2pNXvH3hYEsgBkN8aB0Qk
         z8OA6/Cte348bFLxtQFYxycnLN+1dAI6ifDVP4vMp1OnZ/5rsAQ4kAcUmyeu/CUZqGJK
         3YC+HC0+TKI++9yfC+Qp8f3vP+/Zm61g+WeGOOrxbsU2lH7Nfp/MbDu1rOxUeawBwAvE
         kobGsTzTyrbz/X4mdi8dUn8rGJUQ5mYHYApR1NGabC45gNYkLfhDG7PaoYsP9p0qcJ16
         cqh4c2Pp6KW1Gi3S4qTjD6HZgBUd5lcJBAEzoHvVUX99BB5uvjAaViOqPtJWOfuS8tOy
         lAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c/LxcPuPhVXPQzn57stEGHpSah/gYbnTpXAc6m9kb4M=;
        b=l6GdAUkJjWmq/4KmpU2mIblGgAZ5QtMXyAl8DlQYEvGq30o62tWGC+N72QHsQC9FCY
         afQ0sOsy1kia6aCxn0mFQzhVlResvgeLx9OLP6/ii/68TXC5psjcUQX8ngp55OwQZp6/
         GCOrAvDoGQLtnOy0AeMQ+pTBPR+DRk8wW71YdZC1BvAXcGTb5N2wDTeg61ewVvtwJo6m
         zsYeOpsWIAmTzA3LgO6sxxjcdm8LDhuhuf/IGzoDF5ru+bmbkYYKim7cy5fG4ask7bfG
         0/REF9d2JV4eCVRCLoTdQmpyT1Okwip96woFshUiAwDIpXhjwqwz+QC9lUgC+cy45P3I
         a0TA==
X-Gm-Message-State: AJIora9Q2rviozNN7DKlP6x+ZZ8VsIMOfmuF9dij/qOazCMxiRqMXhnp
	ODbLqSJABiP5M5dohXV6B1+ftaWW/tWGlUDgk9M=
X-Google-Smtp-Source: 
 AGRyM1ufbklliaf9TBEp77rZkrKToWDNhJOAhmDbKPOKGCnpWT94U342vUQpjT+Kbn/oqhvN6ICMgSMV3DztlxEg7I0=
X-Received: by 2002:a0d:e4c1:0:b0:313:8b27:c02c with SMTP id
 n184-20020a0de4c1000000b003138b27c02cmr49509276ywe.198.1657187599108; Thu, 07
 Jul 2022 02:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220706111028.149100-1-liu.ming50@gmail.com>
 <YsWW1I3LrrA4YTv1@mail.local>
In-Reply-To: <YsWW1I3LrrA4YTv1@mail.local>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 7 Jul 2022 11:53:19 +0200
Message-ID: 
 <CALatG=7tsPYUtMqZ+etf1UMpRoQtg_dvAhojnkkUsqwOHxAmQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="0000000000002bce7a05e3340e93"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 09:53:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167763

--0000000000002bce7a05e3340e93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Alexandre:

Thanks for the review, I did not quite follow you, you meant the 'type'
argument being replaced wrongly? I dont see how. Could you share some
details about your comment?

//Ming Liu

Alexandre Belloni <alexandre.belloni@bootlin.com> =E6=96=BC 2022=E5=B9=B47=
=E6=9C=886=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:06=E5=AF=AB=E9=
=81=93=EF=BC=9A

> Hello,
>
> On 06/07/2022 13:10:28+0200, Ming Liu wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > Sometimes an end user might want to choose another kernel type argument
> > for uboot-mkimage other than "kernel", for instance: "kernel_noload".
> >
> > Let's introduce a variable UBOOT_MKIMAGE_KERNEL_TYPE to support that,
> > and it could be used by BSP layers as well.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/classes/kernel-fitimage.bbclass     | 2 +-
> >  meta/classes/kernel-uboot.bbclass        | 3 +++
> >  meta/classes/kernel-uimage.bbclass       | 2 +-
> >  meta/lib/oeqa/selftest/cases/fitimage.py | 3 ++-
> >  4 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> > index 7e09b075ff..2112ae4cfa 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -148,7 +148,7 @@ fitimage_emit_section_kernel() {
> >                  kernel-$2 {
> >                          description =3D "Linux kernel";
> >                          data =3D /incbin/("$3");
> > -                        type =3D "kernel";
> > +                        type =3D "${UBOOT_MKIMAGE_KERNEL_TYPE}";
> >                          arch =3D "${UBOOT_ARCH}";
> >                          os =3D "linux";
> >                          compression =3D "$4";
> > diff --git a/meta/classes/kernel-uboot.bbclass
> b/meta/classes/kernel-uboot.bbclass
> > index 2facade818..1bc98e042d 100644
> > --- a/meta/classes/kernel-uboot.bbclass
> > +++ b/meta/classes/kernel-uboot.bbclass
> > @@ -2,6 +2,9 @@
> >  FIT_KERNEL_COMP_ALG ?=3D "gzip"
> >  FIT_KERNEL_COMP_ALG_EXTENSION ?=3D ".gz"
> >
> > +# Kernel image type passed to mkimage (i.e. kernel kernel_noload...)
> > +UBOOT_MKIMAGE_KERNEL_TYPE ?=3D "kernel"
> > +
> >  uboot_prep_kimage() {
> >       if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
> >               vmlinux_path=3D"arch/${ARCH}/boot/compressed/vmlinux"
> > diff --git a/meta/classes/kernel-uimage.bbclass
> b/meta/classes/kernel-uimage.bbclass
> > index cedb4fa070..e116bf0265 100644
> > --- a/meta/classes/kernel-uimage.bbclass
> > +++ b/meta/classes/kernel-uimage.bbclass
> > @@ -30,6 +30,6 @@ do_uboot_mkimage() {
> >                       awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}" {print
> "0x"$1;exit}'`
> >       fi
> >
> > -     uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C
> "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n
> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uIm=
age
> > +     uboot-mkimage -A ${UBOOT_ARCH} -O ${UBOOT_MKIMAGE_KERNEL_TYPE} -T
> kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n
> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uIm=
age
>
> I feel like you replace the wrong argument here.
>
> >       rm -f linux.bin
> >  }
> > diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py
> b/meta/lib/oeqa/selftest/cases/fitimage.py
> > index e6bfd1257e..7e6479c9ca 100644
> > --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> > +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> > @@ -763,6 +763,7 @@ FIT_HASH_ALG =3D "sha256"
> >
> >          kernel_load =3D str(get_bb_var('UBOOT_LOADADDRESS'))
> >          kernel_entry =3D str(get_bb_var('UBOOT_ENTRYPOINT'))
> > +        kernel_type =3D str(get_bb_var('UBOOT_MKIMAGE_KERNEL_TYPE'))
> >          kernel_compression =3D str(get_bb_var('FIT_KERNEL_COMP_ALG'))
> >          uboot_arch =3D str(get_bb_var('UBOOT_ARCH'))
> >          fit_hash_alg =3D str(get_bb_var('FIT_HASH_ALG'))
> > @@ -775,7 +776,7 @@ FIT_HASH_ALG =3D "sha256"
> >              'kernel-1 {',
> >              'description =3D "Linux kernel";',
> >              'data =3D /incbin/("linux.bin");',
> > -            'type =3D "kernel";',
> > +            'type =3D "' + kernel_type + '";',
> >              'arch =3D "' + uboot_arch + '";',
> >              'os =3D "linux";',
> >              'compression =3D "' + kernel_compression + '";',
> > --
> > 2.25.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#167719):
> https://lists.openembedded.org/g/openembedded-core/message/167719
> > Mute This Topic: https://lists.openembedded.org/mt/92204115/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000002bce7a05e3340e93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, Alexandre:</div><div><br></div><div>Thanks for th=
e review, I did not quite follow you, you meant the &#39;type&#39; argument=
 being replaced wrongly? I dont see how. Could you share some details about=
 your comment?<br></div><div><br></div><div>//Ming Liu <br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Alexandre =
Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.bell=
oni@bootlin.com</a>&gt; =E6=96=BC 2022=E5=B9=B47=E6=9C=886=E6=97=A5 =E9=80=
=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:06=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On 06/07/2022 13:10:28+0200, Ming Liu wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Sometimes an end user might want to choose another kernel type argumen=
t<br>
&gt; for uboot-mkimage other than &quot;kernel&quot;, for instance: &quot;k=
ernel_noload&quot;.<br>
&gt; <br>
&gt; Let&#39;s introduce a variable UBOOT_MKIMAGE_KERNEL_TYPE to support th=
at,<br>
&gt; and it could be used by BSP layers as well.<br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =C2=A0| 2 +-<b=
r>
&gt;=C2=A0 meta/classes/kernel-uboot.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3=
 +++<br>
&gt;=C2=A0 meta/classes/kernel-uimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
 +-<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/fitimage.py | 3 ++-<br>
&gt;=C2=A0 4 files changed, 7 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kerne=
l-fitimage.bbclass<br>
&gt; index 7e09b075ff..2112ae4cfa 100644<br>
&gt; --- a/meta/classes/kernel-fitimage.bbclass<br>
&gt; +++ b/meta/classes/kernel-fitimage.bbclass<br>
&gt; @@ -148,7 +148,7 @@ fitimage_emit_section_kernel() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel-$=
2 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 description =3D &quot;Linux kernel&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 data =3D /incbin/(&quot;$3&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 type =3D &quot;kernel&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 type =3D &quot;${UBOOT_MKIMAGE_KERNEL_TYPE}&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 arch =3D &quot;${UBOOT_ARCH}&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 os =3D &quot;linux&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 compression =3D &quot;$4&quot;;<br>
&gt; diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-u=
boot.bbclass<br>
&gt; index 2facade818..1bc98e042d 100644<br>
&gt; --- a/meta/classes/kernel-uboot.bbclass<br>
&gt; +++ b/meta/classes/kernel-uboot.bbclass<br>
&gt; @@ -2,6 +2,9 @@<br>
&gt;=C2=A0 FIT_KERNEL_COMP_ALG ?=3D &quot;gzip&quot;<br>
&gt;=C2=A0 FIT_KERNEL_COMP_ALG_EXTENSION ?=3D &quot;.gz&quot;<br>
&gt;=C2=A0 <br>
&gt; +# Kernel image type passed to mkimage (i.e. kernel kernel_noload...)<=
br>
&gt; +UBOOT_MKIMAGE_KERNEL_TYPE ?=3D &quot;kernel&quot;<br>
&gt; +<br>
&gt;=C2=A0 uboot_prep_kimage() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e arch/${ARCH}/boot/compressed/vmlinux=
 ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinux_path=3D&=
quot;arch/${ARCH}/boot/compressed/vmlinux&quot;<br>
&gt; diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-=
uimage.bbclass<br>
&gt; index cedb4fa070..e116bf0265 100644<br>
&gt; --- a/meta/classes/kernel-uimage.bbclass<br>
&gt; +++ b/meta/classes/kernel-uimage.bbclass<br>
&gt; @@ -30,6 +30,6 @@ do_uboot_mkimage() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0awk &#39;$3=3D=3D&quot;${UBOOT_ENTRYSYMBOL}&quot; {print &quot=
;0x&quot;$1;exit}&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel=
 -C &quot;${linux_comp}&quot; -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n &qu=
ot;${DISTRO_NAME}/${PV}/${MACHINE}&quot; -d linux.bin ${B}/arch/${ARCH}/boo=
t/uImage<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uboot-mkimage -A ${UBOOT_ARCH} -O ${UBOOT_MKIMAGE=
_KERNEL_TYPE} -T kernel -C &quot;${linux_comp}&quot; -a ${UBOOT_LOADADDRESS=
} -e $ENTRYPOINT -n &quot;${DISTRO_NAME}/${PV}/${MACHINE}&quot; -d linux.bi=
n ${B}/arch/${ARCH}/boot/uImage<br>
<br>
I feel like you replace the wrong argument here.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f linux.bin<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/=
selftest/cases/fitimage.py<br>
&gt; index e6bfd1257e..7e6479c9ca 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/fitimage.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/fitimage.py<br>
&gt; @@ -763,6 +763,7 @@ FIT_HASH_ALG =3D &quot;sha256&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_load =3D str(get_bb_var(&#39;=
UBOOT_LOADADDRESS&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_entry =3D str(get_bb_var(&#39=
;UBOOT_ENTRYPOINT&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_type =3D str(get_bb_var(&#39;UBOOT=
_MKIMAGE_KERNEL_TYPE&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_compression =3D str(get_bb_va=
r(&#39;FIT_KERNEL_COMP_ALG&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uboot_arch =3D str(get_bb_var(&#39;U=
BOOT_ARCH&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fit_hash_alg =3D str(get_bb_var(&#39=
;FIT_HASH_ALG&#39;))<br>
&gt; @@ -775,7 +776,7 @@ FIT_HASH_ALG =3D &quot;sha256&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;kernel-1 {&#39;,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;description =3D &=
quot;Linux kernel&quot;;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;data =3D /incbin/=
(&quot;linux.bin&quot;);&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;type =3D &quot;kernel&=
quot;;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;type =3D &quot;&#39; +=
 kernel_type + &#39;&quot;;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;arch =3D &quot;&#=
39; + uboot_arch + &#39;&quot;;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;os =3D &quot;linu=
x&quot;;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;compression =3D &=
quot;&#39; + kernel_compression + &#39;&quot;;&#39;,<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#167719): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/167719" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/167719</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92204115=
/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/92204115/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000002bce7a05e3340e93--

