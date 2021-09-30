Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C591C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 15:23:36 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web08.13996.1633015408693931293
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 08:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WqjqFgq3;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id a9so3839986qvf.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MOcRp3N3CEr1+DTDIzJOr/XmGsU8NNzKBxGj/FG/Nk4=;
        b=WqjqFgq3lRO7TXs9LsNutj3hb+EG02Eb9iTby0NS8aghwJJDU/q0MouIN8Q3Z045wx
         Tjx1iU/a4g1vhJ9VNhF2RmV4zcHqwvIMBEPRZ94nsqJRLOhrE9T4MKe4S6EzlwsEqOdf
         61dyUtCEWMeMizODY8w9/YWB6RdvcwK66SB8cUVc0l8VIz+UNlmQa8lS2TTQC9v17fNO
         nT1shSeK2oXSJmsqlySgL4ilrG10kHp3ZxyrWNj62WsIY8SvqOgPqq/v9x0VVcOHyOqI
         sa1bT3YmqvrTZUyyLWrKGSOqNePgMHvWebszkoVa0pB+8TqfeYGhEdPjFdovb86bnKFN
         j6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MOcRp3N3CEr1+DTDIzJOr/XmGsU8NNzKBxGj/FG/Nk4=;
        b=Mm1KrdZ43Qf+gQ7Uv6cpeRSIN5smFt6PiC13LqaWnUTwGIzhQYJ3DBBv9secGp9aem
         VVUVfc0gt1SUobPVkApv+eqSHiKZQNZdfGOZ1eA+A64vxz+qtHUrQexnK4W68GFoq0GL
         NnXzGghm3C/as1YF21R/o0xuAVNp/IeGoe0EwqS1zQJQGv0yhUCvXXL6y4L6vET0a9kc
         F/JO0Lzvim+JV/3zKtkJDPhSNctpYq8MgioE/7HuQQeWDrbe3wQWNttrUhYsgmeRjWcw
         NIRZyOC3GqJDVrB3xYYK2G7GNs6jIXLN3jLd8ggtr9ra1MrvBlff/d/cjw+6xYHECLbr
         Zsgg==
X-Gm-Message-State: AOAM532116AjqaxOdQlMCkWKkVs4XI6zbmttNDmxVU+d7whoSNDyciKg
	MHHy5OuY6Yb8HUly4q5c9Ht8oDGOrTsiQaiSjVY=
X-Google-Smtp-Source: 
 ABdhPJy7+wJS4zR2W5uF33h5pIhFUxaCeprb/Xho2ZfV3mzSX/293To93uJEfiU9zm/2TzpNbhwH4pvJBsDRPoxbTW0=
X-Received: by 2002:a0c:8061:: with SMTP id 88mr4482729qva.5.1633015407845;
 Thu, 30 Sep 2021 08:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210929205711.193186-1-raj.khem@gmail.com>
 <YVVdPktXwMNwIVNu@piout.net>
In-Reply-To: <YVVdPktXwMNwIVNu@piout.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Sep 2021 08:23:17 -0700
Message-ID: 
 <CAMKF1souJT2zctaCY5dubAuQT+zJtYkX0Kfsm3D_O251DnabYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace_5.13 -> strace 5.14
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Persian Prince <persianpros@yahoo.com>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004c23d105cd3807de"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 15:23:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156506

