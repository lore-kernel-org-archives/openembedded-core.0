Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE9BC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 11:58:14 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.156318.1680782285728757128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 04:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OCrnGf3t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id e18so39241365wra.9
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 04:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680782284;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxJ7BYpNo99enjlcCb2/zS43OYw5nexV1tdWdYQxrjg=;
        b=OCrnGf3t4tdfscnz9bc+TZ/X2evXCwH+z4GOEagWNAzI106IgQB0esMWRJbAt1TtUD
         QmFzCv6cvypNgfwkDHbgNiUckcUvJs2iOEJ5x1AFXHRTRDJrP5+yu8IbRc09EveXYlRH
         u9ztT60UH0y13gI+rB59L2tRuj1KzuBKcJC0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680782284;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IxJ7BYpNo99enjlcCb2/zS43OYw5nexV1tdWdYQxrjg=;
        b=Df7QqCowArUiosrMGf8ihwoKZdxqD91DrJHrXVxCemA/4/GUpAobdFcAmKX90scxXU
         v2gm5Xiin+lSb6aaMwQua+au5v5+k4qszeZ3Oxghvs4JGCIRxynIN1RmVjqaYB0PWNYy
         pvy5j6Ahb9oMy5YW1Rb3ncjJqITJHuFSgJm/k93aL4StufNs0rOVAlgQVdaMBE7uVmek
         MNRkIRvrJqn80qtAQgf73lKgJUvRgR5PtV9hIsrykWOQoawngOi7SlxszFVtwnrZa7NB
         FwurSSnTsmjez0IzsPmQNASdBApnQDUMdMs04lHg03yiEmypIuW0SwxdWYhs25oa3DDy
         94Pg==
X-Gm-Message-State: AAQBX9eAwhfJBFJhlPh8yUlLgS6lr0WKAERYXWsHdCx2dbsMRicAEmgq
	X/pwjO4WCLRK4gnD2ziywBeFEw==
X-Google-Smtp-Source: AKy350Y/9yFfJEdms1910Betmxug2Kpq617TZTUHHfTFOsAA9GXdi/RyEaxEY7ov/BTlMWjs2rYQdg==
X-Received: by 2002:adf:f492:0:b0:2ce:a7df:c115 with SMTP id l18-20020adff492000000b002cea7dfc115mr6615827wro.41.1680782284142;
        Thu, 06 Apr 2023 04:58:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6a84:552d:cd38:8d5? ([2001:8b0:aba:5f3c:6a84:552d:cd38:8d5])
        by smtp.gmail.com with ESMTPSA id k13-20020a5d66cd000000b002c707785da4sm1544959wrw.107.2023.04.06.04.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 04:58:03 -0700 (PDT)
Message-ID: <b87018c33df6153d6ac0b13e5de8c93f9294be6d.camel@linuxfoundation.org>
Subject: Re: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.rc1)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: qa-build-notification@lists.yoctoproject.org, 
	"<yocto@lists.yoctoproject.org>"
	 <yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Pokybuild User
	 <pokybuild@yoctoproject.org>
Date: Thu, 06 Apr 2023 12:58:02 +0100
In-Reply-To: <BN6PR11MB414551F130849522F32006C5A1919@BN6PR11MB4145.namprd11.prod.outlook.com>
References: 
	<3f837f0f6dc5a6670ebb2d3a6e074fa614c387c3.camel@linuxfoundation.org>
	 <BN6PR11MB414551F130849522F32006C5A1919@BN6PR11MB4145.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 11:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179770

Hi Jing Hui,

Unfortunately there is an issue that has come up regarding the recent
crate fetcher changes. This means we're going to need to move to an rc2
build so we should probably stop testing rc1.

I'll hopefully have that ready soon. Sorry about the churn.

Cheers,

Richard


On Thu, 2023-04-06 at 09:06 +0000, Jing Hui Tham wrote:
> Hi all,
> =20
> Intel and WR YP QA is planning for QA execution for YP build yocto-4.2.rc=
1. We are planning to execute following tests for this cycle:
> =20
> OEQA-manual tests for following module:
> 1. OE-Core
> 2. BSP-hw
> =20
> Runtime auto test for following platforms:
> 1. MinnowTurbot 32-bit
> 2. NUC 7
> 3. ADL
> 4. TGL NUC 11
> 5. Edgerouter
> 6. Beaglebone
> =20
> ETA for completion next Tuesday, April 11.
> =20
> Best regards,
> Jing Hui
>=20
>=20
>=20
> > -----Original Message-----
> > From: qa-build-notification@lists.yoctoproject.org <qa-build-
> > notification@lists.yoctoproject.org> On Behalf Of Richard Purdie
> > Sent: Thursday, April 6, 2023 3:57 PM
> > To: <yocto@lists.yoctoproject.org> <yocto@lists.yoctoproject.org>
> > Cc: qa-build-notification <qa-build-notification@lists.yoctoproject.org=
>
> > Subject: [qa-build-notification] QA notification for completed autobuil=
der
> > build (yocto-4.2.rc1)
> >=20
> > A build flagged for QA (yocto-4.2.rc1) was completed on the autobuilder=
 and
> > is available at:
> >=20
> >=20
> >     https://autobuilder.yocto.io/pub/releases/yocto-4.2.rc1
> >=20
> >=20
> > Build hash information:
> >=20
> > bitbake: 46e1ea2e9a203992bb4de48ea21a8e736419ada2
> > meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> > meta-arm: 3b4ab43d2f82b9db682a88dff4665807b62d1870
> > meta-aws: d243fc1ad45dde57b4caa182a92b685540475cb2
> > meta-intel: ec3147abdd0727fedc707330d58593097357f944
> > meta-mingw: 250617ffa524c082b848487359b9d045703d59c2
> > meta-openembedded: 60afa577e5656a7c82c902da11adc031d71ef8db
> > meta-virtualization: 48c07a48a0e7d56266f20a01bb0c8ebc1085453b
> > oecore: 5a96847e7ef2ff72958d739a91c90e2085c04bc6
> > poky: 08d564bd92fc476d7f0b4a6201b752e51cf93776
> >=20
> >=20
> > This is an automated message from the Yocto Project Autobuilder
> > Git: git://git.yoctoproject.org/yocto-autobuilder2
> > Email: richard.purdie@linuxfoundation.org
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237): https://lists.yoctoproject.org/g/qa-build-notif=
ication/message/237
> Mute This Topic: https://lists.yoctoproject.org/mt/98100538/1686473
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave=
/8915122/1686473/2097788548/xyzzy [richard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20
>=20


