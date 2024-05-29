Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521A0C27C43
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 10:51:09 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.10879.1716979860472315947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 03:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=fl7b/c+z;
 spf=pass (domain: snapchat.com, ip: 209.85.218.46, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59a352bbd9so124991766b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1716979859; x=1717584659; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mDDhDf8OiUWkQ14UHlTjXXsIExc8vNqRk36o2xOn+vE=;
        b=fl7b/c+zICAX+KQPsO99hKhNNAsHw9OikiU4cR18q1Xn0yIKIWCL8S5M6xIQXyzyh5
         Tiaci3oeYQNJmoDujHnP+JgAWAy83+OlPFhrQk4RCzDzAigR7RSz1hV4WZLREHLGERkv
         NxnN7McoXUFT7YOWuAMbuM0EuXnC/sdA/kHt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716979859; x=1717584659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDDhDf8OiUWkQ14UHlTjXXsIExc8vNqRk36o2xOn+vE=;
        b=v6GiHzLUMxXzAgdXzXE0CHNS+nw02A5hbCSl9xoXag4HZXJLOjEvjwvtvSuV5faHb4
         3LKCPkz2FLjWnDFnWmVmN0tBATBBaYIRQdUg9JYUH+vq+FphVcODeQBAd4M1gIkS0or8
         v4MRmIwJCnofrg8qf2jNZGftwv3Cuu9h9UNgNbPjB+ZeHulBHo7eOjzTjSbkIXktzdla
         CuYYPvGqZ1FRWQbOCvNwMocDkbEiA2JeiutyHaocHP2kFviNpN3irSU5D/2b6KMXgpUO
         YqBn6cQHECkXyxbB6qv5+PY0Uy+erDr2C20f5jeyxXJt2XfD1icOUu+31t0qcZoraeBW
         NlOg==
X-Gm-Message-State: AOJu0YxgNxQqiCH6M97FmadhwS4DBk/iZlb6C6E96s8Gvxkd1QfGdDkQ
	RJyavenmHJu3ybIsicah5NxuHbFcbcSa0Xu1AU++t7tpc9qAJEGGMi3/nB5FYVrxLxpIy128Hf5
	N0s1qISsDwXc/Bhlz6DoXGW/tm+QDhCoiCqnkWw==
X-Google-Smtp-Source: AGHT+IF0axY+dYyorlcW62SH9HOMvReUVvRSVnFMhCHnS1Mz3ahg8ZM9IFKB+w1gzxptwVOaWDZGgUTsu4szrhZjOBw=
X-Received: by 2002:a17:906:7b86:b0:a59:aa7a:3b16 with SMTP id
 a640c23a62f3a-a642d2787b8mr161900166b.4.1716979858758; Wed, 29 May 2024
 03:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231205133754.906479-1-ecordonnier@snap.com> <db4abfaf9dfeead32dd8fbf1f620d9ebe4e128d2.camel@linuxfoundation.org>
In-Reply-To: <db4abfaf9dfeead32dd8fbf1f620d9ebe4e128d2.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Wed, 29 May 2024 12:50:47 +0200
Message-ID: <CAHUKmYZCQ+daHJ9uwV=ZN0jLW7PqniNU2XKcBBWVJ8j0=01Jmw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] gdb/systemd: enable minidebuginfo support conditionally
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000091833c061995864c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 10:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200002

--00000000000091833c061995864c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
I had missed your reply. I have changed my email filters so hopefully this
won't happen again (still learning how to work with mailing-lists). I sent
another patch fixing a regression in the test:
https://lists.openembedded.org/g/openembedded-core/message/199999
I tested core-image-sato locally today and it is working with this
configuration as far as I can tell:
DISTRO=3D"poky-altcfg"
DISTRO_FEATURES +=3D "minidebuginfo x11"
TEST_SUITES +=3D "ping ssh systemd"
IMAGE_CLASSES +=3D "testimage"
MACHINE ?=3D "qemux86-64"

https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D9c069e00a0867de11a6069b99a07d2c775848c10
is not a valid link any more, so I'm not sure which constraint you had to
put to the test.

=C3=89tienne


On Fri, Dec 8, 2023 at 12:26=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2023-12-05 at 14:37 +0100, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > Enabling minidebuginfo is not useful if gdb and systemd-coredump
> > are unable to parse it.
> >
> > In order to parse it, gdb needs xz support. Systemd needs coredump
> enabled, as
> > well as elfutil enabled as well (systemd-coredump loads libdw which is
> part of elfutils using dlopen).
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >  meta/classes-global/package.bbclass           |  2 +-
> >  meta/lib/oe/package.py                        |  2 +-
> >  meta/lib/oeqa/runtime/cases/systemd.py        | 21 +++++++++++++++++++
> >  meta/lib/oeqa/selftest/cases/minidebuginfo.py |  2 +-
> >  meta/recipes-core/systemd/systemd_254.4.bb    |  1 +
> >  .../elfutils/elfutils_0.189.bb                |  4 +++-
> >  meta/recipes-devtools/gdb/gdb-common.inc      |  4 +++-
> >  7 files changed, 31 insertions(+), 5 deletions(-)
>
> I merged this as I think it did improve things but adding a test change
> to poky to enable it hasn't quite worked as I hoped.
>
> I had to put a constraint around the test to ensure it only runs on
> systemd images:
>
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openembedded.o=
rg_openembedded-2Dcore_commit_-3Fh-3Dmaster-2Dnext-26id-3D9c069e00a0867de11=
a6069b99a07d2c775848c10&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2e=
pckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DFLdd1vErz4ATg4R=
dnhSX_x1xlDw9KDG-Y9q-SbugHHxHuJmnUZaKuZxRFKFzAB_D&s=3DTtR0nmCl-7A-ZW0pyAbOZ=
deTP1CvFHG88dRcF_5szJQ&e=3D
>
> and with that applied I then had this failure:
>
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__autobuilder.yoctop=
roject.org_typhoon_-23_builders_101_builds_7000_steps_14_logs_stdio&d=3DDwI=
FaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&m=3DFLdd1vErz4ATg4RdnhSX_x1xlDw9KDG-Y9q-SbugHHxHuJ=
mnUZaKuZxRFKFzAB_D&s=3Dyt0et2kFgyojvWvRCXU6ieXQ5tQNyWXUV-WEVS2rJkc&e=3D
>
> I can queue the first patch but I'm not sure about the failure above.
> Any ideas?
>
> Cheers,
>
> Richard
>

