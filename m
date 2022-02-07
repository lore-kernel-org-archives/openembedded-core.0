Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EC5C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 18:58:35 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web09.359.1644260313970997066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 10:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JFg40yDV;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id f13so11447022uab.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 10:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RbU2vIC64WRZrvplDsfg8Lw9PznaJCsi74pNf+tt86g=;
        b=JFg40yDVXz6b086HfdMjHCsfj91SBVf/wwyRqCWA9uipFBARYkMmWko/aYZelShIO4
         FhdRwYAyCnSFSc2AowbHjU7eJ4qMplaC4B0/XGheipRvw7Kdt33FeushbStMorvN23RW
         Oi/h60dggg16Xrjy2oAN8Vqgh67pNhjTSGUBLUO57wIuS1sLpP6O3iAplxmKvxze3ETy
         uKVNBPQLbc2+S4qkUGdWKDD6ob4BU9kCMvi37EsQkHPj34fRX0ifjJ0kM5HpMEtgIBDl
         loiwjK0ieyafs/CG9cYeR3do7zzu+nfNDrBRip9FPQK94v7Hn8bMIlv2vyDvu05KaMbL
         r44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RbU2vIC64WRZrvplDsfg8Lw9PznaJCsi74pNf+tt86g=;
        b=wBkUluAxOyWQR1AzsEDs003SC0MDHxtQTfx8oBKdDYtzVxf7V9HHzW9GtEtNCJkWKt
         B93MtwADWASCn8qchafbGsWvBlPqueYTNHldmAqivtQn1n11Hans16JhUdtzxe3Y8A2K
         IzEynaOq7lbH/xmuUOWqpFgBEUIjg0keRmI7U9dBcptYEA04lPdXzzCLdMRd5Vx+9AKX
         JPdV5cvbY0k61w/5IAm0i5JWQs1QJQuPm6CLJsKZpM72TU1/LvRMy7YfyfGwSBt4dYLe
         Y0KZMfRHAIb8S+mfzKs6KSoQs2xorviHZ+92z+/IZ2ATqWohzbHkailwJhS8bRZAqMZb
         y9AA==
X-Gm-Message-State: AOAM530RSqrqpghfHBQJ/pnALJdDakoWtEMcVoVhlcg89HeF08G8mYix
	jSj5yeA883bKGRVAOK1sbe+ag2C3ph/lHArmTMI=
X-Google-Smtp-Source: 
 ABdhPJw+8jQtplg1/xqKjlHuRkLPIovYToGMGQai6FUla0xFocvHdELih38kXuDsuISK51WIsiewTkjo8WDeK03s/BE=
X-Received: by 2002:a9f:2c0a:: with SMTP id r10mr363727uaj.89.1644260313015;
 Mon, 07 Feb 2022 10:58:33 -0800 (PST)
MIME-Version: 1.0
References: 
 <CH0PR20MB3948AC26096D485ED45706F6BB2C9@CH0PR20MB3948.namprd20.prod.outlook.com>
In-Reply-To: 
 <CH0PR20MB3948AC26096D485ED45706F6BB2C9@CH0PR20MB3948.namprd20.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Feb 2022 19:58:21 +0100
Message-ID: 
 <CANNYZj9_bX2BLzXWM6f+OZL9dsjDrycc8TWrZkQMkW0MznYfgg@mail.gmail.com>
Subject: Re: [OE-core] gio-querymodules: error while loading shared libraries:
 libffi.so.6: cannot open shared object file
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 18:58:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161464

Upgrading from one yocto release to a different yocto release with a
package manager is not supported or tested. You need to replace the
image completely.

Alex

On Mon, 7 Feb 2022 at 19:49, Bryan Evenson <bevenson@melinkcorp.com> wrote:
>
> All,
>
> I'm having some upgrade issues related to upgrading libglib-2.0-0.  I hav=
e a device that is based on the morty release that I am upgrading to a buil=
d based on the dunfell release.  I am using opkg for a package manager.  Du=
ring upgrade I see the error message in the subject.  I think I have an ide=
a of what is happening and I'm looking for help on how to fix it.
>
> I seeh that libglib-2.0-0 depends on libffi.  Between the morty release a=
nd the dunfell release, libffi upgraded from libffi6 to libffi7.  When I up=
grade my system, libffi upgrades from libffi6 to libffi7 prior to libglib-2=
.0-0 upgrading.  When libglib-2.0-0 upgrades, it calls '/usr/libexec/gio-qu=
erymodules /usr/lib/gio/modules/' in its postrm script.  This postrm script=
 fails and gives the error listed the subject line.  I'm assuming that this=
 fails because gio-querymodules depends on libffi6 which is no longer insta=
lled.
>
> Has anyone run into a similar problem and found a way to fix it?  I've tr=
ied a few different ways to force a different upgrade order and so far noth=
ing works.
>
> Thanks,
> Bryan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161463): https://lists.openembedded.org/g/openembedde=
d-core/message/161463
> Mute This Topic: https://lists.openembedded.org/mt/88979156/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

