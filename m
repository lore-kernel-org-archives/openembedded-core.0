Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F385C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 15:25:29 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.22508.1679066723275708705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 08:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eyqk6DGz;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id s8so6676228lfr.8
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679066721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mcjeZZIIw8/f62KKveFWO44q7D3t81bLfh+ua/xZP9A=;
        b=eyqk6DGz6x9oM/67t++k1+pPXwNoBK0TWfjKQ9h0ElZrxD2uHE4qbEzyY+C2Gge5gC
         a1V8mnR2Kg374aIzaV0aokSjMB91vjjK+3jZ2AYmHrXtckc+l67pJHLlxhCXACWfSl+g
         90fWzRNbb3z9AFQEp4nTCfza16eB76CLum1oKRrGEOSj3na6kIUtt0d5rpQiIfyHbG6n
         /qOyiLcYJDaCUDMldd4iny8j0Xseiw/mgOpmDRFjxku+xQa+CTWD10e1a2XLuPUxsuVi
         IgNTSvepS5e3v6eeLz1j8TJ0LeC/KBHOfGaiiBllL0x/kcPNEWZo0ftKzWdBxpSY+DjM
         M/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679066721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcjeZZIIw8/f62KKveFWO44q7D3t81bLfh+ua/xZP9A=;
        b=aUOooUz2kTBQD5jgthDn8EtR4MnzL3sKjy1O3UuvAQgF2G7B6ovNKMOGiuMVarzVfg
         6qOZiDEHLR8N+M+ihfiuxHhLjA1txKn3xpWjSr4MlB58hcdai5qRsIGNVRpbQ8AwZt5Y
         R9BGOC/ncPXEcdNDs4d6STd1xXHDhK/Iez1mFg0hdK5Coyq//HrEb5zM2v1oSTv7NHGL
         G8j9W2/cph5PniPeOKNTKhHvkCzAHpaxM5JJEL7ue5VPDZvEwoDLipaWdensM0IWPC0c
         3MIgjBbKvox0P9JKcx0pV7GJSXpoRfd/mnhy0PlYnt9cEva00kt0KKSF6x9FCAOKFK41
         4PUw==
X-Gm-Message-State: AO0yUKUeYFqffO3UVbLdVm1AYe1sv7+uneK5gOSHaafLM667J5AC7Y6O
	7y0D46XEp85Lcl9IPH32qjCvKfjraukem6xE4Hc=
X-Google-Smtp-Source: AK7set+cz+CkI10enZq0po1dV8f/xhA14FACd7cFP9XplsH7j9uwdk0fxtdQD+hgDJ5omJCUozoMNtNUfqAzbcQ08NA=
X-Received: by 2002:a19:c510:0:b0:4d5:ca32:6ed5 with SMTP id
 w16-20020a19c510000000b004d5ca326ed5mr1123381lfe.3.1679066721243; Fri, 17 Mar
 2023 08:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230317100923.3295331-1-mikko.rapeli@linaro.org>
 <CANNYZj_RVtE=Ud1Tmcr5H0_zQZS_SK+5CT1ro4oanudVdTfBWQ@mail.gmail.com> <ZBRWmcQjRoq631S8@nuoska>
In-Reply-To: <ZBRWmcQjRoq631S8@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Mar 2023 15:25:10 +0000
Message-ID: <CANNYZj-bB4DUWL0HqkAmJyKm7WHEdDatXZZC=EqRVuAfuFwJfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] e2fsprogs: switch from master to debian/master
 branch to fix compatibility
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Jerome Forissier <jerome.forissier@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000079571105f71a2f2b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178756

--00000000000079571105f71a2f2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri 17. Mar 2023 at 12.01, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:

