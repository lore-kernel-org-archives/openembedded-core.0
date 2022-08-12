Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DACCC00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 13:57:36 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.10925.1660312647284793897
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 06:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l8OVVE8n;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id x19so1453509lfq.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 06:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=HfwQglO6BkflKOmFHnrqAJXNAfmNJUZzC7Ln0uWeLlk=;
        b=l8OVVE8ny9n9Qcd3EWir7fnYcqtHpn6wZGafLaRGWYoFiBOp7NEThxWZd66TpRDZxM
         RzH+zNJgzxmDh4wv53Hm/KyC9mwBlIfofFtDkvBATwR+l+x1qC8nNY+rgycQvpZgcZgN
         KmjIw/WCzN76P0LWkAJrfarh97e38b8tHhAlkJBnITIatL03cwS1horkzP+4dWGmHyg2
         sBJql0G4zvCn881fih+u2jUqMIsBjIB8HNv6qzBSH3IaxxaXO0iXjbb8xDNxUEUwfu1t
         L4mTEVRzBiSNfMg29jnoitvPMbgy7r0aSdTCXrQngBODEjcCBuCqKAWUTXxRsw2u8t8M
         CDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=HfwQglO6BkflKOmFHnrqAJXNAfmNJUZzC7Ln0uWeLlk=;
        b=N8306B02MPPxw49koOjc16lbjnNh2j0gv2IxLK4skO34xfrbEljtRueK1u6GiOBNpJ
         zTpk4ANc9GDVB5PQCz4J/OafEBjvMYjMFXvxts9IKUOqcZWoK4div5Rxizcq4+CD+LxJ
         5PCMQeXbwg7Y7RH1Ey3yUv1AdNiBKBsZsrh4Zp656xiiriXAHZkhz0X5Le2fR9vTCSF2
         arSjNOJidFjh7YhEbB9r2T4OMbwa4GGJd92/PLEWmc0vQvEohUspDOhU4IIOlBBYeISi
         eK3I+y5tVI7eJGIbSm3KOPwChZ3YkV5LT3U43Ec8JlZIp11x4+ryDOmIrsO8OjsWTgUC
         ULmw==
X-Gm-Message-State: ACgBeo1ppxjDCVpEMQmVfWw6hu346UNDGQp3IXSOAI9bTUDBQb0Xcoma
	fJ3+gjhL9+ouo30zKpL+4FzKBUF58uAScXi5nuI=
X-Google-Smtp-Source: 
 AA6agR6AYUysXlUhe0L2FWYwxs69dBSWDQcHT7MuxZPRhA3kq5oYk8LHf8uDneJyD3jvnLRlYYAX5StaHMFrVtdLLWg=
X-Received: by 2002:a05:6512:3ba9:b0:48a:e66b:77c3 with SMTP id
 g41-20020a0565123ba900b0048ae66b77c3mr1261337lfv.204.1660312645462; Fri, 12
 Aug 2022 06:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220812112643.2168104-1-jose.quaresma@foundries.io>
 <CADkTA4MY94LwgAop_DyMOwrMoZbV0q5Um_9ZuhRMf58yVFpVKw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MY94LwgAop_DyMOwrMoZbV0q5Um_9ZuhRMf58yVFpVKw@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 12 Aug 2022 14:57:14 +0100
Message-ID: 
 <CANPvuRmYhwb+=mWRxXzF9nUx8uawK=1WLnZ2M8x1Q3TigUiqzQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] linux-yocto: adds a space when append to
 KERNEL_EXTRA_ARGS
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000072ec6205e60ba966"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 13:57:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169284

--00000000000072ec6205e60ba966
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia sexta, 12/08/2022
=C3=A0(s) 14:08:

