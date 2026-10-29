Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5721.1793253654944424234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 23:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oxoAiHnE;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so527933eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 23:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793253654; cv=none;
        d=google.com; s=arc-20260327;
        b=nauLrRgO2siUcy20U90hoQN4LmQjA2VAdF53pQtqDEVY/UyZtXdQQxwD5WvX7peLpy
         aVmIv9CsMyNUuUC7Hw2ieq4b4pkIOdZjA48zyuXKE0D/J9/0TDqAxgx9NwD7AOXYQs1k
         2OhypLw/NRFSrfGXHuapx8Mm3EJdmIWbP+RO3pXMX+CCzoK+4PdW5+WeHCoskhFkweTV
         rmG2/kq0upinICQOv8BVYY00VhaGlBqqPVh3QUVC6DkcF7y1Llt8LkdPAPfFtVndsn0D
         6IB+aNuG+ZDDNvptQs5wmD6/DHKY6cbMg0dnyNqCDdozVUimEtEpNNbgsEK2DQwglzsH
         FZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VVHUDIxVFLrIo2SXdg7Ci02YgjGyHwZVLpkcXzPaLtQ=;
        fh=AWggaWrKTgWJTc+6FkvE3V8kb5xAoFX50Iwj1AleN1U=;
        b=VZuG4OHL4XmdGqCMSZxY8gM21O9pa+V4cYZwvFNHBRGQA9jv2Vr2IQjv253Bsh3/oW
         S1QxaA4IwIX1oBiwu8x6Gpmwjan6c/uwJ+jFqpNob9ETOWY9SFacwCgMD/k26eQBlhlb
         dZDbDX+jbTx2olBQm3xCJeosghSEFl3Vh6lgIrBGC9ckuVknUE5qwuK4kXp1ZPIExESh
         nGrabKALhuRzlCFBIwkax2tI5SeXpSgerfuE3wtGHVim3rpbVWHTBtHQkhqxWUMiN/kv
         BhaA44hVJYjao55OJUet4GcVjc9vaXbUUUClZZWXxaAC1Nil/Alv8QeZDV6E6tr6DnLS
         oBcw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793253654; x=1793858454; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVHUDIxVFLrIo2SXdg7Ci02YgjGyHwZVLpkcXzPaLtQ=;
        b=oxoAiHnE1bT/C3QDXs2jiPV0d2MSeCFI4RZo8jP5AjrMdxXx4HT+dTIzre6Q1OEeun
         Z32/r0rPNoUMvyRCkMMv/WbWvyct/aHh7sXKBlYynf73drWzRnvHN+gFy0l3gB9TzWex
         xijD6dpeJ5Dkst1Ec/W4K7FVPIzJ9ZEMc8zz4USnX10CfftrhOVm77CbJcWqfZGILUfd
         seEOyk7+s1KnEMax2jwbF7rA0iG4dTRLSgOtAxjZCoHm5JG+77H/sNrIPkbKva6LgJgG
         gBeX/EHAqBoxVhlHQ7fkTTI8hrFoeejCySjO2z+KjqtLpY8qvgbKnEmjLCvRyuR5ViLh
         TATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253654; x=1793858454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VVHUDIxVFLrIo2SXdg7Ci02YgjGyHwZVLpkcXzPaLtQ=;
        b=V7AaabvmNRUcT13+y7RWaSJ/w1akGac8siknTU994QB/sL5S28LnfFLFF8DiqdsWDF
         bTyjwSRY4V4Q4x+/GW2B36nPIExne98tsplfVORXQcOj+HdrzkD8slSHQmv71z0KHOY5
         5crWLjQFQYoO/9cLib09OcZ9jnGVPNAv8LGM5GRN4j2YgVkj2N9HD086MvnPJwJFwUJE
         T9jsh2v8gMZKZazL7YxEBgungnXFGuSBKaQ9y10xK3tBPJkeZKBkE1VTgsLMO2cOXBwR
         XzHRnIjoDoVXyj30AiDLYdAZvwxcWqwb3PQwbCCtszSkmTGD3g5H3wkmj6KZp6dq6/W8
         VMoQ==
X-Gm-Message-State: AFq9FYL6WBxvD6EB4Wlg4t4LPf3yICWYfkEiRiLedXg6xQN7R2ta4DWR
	SzzhNQzNHWo8LvKb/bIz6q49u4pYLJV6Owg/79JnFxGaOyf+4i71sagZGiCp6vxnCjZc+BCcrSf
	Rcq2iYgtn69xm3/xkn0lnlD0SMO6Vz02vnA==
