Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0697C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 13:47:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.7722.1657288032372333139
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 06:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NELU+8OE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 r129-20020a1c4487000000b003a2d053adcbso1183144wma.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=2m0suAi8tgzSbQq+t9kK4t0rGb2e0WGat7UXwIqRVp8=;
        b=NELU+8OEF3GHno5tUxPJCoop9jOF7h4rWCVh2m01C0+svFCnwW9yXps5kS9lxuQz5D
         rFOGrENE6NYHbr5sNTVv/IH2UoxwrUiVJu77ln/9NBrrMOn8wCgQMGsmM4RqbwIHAQ6x
         GbmHdTLrP0Bu456iu6NMEdP1VflsUTfb9mHy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=2m0suAi8tgzSbQq+t9kK4t0rGb2e0WGat7UXwIqRVp8=;
        b=kIYDz7l/Si6ngU5dDn8LUUX2m3ZSqje7vc59dOH+6LRz/BQ7bAtp/fprZ4DY5NBBoI
         fVx3a7m2f8u45rTtDTA1x5Cf2UDH/rXinunyGbiZKdz9X8JSFTTtAW5yaMPqOFU4B5tE
         RLT7yfPwRBFt6LaNzWD3/4DB5XBp1mtwb/bd+0B0+jBYWL/V1Np1gyYkIPa6EiAMF2LY
         onVA+0Nau50igSoxz38huiRKaquSG8uXwod3h+tBC7q7qs3ygg3uXLV7zKgCSawyVHFM
         PLb4Qz6WjRCNTBiXDmfeLYqqZ4ul+8aLkQxYWR96CpTlqqCVD3SdgZR3GtHU4Wwq8lMp
         dOgw==
X-Gm-Message-State: AJIora/qFe6dxrwhtq+CKTsLGuokVx8dPRiidM9bgIMqrZajBUjfNdL/
	JMwnkulv8EO2nrMEctXBEBEOMA==
X-Google-Smtp-Source: 
 AGRyM1vaiuMiHT/Mi/aGKCdOaqftmZ97ZBvVLisJGIx6qmeDZftcd+mAwIHaQBwDRvK1ZekedfD6hg==
X-Received: by 2002:a7b:ce0e:0:b0:3a0:4623:86b7 with SMTP id
 m14-20020a7bce0e000000b003a0462386b7mr10624213wmc.62.1657288030757;
        Fri, 08 Jul 2022 06:47:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d6f:c4b9:24ca:b52c?
 ([2001:8b0:aba:5f3c:5d6f:c4b9:24ca:b52c])
        by smtp.gmail.com with ESMTPSA id
 bq25-20020a5d5a19000000b0021d6d74a0ecsm12839969wrb.96.2022.07.08.06.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 06:47:10 -0700 (PDT)
Message-ID: 
 <77dd3defcb6908755d06585d4cfb69a523626a22.camel@linuxfoundation.org>
Subject: Re: [OE-core] Reproducible build issues with buildpaths - take 2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jul 2022 14:47:09 +0100
In-Reply-To: 
 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
References: 
	<7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
	 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 13:47:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167825

On Fri, 2022-07-08 at 09:37 -0400, Bruce Ashfield wrote:
> On Fri, Jul 8, 2022 at 7:07 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > Hi All,
> >=20
> > We've made good progress and I appreciate the help from people. I ran a
> > fresh build on the autobuilder and I forced it to rerun the QA checks
> > for all recipes. The tricky bit about warnings is that they don't show
> > up for objects from sstate and the addition of the buildpaths QA check
> > doesn't cause the checks to rerun. Due to that a few more previsouly
> > unseen issues cropped up.
> >=20
> > The list of issues now stands are:
> >=20
> > qemuppc:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5428
> > WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/module=
s/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.cmd in p=
ackage kernel-devsrc contains reference to TMPDIR [buildpaths]
>=20
> I'll take this one. My fix was only for arch/arm, but I'll expand it
> to cover ppc32.

Thanks.

I built qemuppc locally and got a different failure, I'd really like to
know why I saw that and the autobuilder did not. The failure was:

WARNING: linux-yocto-5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0 do_package=
_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1e8=
3_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/tty/vt/consolemap_deft=
bl.c in package linux-yocto-src contains reference to TMPDIR
File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0=
/linux-qemuppc-standard-build/lib/oid_registry_data.c in package linux-yoct=
o-src contains reference to TMPDIR [buildpaths]

sure enough, tmp/work/qemuppc-poky-linux/linux-yocto/5.15.48+gitAUTOINC+b35=
d1d1e83_5aa3abf07b-r0$ head package/usr/src/debug/linux-yocto/5.15.48+gitAU=
TOINC+b35d1d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/tty/vt/=
consolemap_deftbl.c=20
/*
 * Do not edit this file; it was automatically generated by
 *
 * conmakehash /media/build1/poky/build/tmp/work-shared/qemuppc/kernel-sour=
ce/drivers/tty/vt/cp437.uni > [this file]
 *
 */


I think the warning is saying there is a second issue in linux-qemuppc-
standard-build/lib/oid_registry_data.c too.

Sorry Bruce, not sure why several roads lead to the kernel :/

Cheers,

Richard


