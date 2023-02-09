Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A50C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 18:15:19 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.24317.1675966512645780278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 10:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FN+ZaAhj;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-15ff0a1f735so3647648fac.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDGcPKo/V+w/zNl9VgoBoYLjaSQP7XgOyHZVbdILs+U=;
        b=FN+ZaAhjs/1iqAkXrSxlhEjx82Kc6M7MhK2AGuy1HWc35obj9Yfhv671Fsp71fsvUK
         azDa0eB//ipivy0x9cdXCYTN5W+vw8qrd5jkiA6ZyxrxjVQLgKPjyNJ//C2zchGUSsm7
         XxVg5T9IpSaVFKswnlXvBKjXiTSoaMipbUtYv2h19GbfMccz+lEp/kt5TvohOK88CQlV
         FZymC6M/PLM07kY5gAiyeTa51b9smt7YQ1vPv+Xngh/W3NStvFViOXURDhHqAYouAlDy
         K4WVpQPwgabRKNJIPqst4YRT50ik5B1BlzgEXV9T5fesEWpfP9ELDPKnYzjgho/b5ugb
         5b/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDGcPKo/V+w/zNl9VgoBoYLjaSQP7XgOyHZVbdILs+U=;
        b=UDitrmtf1YQlUl28oDspcIWzxctEv3Lmy8gL0kH8Tzq2uC8vy93gHQEXXaETpE3ocU
         Lr6VhtkS2nMOXVXjeZVJwBWB+IgXs6/wQbtfHFi0UeFUUSfabFsTKYtWSy/R20bYy0vx
         HHs6v5/r8mxO9zoeDfhf0AuuiiHKqK3dA9jdHu9yvzujEXThIjF27KvporLx6DniMYLe
         FNaJ/clHBxfaTFeCfdH8w30VBmw4l2So/4/CdpqlCnTVaThPtGqjPQDsSiZSO59NLbYR
         xDQdWo+wTSG9LjjpxycVfrWfzgwAUninxUfEHxUFtUYoj5iFJCB9Ckyt5f+T2MCf0IBn
         ZUJA==
X-Gm-Message-State: AO0yUKUcYecoDE1Eo1giq7BoEFQZZqhwgLWVLY123jhSnIlFLzKg4h3Q
	rk92RTmXZD3XB58Xun4AY768jSynKFkMBxGvVD4=
X-Google-Smtp-Source: AK7set9VV/dGItqfVZe9DEPjVMxUpmr2p3o4lGZrUiAdh5fg4CPq+obEHBj0A7VV+aJNxNKr+pfBEnh2Z+GDR89ecKU=
X-Received: by 2002:a05:6870:430a:b0:163:b85e:f1ca with SMTP id
 w10-20020a056870430a00b00163b85ef1camr1161743oah.262.1675966511797; Thu, 09
 Feb 2023 10:15:11 -0800 (PST)
MIME-Version: 1.0
References: <2E74248C-B3ED-4923-8731-DB10E38313F1@arm.com>
In-Reply-To: <2E74248C-B3ED-4923-8731-DB10E38313F1@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Feb 2023 10:14:45 -0800
Message-ID: <CAMKF1sq0NQYXkje-hcA6sTciMYUKC8VosJtUvP4kUn5LfX3ZoQ@mail.gmail.com>
Subject: Re: [OE-core] DNF5
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 18:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176965

Is there some reading material for quick highlights of dnf5 and its future =
?

On Thu, Feb 9, 2023 at 4:05 AM Ross Burton <ross.burton@arm.com> wrote:
>
> Hi,
>
> At FOSDEM there were was a session about DNF 5 and someone (sorry if you=
=E2=80=99re reading this, I can=E2=80=99t remember your name) came to the s=
tand to ask if we=E2=80=99ve looked at it.  I was aware of a DNF replacemen=
t but wasn=E2=80=99t aware that it had actually started making releases.
>
> I=E2=80=99ve just pushed a branch to poky-contrib:ross/dnf5 which adds re=
cipes for DNF5 and any new dependencies (it also needs meta-oe right now, a=
s some dependencies are there).  It builds a dnf-native, but the blocker is=
 that it doesn=E2=80=99t yet implement =E2=80=94repofrompath to add a repos=
itory without a corresponding configuration file, which is what we use at r=
ootfs time.  We can probably work around that by writing a temporary repo f=
ile, or just implement the feature upstream.
>
> If anyone is interested in helping the port to DNF5 then your help would =
be appreciated!
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176949): https://lists.openembedded.org/g/openembedde=
d-core/message/176949
> Mute This Topic: https://lists.openembedded.org/mt/96851390/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

