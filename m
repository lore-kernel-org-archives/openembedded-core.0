Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032B8C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 08:53:40 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web11.7844.1644483218673703402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 00:53:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eOFX8Awc;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id d22so2666703uaw.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 00:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hr7D1H7scdZYiGUVSW892LhX4+yQMIymUhHKxrloyc4=;
        b=eOFX8AwcZ/YtNLMq4M7LXqtJolOm/fvcKpPW9+I3C/W9nYSQrHAAaggaygtkx/ZLfl
         lg/Bdv0d7DRMM8OynupEuSBzeFHA76Umm015PSipARfNw84AoiGiJj9hURCMBsxf7V70
         SzcHtE6Tpzl5su9nAziuI4+zlDIbYy5StcwtPpBytf6jy7+EMsRAGneqOI4DuNxpP/wz
         ajHOeJU3jggyErRy6uj2uLir0cckPW5MPA5GqG9MFzK+XS+yoAyKJwBtcvyJKp71K61W
         novttBvSSJAvQook6uiVEkSqVFN3edP8+NDpEISWG4LTmNzf6SIkjjqb9KoRUX/Udju7
         PI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hr7D1H7scdZYiGUVSW892LhX4+yQMIymUhHKxrloyc4=;
        b=wcmoEZZSIpIOY0oUqhglsWo4msEUlWklj+TYMVlciv4MLbQOSZEgCNojhWM3dlBG7U
         1GQdpjZFSmxRufVnzgd2RKPeEJ0fXr2f8nAbkgNWjpiCX9Qy4n/IanrzY6rHAMgowtzA
         PfzBqsKRid2cSbOtOiw/kcnVv2WS3ZI/2jsdhz6NCYUFai+MLrCrUMjoIjnVIhqCyE6c
         nAXPtkK+di9tuqnb0Uy4oC06lv41AuH+OKSea0fjBrw0Qa7xtreYfX+tmkCbcWiH7SvV
         yVjwWvWdmwVb+rYCszs8vh5F+KVqFOl7Sx2je8354nIFzwBtAyUH8AEF8VzEMTqswdVx
         ulOQ==
X-Gm-Message-State: AOAM532bPzOzmUppgzsdV4kmfFd8kKk+G4+dMy6fkoBxUyGybfeIa31h
	ldxrOf1EYdQkl6+m+oM2NdBQf61srjO+gjz7fsE=
X-Google-Smtp-Source: 
 ABdhPJw6yLUSTLAj5J5QS+JFwfLlHBu2H958oDlrqlHaFWGm27tDeu5+C43InXUEsaCIpkveFRx3vbj9G78YlZX2M88=
X-Received: by 2002:ab0:1d03:: with SMTP id j3mr2276635uak.100.1644483217410;
 Thu, 10 Feb 2022 00:53:37 -0800 (PST)
MIME-Version: 1.0
References: <1644308725-5262-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj8X+Ryn4Jo5U=j=FcAjfff8o-J+TqZpr3HdGSA40amRVA@mail.gmail.com>
 <OSBPR01MB18458CD72151816CE89F4962DC2F9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB18458CD72151816CE89F4962DC2F9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Feb 2022 09:53:26 +0100
Message-ID: 
 <CANNYZj8RdXuJ1nreTZxOC_dZdbfO6xibW7CzO5Zkq98F5cC_xQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ed: upgrade 1.17 -> 1.18
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 08:53:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161602

Thanks for the research. Yes, please do add this to commit and resend.

Alex

On Thu, 10 Feb 2022 at 02:07, wangmy@fujitsu.com <wangmy@fujitsu.com> wrote=
:
>
> As you can see the ChangeLog shown below, in version 1.5 the maintainer m=
istakenly changed the copyright holder from Andrew Moore to the FSF. In ver=
sions 1.6 and 1.11 he tried to fix the mistake, but he forgot to restore th=
e original COPYING, which he have done now in 1.18.
>
> Therefore, in addition to changing the LICENSE field from GPLv3 + to GPLv=
2 , should I add relevant information in the commit?
>
> 2010-08-30  Antonio Diaz Diaz  <ant_diaz@teleline.es>
>         * Version 1.5 released.
>         * Change copyright holder from Andrew, Antonio to the FSF.
>           (This change was later discovered to be wrong. See 1.6 and 1.11=
).
>
> 2012-01-01  Antonio Diaz Diaz  <ant_diaz@teleline.es>
>
>         * Version 1.6 released.
>         * Restore copyright notices of Andrew L. Moore. It seems Andrew
>           granted some permissions but never assigned copyright to the FS=
F.
>
> 2015-03-30  Antonio Diaz Diaz  <antonio@gnu.org>
>
>         * Version 1.11 released.
>         * Restore original copyright and license notices in the code. I
>           assigned to the FSF the copyright on changes made to the part o=
f ed
>           already copyrighted by the FSF, which seems to be just the manu=
al.
>
> 2022-02-04  Antonio Diaz Diaz  <antonio@gnu.org>
>         * Version 1.18 released.
>         * COPYING: Restored. (I forgot to do it in 1.11).
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Tuesday, February 8, 2022 6:25 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: OE-core <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] ed: upgrade 1.17 -> 1.18
> >
> > On Tue, 8 Feb 2022 at 09:26, wangmy <wangmy@fujitsu.com> wrote:
> >
> > > License-Update:
> > > year updated to 2022.
> > > license changed from GNU3 to GNU2.
> > >  LICENSE =3D "GPLv3+"
> > > -LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D0c7051aef9219dc7237f206c5c4179a7 \
> > > -
> > file://ed.h;endline=3D20;md5=3Db72aa5eaafef318c6bfc37f858469113 \
> > > -
> > file://main.c;endline=3D17;md5=3D2c93e24f4db3528a00a24c7df5618e41 \
> > > +LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D76d6e300ffd8fb9d18bd9b136a9bba13 \
> > > +
> > file://ed.h;endline=3D20;md5=3D6e6a818b0593f937fc63ba08d5e314bf \
> > > +
> > > +file://main.c;endline=3D17;md5=3D8419a08bb12936f32384a0d1c0f9e74c \
> >
> >
> > If the license changed, you need to update the LICENSE field. Also a bi=
t
> > more research would be appreciated: can you find and link the commit
> > where the change occurred?
> >
> > Alex

