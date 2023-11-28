Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E86C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:10:37 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.5805.1701209430791826883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YdhW8l2N;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a00d5b0ec44so838446866b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701209429; x=1701814229; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPb9xNfEt57biyoGoqrBMhHFk7lBqORN5uJ9dQdqVgo=;
        b=YdhW8l2N01w+8GlPpeJYyFTak3StDGxErUaIvdiKGQDVqbzjtkq/G2vEePQHKpo1Oc
         J4En/YjHva8pvDXcpbXlTGWWqTkcKFF6saxSVPcVhy6PWXMOlQ5UWVuywEUCDSImRrAN
         r2/ipAkmbmcd9LEuSVwmal0t5njKmKfWgeX0602nFIgaudKKhtVCMAGp02WOVV9bTBhg
         Bv7h1L1TGP7zP35t0CGka0ZZaCgs8tzvrI8ybE4/dByK7oTV5o6sS6pp1GpkD/lnpYig
         7LmnAMPI8i5yPk0x5akhgSQO6e2qHFerswNlPBUiMa29OhFKkBhKmUHUYf1G6U3HCXja
         rOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701209429; x=1701814229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPb9xNfEt57biyoGoqrBMhHFk7lBqORN5uJ9dQdqVgo=;
        b=dQFoh5ChzYlSys5Aa6a2LxA7nJYSUwHqZMbBjC6ObU2ScdOQ/6XHOfOhLbHWpGp7bO
         OcvvJDAXHcfylsRTKlHEfbxoCjChqBuSviyx9fWVuX7P8LU0BnWWbLQ8Wcl5sj+xhyzV
         szIhOlc36dlQe9BCaD2rqIRRfmjRSsvR5jS1XEszODsXssfrqdnK9+LFlX2sqWbnTUAx
         dvFt0fUAVus9IdRBNbHVXV4XvJ/GbXOr9tzlAnnSgUW0echq5iZ+K9xtCstLraCmj0AK
         /GwvZCL98pdm/pxnxKYaP+ujgHeiRbwILgqFDIMUQPsWCV9pDmhkT+SVq3Yy8A9Ea6DJ
         e2xQ==
X-Gm-Message-State: AOJu0YywF7EvgHnEcCJoLHKdyhgW4/NBcuVpNJWCon+xvPPV2L+BZ1Xz
	WxQPPpD0YcIWCbYuSuNokLK6yIPkFQo/yXVI6JlMjQ==
X-Google-Smtp-Source: AGHT+IHcVUiWj7ggIJskL8EvGvpH7TDri972j3Ivii5zGU1UTiaOfP7H6XNs8IrHBXExm4L0YZt+VZVAbyl9bPGVUBU=
X-Received: by 2002:a17:906:74d1:b0:a02:9174:629f with SMTP id
 z17-20020a17090674d100b00a029174629fmr10336794ejl.55.1701209428955; Tue, 28
 Nov 2023 14:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20230330060328.8654-1-badganchipv@gmail.com> <9575.1701068157617019984@lists.openembedded.org>
In-Reply-To: <9575.1701068157617019984@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 28 Nov 2023 12:10:18 -1000
Message-ID: <CAOSpxdb+Gd6SsGFnuX1AB01Xc24yc4SMtLPmtjj51B79uA6qEg@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH 1/2] rsync: Add missing
 prototypes to function declarations
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191387

On Sun, Nov 26, 2023 at 8:55=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.=
com> wrote:
>
> Hi,
>
> Could you please take this change

This has been in kirkstone since April:

https://git.yoctoproject.org/poky/commit/?h=3Dkirkstone&id=3D6e89e71679ebcc=
5cca9c25cddb6e46d488e41e5c

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191256): https://lists.openembedded.org/g/openembedde=
d-core/message/191256
> Mute This Topic: https://lists.openembedded.org/mt/97945090/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

