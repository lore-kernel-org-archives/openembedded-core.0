Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9177FEB64DC
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 08:07:55 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.5987.1687334872674146471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 01:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=GCyzJFKx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.182, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b4826ba943so38696531fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687334870; x=1689926870;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K4trM3Sn7r34UNSHmM7KosS51+sUXvXIgaULX6vE0Eg=;
        b=GCyzJFKxcAfRVWoX8u4Sd3webnstIljsTVJfAcF/DwP/SYMGoq0aMKdSw/MkO8vgEi
         j6su3h+peZul7eBHGCvWK8EZvl2MR7fVXWvco5sPnEoe3L+5UmbEo+PErKQ2Mx6Hx+lF
         z3wzoZpVIFcfK67+hEMdrC0NQ5rSEuNEjuFpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687334870; x=1689926870;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4trM3Sn7r34UNSHmM7KosS51+sUXvXIgaULX6vE0Eg=;
        b=Zi68IKLcLU4tRGKQVVqgdP8GdB6GfIqylTDNQfBOGutOFXzgr6xWiLCd1UR9MgAhfU
         pfQC2Hrr0Y+qr6iYfSQFWWFI3Tz41UlB1S8zC1dgbNet5jqx/15p6WoyRgoFNjzFCIr/
         WGkz1EdlE2dw1Afdx5bHfI3vi7RcyPDuZkEhpkmXhrDMs0U0VCw4e42dcK2tQ3IcobnY
         wetdA/FvW69nFGsMeR8IsChTRif4aAJ5OoNJoQe670NYfsKDBRsALTNh7NiHfMsIPtnB
         10q7oqklfuEHTVjwZOFMUj9eNziE1UMTcQSiWyWNUznjyWIh+jeSe8IJH7Zz1XWHTMWH
         xDFA==
X-Gm-Message-State: AC+VfDybNdMVBC7dBRVP+R77/pq4UiCvcYvuvgffcbeg2zN9eMxt5ELb
	tK39ktOtjEbYzs0V62B3xOVlow==
X-Google-Smtp-Source: ACHHUZ47eAupDu4GcWuQPOB0Kxi3xYfBF0su80CK0vB+stgqWK+mvKGLIhTk5zlQ+fVpdQfzCJPkCQ==
X-Received: by 2002:a19:7108:0:b0:4ef:f11c:f5b0 with SMTP id m8-20020a197108000000b004eff11cf5b0mr8205256lfc.54.1687334870237;
        Wed, 21 Jun 2023 01:07:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1417:9a5:3a38:428a? ([2001:8b0:aba:5f3c:1417:9a5:3a38:428a])
        by smtp.gmail.com with ESMTPSA id r11-20020a5d498b000000b00307a86a4bcesm3779223wrq.35.2023.06.21.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 01:07:49 -0700 (PDT)
Message-ID: <d20229c092226633a28f13992698b6e39821a2fc.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] runqemu-gen-tapdevs: pass
 STAGING_BINDIR_NATIVE to ifup
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <aehs29@gmail.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Jun 2023 09:07:48 +0100
In-Reply-To: <CAHMutrYDYCRCTcYHb1DBi=5kVR62WOx0ATs6Dj9SMZtC41kDOw@mail.gmail.com>
References: <20230619135416.1640748-1-tgamblin@baylibre.com>
	 <d114391afb2fb86d115abb740af5a4a9473848b6.camel@linuxfoundation.org>
	 <ef3d8471-22f1-7b0b-48f6-25a096a28d42@baylibre.com>
	 <e1b3ced391e8d316d808b5c35c2c655d89191089.camel@linuxfoundation.org>
	 <CAHMutrYDYCRCTcYHb1DBi=5kVR62WOx0ATs6Dj9SMZtC41kDOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 08:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183176

On Tue, 2023-06-20 at 18:21 -0600, Alejandro Hernandez wrote:
> Just to add more information to this, I've noticed a failure on my
> test environment today while trying to run -c testimage, apparently
> due to one of these fixes:
>=20
> Command '('sudo', '/home/vsts/poky/scripts/runqemu-ifup', '1001',
> '123', '/home/vsts/poky/build/tmp/work/x86_64-linux/qemu-helper-
> native/1.0-r1/recipe-sysroot-native/usr/bin')' returned non-zero exit
> status 1=C2=A0
>=20
> As Richard mentioned the bindir isnt used anymore, and the patches
> mentioned
> (https://git.yoctoproject.org/poky/commit/?id=3D51063c1e6ac214b4ef43c88
> c8091c909a7cab2cb) fixes the check for the extra parameter, however,
> I can clearly see that a third parameter is being passed to runqemu-
> ifup, which I believe is being called here:
> https://git.yoctoproject.org/poky/tree/scripts/runqemu#n1185
>=20
> I'll be sending a patch to fix the call to runqemu-ifup=C2=A0with the
> correct amount of arguments.

Thanks, I had a feeling I'd missed a reference somewhere!

In the long run, removing the need for the staging directories should
help usability so it is the right direction now we no longer need it.

Cheers,

Richard