> Hi,
>
> On Fri, Mar 17, 2023 at 11:39:23AM +0100, Alexander Kanavin wrote:
> > This doesn=E2=80=99t seem right. We should not give special privileges =
to tooling
> > from any particular host distro. If you need to manipulate images, buil=
d
> > e2fsprogs-native and run that.
>
> This is about ext4 images breaking compatibility with older versions of
> tooling used manipulate the images. For Debian the upstream maintainers
> and Debian package maintainers agreed to keep the backwards
> compatibility for longer time. I think that makes sense for yocto too.
>
> While I agree that using e2fsprogs-native is a solution too, I also
> agree that a lot of users are using non-yocto e2fsprogs when e.g.
> flashing images to target HW. Breaking compatibility can quite simply be
> avoided and upstream will maintain this branch. Win win from my point of
> view.


But then we should put e2fsprogs into buildtools-tarball(-extended). It=E2=
=80=99s
not any different to providing compatible gcc, when one from the host
distro is too old.

Taking a custom branch creates a maintenance problem. What if it stops
being maintained? Will it follow proper upstream closely? Can we ever drop
this backwards compatibility? It creates a long term headache that I do not
want.

Alex



>
> Cheers,
>
> -Mikko
>
> > Alex
> >
> > On Fri 17. Mar 2023 at 10.09, Mikko Rapeli <mikko.rapeli@linaro.org>
> wrote:
> >
> > > From: Jerome Forissier <jerome.forissier@linaro.org>
> > >
> > > When trying to use e2fsck <=3D 1.47.0 on the root filesystem (for
> example,
> > > to resize a partition after copying the image to a USB stick on a
> > > computer running current Ubuntu [22.04] or Debian), an error is
> > > reported:
> > >
> > >  e2fsck 1.46.5 (30-Dec-2021)
> > >  /dev/sdb2 has unsupported feature(s): FEATURE_C12
> > >  e2fsck: Get a newer version of e2fsck!
> > >
> > > This has been discussed in [2] and a fix was made for use by
> > > Debian-based distros in [3]. Let's pick that version.
> > >
> > > Link: [1]
> https://gitlab.com/Linaro/trusted-reference-stack/trs/-/issues/1
> > > Link: [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1031622
> > > Link: [3]
> > >
> https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=3Ddebian/m=
aster&id=3D1181f164c48574a4813bfa203dbd7b4123154021
> > >
> > > Binary compatibility of generated ext4 file system images is importan=
t
> > > so it's better to use the "debian/master" branch.
> > >
> > > Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc                   | 2 =
+-
> > >  .../e2fsprogs/{e2fsprogs_1.47.0.bb =3D> e2fsprogs_1.47.0-2.bb}    | =
2
> +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.0.bb =3D>
> > > e2fsprogs_1.47.0-2.bb} (99%)
> > >
> > > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> > > b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> > > index f41a5d0b4e..2f54896e8c 100644
> > > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> > > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> > > @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =3D
> > > "file://NOTICE;md5=3Dd50be0580c0b0a7fbc7a4830bbe6c12b \
> > >  SECTION =3D "base"
> > >  DEPENDS =3D "util-linux attr autoconf-archive"
> > >
> > > -SRC_URI =3D "git://
> > > git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=3Dmaster"
> > > +SRC_URI =3D "git://
> > > git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=3Ddebian/master"
> > >  S =3D "${WORKDIR}/git"
> > >
> > >  inherit autotools gettext texinfo pkgconfig multilib_header
> > > update-alternatives ptest
> > > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> > > b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
> > > similarity index 99%
> > > rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> > > rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
> > > index 2620610903..9bf89ba0c4 100644
> > > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> > > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
> > > @@ -10,7 +10,7 @@ SRC_URI:append:class-native =3D " \
> > >             file://quiet-debugfs.patch \
> > >             "
> > >
> > > -SRCREV =3D "f4c9cc4bedacde8408edda3520a32d3842290112"
> > > +SRCREV =3D "1181f164c48574a4813bfa203dbd7b4123154021"
> > >  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+\.\d+(\.\d+)*)$"
> > >
> > >  EXTRA_OECONF +=3D "--libdir=3D${base_libdir} --sbindir=3D${base_sbin=
dir} \
> > > --
> > > 2.34.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#178747):
> > > https://lists.openembedded.org/g/openembedded-core/message/178747
> > > Mute This Topic: https://lists.openembedded.org/mt/97669707/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [
> > > alex.kanavin@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> > >
>

