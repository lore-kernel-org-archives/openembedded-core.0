Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6568BC4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 10:37:02 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.15779.1672396619749299795
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 02:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X2AiBJ86;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j17so14181960wrr.7
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 02:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rSxkET9fFmDqA2Ih1mNrqUzMppAAx2/kemsrrxGt2lo=;
        b=X2AiBJ86TaNgCm1J6j0FDCf6KbhLRf3TnlFT6YBZ+rTiY60PR62Nmp85Ic9CfISR2+
         DJcskgyBawi2Q5FOYp4rXLkeBA4Tj+HLdBUVUi01ONcHxDjOc1aLW45VCzkiObPh40NS
         +dUgCn8WxbX3DM3EKQZ1Ua08gIyrcJhBjs4Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rSxkET9fFmDqA2Ih1mNrqUzMppAAx2/kemsrrxGt2lo=;
        b=IiXn0vN+fSYYzF03593dV2CD3IjqOeNuzuTRlXy1t1L8Hk5+Um0rCVPPmtwfaCqaIY
         19pkmjVDpdCaxZzeyn43f1QWXM63K8yfzBKBZJP487KP8V9ifdz5MtXcAOgMlett8tHT
         2gnPnGszTIH+Wo8P3OAr9hZNXkV2MS1LPAXxBl6Tl9sCt37SXYy7jduYQLNEwnNaRvFF
         QEe/FNPF9v1Vi9/iOlxT5xzuvwvJfFVyZg+WEnfeTn8JcY8LBEiwulH+SCdNSgV7EHJG
         p2EemAfmCrsDeD73tA8sTxdZMnWjeN48ETEKAY5meAkqQa6cPpvVesTRpRRMg8b2S/gD
         xzrQ==
X-Gm-Message-State: AFqh2kpq0QwmJ+Z/qCL2J6tjtdratCqqkQgYOzyWC7rC0Z8TjkFGhexq
	VLth4XG3G7T9E0zoySlp1uMWvg==
X-Google-Smtp-Source: AMrXdXu/m31XuBSi5Nfk9CnCiZbrNqmORWPIMVIoYh12TX7zcbu5Hxsz996FM7jDxSltxAb2jPVLeA==
X-Received: by 2002:a5d:438e:0:b0:24d:867f:10e6 with SMTP id i14-20020a5d438e000000b0024d867f10e6mr21860669wrq.32.1672396617984;
        Fri, 30 Dec 2022 02:36:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fd62:db1:ca71:a503? ([2001:8b0:aba:5f3c:fd62:db1:ca71:a503])
        by smtp.gmail.com with ESMTPSA id b2-20020adff242000000b0023662245d3csm20460187wrp.95.2022.12.30.02.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 02:36:57 -0800 (PST)
Message-ID: <876a1de350c1c096dcc34766c7412e765542dbd2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 7/7] qemu: update 7.1.0 -> 7.2.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>, alex.bennee@linaro.org, berrange@redhat.com
Date: Fri, 30 Dec 2022 10:36:56 +0000
In-Reply-To: <CANNYZj__BZwPwMP2SzTWsJSvfzVM2cnJ-XNZzOmqOj2P+_h5Hg@mail.gmail.com>
References: <20221224165943.1324800-1-alex@linutronix.de>
	 <20221224165943.1324800-7-alex@linutronix.de>
	 <6ea0dc08bc4007911090f49ebf4c9d9dee9579fb.camel@linuxfoundation.org>
	 <173581B798B2479E.21302@lists.openembedded.org>
	 <CANNYZj__BZwPwMP2SzTWsJSvfzVM2cnJ-XNZzOmqOj2P+_h5Hg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175137

On Fri, 2022-12-30 at 09:06 +0100, Alexander Kanavin wrote:
> On Fri, 30 Dec 2022 at 08:31, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > > Since I merged this we've been seeing an intermittent qemu ptest
> > > failure on both arm and x86:
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/447=
9/steps/12/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/427=
3/steps/12/logs/stdio
> > >=20
> > > Not sure what the pattern to trigger it is, not looked into it.
> >=20
> > I had filed a bug for this:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14996
>=20
> The culprit is here:
> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D68406d10859385c88da=
73d0106254a7f47e6652e
>=20
> Particularly the
>     /* try to avoid a race to create the socket */
>     g_usleep(1000);
>=20
> bit is not reliable enough, there has to be hard synchronization.
>=20
> I guess we have to disable the test altogether for now.

Disabling sounds reasonable, thanks for looking into it.

Cheers,

Richard

