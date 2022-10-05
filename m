Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D5AC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 03:30:22 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.19826.1664940618951484705
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 20:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mJGQv667;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id m15so21269719edb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 20:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TZYyyWr2U2SOx++XsbfGXF+el2IvqZHoSysP6iPh+Eo=;
        b=mJGQv667LQWrHQrrBWt8cragdxWDvSDBIBoK75RzmdASWRjvRVWgYrgym+UwoItjej
         Y9vYuCUAY8SlmPpN8neuBq/km60wqXwoY6Z1RaSmyomDvNpF1eYUsPTcudC5Wu58UtbS
         Vq8VjrLXIQJOjGczHalQVON5jXNyNS8GF91Tt5lpWMdqoGnyqgwZhhoJ8kLxYtYYuajl
         hvNQvAtKv6XzADZRMBhHqatzRhQdMA7ri1z2hfn4qnv3uQLbLfntOJsNCDEdKiSdSNbt
         lwkC7gnwokdLbDZ1NphrOCWtG5ifuBdEOn8X1ickL76Vu2FOxpe7wTb+zP1LdN7tfYn3
         onqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZYyyWr2U2SOx++XsbfGXF+el2IvqZHoSysP6iPh+Eo=;
        b=jH1/+NNXOXq8u76iR6WghlIHvWNvCN0+Bc79MJ8H2tsxBveZdzb70KSw0OHRA8Y442
         mUb+H2BUriMP8oXqttCJEkLyCwwrGHrO7Y8tXi/2MBAq/SyrMCX8+LspcTtyMGHJ0/pg
         cqNiJgtlWWjlo1eYTVTEeP6P0qGCMn00i1yv2w1pkLfjK1vZ99lNoBRWn4IQGzOY06jG
         E9KNJIZllYeAI5Kul1CgSz/rBmUA1S2M1np1uuoU7WWSzmpEiGnkJ4obKY10eDCmaXNj
         ZA4ctXlcfiSAglfxLvBF+atPn87TfDvdty1dXjNhuDZybNGE1N6wmXWCHe4yxYbeSGPi
         dxxA==
X-Gm-Message-State: ACrzQf1v5PkN3mBhJMfJMLnPDi3GnMCPG30bmdia5ceZHbZ3naHZ3UTq
	tTXyJifPhHBs/LdsOkbF+64fEmpgDEq8gl301AQ=
X-Google-Smtp-Source: 
 AMsMyM4ztBdBLOprz7NmNeFd6cChmVUFRDuURoqP4/P36PMGLAScmUZLib7XQVnkk7Q97pN5W7fiuKXlebvsGqODkU8=
X-Received: by 2002:a05:6402:1b08:b0:458:d229:bcac with SMTP id
 by8-20020a0564021b0800b00458d229bcacmr14706336edb.118.1664940616842; Tue, 04
 Oct 2022 20:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664911788.git.steve@sakoman.com>
In-Reply-To: <cover.1664911788.git.steve@sakoman.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 4 Oct 2022 20:30:05 -0700
Message-ID: 
 <CANx9H-C5w-JoVEWPbsYDTmoXegaz60eKnmEdHiLwL1jFJiwJCQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 0/2] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000a055e05ea41328f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 03:30:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171439

--0000000000000a055e05ea41328f
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 4, 2022 at 12:31 PM Steve Sakoman <steve@sakoman.com> wrote:

> This should be the final pull request for the upcoming 3.1.20 build.
>
> The following changes since commit
> 7a08f2ae1c12e3511b409c4535d2eab83a27b64a:
>
>   create-pull-request: don't switch the git remote protocol to git://
> (2022-09-29 06:45:30 -1000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/dunfell-next
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
>
> Mathieu Dubois-Briand (1):
>   bind: Fix CVEs 2022-2795, 2022-38177, 2022-38178
>
> Paul Barker (1):
>   licenses: Handle newer SPDX license names
>

Thank you. Carrying these in a couple layers.


>  meta/conf/licenses.conf                       |  7 ++
>  .../bind/bind/CVE-2022-2795.patch             | 67 +++++++++++++++++++
>  .../bind/bind/CVE-2022-38177.patch            | 31 +++++++++
>  .../bind/bind/CVE-2022-38178.patch            | 33 +++++++++
>  .../recipes-connectivity/bind/bind_9.11.37.bb |  3 +
>  5 files changed, 141 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-2795.patch
>  create mode 100644
> meta/recipes-connectivity/bind/bind/CVE-2022-38177.patch
>  create mode 100644
> meta/recipes-connectivity/bind/bind/CVE-2022-38178.patch
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171432):
> https://lists.openembedded.org/g/openembedded-core/message/171432
> Mute This Topic: https://lists.openembedded.org/mt/94121478/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000000a055e05ea41328f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 4, 2022 at 12:31 PM Steve Sakoman &lt;<a href=
=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">This should be the final pull request for the u=
pcoming 3.1.20 build.<br>
<br>
The following changes since commit 7a08f2ae1c12e3511b409c4535d2eab83a27b64a=
:<br>
<br>
=C2=A0 create-pull-request: don&#39;t switch the git remote protocol to git=
:// (2022-09-29 06:45:30 -1000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/dunfell-next<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/dunfell-next" rel=3D"noreferrer" target=3D"_blank">http://cgi=
t.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/dunfell-next</=
a><br>
<br>
Mathieu Dubois-Briand (1):<br>
=C2=A0 bind: Fix CVEs 2022-2795, 2022-38177, 2022-38178<br>
<br>
Paul Barker (1):<br>
=C2=A0 licenses: Handle newer SPDX license names<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you. Carry=
ing these in a couple layers.</div><div dir=3D"auto"><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><br>
=C2=A0meta/conf/licenses.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++<br>
=C2=A0.../bind/bind/CVE-2022-2795.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 67 +++++++++++++++++++<br>
=C2=A0.../bind/bind/CVE-2022-38177.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 31 +++++++++<br>
=C2=A0.../bind/bind/CVE-2022-38178.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 33 +++++++++<br>
=C2=A0.../recipes-connectivity/bind/<a href=3D"http://bind_9.11.37.bb" rel=
=3D"noreferrer" target=3D"_blank">bind_9.11.37.bb</a> |=C2=A0 3 +<br>
=C2=A05 files changed, 141 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-2795.=
patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-38177=
.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2022-38178=
.patch<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171432): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171432" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171432</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94121478/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94121478/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000a055e05ea41328f--

