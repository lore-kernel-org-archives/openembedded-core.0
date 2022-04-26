Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5E2C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 08:24:13 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.3729.1650961451409899735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 01:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nf38KEP9;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id j4so6063409lfh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 01:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qBUTBtISDPtzpX248gIxSsD+FdQPRxn6W1g/fRAcTZc=;
        b=nf38KEP9zmi7i31fYFuGqMkjQrNdx3IszTqcL94WFCcHXyrvDM5/DBqia18gC0/bjM
         i5Bib8pbQkG92857RzgZgVfOhShLs1y/GIqDKBDiE6ccYhkboYMPQdK7jtkgp5DekBov
         +BuY5N32QRK1wZNlVWxeYzRP8b9MTdz3Dwyu9umj5n8ZlvsDaGcN/ppBzyvm+fRmxgo2
         OH/FxxVzrLtcy2/m6CMdiu8E88ikN7AFGDxDj87cCOcynVo05nbU9JEV1xmjSMIqOL8x
         SwJFslGSDChh7IghyIA7OY9d7xrZk2pmoYNDmhSK4+p1jXkjerx11XlS+40HH/ddXSMo
         E1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qBUTBtISDPtzpX248gIxSsD+FdQPRxn6W1g/fRAcTZc=;
        b=KiBHGVY5qlqPJIi9aHsbv8EvEmTUop08/qt92QjJXzoSkrAWrwfac8R6QcZv5zSSmW
         RXx6lx1QHxBfUauguk1qI4p4pcufnP5qqrShnB/aohEDRZ/COh+M6cp+hDWjbE29dSuc
         QRKOanbkdt0EhSsd9ChTYHzr6MsoMh4MBj1XkfgqybbZSxSq2Gij3rbMMilwriTBeOrN
         vfaqYnmaWChX8ccROZmAZEOAblQSOYG9WsJZgcF55q8rFmYarAQkrpxYkJlHtCdUzncx
         1YG1WU/at08XwD0SAxWyp7YAetZuEPNYxkYkIWo5oMu4A6YawAlFDD5BUfbqkNGcy0fL
         otpA==
X-Gm-Message-State: AOAM5326e29fqG21NnF9v5NZi0jzalPODmTY6YFZYCCf1P7y1DbZ0243
	w0UHzyxj3Vze3z5HLZNyggFmShQDqeP2oHct2fU=
X-Google-Smtp-Source: 
 ABdhPJyR5POLLRg8hb+MmhtB+JHCWcMoESxQmtGVI6o8r1gK9BCc0+L7IHgoeMHE0pDPtjl7HD/2eIWSaU5i7aIcPUk=
X-Received: by 2002:a05:6512:5cb:b0:472:f7e:a5f5 with SMTP id
 o11-20020a05651205cb00b004720f7ea5f5mr3908536lfo.358.1650961449522; Tue, 26
 Apr 2022 01:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <dwNG.1650960833949086015.bRfk@lists.openembedded.org>
In-Reply-To: <dwNG.1650960833949086015.bRfk@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Apr 2022 10:23:57 +0200
Message-ID: 
 <CANNYZj_68ACtcZxAqognRdHE_H8C8dAa2eMHmfHy6PUBDjq8Wg@mail.gmail.com>
Subject: Re: [OE-core] CVE-2022-24765 Git Errors with Bitbake
To: dev-faha@t-online.de
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 08:24:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164862

There is a fix in master for this, and more fixes in master-next.

Alex

On Tue, 26 Apr 2022 at 10:14, <dev-faha@t-online.de> wrote:
>
> Hello everyone,
> since the patch for CVE-2022-24765 (uncontrolled search for git repositor=
ies) arrived we have problems using Git as package source. For some reason =
git thinks that the repositories do not belong to the user who is invoking =
the bitbake command, even though when checking the file permission manually=
 they seem to be correct:
>
> "fatal: unsafe repository ('...' is owned by someone else)"
>
> So is bitbake using some mechanism (e.g. fake root?) to invoke the git co=
mmands? Is there a workaround to fix this?
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164861): https://lists.openembedded.org/g/openembedde=
d-core/message/164861
> Mute This Topic: https://lists.openembedded.org/mt/90703668/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

