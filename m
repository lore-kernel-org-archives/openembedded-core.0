Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58316CD8C9E
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:58:50 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.93531.1696949922317320190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JLZi767P;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-79fb78e297bso243132239f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696949921; x=1697554721; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XyEhR+SZLQQfW+qPt4nahk8Cm+I5T1Qvkl/KWoImNdw=;
        b=JLZi767PdLGONvszUt86m8H1u+8MsmEmuYx/UvLXoFU+Pea0ajVodtGJtZaLIj1KQU
         QFwwyHbVCpOc0mGcmI743dw/50kpb0/vHxBG0EOYBGWpeWxxO1/a7fmbHzLzrxpSVevY
         +4NcAalYTlLmK7za4I7lqMpuAYSiOAppnL0qG/PhpjmSFmESdm9cjvqRRB3q1MN+lrcy
         bzArBCXP3qk4mZ0C6nsERWLMkuk5eSpyyBuE+WvGXozwpnZrxaTgqeT2XnYV6R/RBf88
         8FFGXu96lV96Y3636+zIi73XKLMvUmT1QvM5e7q3+GMg7xp+kaiQv3Per5OAe3iIHAI6
         Llag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696949921; x=1697554721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyEhR+SZLQQfW+qPt4nahk8Cm+I5T1Qvkl/KWoImNdw=;
        b=CqkxyRB7Ew4ZOM7MZs+yp0GHSARIahAp+VvzRwYboLTYb/y0aLPFJZf6nJmvhSpuhP
         HXc6h3zoPBynZQis20FBQl4tLgfhTK+Yba9/f1qfO52Hf7JwJYQZabBvMGJIUDZvCUwn
         ZDhT51Oe+iln4a7s6QazAqjUf8aWgxhWTWwtTaCbISwEE3qqYSvDr0DngUc2UC30KK3I
         QSa0VIhM3qeNgxtyoXLhqKaz7MYobF4V4bhDP2MAxhZ/RJu0ABXSEcb2fUxsnuw+pMED
         38OqH2IvxBTLD+pw24bYl/wGXfplVLvdOeEc1kmRYCbCxNhBZi76vBWEPLhPwCRhnKvn
         fxoQ==
X-Gm-Message-State: AOJu0YxchOVj4SW1/CMPu2oKWYrUZyiF/f9cKB/cTwUKdjg4SIrBzZUp
	wzV6HtWf7llmR0NTzbRkKqFF6WpujSiWwfZGIzA=
X-Google-Smtp-Source: AGHT+IH61KXdMPLuBjs/5EwArCP7tr1mY9hd1FERNdLrOsbxqq4OmfZT2pYX1CXV817JBI0a9+5o6AXRZewJCgucTQE=
X-Received: by 2002:a5e:9705:0:b0:798:2415:1189 with SMTP id
 w5-20020a5e9705000000b0079824151189mr19808247ioj.12.1696949921432; Tue, 10
 Oct 2023 07:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
 <1c4a47b33bed622c5b7c137a830e359302293887.1688958789.git.bruce.ashfield@gmail.com>
 <ca1963d9-39aa-d00f-6ac9-9ee919db7d32@prevas.dk> <CADkTA4N1A1DGi1Kde+Muaq_pHB=XXRPiHui74PD24pVwf1-SAw@mail.gmail.com>
 <dfeeb982-555e-8195-3dde-ef621ba66a1f@prevas.dk>
In-Reply-To: <dfeeb982-555e-8195-3dde-ef621ba66a1f@prevas.dk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Oct 2023 10:58:30 -0400
Message-ID: <CADkTA4MBfA13iGxfmUXBMNAS+8VUdE_6bOfnzOEA+rHC9jGW7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/15] perf: fix buildpaths QA warning in 6.4+
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000044cba606075df13e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188911

--00000000000044cba606075df13e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 10:37=E2=80=AFAM Rasmus Villemoes <
rasmus.villemoes@prevas.dk> wrote:

