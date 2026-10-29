Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5364.1793250527802121084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sBs1pgBW;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso788859eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793250527; cv=none;
        d=google.com; s=arc-20260327;
        b=fw7M/0LZFyeoefFZJLi76tzhIkPnv/lmI61m43WOrsgRVi90KMVd98ramll1eC7FV/
         n71TpHe8t8Is1zgMAF5buvQ8CtX2OlNLKAvmgpSsdynGcxKiyKs1/qYDA/+pCgQC8i0K
         Y95xiY/qCGa5Og0MgNsRvTESatxr8HnVQ5WDHrMaKTzqb2JVybXk9PcTx8H301uLROoD
         bpIDDiKm6l2C5syKxc66nSZp85vZpych/eZhj6+hbIETyqt2FhH2dtiifPDTPujdjZrY
         he9Xf4L0hSe9vlU8o1QXM6RQF0zxNFISUmlOHKX1yJx2/z9MNlwCQu3v0i9U7YILtp/L
         GJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2gXnG9coEa+1hmR7Tbef3WyqSQs0VY4PHH8MxgS0kAY=;
        fh=pfVT1cBQeyU3kL7qKFW5PtqZdUPsFag2cMqh1KA01Rk=;
        b=KsQiFBN+JsLixj8kS+rypdHkQGrdwg62jJH6QkYCgKulVDRnEnBixrT1ZnfcRX5BvM
         HwnRNApeFDiIPaK2JyAbc3voGYBOxayYKsR6W1xD4iVynB81p1qiJTOHJNqyrPWyuAa5
         tlNq5lnn1NtD4kkRTCmDwn/c/XIwqhgFhNvm97BPqQDoNeNUECny1G932OQKHueHDUB9
         Dk/1Ut28e8DTqaFYMOw2SCT5EOPvaUE+i4qiYzE8DpPD2vjUi19JnkRtnd83MTEKYZLH
         Hdg6h9oxVJCWqEas+ecWKP1kBxfYALhr27gwU1HXXOCvNnYkWHxudlwGDBe/POOBXUMs
         ZWRg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250527; x=1793855327; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gXnG9coEa+1hmR7Tbef3WyqSQs0VY4PHH8MxgS0kAY=;
        b=sBs1pgBWoKpLRaWQMTyhakSjWy4KAN/mIbQnkIJ0vY08ila/Zoli24qcxmbulqLYHC
         cLZH06pi9j7oPMazYx2sfDeApR6zuJ7XHmHkSKTnzb6985Uu5HL8oj/Ud9fzRqBlI+ut
         J91RWXK0omOSr7rkGOcsToeGcNc929vrrmI0g3JVjmjuzlwHIOq3Y35Y5Ahq6zs+rtRA
         13AHWN+GKQvsuvjPTCa67BpBteNC3C7rUJrAuj4qg35qHDMyXWL0HCgt+qi6D8Q7I7VB
         sBdt7WugSQ5MWOyX2h5YSH5buz+i+K/f1rZpAbc8GNujny9EUA9s8D+TVDvwWmJfhIvh
         WPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250527; x=1793855327;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2gXnG9coEa+1hmR7Tbef3WyqSQs0VY4PHH8MxgS0kAY=;
        b=A7nnbI3gRxavv3COGRnowHfqFX6y/35EqdvdESJ/bdLMJc5O66yv37dz2JkTrA7Eza
         cUODsVJT/ZBFsJzNbbh1tDHippRnYsF36/WIGLbqYS+bxQ2mITOSv4vPCzHHEyjKHQfe
         /wEQh0Jw6EOh9BQqGqQSXHP0beUtA2fot1dCSDiV3gPO+lztlGFwmwFh3xjoNrwYnnth
         Qn6Pg4uoSbLagor5Kwki9NHp6R7zhzwm8AoXKWkiU3wj4leE6YgdjZ4WpI2eBlvOHlLG
         URc+Aet7E1VJ0QuplnzeUorfvVNSVo5bovhNaohw0/PmcL9Ny5GMMvm3KU/VqD2WmL9O
         JnNw==
