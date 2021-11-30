Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396B1C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 15:58:15 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web11.77987.1638287893993968423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 07:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fWvp9X67;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id i6so42332952uae.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 07:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fWgGASLbFBCKGDIpz5sqHxp8GKLwKsp13nsmsa7lz7g=;
        b=fWvp9X67xj5xmvbI/1uvfSfiUHVs1Sqe4GxOBlRcCGWfIvRnLiMOHpLiVhXBkQwzle
         Be6hxpgCvNCzzjsdOjIkV+VscrY//zdHPXiVbynaHj7gFZ+CIfNubPnKY0h7ZbqMT5Vz
         S+0eCpKBIWOHG/zlxhDNtj8FdjjqX4WU+50iDQ+1UbdqBdujll4ZxAASUUCgJLppNc+O
         /6WMh20RMALPh7a2YOr8SaDv67qsLm13vx3ODPbIqcvihM+pN0NJcFk4mC5jHBDnPsoE
         Xp7uCFt54e7VtxMwI0hccQ/AgFV0Hwea9pX4c5IVTFIkCcri95QKCfrGyyzw/JO/CbYX
         9Qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fWgGASLbFBCKGDIpz5sqHxp8GKLwKsp13nsmsa7lz7g=;
        b=FmKsW28mn0T0q4SoPJhLiKxW96W2KD5xy9krkivR1OVIAxRv+TqKqCcpCftp3ibdnO
         /2Ap8EYPLWpI0ZkdOEsVyKvRsKoighEZfD07ovoDlIOQwTOjzWLDsRvwXgMXyHxqyPCh
         Jh7BAHhzF5+x5h84x18jYhEBW433ZJ5VYmKpjcPbcLB+x/QaQTSW/i3AtXR3p8NYnWWd
         ZUrZz+uKJc85I1exZYlE3js3WD+jeujTIp4DqUWXrSdUjTYRrq3yevni9KX9zVl5tuSR
         9Am/4pQFJqlCqClGm3Go1mUNzbyy9Wpid6Kwdyhu7W9HtyyRK1EBBGbppkslFJRAW6ZN
         xItA==
X-Gm-Message-State: AOAM530hZZCbLrP8OOee8eafsHuaug8J/RzR/SCg7SmmkgyMpYrtRKqZ
	5ColDTcgPOCXtCI1lr1BpzSLA8CzAnmYTW4yyuc=
X-Google-Smtp-Source: 
 ABdhPJxUOucm3C+FVWmWxK2GEn4bZMHjgn75vVL5T4DaVGzN1IFcf+JVmd0aPCuvG3/0M3CVvStlEQwkQFbSpKDfSC8=
X-Received: by 2002:a9f:218c:: with SMTP id 12mr145303uac.71.1638287888582;
 Tue, 30 Nov 2021 07:58:08 -0800 (PST)
MIME-Version: 1.0
References: <16B8DDF86EA1F6BB.995@lists.openembedded.org>
 <4611c03e-e581-89d5-b067-af301d9c1afc@gmail.com>
In-Reply-To: <4611c03e-e581-89d5-b067-af301d9c1afc@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Nov 2021 16:57:56 +0100
Message-ID: 
 <CANNYZj_81GJzyfh6z7ZLJrXLO_L_t2x2AtxgpxDTkUiX+2kDPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/6] Pull request (cover letter only)
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a38d8205d2039f27"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 15:58:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158979

--000000000000a38d8205d2039f27
Content-Type: text/plain; charset="UTF-8"

The patchset is now under testing:
https://git.yoctoproject.org/poky/log/?h=master-next

If there are issues, you'll hear about them, otherwise the patches will
quietly land in master :)

Alex