> On 10/10/2023 14.31, Bruce Ashfield wrote:
> >
> >
> > On Tue, Oct 10, 2023 at 7:44=E2=80=AFAM Rasmus Villemoes
> >     It seems we can fix it with
> >
> >     $ git diff
> >     diff --git a/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
> >     b/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
> >     index 420286e..59c0c10 100644
> >     --- a/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
> >     +++ b/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
> >     @@ -81,7 +81,7 @@ EXTRA_OEMAKE =3D '\
> >          LDSHARED=3D"${CC} -shared" \
> >          AR=3D"${AR}" \
> >          LD=3D"${LD}" \
> >     -    EXTRA_CFLAGS=3D"-ldw -I${S}" \
> >     +    EXTRA_CFLAGS=3D"-ldw -I${S} ${DEBUG_PREFIX_MAP}" \
> >          YFLAGS=3D'-y
> >
>  --file-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-$=
{PR}' \
> >          EXTRA_LDFLAGS=3D"${PERF_EXTRA_LDFLAGS}" \
> >          perfexecdir=3D${libexecdir} \
> >
> >     but I'm quite curious what the difference between our setups is,
> since
> >     apparently the only problem oe-core has/had was that new file
> introduced
> >     in v6.4.
> >
> >
> > You can see any patches that we have against perf in the kernel-cache
> > repository (https://git.yoctoproject.org/yocto-kernel-cache/
> > <https://git.yoctoproject.org/yocto-kernel-cache/>). That being
> > said, we unfortunately cannot really patch perf, since the recipe is
> > supported against more than our reference kernels.
>
> I didn't suggest to patch perf, I suggested to patch the perf recipe.
>

I also didn't mean that. You asked what the differences might
be in our setup, which largely means linux-yocto. Hence why
the patches would be relevant to that question.


> >
> > Other than that, there's no special setup (in particular no setup that
> > I have) as it is the autobuilder infrastructure that typically finds an=
d
> > reports these issues.
>
> So I found the difference, and those autobuilder builds do in fact make
> the compiler use all the right -f*-prefix-map options. It's because
> meta/conf/distro/include/security_flags.inc contains
>
> TARGET_CC_ARCH:append:pn-perf =3D " ${SELECTED_OPTIMIZATION}"
>
> and that includes the DEBUG_PREFIX_MAP setting, and in turn gets
> included in the CC setting via HOST_CC_ARCH. And of course the poky
> distro includes that security_flags.inc file, while our custom distro
> does not (up until five minutes ago, I never knew that file existed).
>
> Of course one wonders why those :append:pn-* settings that don't
> actually append any security related flags, but do affect stuff like the
> recipes passing QA, are hidden away in a file called security_flags.inc
> instead of those settings just being directly in the recipes themselves.
> There's no explanation in oe-core e93765ffb57 ; it removed a whole bunch
> of append_pn-* stuff which had apparently become redundant (the commit
> log hints as much), but doesn't offer any explanation as to why pn-perf
> should grow that setting. And AFAICT that long predates the invention of
> the -f*-prefix-map flags, so it seems to be mostly by accident that
> perf, with the poky distro, actually does build with those flags.
>

The settings and debug maps are typically distro policies, so that's
why they were historically controlled there. If we pull it out to the
recipe, we'd want to check a similar distro flag to enable/disable
(mainly for debug purposes).

I wouldn't say by accident at all, but there's been a lot of changes
over time, so there's bits and pieces that are stitched together
differently, with variable names that have had their meaning change
over time.

Bruce