> On Fri, Aug 12, 2022 at 7:27 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> > index cabc8f4975..7ea661e138 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > @@ -60,7 +60,7 @@ do_install:append(){
> >  KERNEL_FEATURES:append:qemuall=3D"
> features/kernel-sample/kernel-sample.scc"
> >
> >  KERNEL_DEBUG_OPTIONS ?=3D "stack"
> > -KERNEL_EXTRA_ARGS:append:x86-64 =3D
> "${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack',
> 'HOST_LIBELF_LIBS=3D"-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../.=
./usr/lib/
> -lelf"', '', d)}"
> > +KERNEL_EXTRA_ARGS:append:x86-64 =3D "
> ${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack',
> 'HOST_LIBELF_LIBS=3D"-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../.=
./usr/lib/
> -lelf"', '', d)}"
>
> The space would be intentional, as :append doesn't add one (or maybe

I'm not seeing the removed space with the small font I'm currently
> reading this with).
>

but there is no space and what my patch does is adding it before the char
'$' change form 'x86-64 =3D "$' to 'x86-64 =3D " $'
that afaik is the policy used when we need to append something to variable
with :append (take into account the extra space)

maybe my commit title can be changed to:
linux-yocto: prepend the the value with a space when append to
KERNEL_EXTRA_ARGS


>
> Was it causing a problem ?
>

yes, if you use KERNEL_EXTRA_ARGS=3DX or KERNEL_EXTRA_ARGS:append=3DX in yo=
ur
code it doesn't work
because of the missing space and at the end KERNEL_EXTRA_ARGS will have:

KERNEL_EXTRA_ARGS =3D "XHOST_LIBELF_....

instead of

KERNEL_EXTRA_ARGS =3D "X HOST_LIBELF_....

Jose


> Bruce
>
> >
> >  do_devshell:prepend() {
> >      # setup native pkg-config variables (kconfig scripts call
> pkg-config directly, cannot generically be overriden to pkg-config-native=
)
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169281):
> https://lists.openembedded.org/g/openembedded-core/message/169281
> > Mute This Topic: https://lists.openembedded.org/mt/92977591/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000072ec6205e60ba966
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia =
sexta, 12/08/2022 =C3=A0(s) 14:08:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Fri, Aug 12, 2022 at 7:27 AM Jose Quaresma &lt;<a hre=
f=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/linux/linux-yocto.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-=
kernel/linux/linux-yocto.inc<br>
&gt; index cabc8f4975..7ea661e138 100644<br>
&gt; --- a/meta/recipes-kernel/linux/linux-yocto.inc<br>
&gt; +++ b/meta/recipes-kernel/linux/linux-yocto.inc<br>
&gt; @@ -60,7 +60,7 @@ do_install:append(){<br>
&gt;=C2=A0 KERNEL_FEATURES:append:qemuall=3D&quot; features/kernel-sample/k=
ernel-sample.scc&quot;<br>
&gt;<br>
&gt;=C2=A0 KERNEL_DEBUG_OPTIONS ?=3D &quot;stack&quot;<br>
&gt; -KERNEL_EXTRA_ARGS:append:x86-64 =3D &quot;${@bb.utils.contains(&#39;K=
ERNEL_DEBUG_OPTIONS&#39;, &#39;stack&#39;, &#39;HOST_LIBELF_LIBS=3D&quot;-L=
${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf&quot;&#3=
9;, &#39;&#39;, d)}&quot;<br>
&gt; +KERNEL_EXTRA_ARGS:append:x86-64 =3D &quot; ${@bb.utils.contains(&#39;=
KERNEL_DEBUG_OPTIONS&#39;, &#39;stack&#39;, &#39;HOST_LIBELF_LIBS=3D&quot;-=
L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf&quot;&#=
39;, &#39;&#39;, d)}&quot;<br>
<br>
The space would be intentional, as :append doesn&#39;t add one (or maybe</b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I&#39;m not seeing the removed space with the small font I&#39;m currently<=
br>
reading this with).<br></blockquote><div><br><div>but there is no space and=
 what my patch does is adding it before the char &#39;$&#39; change form &#=
39;x86-64 =3D &quot;$&#39; to &#39;x86-64 =3D=C2=A0&quot; $&#39;=C2=A0</div=
><div>that afaik is the policy used when we need to append=C2=A0something t=
o variable with :append (take into account the extra space)</div><div><br>m=
aybe my commit title can be changed to:<br></div>linux-yocto:=C2=A0prepend =
the the value with a space when append to KERNEL_EXTRA_ARGS<br>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Was it causing a problem ?<br></blockquote><div><br></div><div>yes, if you =
use KERNEL_EXTRA_ARGS=3DX or KERNEL_EXTRA_ARGS:append=3DX in your code it d=
oesn&#39;t work</div><div>because of the missing space and at the end KERNE=
L_EXTRA_ARGS will have:</div><div><br>KERNEL_EXTRA_ARGS =3D &quot;XHOST_LIB=
ELF_....<br><br>instead=C2=A0of<br><br>KERNEL_EXTRA_ARGS =3D &quot;X HOST_L=
IBELF_....<br><br>Jose</div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
Bruce<br>
<br>
&gt;<br>
&gt;=C2=A0 do_devshell:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # setup native pkg-config variables (kconfig scrip=
ts call pkg-config directly, cannot generically be overriden to pkg-config-=
native)<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#169281): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/169281" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/169281</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92977591=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/92977591/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.=
com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000072ec6205e60ba966--

