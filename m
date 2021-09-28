Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BBDC4332F
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 01:44:16 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web09.8305.1632793455101285070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 18:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A7bK7HeZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.52,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id o124so20382812vsc.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 18:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fUvYyKZq5K2VJa23lhwwt18u4UgcWvaXg6j3/cxIAD0=;
        b=A7bK7HeZky590TY9FlCEiK1tgw71SVail981Kifm4FFP5KSyWvJSc1ZQuXY6OWDCEp
         ykGozYzY0tNuxG1FgBhU3RKYAckL6PyCSCiA5NtiwVrnt5HqSPsEzZX1uvOh+ivUaMFO
         g3gair/xAaOxIDSmJWRtcyXz68f6Le0RjmlxmvInFFIsx+z6TV18heU22HgqiVl24Xqf
         MF7si+PVpPuoSL6d8qPb8agDlDn6NrxPuAhF6U8MPFKOEFztYprAuSaBUeUL3RfusA2/
         nF/mB3OrWPVKvKRD/2p011W6SKlAZ8eI8UrK5ufvHkLjcj9LLBhg30ckvJDdpYe1Kp5N
         Ea9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fUvYyKZq5K2VJa23lhwwt18u4UgcWvaXg6j3/cxIAD0=;
        b=bnne0/UXgcRG4XeBhJT0eWB7tmauqzIczXUFfskGHTNguttXzgSUtckTB9HoQj0MfW
         lVsCMI6cyhsjmPFTpMFSWc1a5nlbfFSMKSGn1yX1nhOpa2wDyYeXlyDx966UyCcKtqJU
         NwZL92gSkmGqSZnLivGT6WSa26Gy7dyCiKOzBzyXXax4KLYMe5rIp12APKe7DrlsLcBL
         5JpnipJdoWrNCnSCO/E2UP32VKQq2MKV7eGSJPyFcKiomia3dbW5nzc7PAGZmvROshS/
         /4nJl8rVA3taR7YI/64HUHJVSrQAP0pSG8kGobB0iNrBMqYFpGVHVgMfFsc8tsdVfSOw
         UDtQ==
X-Gm-Message-State: AOAM533Gs8LaAU4rr+gcCQ+QbgTxKb1CGHocQ88tAN6v0OQIdOmQpZ/J
	BV3NjLLadvKVXBCNWLZg8wRAny6gzQJze+vl/2c=
X-Google-Smtp-Source: 
 ABdhPJzmQrdI6IraPmmUr+6r4jZPcE4jXFSVr/BWTbye7Khxm6debORL4vU7rVXYukv3IaIrULykESZE1vtlASRXRGs=
X-Received: by 2002:a67:5f03:: with SMTP id t3mr3256932vsb.5.1632793454231;
 Mon, 27 Sep 2021 18:44:14 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAA=hcWTC3_+Fg9uRC7ZnAEKhNEcF5Z_PM1WEugxQD76oFJ33dg@mail.gmail.com>
 <1e3f20d2-e557-b8fb-3ab7-d473db4eb2ad@gmail.com>
In-Reply-To: <1e3f20d2-e557-b8fb-3ab7-d473db4eb2ad@gmail.com>
From: Jupiter <jupiter.hce@gmail.com>
Date: Tue, 28 Sep 2021 11:43:37 +1000
Message-ID: 
 <CAA=hcWROFMPK-pgRH4jtSgcVFadrw+xKvEBujP-ZKRYM7_=qLQ@mail.gmail.com>
Subject: Re: [OE-core] Incorrect systemd timer
To: Khem Raj <raj.khem@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
	OE <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 01:44:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156404

> perhaps use
> OnCalendar=*-*-* *:*:00

No, the same result, completely bewildered why the timer does not work
in Yocto Linux

Thanks Khem.