--0000000000004c23d105cd3807de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2021 at 11:46 PM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello,
>
> On 29/09/2021 13:57:10-0700, Khem Raj wrote:
> > From: Persian Prince <persianpros@yahoo.com>
> >
> > Strace 5.13 won't compile with 5.14 headers:
> >
> > | ../../strace-5.13/src/fs_x_ioctl.c: In function 'fs_x_ioctl':
> > | ../../strace-5.13/src/fs_x_ioctl.c:64:14: error: invalid application
> of 'sizeof' to incomplete type 'struct fsxattr'
> > |    64 |         case FS_IOC_FSGETXATTR:
> > |       |              ^~~~~~~~~~~~~~~~~
> > | ../../strace-5.13/src/fs_x_ioctl.c:71:14: error: invalid application
> of 'sizeof' to incomplete type 'struct fsxattr'
> > |    71 |         case FS_IOC_FSSETXATTR:
> > |       |              ^~~~~~~~~~~~~~~~~
> > | make[3]: *** [Makefile:5011: libstrace_a-fs_x_ioctl.o] Error 1
> > | make[3]: *** Waiting for unfinished jobs....
> >
> > According to https://strace.io/files/5.14/:
> >
> > * Improvements
> >   * Implemented decoding of memfd_secret and quotactl_fd syscalls,
> >     introduced in Linux 5.14.
> >   * Enhanced prctl syscall decoding.
> >   * Enhanced decoding of IFLA_* netlink attributes.
> >   * Enhanced decoding of MDBA_ROUTER_PATTR_* mdb router port netlink
> attributes.
> >   * Updated lists of BPF_*, IORING_*, MADV_*, MOUNT_ATTR_*, SCTP_*,
> >     and UFFD_* constants.
> >   * Updated lists of ioctl commands from Linux 5.14.
> >
> > Persian Prince <persianpros@yahoo.com>
>
> I guess this should have been an SoB.
>
> However, this is not applicable as we already carry a similar patch in
> kirkstone-next.


If you do that=E2=80=99s fine see if commit msg makes sense and perhaps tra=
nsplant
that part to what you are staging


>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/strace/{strace_5.13.bb =3D> strace_5.14.bb} | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/strace/{strace_5.13.bb =3D> strace_5.14.b=
b}
> (96%)
> >
> > diff --git a/meta/recipes-devtools/strace/strace_5.13.bb
> b/meta/recipes-devtools/strace/strace_5.14.bb
> > similarity index 96%
> > rename from meta/recipes-devtools/strace/strace_5.13.bb
> > rename to meta/recipes-devtools/strace/strace_5.14.bb
> > index 7d93f2da98..02a4843edf 100644
> > --- a/meta/recipes-devtools/strace/strace_5.13.bb
> > +++ b/meta/recipes-devtools/strace/strace_5.14.bb
> > @@ -15,7 +15,7 @@ SRC_URI =3D "
> https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> >             file://uintptr_t.patch \
> >             file://0001-strace-fix-reproducibilty-issues.patch \
> >             "
> > -SRC_URI[sha256sum] =3D
> "5acc34888b9d510ad6ac915d4a8df08f51cf1ae920ea24649f6a4bb984d0b656"
> > +SRC_URI[sha256sum] =3D
> "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73"
> >
> >  inherit autotools ptest
> >
> > --
> > 2.33.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#156475):
> https://lists.openembedded.org/g/openembedded-core/message/156475
> > Mute This Topic: https://lists.openembedded.org/mt/85959484/3617179
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

--0000000000004c23d105cd3807de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Sep 29, 2021 at 11:46 PM Alexandre Belloni &lt;<a h=
ref=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
On 29/09/2021 13:57:10-0700, Khem Raj wrote:<br>
&gt; From: Persian Prince &lt;<a href=3D"mailto:persianpros@yahoo.com" targ=
et=3D"_blank">persianpros@yahoo.com</a>&gt;<br>
&gt; <br>
&gt; Strace 5.13 won&#39;t compile with 5.14 headers:<br>
&gt; <br>
&gt; | ../../strace-5.13/src/fs_x_ioctl.c: In function &#39;fs_x_ioctl&#39;=
:<br>
&gt; | ../../strace-5.13/src/fs_x_ioctl.c:64:14: error: invalid application=
 of &#39;sizeof&#39; to incomplete type &#39;struct fsxattr&#39;<br>
&gt; |=C2=A0 =C2=A0 64 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FS_IOC_FSGET=
XATTR:<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ^~~~~~~~~~~~~~~~~<br>
&gt; | ../../strace-5.13/src/fs_x_ioctl.c:71:14: error: invalid application=
 of &#39;sizeof&#39; to incomplete type &#39;struct fsxattr&#39;<br>