--00000000000091833c061995864c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br>I had missed your reply. I have changed my =
email filters so hopefully this won&#39;t happen again (still learning how =
to work with mailing-lists). I sent another patch fixing a regression in th=
e test:=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-core/=
message/199999">https://lists.openembedded.org/g/openembedded-core/message/=
199999</a><br>I tested core-image-sato locally today and it is working with=
=C2=A0this configuration as far as I can tell:<br>DISTRO=3D&quot;poky-altcf=
g&quot;<br>DISTRO_FEATURES +=3D &quot;minidebuginfo x11&quot;<br>TEST_SUITE=
S +=3D &quot;ping ssh systemd&quot;<br>IMAGE_CLASSES +=3D &quot;testimage&q=
uot;<br>MACHINE ?=3D &quot;qemux86-64&quot;<br><br><a href=3D"https://git.o=
penembedded.org/openembedded-core/commit/?h=3Dmaster-next&amp;id=3D9c069e00=
a0867de11a6069b99a07d2c775848c10">https://git.openembedded.org/openembedded=
-core/commit/?h=3Dmaster-next&amp;id=3D9c069e00a0867de11a6069b99a07d2c77584=
8c10</a> is not a valid link any more, so I&#39;m not sure which constraint=
 you had to put to the test.<br><br>=C3=89tienne<br><br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 8, 2023=
 at 12:26=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2023-12-05 at =
14:37 +0100, Etienne Cordonnier via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; <br>
&gt; Enabling minidebuginfo is not useful if gdb and systemd-coredump<br>
&gt; are unable to parse it.<br>
&gt; <br>
&gt; In order to parse it, gdb needs xz support. Systemd needs coredump ena=
bled, as<br>
&gt; well as elfutil enabled as well (systemd-coredump loads libdw which is=
 part of elfutils using dlopen).<br>
&gt; <br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-global/package.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 meta/lib/oe/package.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 meta/lib/oeqa/runtime/cases/systemd.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 21 +++++++++++++++++++<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/minidebuginfo.py |=C2=A0 2 +-<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt;=C2=A0 .../elfutils/<a href=3D"http://elfutils_0.189.bb" rel=3D"norefer=
rer" target=3D"_blank">elfutils_0.189.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
&gt;=C2=A0 meta/recipes-devtools/gdb/gdb-common.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 +++-<br>
&gt;=C2=A0 7 files changed, 31 insertions(+), 5 deletions(-)<br>
<br>
I merged this as I think it did improve things but adding a test change<br>
to poky to enable it hasn&#39;t quite worked as I hoped.<br>
<br>
I had to put a constraint around the test to ensure it only runs on<br>
systemd images:<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.opene=
mbedded.org_openembedded-2Dcore_commit_-3Fh-3Dmaster-2Dnext-26id-3D9c069e00=
a0867de11a6069b99a07d2c775848c10&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hp=
F_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67=
E&amp;m=3DFLdd1vErz4ATg4RdnhSX_x1xlDw9KDG-Y9q-SbugHHxHuJmnUZaKuZxRFKFzAB_D&=
amp;s=3DTtR0nmCl-7A-ZW0pyAbOZdeTP1CvFHG88dRcF_5szJQ&amp;e=3D" rel=3D"norefe=
rrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__git.openembedded.org_openembedded-2Dcore_commit_-3Fh-3Dmaster-2Dnext-26=
id-3D9c069e00a0867de11a6069b99a07d2c775848c10&amp;d=3DDwIFaQ&amp;c=3DncDTmp=
hkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DUL=
JTKUkSGa66m67E&amp;m=3DFLdd1vErz4ATg4RdnhSX_x1xlDw9KDG-Y9q-SbugHHxHuJmnUZaK=
uZxRFKFzAB_D&amp;s=3DTtR0nmCl-7A-ZW0pyAbOZdeTP1CvFHG88dRcF_5szJQ&amp;e=3D</=
a> <br>
<br>
and with that applied I then had this failure:<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__autobuild=
er.yoctoproject.org_typhoon_-23_builders_101_builds_7000_steps_14_logs_stdi=
o&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DFLdd1vErz4ATg4RdnhSX=
_x1xlDw9KDG-Y9q-SbugHHxHuJmnUZaKuZxRFKFzAB_D&amp;s=3Dyt0et2kFgyojvWvRCXU6ie=
XQ5tQNyWXUV-WEVS2rJkc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__autobuilder.yoctoproject.o=
rg_typhoon_-23_builders_101_builds_7000_steps_14_logs_stdio&amp;d=3DDwIFaQ&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DFLdd1vErz4ATg4RdnhSX_x1xlDw9KDG-Y9q-Sb=
ugHHxHuJmnUZaKuZxRFKFzAB_D&amp;s=3Dyt0et2kFgyojvWvRCXU6ieXQ5tQNyWXUV-WEVS2r=
Jkc&amp;e=3D</a> <br>
<br>
I can queue the first patch but I&#39;m not sure about the failure above.<b=
r>
Any ideas?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--00000000000091833c061995864c--