On Tue, 30 Nov 2021 at 09:14, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> Just pinging to check if anyone had a chance to take a look at it
>
> Thanks,
> Vyacheslav
>
> On 19.11.2021 07:15, Vyacheslav Yurkov via lists.openembedded.org wrote:
> > This is a V1 of overlayfs-etc image feature implementation, that allows
> > to setup the whole /etc under overlayfs. Please review and merge if you
> > find it OK
> >
> > The following changes since commit
> 0d15632f3db787d3f08eb260732567e62f52ffb3:
> >
> >    libtasn1: upgrade 4.17.0 -> 4.18.0 (2021-11-16 22:19:47 +0000)
> >
> > are available in the Git repository at:
> >
> >    git://github.com/UVV-gh/openembedded-core feature/overlayfs-etc
> >
> https://github.com/UVV-gh/openembedded-core/tree/feature/overlayfs-etc
> >
> > Vyacheslav Yurkov (6):
> >    overlayfs-etc: mount etc as overlayfs
> >    wic: image for overlayfs-etc tests
> >    image: add overlayfs-etc image feature
> >    oeqa/selftest: overlayfs helper function
> >    oeqa/selftest: unit tests for overlayfs-etc
> >    overlayfs: update notes on /etc
> >
> >   meta-selftest/wic/overlayfs_etc.wks.in    |   4 +
> >   meta/classes/image.bbclass                |   3 +-
> >   meta/classes/overlayfs-etc.bbclass        |  93 ++++++++++++
> >   meta/classes/overlayfs.bbclass            |   1 +
> >   meta/lib/oeqa/selftest/cases/overlayfs.py | 173 ++++++++++++++++++++--
> >   5 files changed, 257 insertions(+), 17 deletions(-)
> >   create mode 100644 meta-selftest/wic/overlayfs_etc.wks.in
> >   create mode 100644 meta/classes/overlayfs-etc.bbclass
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158972):
> https://lists.openembedded.org/g/openembedded-core/message/158972
> Mute This Topic: https://lists.openembedded.org/mt/87162486/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a38d8205d2039f27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The patchset is now under testing:</div><div><a href=
=3D"https://git.yoctoproject.org/poky/log/?h=3Dmaster-next">https://git.yoc=
toproject.org/poky/log/?h=3Dmaster-next</a></div><div><br></div><div>If the=
re are issues, you&#39;ll hear about them, otherwise the patches will quiet=
ly land in master :)</div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 30 Nov =
2021 at 09:14, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com">=
uvv.mail@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Just pinging to check if anyone had a chance to take a lo=
ok at it<br>
<br>
Thanks,<br>
Vyacheslav<br>
<br>
On 19.11.2021 07:15, Vyacheslav Yurkov via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> w=
rote:<br>
&gt; This is a V1 of overlayfs-etc image feature implementation, that allow=
s<br>
&gt; to setup the whole /etc under overlayfs. Please review and merge if yo=
u<br>
&gt; find it OK<br>
&gt;<br>
&gt; The following changes since commit 0d15632f3db787d3f08eb260732567e62f5=
2ffb3:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 libtasn1: upgrade 4.17.0 -&gt; 4.18.0 (2021-11-16 22:19:4=
7 +0000)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 git://<a href=3D"http://github.com/UVV-gh/openembedded-co=
re" rel=3D"noreferrer" target=3D"_blank">github.com/UVV-gh/openembedded-cor=
e</a> feature/overlayfs-etc<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/UVV-gh/openembedded-core/tr=
ee/feature/overlayfs-etc" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/UVV-gh/openembedded-core/tree/feature/overlayfs-etc</a><br>
&gt;<br>
&gt; Vyacheslav Yurkov (6):<br>
&gt;=C2=A0 =C2=A0 overlayfs-etc: mount etc as overlayfs<br>
&gt;=C2=A0 =C2=A0 wic: image for overlayfs-etc tests<br>
&gt;=C2=A0 =C2=A0 image: add overlayfs-etc image feature<br>
&gt;=C2=A0 =C2=A0 oeqa/selftest: overlayfs helper function<br>
&gt;=C2=A0 =C2=A0 oeqa/selftest: unit tests for overlayfs-etc<br>
&gt;=C2=A0 =C2=A0 overlayfs: update notes on /etc<br>
&gt;<br>
&gt;=C2=A0 =C2=A0meta-selftest/wic/<a href=3D"http://overlayfs_etc.wks.in" =
rel=3D"noreferrer" target=3D"_blank">overlayfs_etc.wks.in</a>=C2=A0 =C2=A0 =
|=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 =C2=A0meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0meta/classes/overlayfs-etc.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 93 ++++++++++++<br>
&gt;=C2=A0 =C2=A0meta/classes/overlayfs.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0meta/lib/oeqa/selftest/cases/overlayfs.py | 173 ++++++++++=
++++++++++--<br>
&gt;=C2=A0 =C2=A05 files changed, 257 insertions(+), 17 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-selftest/wic/<a href=3D"http://ove=
rlayfs_etc.wks.in" rel=3D"noreferrer" target=3D"_blank">overlayfs_etc.wks.i=
n</a><br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/classes/overlayfs-etc.bbclass<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158972): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158972" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158972</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87162486/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87162486/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a38d8205d2039f27--