X-Gm-Gg: AYBFou3gLSQjQyeU8uE/2Doqmdacp685eMLn6Ky0SSZjlyIgfiTeH5x4s8VgCwKpXuE
	rw20QU8eCgAeOr2sd0j4FC/sME735xLmB/braZI25JwDhK6ewR/SIlHXANbZunYUSxxSVfXd+2k
	sq/z5Ds/DThzREq/96oW9zHuQk544ccjZ0fmHlrQLSTF/9/RWT6w4gY13Ywb9KrI2rElIrAbKrD
	NzwNOZ1BkP1iB6zhOY8bm6DYZe2OcFj7Y8Wif7zzvqQg87MwWH4wuSSyZwFg8SbqQk0wrl31hpc
	nCFlJ7gdws7qb+y2rv2R5OmOrCbu6H3PJsjVavkPQGmAbsee7HYIJ81PifKI4JkcDFIWvxJ+nA4
	ubNPZgmimzDAWrCbJQcXcDLubR6orZQwLQJ2k8V0=
X-Received: by 2002:a05:693c:60d3:b0:369:2505:380 with SMTP id
 5a478bee46e88-36a203ff8d6mr6796336eec.24.1793253653949; Wed, 28 Oct 2026
 23:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261029024010.2113092-1-ragaprasanth@gmail.com>
 <6ae2bf09.0a372733.3ab85e.5e55@mx.google.com> <CAG7eodEvhmPWudqazp1WivHWN05x=TwPQww4ik_ZceruT0wAfQ@mail.gmail.com>
In-Reply-To: <CAG7eodEvhmPWudqazp1WivHWN05x=TwPQww4ik_ZceruT0wAfQ@mail.gmail.com>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Thu, 29 Oct 2026 15:00:17 +0900
X-Gm-Features: AclHuK-BMCpulYiaxYGRV08-CzApvETzdSkCzTVEXtkrTvCFODdxM2P2VtqNrWA
Message-ID: <CAG7eodGgG1nXcr7FV5suCBboKgRKeHkMVTr5XKyhvBSX8ht3QQ@mail.gmail.com>
Subject: Re: [PATCH] kernel.bbclass: fix -dev files when KERNEL_PACKAGE_NAME
 is PN
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000009327e065ef46787"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248898

--00000000000009327e065ef46787
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

I don't see my patches in the patchwork, am i missing something?

Thanks,
Prasanth R

On Thu, Oct 29, 2026 at 2:08=E2=80=AFPM Prasanth Ramesh <ragaprasanth@gmail=
.com>
wrote:

> Hi Bruce,
>
> Thanks for the detailed review and the explanation regarding the event
> handler. That makes perfect sense.
>
> Sent v2.
>
> Thanks,
> Prasanth R
>
>
> On Thu, Oct 29, 2026 at 12:35=E2=80=AFPM Bruce Ashfield <bruce.ashfield@g=
mail.com>
> wrote:
>
>> On Wed, Oct 29, 2026 at 11:40 AM Prasanth R <ragaprasanth@gmail.com>
>> wrote:
>> >
>>
>> Can you elaborate on the configuration / build that you are doing that
>> is triggering this ? You have multiple kernels ? and you are setting
>> KERNEL_PACKAGE_NAME =3D  "${PN}" as part of that ? How you ran into this
>> is important for understanding the context. It could be that we can
>> avoid the issue in another way.
>>
>> > With KERNEL_PACKAGE_NAME =3D "${PN}", FILES:${KERNEL_PACKAGE_NAME}-dev=
 and