--00000000000079571105f71a2f2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri 17. Mar 2023 at 12.01, Mikko Rapeli &lt;<a href=3D"m=
ailto:mikko.rapeli@linaro.org">mikko.rapeli@linaro.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-col=
or:rgb(204,204,204)">Hi,<br>
<br>
On Fri, Mar 17, 2023 at 11:39:23AM +0100, Alexander Kanavin wrote:<br>
&gt; This doesn=E2=80=99t seem right. We should not give special privileges=
 to tooling<br>
&gt; from any particular host distro. If you need to manipulate images, bui=
ld<br>
&gt; e2fsprogs-native and run that.<br>
<br>
This is about ext4 images breaking compatibility with older versions of<br>
tooling used manipulate the images. For Debian the upstream maintainers<br>
and Debian package maintainers agreed to keep the backwards<br>
compatibility for longer time. I think that makes sense for yocto too.<br>
<br>
While I agree that using e2fsprogs-native is a solution too, I also<br>
agree that a lot of users are using non-yocto e2fsprogs when e.g.<br>
flashing images to target HW. Breaking compatibility can quite simply be<br=
>
avoided and upstream will maintain this branch. Win win from my point of<br=
>
view.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">But then we=
 should put e2fsprogs into buildtools-tarball(-extended). It=E2=80=99s not =
any different to providing compatible gcc, when one from the host distro is=
 too old.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Taking a=
 custom branch creates a maintenance problem. What if it stops being mainta=
ined? Will it follow proper upstream closely? Can we ever drop this backwar=
ds compatibility? It creates a long term headache that I do not want.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
&gt; Alex<br>
&gt; <br>
&gt; On Fri 17. Mar 2023 at 10.09, Mikko Rapeli &lt;<a href=3D"mailto:mikko=
.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt; wrote=
:<br>
&gt; <br>
&gt; &gt; From: Jerome Forissier &lt;<a href=3D"mailto:jerome.forissier@lin=
aro.org" target=3D"_blank">jerome.forissier@linaro.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; When trying to use e2fsck &lt;=3D 1.47.0 on the root filesystem (=
for example,<br>
&gt; &gt; to resize a partition after copying the image to a USB stick on a=
<br>
&gt; &gt; computer running current Ubuntu [22.04] or Debian), an error is<b=
r>
&gt; &gt; reported:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 e2fsck 1.46.5 (30-Dec-2021)<br>
&gt; &gt;=C2=A0 /dev/sdb2 has unsupported feature(s): FEATURE_C12<br>
&gt; &gt;=C2=A0 e2fsck: Get a newer version of e2fsck!<br>
&gt; &gt;<br>
&gt; &gt; This has been discussed in [2] and a fix was made for use by<br>
&gt; &gt; Debian-based distros in [3]. Let&#39;s pick that version.<br>
&gt; &gt;<br>
&gt; &gt; Link: [1] <a href=3D"https://gitlab.com/Linaro/trusted-reference-=
stack/trs/-/issues/1" rel=3D"noreferrer" target=3D"_blank">https://gitlab.c=
om/Linaro/trusted-reference-stack/trs/-/issues/1</a><br>
&gt; &gt; Link: [2] <a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cg=
i?bug=3D1031622" rel=3D"noreferrer" target=3D"_blank">https://bugs.debian.o=
rg/cgi-bin/bugreport.cgi?bug=3D1031622</a><br>
&gt; &gt; Link: [3]<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/c=
ommit/?h=3Ddebian/master&amp;id=3D1181f164c48574a4813bfa203dbd7b4123154021"=
 rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/fs/ext=
