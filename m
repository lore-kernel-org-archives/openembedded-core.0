Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39069C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 11:48:20 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.18730.1658922495057409217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 04:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pO2BCbwR;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id r14so19517034ljp.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=diwMtEumgpAcAxihp1m6DfwX2PJcg2xsj2P+OKGgOCA=;
        b=pO2BCbwRK/hZ3/f03/riB8W62yvjj3lxKkr9GD0Ezf8wwWtiBNZTfBODRwJizW1KYa
         JSQ+2xqBXPQYNp8TI760JicwxqZopYOLRu3VPlyACER9WchCVSQ8IimGzVMRIspe6a6c
         b7vyls3sGNYUBD+4RvapxjyyjM7s3jncsuFhNVsxRcXV8BkMCmYQeXSnI3Z/dNQPxbkt
         RYsv30kU8OmQQUjJTVfobbcU7oVtcmLRLBBR1y+hTd0BxDWCqzDVHW2HluyApXY5TAHL
         DLabhLHjsuqhvht1GbIIZJbRkdWFVAlCnCWUjUQmkrSiJI3v5DsCfnXJd4QdQWh5NRRc
         uB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=diwMtEumgpAcAxihp1m6DfwX2PJcg2xsj2P+OKGgOCA=;
        b=uE0Z89AosWAOSW7sjjjDJgdEgnflrftvny9lMheqMENJgJDdfKrv2PChj7dY3e+qJg
         F76loXgenx3yQVHZ7K+a55Yl5R2t2qItyUY+16lSS6+EM3HDI5pY68OtZ2dzYNarSeSs
         xOpOBcOUMV5dBnb16liB6xBBjJ9vYZQDjwcNH5mS9f6vxS+rVDXbWe0hqlVmmvtUOldO
         obdbYOs0qLs75SjPl0DU9xHjYDIzjyOoXCHGJliljsD/IwZWX1rCLpymaH3QD3dCTaM1
         5MgKOalXxLNCpzCP1sezAbRfHeAIxJ4hIRAfDoglmVEiMnh+0BCN6Z4ZUuQVvPupQfD/
         cGuA==
X-Gm-Message-State: AJIora+WwHuWXtZ2z42Snuc5TR4OjKDtEN6B9hrGDXG6QRqtVebhXqPr
	aMl2MCVNgJ+D62qCNlK0uNeiSg2fk2UB5mVhwBk=
X-Google-Smtp-Source: 
 AGRyM1sNBX1tpnpBGWr+fqZPhRX3wJcQ/VmSx6YrHr8NA89jlYgtQFCPzrBO4k3GIid4lmtxbz9MNJgQSgfkJpMoQCI=
X-Received: by 2002:a2e:721a:0:b0:25d:eaf8:6a5b with SMTP id
 n26-20020a2e721a000000b0025deaf86a5bmr7351305ljc.257.1658922492912; Wed, 27
 Jul 2022 04:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220726211328.2122681-1-rustyhowell@gmail.com>
 <20220727125339.70e1886c@booty>
In-Reply-To: <20220727125339.70e1886c@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Jul 2022 13:48:01 +0200
Message-ID: 
 <CANNYZj-FJHUQgVb3GXWjEd6mkQE2-wkX2vUky3pJXQLdq6LPVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] debian packaging: set md5sums for conffiles
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Rusty Howell <rustyhowell@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 11:48:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168556

Also, I'm not sure I understand why this needs to be fixed with custom
code. Isn't this something that dpkg/apt take care of themselves?

Alex

On Wed, 27 Jul 2022 at 12:53, Luca Ceresoli via lists.openembedded.org
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
>
> Hello Rusty,
>
> On Tue, 26 Jul 2022 15:13:28 -0600
> "Rusty Howell" <rustyhowell@gmail.com> wrote:
>
> > Currently in an image created with debian package management, dpkg is missing the md5sums in
> > /var/lib/dpkg/status for files designated as conffiles.  They are just listed as "newconffile",
> > which is an intermediate state when dpkg installs a package with an conf file.  Also, when the
> > device first boots the script /usr/sbin/run-postinsts does not cause /var/lib/dpkg/status to update
> > those hashes either.
> >
> > The problem here is that when using a package feed, all the conf files are listed as "newconffile",
> > which will indicate to dpkg to replace them all on the first update.  dpkg will not follow the rules for
> > confold, confnew, confdef.
>
> This patch does not apply on the current master branch of oe-core.
> Maybe you wrote it on an older commit or on a branch (e.g. kirkstone)?
>
> Also we require you so sign-off the patches you send on the mailing
> list ('git commit -s' does that automatically).
>
> Best regards.
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168552): https://lists.openembedded.org/g/openembedded-core/message/168552
> Mute This Topic: https://lists.openembedded.org/mt/92637328/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