>
> Rasmus
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000044cba606075df13e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Oct 10, 2023 at 10:37=E2=80=AFAM Rasmus Vil=
lemoes &lt;<a href=3D"mailto:rasmus.villemoes@prevas.dk">rasmus.villemoes@p=
revas.dk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 10/10/2023 14.31, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Oct 10, 2023 at 7:44=E2=80=AFAM Rasmus Villemoes<br>
&gt;=C2=A0 =C2=A0 =C2=A0It seems we can fix it with<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0$ git diff<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-kernel/perf/<a href=3D"ht=
tp://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a> &lt;<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">http://perf.bb</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-kernel/perf/<a href=3D"http://perf.b=
b" rel=3D"noreferrer" target=3D"_blank">perf.bb</a> &lt;<a href=3D"http://p=
erf.bb" rel=3D"noreferrer" target=3D"_blank">http://perf.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 420286e..59c0c10 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-kernel/perf/<a href=3D"http://pe=
rf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a> &lt;<a href=3D"http=
://perf.bb" rel=3D"noreferrer" target=3D"_blank">http://perf.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-kernel/perf/<a href=3D"http://pe=
rf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a> &lt;<a href=3D"http=
://perf.bb" rel=3D"noreferrer" target=3D"_blank">http://perf.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -81,7 +81,7 @@ EXTRA_OEMAKE =3D &#39;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0LDSHARED=3D&quot;${CC} -shared&=
quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0AR=3D&quot;${AR}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0LD=3D&quot;${LD}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 EXTRA_CFLAGS=3D&quot;-ldw -I${S}&quo=
t; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 EXTRA_CFLAGS=3D&quot;-ldw -I${S} ${D=
EBUG_PREFIX_MAP}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0YFLAGS=3D&#39;-y<br>
&gt;=C2=A0 =C2=A0 =C2=A0--file-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${P=
N}/${EXTENDPE}${PV}-${PR}&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0EXTRA_LDFLAGS=3D&quot;${PERF_EX=
TRA_LDFLAGS}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0perfexecdir=3D${libexecdir} \<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0but I&#39;m quite curious what the difference betwe=
en our setups is, since<br>
&gt;=C2=A0 =C2=A0 =C2=A0apparently the only problem oe-core has/had was tha=
t new file introduced<br>
&gt;=C2=A0 =C2=A0 =C2=A0in v6.4.<br>
&gt; <br>
&gt; <br>
&gt; You can see any patches that we have against perf in the kernel-cache<=
br>
&gt; repository (<a href=3D"https://git.yoctoproject.org/yocto-kernel-cache=
/" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/yocto-=
kernel-cache/</a><br>
&gt; &lt;<a href=3D"https://git.yoctoproject.org/yocto-kernel-cache/" rel=
=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/yocto-kernel=
-cache/</a>&gt;). That being<br>
&gt; said, we unfortunately cannot really patch perf, since the recipe is<b=
r>
&gt; supported against more than our reference kernels.<br>
<br>
I didn&#39;t suggest to patch perf, I suggested to patch the perf recipe.<b=
r></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">I also didn&#39;t mean that. You asked what the differences =
might</div><div class=3D"gmail_default" style=3D"font-size:small">be in our=
 setup, which largely means linux-yocto. Hence why</div><div class=3D"gmail=
_default" style=3D"font-size:small">the patches would be relevant to that q=
uestion.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; <br>
&gt; Other than that, there&#39;s no special setup (in particular no setup =
that<br>
&gt; I have) as it is the autobuilder infrastructure that typically finds a=
nd<br>
&gt; reports these issues.<br>
<br>
So I found the difference, and those autobuilder builds do in fact make<br>
the compiler use all the right -f*-prefix-map options. It&#39;s because<br>
meta/conf/distro/include/security_flags.inc contains<br>
<br>
TARGET_CC_ARCH:append:pn-perf =3D &quot; ${SELECTED_OPTIMIZATION}&quot;<br>
<br>
and that includes the DEBUG_PREFIX_MAP setting, and in turn gets<br>
included in the CC setting via HOST_CC_ARCH. And of course the poky<br>
distro includes that security_flags.inc file, while our custom distro<br>
does not (up until five minutes ago, I never knew that file existed).<br>
<br>
Of course one wonders why those :append:pn-* settings that don&#39;t<br>
actually append any security related flags, but do affect stuff like the<br=
>
recipes passing QA, are hidden away in a file called security_flags.inc<br>
instead of those settings just being directly in the recipes themselves.<br=
>
There&#39;s no explanation in oe-core e93765ffb57 ; it removed a whole bunc=
h<br>
of append_pn-* stuff which had apparently become redundant (the commit<br>
log hints as much), but doesn&#39;t offer any explanation as to why pn-perf=
<br>
should grow that setting. And AFAICT that long predates the invention of<br=
>
the -f*-prefix-map flags, so it seems to be mostly by accident that<br>
perf, with the poky distro, actually does build with those flags.<br></bloc=
kquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">The settings and debug maps are typically distro policies, so that&#39;s<=
/div><div class=3D"gmail_default" style=3D"font-size:small">why they were h=
istorically controlled there. If we pull it out to the</div><div class=3D"g=
mail_default" style=3D"font-size:small">recipe, we&#39;d want to check a si=
milar distro flag to enable/disable=C2=A0</div><div class=3D"gmail_default"=
 style=3D"font-size:small">(mainly for debug purposes).</div><div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">I wouldn&#39;t=
 say by accident at all, but there&#39;s been a lot of changes</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">over time, so there&#39;s b=
its and pieces that are stitched together</div><div class=3D"gmail_default"=
 style=3D"font-size:small">differently, with variable names that have had t=
heir meaning change</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">over time.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Rasmus<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--00000000000044cba606075df13e--

