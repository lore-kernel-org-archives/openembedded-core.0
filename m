Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FDFC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 09:32:07 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.11268.1714469524244510366
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 02:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OaCLtD/K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.42, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so6896946e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714469522; x=1715074322; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XVtJK/LlIwYr99KdJtvafSa1aUL1xtHik+tXTW0QA/8=;
        b=OaCLtD/KRqoZc5NDy0/bABK4h+ASMAvf/V0w56lOzLDApRL5nqnpHCsoLtWKeiRdlg
         RJazvD0kaaVesYjWVMLoQjheqdos3m4RSPGMwP0n5TWSmVPMnG2dmEwfMJo6XqNIzN8W
         g7t7OxylapXCm1i9cE/vbzBBihHB/1O9RZFhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714469522; x=1715074322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVtJK/LlIwYr99KdJtvafSa1aUL1xtHik+tXTW0QA/8=;
        b=X/UQE5Dn1MrYfGf+3X+C8jO9zc9L6VX0d8fi3k7zRbBaiiuBR4urGBRsAGipAKElrF
         NzCwyFoygppfM1sml39gHY7Qt6iDbw6JdDfpAce2Wdvstlm0kA+RwXP2f2f9DmYRW0rj
         Y5nWqh7JbGfUdEz3SyMPvmgfUv6q7rGJf9rhqFl3r1m/DF4wY+sDhSxn97wurxUK+mbN
         VdoepRIjBqIk3Pp5QDjyvE4UBC3YQcXJGOz2GQF0ho06o3SIJzeAh4YY426ukd28cvUe
         xeuvK0wlK5ysSvRj49aFZUWQe5CBDEs6XA6s/gqMEWSF4LFHXSUpncJPN58F6NK5ELi+
         fjGg==
X-Gm-Message-State: AOJu0YzA5Nzyb9AN7zOxNfwRkDlwnOoRhZWaxzU5Obn19UByV3CP49is
	l5Wd0we7kV8N3NOmU7nvWAdSxJFll/O7Nhs9ZsmE7tEtMkVblE6sfmM5iiYSyguWNPZZpOVMFep
	TiNIaWEG3ASVM6FqENgvlOVV3vDcHjcvdN36guw==
X-Google-Smtp-Source: AGHT+IGnF3M5w4zKqcTQqQYn06GdJ8s5spxC2l8TvR9iewYQrpZsMCb3pL9u10QG1ll928T2GRrESQupjAHS+6tO8Tk=
X-Received: by 2002:a05:6512:210d:b0:51b:518e:5679 with SMTP id
 q13-20020a056512210d00b0051b518e5679mr6511113lfr.18.1714469522173; Tue, 30
 Apr 2024 02:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <AS1PR10MB56978EF0E9F2A135E7480AC3FD1A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56978EF0E9F2A135E7480AC3FD1A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 30 Apr 2024 02:31:50 -0700
Message-ID: <CADfgfoax3-PrvbkSnvzy7WzPofCC4zKZETmAix5BB60O566qBw@mail.gmail.com>
Subject: Re: [OE-core] Yocto-5.0 tag on master instead of scarthgap
To: peter.marko@siemens.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Lee, Chee Yang" <chee.yang.lee@intel.com>, 
	Josef Holzmayr-Khosh Amoz <jester@theyoctojester.info>
Content-Type: multipart/alternative; boundary="000000000000d90b5206174d0a5d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 09:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198757

--000000000000d90b5206174d0a5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The tags have been corrected.

Copies of openembedded-core that have the incorrect tags will need to
delete them and pull in the new ones.

git tag --delete yocto-5.0 2024-04 2024-04-scarthgap
git pull origin

On Tue, Apr 30, 2024 at 1:39=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> Looks like yocto-5.0 tag in openembedded-core repository was done on
> master instead of scarthgap branch.
>
> Tag in poky repository seems to be fine.
>
>
>
> Peter
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198756):
> https://lists.openembedded.org/g/openembedded-core/message/198756
> Mute This Topic: https://lists.openembedded.org/mt/105817337/1003190
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> mhalstead@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000d90b5206174d0a5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The tags have been corrected.=C2=A0<div><br></div><div>Cop=
ies of=C2=A0openembedded-core that have the incorrect tags will need to del=
ete them and pull in the new ones.</div><div><br></div><div>git tag --delet=
e yocto-5.0 2024-04 2024-04-scarthgap</div><div>git pull origin</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Apr 30, 2024 at 1:39=E2=80=AFAM Peter Marko via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"ma=
ilto:siemens.com@lists.openembedded.org">siemens.com@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div class=3D"msg-4916673087460137110">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-4916673087460137110WordSection1">
<p class=3D"MsoNormal">Looks like yocto-5.0 tag in openembedded-core reposi=
tory was done on master instead of scarthgap branch.<u></u><u></u></p>
<p class=3D"MsoNormal">Tag in poky repository seems to be fine.<u></u><u></=
u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Peter<u></u><u></u></p>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198756): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198756" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198756</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105817337/100=
3190" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105817337/1003190</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:mhalstead@linuxfoundation.=
org" target=3D"_blank">mhalstead@linuxfoundation.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Project<=
/div><div>Systems Operations Engineer</div></div></div>

--000000000000d90b5206174d0a5d--