2/e2fsprogs.git/commit/?h=3Ddebian/master&amp;id=3D1181f164c48574a4813bfa20=
3dbd7b4123154021</a><br>
&gt; &gt;<br>
&gt; &gt; Binary compatibility of generated ext4 file system images is impo=
rtant<br>
&gt; &gt; so it&#39;s better to use the &quot;debian/master&quot; branch.<b=
r>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jerome Forissier &lt;<a href=3D"mailto:jerome.fori=
ssier@linaro.org" target=3D"_blank">jerome.forissier@linaro.org</a>&gt;<br>
&gt; &gt; Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@li=
naro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; &gt;=C2=A0 .../e2fsprogs/{<a href=3D"http://e2fsprogs_1.47.0.bb" rel=
=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0.bb</a> =3D&gt; <a href=
=3D"http://e2fsprogs_1.47.0-2.bb" rel=3D"noreferrer" target=3D"_blank">e2fs=
progs_1.47.0-2.bb</a>}=C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/e2fsprogs/{<a href=3D"http://e=
2fsprogs_1.47.0.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0.b=
b</a> =3D&gt;<br>
&gt; &gt; <a href=3D"http://e2fsprogs_1.47.0-2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">e2fsprogs_1.47.0-2.bb</a>} (99%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc<br>
&gt; &gt; b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc<br>
&gt; &gt; index f41a5d0b4e..2f54896e8c 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc<br>
&gt; &gt; @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &quot;file://NOTICE;md5=3Dd50be0580c0b0a7fbc7a4830bbe6c12b \<br>
&gt; &gt;=C2=A0 SECTION =3D &quot;base&quot;<br>
&gt; &gt;=C2=A0 DEPENDS =3D &quot;util-linux attr autoconf-archive&quot;<br=
>
&gt; &gt;<br>
&gt; &gt; -SRC_URI =3D &quot;git://<br>
&gt; &gt; <a href=3D"http://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;br=
anch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.kernel.org/pub/scm/=
fs/ext2/e2fsprogs.git;branch=3Dmaster</a>&quot;<br>
&gt; &gt; +SRC_URI =3D &quot;git://<br>
&gt; &gt; <a href=3D"http://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;br=
anch=3Ddebian/master" rel=3D"noreferrer" target=3D"_blank">git.kernel.org/p=
ub/scm/fs/ext2/e2fsprogs.git;branch=3Ddebian/master</a>&quot;<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit autotools gettext texinfo pkgconfig multilib_header=
<br>
&gt; &gt; update-alternatives ptest<br>
&gt; &gt; diff --git a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2=
fsprogs_1.47.0.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0.bb=
</a><br>
&gt; &gt; b/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.4=
7.0-2.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0-2.bb</a><br=
>
&gt; &gt; similarity index 99%<br>
&gt; &gt; rename from meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2f=
sprogs_1.47.0.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0.bb<=
/a><br>
&gt; &gt; rename to meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsp=
rogs_1.47.0-2.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0-2.b=
b</a><br>
&gt; &gt; index 2620610903..9bf89ba0c4 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs=
_1.47.0.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0.bb</a><br=
>
&gt; &gt; +++ b/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs=
_1.47.0-2.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.47.0-2.bb</a=
><br>
&gt; &gt; @@ -10,7 +10,7 @@ SRC_URI:append:class-native =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://quiet-debug=
fs.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRCREV =3D &quot;f4c9cc4bedacde8408edda3520a32d3842290112&quot;<=
br>
&gt; &gt; +SRCREV =3D &quot;1181f164c48574a4813bfa203dbd7b4123154021&quot;<=
br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+\.\=
d+(\.\d+)*)$&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 EXTRA_OECONF +=3D &quot;--libdir=3D${base_libdir} --sbindir=
=3D${base_sbindir} \<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#178747):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/178747" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/178747</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/976=
69707/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/97669707/1686489</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<br>
&gt; &gt; <a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div></div>

--00000000000079571105f71a2f2b--