&gt; |=C2=A0 =C2=A0 71 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FS_IOC_FSSET=
XATTR:<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ^~~~~~~~~~~~~~~~~<br>
&gt; | make[3]: *** [Makefile:5011: libstrace_a-fs_x_ioctl.o] Error 1<br>
&gt; | make[3]: *** Waiting for unfinished jobs....<br>
&gt; <br>
&gt; According to <a href=3D"https://strace.io/files/5.14/" rel=3D"noreferr=
er" target=3D"_blank">https://strace.io/files/5.14/</a>:<br>
&gt; <br>
&gt; * Improvements<br>
&gt;=C2=A0 =C2=A0* Implemented decoding of memfd_secret and quotactl_fd sys=
calls,<br>
&gt;=C2=A0 =C2=A0 =C2=A0introduced in Linux 5.14.<br>
&gt;=C2=A0 =C2=A0* Enhanced prctl syscall decoding.<br>
&gt;=C2=A0 =C2=A0* Enhanced decoding of IFLA_* netlink attributes.<br>
&gt;=C2=A0 =C2=A0* Enhanced decoding of MDBA_ROUTER_PATTR_* mdb router port=
 netlink attributes.<br>
&gt;=C2=A0 =C2=A0* Updated lists of BPF_*, IORING_*, MADV_*, MOUNT_ATTR_*, =
SCTP_*,<br>
&gt;=C2=A0 =C2=A0 =C2=A0and UFFD_* constants.<br>
&gt;=C2=A0 =C2=A0* Updated lists of ioctl commands from Linux 5.14.<br>
&gt; <br>
&gt; Persian Prince &lt;<a href=3D"mailto:persianpros@yahoo.com" target=3D"=
_blank">persianpros@yahoo.com</a>&gt;<br>
<br>
I guess this should have been an SoB.<br>
<br>
However, this is not applicable as we already carry a similar patch in<br>
kirkstone-next.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I=
f you do that=E2=80=99s fine see if commit msg makes sense and perhaps tran=
splant that part to what you are staging=C2=A0</div><div dir=3D"auto"><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/strace/{<a href=3D"http://strace_5.13.bb" =
rel=3D"noreferrer" target=3D"_blank">strace_5.13.bb</a> =3D&gt; <a href=3D"=
http://strace_5.14.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.14.bb<=
/a>} | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/strace/{<a href=3D"http://strace_5.=
13.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.13.bb</a> =3D&gt; <a h=
ref=3D"http://strace_5.14.bb" rel=3D"noreferrer" target=3D"_blank">strace_5=
.14.bb</a>} (96%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/strace/<a href=3D"http://strace_5.1=
3.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.13.bb</a> b/meta/recipe=
s-devtools/strace/<a href=3D"http://strace_5.14.bb" rel=3D"noreferrer" targ=
et=3D"_blank">strace_5.14.bb</a><br>
&gt; similarity index 96%<br>
&gt; rename from meta/recipes-devtools/strace/<a href=3D"http://strace_5.13=
.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.13.bb</a><br>
&gt; rename to meta/recipes-devtools/strace/<a href=3D"http://strace_5.14.b=
b" rel=3D"noreferrer" target=3D"_blank">strace_5.14.bb</a><br>
&gt; index 7d93f2da98..02a4843edf 100644<br>
&gt; --- a/meta/recipes-devtools/strace/<a href=3D"http://strace_5.13.bb" r=
el=3D"noreferrer" target=3D"_blank">strace_5.13.bb</a><br>
&gt; +++ b/meta/recipes-devtools/strace/<a href=3D"http://strace_5.14.bb" r=
el=3D"noreferrer" target=3D"_blank">strace_5.14.bb</a><br>
&gt; @@ -15,7 +15,7 @@ SRC_URI =3D &quot;<a href=3D"https://strace.io/files=
/$%7BPV%7D/strace-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">ht=
tps://strace.io/files/${PV}/strace-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://uintptr_t.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-strace-fix-=
reproducibilty-issues.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;5acc34888b9d510ad6ac915d4a8df08f51cf1ae9=
20ea24649f6a4bb984d0b656&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;901bee6db5e17debad4530dd9ffb4dc9a96c4a65=
6edbe1c3141b7cb307b11e73&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit autotools ptest<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.33.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#156475): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/156475" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/156475</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85959484=
/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/85959484/3617179</a><br>
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
</blockquote></div></div>

--0000000000004c23d105cd3807de--

