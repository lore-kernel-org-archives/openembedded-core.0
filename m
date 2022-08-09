Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1898DC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 13:26:28 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.11850.1660051579491137120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 06:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E2e1WyZZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j7so14351927wrh.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 06:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=OJd39ZeabxwgbjsNuJqGS+7Db9XX+ui0QQVJO2rHq4Q=;
        b=E2e1WyZZt0NA4MrJbgXycaymuLhA/ao2jEul939TIKRQz0loC82QsBTN0KGXl2ldRS
         26Poe0SMGkY9dVzItDPof4PpbmqdaKLrqNYP8ijSF+PqdYlb3RLu2wtOMenV/hhUJlsC
         BQy3xzNJQJs2R74N6UDT3mqg22mYG3DcwsEu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=OJd39ZeabxwgbjsNuJqGS+7Db9XX+ui0QQVJO2rHq4Q=;
        b=NMbXa317tUbSwbtowvvcJ/dMFRs+X7MxQj5Vpstv0IGJMz3SH9X54sab++brpx2zTQ
         gFrmB/9ueGoMkqKXG4ZKBLqqXlvuvwGXWzlEOGlCL9W9UM4XOxPX0VHX+ue6IAtraUzM
         dRrJxHHIHCvPdfFqLno19QmzdVYRLN6G/KoptzCiovJ8Vw3wYmXDJLUvcEcOpPiVMPIz
         tHawJbyGHeR8Ysl8g9/NMEtgey+1vYvFVN8eDbEKAKlK4DN/eyIemJOSJ6+jhD+9s+DN
         KBpDk8xnGQGQk1gJIGjzaYTFmG4zkEPQXqlurHgEeTFmlwZWxooEAkV/Kzcr1Y7phaU9
         fqWQ==
X-Gm-Message-State: ACgBeo1kSwQAQV3SjrF0S16IeRtQBsNf2GgMHEED+jTfDQ3J4vfrFXF3
	9UyNtI61YCbDhRUH+h6Nfb3sxQ==
X-Google-Smtp-Source: 
 AA6agR50sfOBfONFEtr76ppPkQIImgm8/CUnSqPte+cA/w2/pEaCwgRIxGOZ80sqfbovubmBY9ECMQ==
X-Received: by 2002:a05:6000:18a1:b0:222:c477:e919 with SMTP id
 b1-20020a05600018a100b00222c477e919mr7853681wri.301.1660051577836;
        Tue, 09 Aug 2022 06:26:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222?
 ([2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a7bc004000000b003a31673515bsm20769303wmb.7.2022.08.09.06.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 06:26:17 -0700 (PDT)
Message-ID: 
 <bfc1c1a5b9ac8093b409129b825c41696650f66a.camel@linuxfoundation.org>
Subject: Re: [PATCH] kern-devsrc: Drop auto.conf creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 09 Aug 2022 14:26:16 +0100
In-Reply-To: 
 <CADkTA4MBRL7JuLA8D32K1_CcyDMcRO=hfJyghPHyUZtwKw-nqA@mail.gmail.com>
References: <20220809111449.192321-1-richard.purdie@linuxfoundation.org>
	 <CADkTA4MBRL7JuLA8D32K1_CcyDMcRO=hfJyghPHyUZtwKw-nqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 13:26:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169149

On Tue, 2022-08-09 at 09:16 -0400, Bruce Ashfield wrote:
> On Tue, Aug 9, 2022 at 7:14 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > After this commit in the mainline kernel, the quoting is different in a=
uto.conf
> > compared to .config:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D129ab0d2d9f38b9d43df35235fc66c6740d6928b
> >=20
> > We therefore can't just copy one over the other or it leads to syntax/q=
uoting
> > errors. We end up running make prepare anyway in all our tests so drop
> > this copy for fix 5.19 kernels.
>=20
> It is safe to stop doing this manipulation now.
>=20
> But I am curious, I was running on-target tests for 5.19+ and didn't
> have any issues, what is breaking that I managed to miss ?

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/5629/step=
s/13/logs/stdio

Basically any kernelmodule.KernelModuleTest.test_kernel_module which
was run was failing (which would run on any image with kernel-devsrc in
and a toolchain). It failed everywhere, all sdk qemu machines equally.

> There is a risk that if the .cmd files start regenerating because of
> this missing, or the different timestamp, that we'll have issues. But
> putting it through the AB should show us if that is true.

After this change is applied, the build looks a lot greener and this
issue goes away.

Cheers,

Richard