X-Gm-Message-State: AFq9FYLjfaOWQq7A4EtZJBN8ibGyIcbbzHANAcmPfM6JnprweBjWNVbr
	5IxQwjzYA1kwDzdzn5tcboKj+V7O2e5XqYZROHRbXV58uSUeDwAgLY44dNsOvpc43so932Mi4IS
	cMnvfl3DPKv+jJN7bbG1okg9E2BEWccg=
X-Gm-Gg: AYBFou2QStEk0aWFHtOCbM+hpOhwZhz+T4eZAPb7FjiP2NJ9nzp/L9DhEOmyXcF8ZUs
	Xo2vWf3qrK5MCnb8Xxvih8XLvea4nfly/cJomyTyDrDx2WWQu1905JXoeo7DuLjPg9oTe6keABh
	7FnzdwdHhnyPNIX5HirvihVIXZUfSlWN4JDxZWCbyO9bif17SmEgOdvQyNhP2wAYmEsQZWcUG3E
	Cpu4b57LK1/3NlLYKOx74gGoUVZLOM7osf4iQ/PrNFfG1a5hg7R4zBbd0D1PAoNqM8q1qfIhdJI
	81KKEGvVpVvRxa7fqMF+k7cagxiqLKls30cWx1lpvJXEo5cgPWbWGn9qLNt+lTxJI6Xrb87b+P7
	GZ5ztQasQxII5McVWIPFw8FL/tA2eOR7dEk7zxww=
X-Received: by 2002:a05:7301:4683:b0:35e:51d6:9f6f with SMTP id
 5a478bee46e88-36a20418ca8mr7231361eec.27.1793250526815; Wed, 28 Oct 2026
 22:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20261029024010.2113092-1-ragaprasanth@gmail.com> <6ae2bf09.0a372733.3ab85e.5e55@mx.google.com>
In-Reply-To: <6ae2bf09.0a372733.3ab85e.5e55@mx.google.com>
From: "prasanth" <ragaprasanth@gmail.com>
Date: Thu, 29 Oct 2026 14:08:09 +0900
X-Gm-Features: AclHuK9Y5FGLdqxXAUwDqX3mpTv1wopTb8iu086zK7QbTK_SmvoU5oDffH4GjTM
Message-ID: <CAG7eodEvhmPWudqazp1WivHWN05x=TwPQww4ik_ZceruT0wAfQ@mail.gmail.com>
Subject: Re: [PATCH] kernel.bbclass: fix -dev files when KERNEL_PACKAGE_NAME is PN
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, prasanth.r@lineo.co.jp
Content-Type: multipart/alternative; boundary="000000000000a4e9c6065ef3ac10"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248904

--000000000000a4e9c6065ef3ac10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Thanks for the detailed review and the explanation regarding the event
handler. That makes perfect sense.

Sent v2.

Thanks,
Prasanth R


On Thu, Oct 29, 2026 at 12:35=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gma=
il.com>
wrote:

