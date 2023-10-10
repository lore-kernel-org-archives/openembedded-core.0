Return-Path: <vincent.prince.fr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2D0CD6134
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:49:57 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.87543.1696931394095622841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EhXCfx71;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-691c05bc5aaso4806130b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696931393; x=1697536193; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GDgqDNyom5Zj+4p27GXnUt6JHnHQ3VuwKze5PY8YMw=;
        b=EhXCfx71VY0TYAFBReMt7zhX76Fo7/7blTLaBM/3HgIBtO9YLQjfKE2o6GMX+L5AIH
         97/b8XAPkVWlI3QTf0HubdXfPog7QTxhZQb7TgsBlgVnP9dLvbUQd2QruNK93CPNhBU9
         JRiWJ6aXWaJHpF3ow/GW/oluFTe/tgCDuMhKVCRREdgo6+XvYZvqw2XxG3aOZjrxeB05
         J7DhifbMgIglx1TNZMD6xCkqtO8SwNCEIdxkHBUACrFILHtgpeavmODfxPOwsvIGKMMT
         cE4/G5AMcfbyc8GJaymYkAA795ptTarg3vz2a//+siZwmekDG1mY0KWGyDh2SW5Lp4dR
         HsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696931393; x=1697536193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GDgqDNyom5Zj+4p27GXnUt6JHnHQ3VuwKze5PY8YMw=;
        b=DAojwaa5q1YOGhbN2kP88+t8AT2JrIrCp5ZjDtDZPQQIp1C5vTpy5fU/PzmYSrcw5W
         4CdwBGhvxqrQpEnf8ypCOFmqLeEY5titMYOuqqi7qKMDkZ/DsExVLdL3C8MB5xH9p5/l
         fv0uXtDzPXiqqhnxlD6YT9HyG8kdFs9O3mWFjBKeuZuc0LX9SOCvLe4I0qFqLBMOi/+i
         9nQKXeTQuHkDk82bsPchCsd5S4ZLoP9DObKOqScB7NjhvHVXP7y9ePYPmebCEaL+ki3b
         Kft+cCEfzI9cINP1+k4SdH0Xa8UBCwbmnhp2nyM0iKX/utb6e9wm6vaN+f1vpOlXWW/j
         r5ZA==
X-Gm-Message-State: AOJu0YzSn1+WvRCpE+osldEocJhJZtPWE3e2DnyJWIZSfT6oK8pFgPSJ
	aEALd/nT6BEAYRimg8PoroWHcMEnkXBEMioN9oQ9IGttco0=
X-Google-Smtp-Source: AGHT+IFiv3U+rdA24M93wUa+P+EWUCtKAckBwWJE1E0kgdTRg1jXYxAlhi2u/XSj0TLcIJ0ebJ3G4sfdLK1uH/v1Jk8=
X-Received: by 2002:a05:6a21:9989:b0:14c:daa9:5e22 with SMTP id
 ve9-20020a056a21998900b0014cdaa95e22mr21866500pzb.45.1696931393218; Tue, 10
 Oct 2023 02:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231006200814.178676-1-peter.marko@siemens.com>
 <CAB2nKc8_7uCz20PSnRXY+ycoP+jekwWev9PUAFwt_DcFcxtnkQ@mail.gmail.com> <AS1PR10MB569729A5E196CF9B0F44965DFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569729A5E196CF9B0F44965DFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Tue, 10 Oct 2023 11:49:42 +0200
Message-ID: <CAB2nKc_wXSA1cxNnz=MeLTYKSc-uJesM40HVPnaddKEMvo43Jg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] glibc: Update to latest on stable
 2.35 branch
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 09:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188879

Fetching on the networked machine was ok.
I managed to get rid of the problem by cleaning glibc and
cross-localedef-native downloads  and sstate-cache from both machines
gitshallow_sourceware.org.git.glibc.git_561e9da-1_release.2.35.master.tar.g=
z
gitshallow_sourceware.org.git.glibc.git_561e9da-1_release.2.35.master.tar.g=
z.done
gitshallow_sourceware.org.git.glibc.git_c84018a-1_release.2.35.master.tar.g=
z
gitshallow_sourceware.org.git.glibc.git_c84018a-1_release.2.35.master.tar.g=
z.done
git2/sourceware.org.git.glibc.git
git2/sourceware.org.git.glibc.git.done
....
 and relaunching the build, not sure what happened here, maybe