>> > FILES:${PN}-dev from bitbake.conf become the same variable and the
>> > bitbake.conf value wins. The same happens for -dbg. The kernel files a=
re
>> > then not packaged and do_package fails:
>>
>> Also for -dbg, the bitbake.conf value is a superset of what the kernel
>> class
>> sets, so nothing is actually lost there. It is just the key collision
>> warning. Worth saying that, so it is clear that -dev is the real breakag=
e.
>>
>> >
>> >   ERROR: linux-yocto-7.2.8+git-r0 do_package: QA Issue: linux-yocto:
>> >   Files/directories were installed but not shipped in any package:
>> >     /boot/System.map-7.2.8-yocto-standard
>> >     /boot/config-7.2.8-yocto-standard
>> >     /boot/Module.symvers-7.2.8-yocto-standard
>> >
>> > This matters when a second kernel recipe. So, Rename the kernel
>> variables
>> > to the ${PN} names before the keys are expanded, so the kernel values
>> are kept.
>>
>> This sentence is broken. Can you say who actually sets
>> KERNEL_PACKAGE_NAME =3D "${PN}" and why? I assume an alternate/second
>> kernel recipe, but that should be spelled out. This is the specifics
>> that are hinted at in my opening question.
>>
>> I'd also like the commit message to explain why an event handler is
>> needed. My first reaction was that this was more complex than it needed
>> to be. But key expansion happens (in sorted order) before anonymous pyth=
on
>> runs, so by the time __anonymous() sees it, the kernel value is already
>> gone. Fixing it in anonymous python would also clobber any :append to
>> FILES:${KERNEL_PACKAGE_NAME}-dev from a bbappend. A :append in the class
>> keeps the files but still triggers the "Variable key ... replaces origin=
al
>> key" warning on every parse. So renaming before expansion is the right
>> place. Just say so in the commit, so the next person doesn't have to wor=
k
>> it out again.
>>
>> >
>> > Remove the old warning about bug 11905, which was closed as not a bug.
>>
>> Fine. 11905 is the same key expansion ordering issue, and that is
>> expected bitbake behaviour, which is why the fix belongs here.
>>
>> >
>> > AI-Generated: Uses Claude
>> > Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
>> > ---
>> >
>> > Notes:
>> >     Tested on master: without this patch do_package fails with the
>> >     QA error above; with it the build passes with no warnings and
>> linux-yocto-dev
>> >     contains System.map, Module.symvers and the config.
>>
>> Please also confirm the default case (KERNEL_PACKAGE_NAME =3D "kernel") =
is
>> unchanged. It should be, since the handler returns early, but it is the
>> case almost everyone uses.
>>
>> Also note in the commit that with KERNEL_PACKAGE_NAME =3D "${PN}", the -=
dev
>> package no longer picks up the bitbake.conf default -dev contents
>> (includedir, .so symlinks, etc). That matches what kernel-dev gets
>> today, so I think it is correct, but it is a behaviour change and should
>> be stated (and confirmed by testing).
>>
>> >
>> >  meta/classes-recipe/kernel.bbclass | 21 ++++++++++++++-------
>> >  1 file changed, 14 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/meta/classes-recipe/kernel.bbclass
>> b/meta/classes-recipe/kernel.bbclass
>> > index 0a6d754108..b018c164fd 100644
>> > --- a/meta/classes-recipe/kernel.bbclass
>> > +++ b/meta/classes-recipe/kernel.bbclass
>> > @@ -60,16 +60,23 @@ KERNEL_VERSION_NAME[vardepvalue] =3D
>> "${LINUX_VERSION}"
>> >  KERNEL_VERSION_PKG_NAME =3D
>> "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
>> >  KERNEL_VERSION_PKG_NAME[vardepvalue] =3D "${LINUX_VERSION}"
>> >
>> > +# With KERNEL_PACKAGE_NAME =3D "${PN}", FILES:${PN}-dev/-dbg from
>> bitbake.conf
>> > +# would replace the kernel values during key expansion, so rename the
>> kernel
>> > +# variables to the ${PN} names first.
>>
>> Same here. Add a line saying this must run before key expansion
>> (i.e. it can't live in __anonymous), so nobody "simplifies" it later.
>>
>> > +python kernel_package_name_handler () {
>> > +    d =3D e.data
>> > +    if d.getVar("KERNEL_PACKAGE_NAME") !=3D d.getVar("PN"):
>> > +        return
>> > +
>> > +    for pkg in ("dev", "dbg"):
>> > +        d.renameVar("FILES:${KERNEL_PACKAGE_NAME}-%s" % pkg,
>> "FILES:${PN}-%s" % pkg)
>> > +}
>> > +addhandler kernel_package_name_handler
>> > +kernel_package_name_handler[eventmask] =3D "bb.event.RecipePreFinalis=
e"
>> > +
>> >  python __anonymous () {
>> > -    pn =3D d.getVar("PN")
>> >      kpn =3D d.getVar("KERNEL_PACKAGE_NAME")
>> >
>> > -    # XXX Remove this after bug 11905 is resolved
>> > -    #  FILES:${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
>> > -    if kpn =3D=3D pn:
>> > -        bb.warn("Some packages (E.g. *-dev) might be missing due to "
>> > -                "bug 11905 (variable KERNEL_PACKAGE_NAME =3D=3D PN)")
>> > -
>>
>> The code itself looks fine. A v2 with the commit message and comment
>> updates and I'll ack it.
>>
>> Bruce
>>
>> > --
>> > 2.34.1
>>
>

--00000000000009327e065ef46787
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Bruce,</div><div><br></div><div>I don&#39;t s=
ee my patches in the patchwork, am i=C2=A0missing something?</div><div><br>=
</div><div>Thanks,=C2=A0</div><div>Prasanth R</div></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Oct 29, 2026 at 2:08=E2=80=AFPM Prasanth Ramesh &lt;<a href=3D"mailto=
:ragaprasanth@gmail.com">ragaprasanth@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Bruce,<b=
r><br>Thanks for the detailed review and the explanation regarding the even=
t handler. That makes perfect sense.<br><br>Sent v2.<br><br>Thanks,<br>Pras=
anth R<div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><br>=
</div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Oct 29, 2026 at 12:35=E2=80=AFPM Bruce Ashfield &=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashf=
ield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Wed, Oct 29, 2026 at 11:40 AM Prasanth R &lt;<a href=3D"ma=
ilto:ragaprasanth@gmail.com" target=3D"_blank">ragaprasanth@gmail.com</a>&g=
t; wrote:<br>
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
</blockquote></div>

--00000000000009327e065ef46787--