> On Wed, Oct 29, 2026 at 11:40 AM Prasanth R <ragaprasanth@gmail.com>
> wrote:
> >
>
> Can you elaborate on the configuration / build that you are doing that
> is triggering this ? You have multiple kernels ? and you are setting
> KERNEL_PACKAGE_NAME =3D  "${PN}" as part of that ? How you ran into this
> is important for understanding the context. It could be that we can
> avoid the issue in another way.
>
> > With KERNEL_PACKAGE_NAME =3D "${PN}", FILES:${KERNEL_PACKAGE_NAME}-dev =
and
> > FILES:${PN}-dev from bitbake.conf become the same variable and the
> > bitbake.conf value wins. The same happens for -dbg. The kernel files ar=
e
> > then not packaged and do_package fails:
>
> Also for -dbg, the bitbake.conf value is a superset of what the kernel
> class
> sets, so nothing is actually lost there. It is just the key collision
> warning. Worth saying that, so it is clear that -dev is the real breakage=
.
>
> >
> >   ERROR: linux-yocto-7.2.8+git-r0 do_package: QA Issue: linux-yocto:
> >   Files/directories were installed but not shipped in any package:
> >     /boot/System.map-7.2.8-yocto-standard
> >     /boot/config-7.2.8-yocto-standard
> >     /boot/Module.symvers-7.2.8-yocto-standard
> >
> > This matters when a second kernel recipe. So, Rename the kernel variabl=
es
> > to the ${PN} names before the keys are expanded, so the kernel values
> are kept.
>
> This sentence is broken. Can you say who actually sets
> KERNEL_PACKAGE_NAME =3D "${PN}" and why? I assume an alternate/second
> kernel recipe, but that should be spelled out. This is the specifics
> that are hinted at in my opening question.
>
> I'd also like the commit message to explain why an event handler is
> needed. My first reaction was that this was more complex than it needed
> to be. But key expansion happens (in sorted order) before anonymous pytho=
n
> runs, so by the time __anonymous() sees it, the kernel value is already
> gone. Fixing it in anonymous python would also clobber any :append to
> FILES:${KERNEL_PACKAGE_NAME}-dev from a bbappend. A :append in the class
> keeps the files but still triggers the "Variable key ... replaces origina=
l
> key" warning on every parse. So renaming before expansion is the right
> place. Just say so in the commit, so the next person doesn't have to work
> it out again.
>
> >
> > Remove the old warning about bug 11905, which was closed as not a bug.
>
> Fine. 11905 is the same key expansion ordering issue, and that is
> expected bitbake behaviour, which is why the fix belongs here.
>
> >
> > AI-Generated: Uses Claude
> > Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> > ---
> >
> > Notes:
> >     Tested on master: without this patch do_package fails with the
> >     QA error above; with it the build passes with no warnings and
> linux-yocto-dev
> >     contains System.map, Module.symvers and the config.
>
> Please also confirm the default case (KERNEL_PACKAGE_NAME =3D "kernel") i=
s
> unchanged. It should be, since the handler returns early, but it is the
> case almost everyone uses.
>
> Also note in the commit that with KERNEL_PACKAGE_NAME =3D "${PN}", the -d=
ev
> package no longer picks up the bitbake.conf default -dev contents
> (includedir, .so symlinks, etc). That matches what kernel-dev gets
> today, so I think it is correct, but it is a behaviour change and should
> be stated (and confirmed by testing).
>
> >
> >  meta/classes-recipe/kernel.bbclass | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> > index 0a6d754108..b018c164fd 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -60,16 +60,23 @@ KERNEL_VERSION_NAME[vardepvalue] =3D "${LINUX_VERSI=
ON}"
> >  KERNEL_VERSION_PKG_NAME =3D
> "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
> >  KERNEL_VERSION_PKG_NAME[vardepvalue] =3D "${LINUX_VERSION}"
> >
> > +# With KERNEL_PACKAGE_NAME =3D "${PN}", FILES:${PN}-dev/-dbg from
> bitbake.conf
> > +# would replace the kernel values during key expansion, so rename the
> kernel
> > +# variables to the ${PN} names first.
>
> Same here. Add a line saying this must run before key expansion
> (i.e. it can't live in __anonymous), so nobody "simplifies" it later.
>
> > +python kernel_package_name_handler () {
> > +    d =3D e.data
> > +    if d.getVar("KERNEL_PACKAGE_NAME") !=3D d.getVar("PN"):
> > +        return
> > +
> > +    for pkg in ("dev", "dbg"):
> > +        d.renameVar("FILES:${KERNEL_PACKAGE_NAME}-%s" % pkg,
> "FILES:${PN}-%s" % pkg)
> > +}
> > +addhandler kernel_package_name_handler
> > +kernel_package_name_handler[eventmask] =3D "bb.event.RecipePreFinalise=
"
> > +
> >  python __anonymous () {
> > -    pn =3D d.getVar("PN")
> >      kpn =3D d.getVar("KERNEL_PACKAGE_NAME")
> >
> > -    # XXX Remove this after bug 11905 is resolved
> > -    #  FILES:${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
> > -    if kpn =3D=3D pn:
> > -        bb.warn("Some packages (E.g. *-dev) might be missing due to "
> > -                "bug 11905 (variable KERNEL_PACKAGE_NAME =3D=3D PN)")
> > -
>
> The code itself looks fine. A v2 with the commit message and comment
> updates and I'll ack it.
>
> Bruce
>
> > --
> > 2.34.1
>

--000000000000a4e9c6065ef3ac10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce,<br><br>Thanks for the detailed review and the ex=
planation regarding the event handler. That makes perfect sense.<br><br>Sen=
t v2.<br><br>Thanks,<br>Prasanth R<div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><br></div></div>=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Oct 29, 2026 at 12:35=E2=80=AFPM Bruc=
e Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, Oct 29, 2026 at 11:40 AM Prasanth R &lt;<a href=3D"mailto:r=
agaprasanth@gmail.com" target=3D"_blank">ragaprasanth@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
<br>
Can you elaborate on the configuration / build that you are doing that<br>
is triggering this ? You have multiple kernels ? and you are setting<br>
KERNEL_PACKAGE_NAME =3D=C2=A0 &quot;${PN}&quot; as part of that ? How you r=
an into this<br>
is important for understanding the context. It could be that we can<br>
avoid the issue in another way.<br>
<br>
&gt; With KERNEL_PACKAGE_NAME =3D &quot;${PN}&quot;, FILES:${KERNEL_PACKAGE=
_NAME}-dev and<br>
&gt; FILES:${PN}-dev from bitbake.conf become the same variable and the<br>
&gt; bitbake.conf value wins. The same happens for -dbg. The kernel files a=
re<br>
&gt; then not packaged and do_package fails:<br>
<br>
Also for -dbg, the bitbake.conf value is a superset of what the kernel clas=
s<br>
sets, so nothing is actually lost there. It is just the key collision<br>
warning. Worth saying that, so it is clear that -dev is the real breakage.<=
br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0ERROR: linux-yocto-7.2.8+git-r0 do_package: QA Issue: linu=
x-yocto:<br>
&gt;=C2=A0 =C2=A0Files/directories were installed but not shipped in any pa=
ckage:<br>
&gt;=C2=A0 =C2=A0 =C2=A0/boot/System.map-7.2.8-yocto-standard<br>
&gt;=C2=A0 =C2=A0 =C2=A0/boot/config-7.2.8-yocto-standard<br>
&gt;=C2=A0 =C2=A0 =C2=A0/boot/Module.symvers-7.2.8-yocto-standard<br>
&gt;<br>
&gt; This matters when a second kernel recipe. So, Rename the kernel variab=
les<br>
&gt; to the ${PN} names before the keys are expanded, so the kernel values =
are kept.<br>
<br>
This sentence is broken. Can you say who actually sets<br>
KERNEL_PACKAGE_NAME =3D &quot;${PN}&quot; and why? I assume an alternate/se=
cond<br>
kernel recipe, but that should be spelled out. This is the specifics<br>
that are hinted at in my opening question.<br>
<br>
I&#39;d also like the commit message to explain why an event handler is<br>
needed. My first reaction was that this was more complex than it needed<br>
to be. But key expansion happens (in sorted order) before anonymous python<=
br>
runs, so by the time __anonymous() sees it, the kernel value is already<br>
gone. Fixing it in anonymous python would also clobber any :append to<br>
FILES:${KERNEL_PACKAGE_NAME}-dev from a bbappend. A :append in the class<br=
>
keeps the files but still triggers the &quot;Variable key ... replaces orig=
inal<br>
key&quot; warning on every parse. So renaming before expansion is the right=
<br>
place. Just say so in the commit, so the next person doesn&#39;t have to wo=
rk<br>
it out again.<br>
<br>
&gt;<br>
&gt; Remove the old warning about bug 11905, which was closed as not a bug.=
<br>
<br>
Fine. 11905 is the same key expansion ordering issue, and that is<br>
expected bitbake behaviour, which is why the fix belongs here.<br>
<br>
&gt;<br>
&gt; AI-Generated: Uses Claude<br>
&gt; Signed-off-by: Prasanth R &lt;<a href=3D"mailto:prasanth.r@lineo.co.jp=
" target=3D"_blank">prasanth.r@lineo.co.jp</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Notes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Tested on master: without this patch do_package fai=
ls with the<br>
&gt;=C2=A0 =C2=A0 =C2=A0QA error above; with it the build passes with no wa=
rnings and linux-yocto-dev<br>
&gt;=C2=A0 =C2=A0 =C2=A0contains System.map, Module.symvers and the config.=
<br>
<br>
Please also confirm the default case (KERNEL_PACKAGE_NAME =3D &quot;kernel&=
quot;) is<br>
unchanged. It should be, since the handler returns early, but it is the<br>
case almost everyone uses.<br>
<br>
Also note in the commit that with KERNEL_PACKAGE_NAME =3D &quot;${PN}&quot;=
, the -dev<br>
package no longer picks up the bitbake.conf default -dev contents<br>
(includedir, .so symlinks, etc). That matches what kernel-dev gets<br>
today, so I think it is correct, but it is a behaviour change and should<br=
>
be stated (and confirmed by testing).<br>
<br>
&gt;<br>
&gt;=C2=A0 meta/classes-recipe/kernel.bbclass | 21 ++++++++++++++-------<br=
>
&gt;=C2=A0 1 file changed, 14 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass<br>
&gt; index 0a6d754108..b018c164fd 100644<br>
&gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; @@ -60,16 +60,23 @@ KERNEL_VERSION_NAME[vardepvalue] =3D &quot;${LINUX=
_VERSION}&quot;<br>
&gt;=C2=A0 KERNEL_VERSION_PKG_NAME =3D &quot;${@legitimize_package_name(d.g=
etVar(&#39;KERNEL_VERSION&#39;))}&quot;<br>
&gt;=C2=A0 KERNEL_VERSION_PKG_NAME[vardepvalue] =3D &quot;${LINUX_VERSION}&=
quot;<br>
&gt;<br>
&gt; +# With KERNEL_PACKAGE_NAME =3D &quot;${PN}&quot;, FILES:${PN}-dev/-db=
g from bitbake.conf<br>
&gt; +# would replace the kernel values during key expansion, so rename the=
 kernel<br>
&gt; +# variables to the ${PN} names first.<br>
<br>
Same here. Add a line saying this must run before key expansion<br>
(i.e. it can&#39;t live in __anonymous), so nobody &quot;simplifies&quot; i=
t later.<br>
<br>
&gt; +python kernel_package_name_handler () {<br>
&gt; +=C2=A0 =C2=A0 d =3D e.data<br>
&gt; +=C2=A0 =C2=A0 if d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;) !=3D d.get=
Var(&quot;PN&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for pkg in (&quot;dev&quot;, &quot;dbg&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.renameVar(&quot;FILES:${KERNEL_PACKAGE_=
NAME}-%s&quot; % pkg, &quot;FILES:${PN}-%s&quot; % pkg)<br>
&gt; +}<br>
&gt; +addhandler kernel_package_name_handler<br>
&gt; +kernel_package_name_handler[eventmask] =3D &quot;bb.event.RecipePreFi=
nalise&quot;<br>
&gt; +<br>
&gt;=C2=A0 python __anonymous () {<br>
&gt; -=C2=A0 =C2=A0 pn =3D d.getVar(&quot;PN&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kpn =3D d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;)<=
br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 # XXX Remove this after bug 11905 is resolved<br>
&gt; -=C2=A0 =C2=A0 #=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-dev doesn&#39;t ex=
pand correctly<br>
&gt; -=C2=A0 =C2=A0 if kpn =3D=3D pn:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Some packages (E.g. *-dev) =
might be missing due to &quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bug 119=
05 (variable KERNEL_PACKAGE_NAME =3D=3D PN)&quot;)<br>
&gt; -<br>
<br>
The code itself looks fine. A v2 with the commit message and comment<br>
updates and I&#39;ll ack it.<br>
<br>
Bruce<br>
<br>
&gt; --<br>
&gt; 2.34.1<br>
</blockquote></div>

--000000000000a4e9c6065ef3ac10--