something related to
SRCREV_FORMAT // SRCREV_glibc // SRCREV_localedef variables that does
not trigger cache/download recomputing?


Le lun. 9 oct. 2023 =C3=A0 23:08, Marko, Peter <Peter.Marko@siemens.com> a =
=C3=A9crit :
>
> -----Original Message-----
> From: Vincent Prince <vincent.prince.fr@gmail.com>
> Sent: Monday, October 9, 2023 21:09
> To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][kirkstone][PATCH] glibc: Update to latest on stabl=
e 2.35 branch
>
> > Hello,
> >
> > I have a small question concerning glibc source handling.
> >
> > I have a machine connected to the Internet that runs
> > bitbake -k -f --runall=3Dfetch universe
> > and another offline machine that uses the previous fetch as a source mi=
rror.
> > When I bitbake my image, it fails to use this with
> >
> > ERROR: cross-localedef-native-2.35-r0 do_fetch: Bitbake Fetcher Error:
> > NetworkAccess('git://sourceware.org/git/glibc.git;branch=3Drelease/2.35=
/master;name=3Dglibc',
> > 'LANG=3DC git -c core.fsyncobjectfiles=3D0 -c gc.autoDetach=3Dfalse -c
> > core.pager=3Dcat fetch -f --progress git://sourceware.org/git/glibc.git
> > refs/heads/*:refs/heads/* refs/tags/*:refs/tags/*')
> > It seems git archives seem corrupted?
> >
> > Do you know what could be causing this?
> > Best regards,
> > Vincent
>
> Fetch works for me and since it was merged also on autobuilder.
> What I can imagine is that your fetch on networked machine failed (e.g. d=
ue to temporary network problem).
> Did you check log on the networked machine?
>
> Peter
>
> >
> > Le ven. 6 oct. 2023 =C3=A0 22:10, Peter Marko via lists.openembedded.or=
g
> > <peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :
> > >
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > Adresses CVE-2023-4911.
> > >
> > > Single commit bump:
> > > * c84018a05ae tunables: Terminate if end of input is reached (CVE-202=
3-4911)
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  meta/recipes-core/glibc/glibc-version.inc | 2 +-
> > >  meta/recipes-core/glibc/glibc_2.35.bb     | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes=
-core/glibc/glibc-version.inc
> > > index c23a43576c..e0d47f283b 100644
> > > --- a/meta/recipes-core/glibc/glibc-version.inc
> > > +++ b/meta/recipes-core/glibc/glibc-version.inc
> > > @@ -1,6 +1,6 @@
> > >  SRCBRANCH ?=3D "release/2.35/master"
> > >  PV =3D "2.35"
> > > -SRCREV_glibc ?=3D "73d4ce728a59deb2fd18969e559769b3f590fac9"
> > > +SRCREV_glibc ?=3D "c84018a05aec80f5ee6f682db0da1130b0196aef"
> > >  SRCREV_localedef ?=3D "794da69788cbf9bf57b59a852f9f11307663fa87"
> > >
> > >  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
> > > diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-cor=
e/glibc/glibc_2.35.bb
> > > index b4bad5b7ac..271520f76b 100644
> > > --- a/meta/recipes-core/glibc/glibc_2.35.bb
> > > +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> > > @@ -17,7 +17,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2019-1010022 CVE-2019-10=
10023 CVE-2019-1010024"
> > >  CVE_CHECK_IGNORE +=3D "CVE-2019-1010025"
> > >
> > >  # To avoid these in cve-check reports since the recipe version did n=
ot change
> > > -CVE_CHECK_IGNORE +=3D "CVE-2023-4813 CVE-2023-4806 CVE-2023-5156"
> > > +CVE_CHECK_IGNORE +=3D "CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE=
-2023-5156"
> > >
> > >  DEPENDS +=3D "gperf-native bison-native"
> > >
> > > --
> > > 2.30.2
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#188784): https://lists.openembedded.org/g/openemb=
edded-core/message/188784
> > > Mute This Topic: https://lists.openembedded.org/mt/101805676/3616779
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [vincent.prince.fr@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

