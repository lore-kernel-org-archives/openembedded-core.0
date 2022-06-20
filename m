Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A452C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 08:03:56 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web08.27795.1655712230733363859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 01:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nYibm/w6;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id s21so5402963lfs.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 01:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9qnq8L1fl4FbgNq6nBgWBWkbfkJF//gk39kEjBh9t6A=;
        b=nYibm/w65+/r6CUg5LLmPN0dnva2iPAJjD98PaK0LwoZ4Lyxe9m6yaJRo91oeKNPHv
         6he/bFR8tVdT4RxEBMLBsaQSaVZ546GMolaFyldTYl+YOSIicLIVd3FJ6OcKXhdjkjAw
         1DWx6T1P2ro8na///Dcapg4BOGQ3AfSAJ6K+oodu8tfAd4RYtOv/Nw2+Trl51W6Fz/6q
         qIwQBtKVVHHec5nNJHXdXcUmbqVf3kX/gCtwa9IWIy0zQKzG26EkyQBJjZkQttgl7vBl
         bzCDwpE2oqnMUgWgcBBTAFo0Bd3azKNOdXigYkPRGyiC7Vk1Cbl0qPGC6BAhugS+mcc7
         Z3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9qnq8L1fl4FbgNq6nBgWBWkbfkJF//gk39kEjBh9t6A=;
        b=M6QtXkdUxeu5fac4yR7oEPjPPFCbf+0FtwpWoNNVGkT30SzYK2gLcOTfFYx/9Z1iFm
         UrI5pMivOWU4QX49V4gom41KmmpLo527j+rz7DHO0jtB6caxMyfSDSEVdH8IiASB7Wcl
         scpL09iTxywl/QWmKpGjoSOwj4XJLfkMyy2PEZM0djhb+Y0+I0HotB+lPuiidfqX+zwZ
         0YkU7RKSau5Fh5ZdtTGofiNl3s55SKY3NqHc2W4OzDBP+MUioezY2ZHH+xC+bfWFjzGj
         /FM2adaQtGKzagBbixu3tYKTE0hCRvAZ2asKMmsh67+OpnFdZwpCkeTK2gQNEUrWo18Y
         6wcA==
X-Gm-Message-State: AJIora/x98lg5UBCGaWJLuQOvqgFU6m7G97WvCgNCWFcz5/VCVOUk/Rl
	jpKGVFzI8hPKOIrRxfv/odpGwSkb6TX7JZwjTfU=
X-Google-Smtp-Source: 
 AGRyM1uziYLI8irDS2PWgXNu/6vfOOkAFKnVCnH3514znwqVmB+Wzux/O3cXJQmRx8smPitu5HdqrBejnEGBAmfeNNs=
X-Received: by 2002:ac2:5d31:0:b0:47d:c71c:50d5 with SMTP id
 i17-20020ac25d31000000b0047dc71c50d5mr12317220lfb.665.1655712228758; Mon, 20
 Jun 2022 01:03:48 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANNYZj_gJRaGsbm-Lb=eVZqYD1u=N4Xqe0edEz6DfTunT3hRWw@mail.gmail.com>
 <E113DB50-F77E-408E-ABCA-9B320BC506E0@burtonini.com>
In-Reply-To: <E113DB50-F77E-408E-ABCA-9B320BC506E0@burtonini.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Jun 2022 10:03:38 +0200
Message-ID: 
 <CANNYZj-AtXj4-jxuN8wkr+syzxhpf8fZ4ZuK_Bi086-QNSFEhw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] python3-jsonschema: upgrading to 4.6.0 FAILED
To: Ross Burton <ross@burtonini.com>
Cc: Tim Orling <ticotimo@gmail.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 08:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167085

Thanks!

Alex

On Sun, 19 Jun 2022 at 23:29, Ross Burton <ross@burtonini.com> wrote:
>
> Patches on the list.
>
> I=E2=80=99m now debating as to whether the class should be called hatch o=
r hatchling=E2=80=A6
>
> Ross
>
> > On 18 Jun 2022, at 21:54, Alexander Kanavin <alex.kanavin@gmail.com> wr=
ote:
> >
> > =EF=BB=BFpython3-jsonschema has replaced setuptools with a "modern,
> > well-designed, legacy-free, and now well-supported packaging tool,
> > Hatch", which oe-core does not yet support:
> > https://github.com/python-jsonschema/jsonschema/commit/f61f3b7a73c14409=
178921bf4ce23050bf90560d
> >
> > Ross, I think there's been some work to enable that? Can you carry it
> > to completion?
> >
> > Alex
> >
> >> On Wed, 15 Jun 2022 at 15:05, Auto Upgrade Helper <auh@yoctoproject.or=
g> wrote:
> >>
> >> Hello,
> >>
> >> this email is a notification from the Auto Upgrade Helper
> >> that the automatic attempt to upgrade the recipe *python3-jsonschema* =
to *4.6.0* has Failed(do_compile).
> >>
> >> Detailed error information:
> >>
> >> do_compile failed
> >>
> >>
> >>
> >> Next steps:
> >>    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.5.1-4.6=
.0.patch
> >>    - check the changes to upstream patches and summarize them in the c=
ommit message,
> >>    - compile an image that contains the package
> >>    - perform some basic sanity tests
> >>    - amend the patch and sign it off: git commit -s --reset-author --a=
mend
> >>    - send it to the appropriate mailing list
> >>
> >> Alternatively, if you believe the recipe should not be upgraded at thi=
s time,
> >> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> >> automatic upgrades would no longer be attempted.
> >>
> >> Please review the attached files for further information and build/upd=
ate failures.
> >> Any problem please file a bug at https://bugzilla.yoctoproject.org/ent=
er_bug.cgi?product=3DAutomated%20Update%20Handler
> >>
> >> Regards,
> >> The Upgrade Helper
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#166956): https://lists.openembedded.org/g/openembe=
dded-core/message/166956
> >> Mute This Topic: https://lists.openembedded.org/mt/91775634/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

