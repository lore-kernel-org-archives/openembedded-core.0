Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65459C77B61
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 14:20:35 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.9426.1680877234094319465
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 07:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eEa3sdfH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id e18so42426626wra.9
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680877232;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H63lWgdtQQLPG+3t5Cvp+i06DkpkmpVCYeawguN7BUE=;
        b=eEa3sdfH+zPt+S7I7YWooogb2PHCJo+d51B6ANeNYZkHXfWICjQzSJRXr+VV8C9C2T
         JSSe+0w9c/geTWJngcYhmdep2NnXyvRVbIcOWp34fu5aphAJLO9mnGVU8Q7SJU3pFTa9
         61fvawKBDPnqp9q5a2I5OldScx/B1lA6t9jt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680877232;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H63lWgdtQQLPG+3t5Cvp+i06DkpkmpVCYeawguN7BUE=;
        b=vaMUm1yEHsEturLq3Ob0AGMyio5kCayfBZpSW3zX+hnCR3b3Qxx17NMybo/evMTJog
         U/R/B564oFMlOPJSd2V8Yi4lfKZ5wwu2r2NNqV/n3v/VQuVzZByMBQfZW85HuHGuA4kL
         RzUI132xcLO1ZiE6Wv9Z1OZ/qHOBCs+iQgY1BaF8GvqpLLSQuekY7aJp9SpA5bO2oblv
         QHx8XLJRXMovnArWbvsKXmiOu1ihcZoNOsI4n2mZ8Pv1pMr/NoKMrkXfMWFz3lQ9d1iL
         FkNKl43BLII9JijS0cpQAuPPeAwb5pPrBaG+H996zUzXvT3HVEdeVM+mmqT/VPTDbeMe
         yUtQ==
X-Gm-Message-State: AAQBX9elZCvUjG+Uo09t71MnsToos/G6NwDMTjGQ7AHR9uvSdxVfMUgZ
	MMIRV9M4UVaVhOATUx8Te8a5ug==
X-Google-Smtp-Source: AKy350YWnLgC80rRU9FrDFezCpcRUsPaEiUQZH/CPOcg5LCbVA6gprUy/VW/jINyY1OTLsf5C1z4vw==
X-Received: by 2002:a05:6000:1281:b0:2ce:9da7:6d42 with SMTP id f1-20020a056000128100b002ce9da76d42mr1982952wrx.38.1680877232479;
        Fri, 07 Apr 2023 07:20:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:be03:9b2d:76a:ec3b? ([2001:8b0:aba:5f3c:be03:9b2d:76a:ec3b])
        by smtp.gmail.com with ESMTPSA id f3-20020a7bc8c3000000b003ee10fb56ebsm4806789wml.9.2023.04.07.07.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 07:20:31 -0700 (PDT)
Message-ID: <97d250ce274316d430096427dcd129b64bbd8d43.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-exclusions: Document some further
 linux-yocto CVE statuses
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 07 Apr 2023 15:20:31 +0100
In-Reply-To: <6179e5dc-6d8d-948a-16c9-7d9c0eb43933@smile.fr>
References: <20230407105840.635561-1-richard.purdie@linuxfoundation.org>
	 <6179e5dc-6d8d-948a-16c9-7d9c0eb43933@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 14:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179821

On Fri, 2023-04-07 at 15:38 +0200, Yoann Congal wrote:
> Hi,
>=20
> On 4/7/23 12:58, Richard Purdie wrote:
> > Add some information about some further kernel CVEs which don't apply f=
or
> > either linux-yocto or don't apply for linux-yocto 6.1.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/conf/distro/include/cve-extra-exclusions.inc |  7 +++++++
> >  meta/recipes-kernel/linux/cve-exclusion_6.1.inc   | 13 +++++++++++++
> >  2 files changed, 20 insertions(+)
> >=20
> > diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/c=
onf/distro/include/cve-extra-exclusions.inc
> > index 0b895985015..76dab1d630a 100644
> > --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> > +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> > @@ -438,6 +438,13 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1073"
> >  # Backported in version 6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
> >  CVE_CHECK_IGNORE +=3D "CVE-2023-1074"
> > =20
> > +# https://nvd.nist.gov/vuln/detail/CVE-2023-1076
> > +CVE-2023-1076: linux-yocto https://web.nvd.nist.gov/view/vuln/detail?v=
ulnId=3DCVE-2023-1076 *
>=20
> This line is a misplaced copy/paste maybe? (the URL a redirect from/to th=
e one in the line just above)
>=20
> > +# Patched in kernel v6.3 a096ccca6e503a5c575717ff8a36ace27510ab0a
> > +# Backported in version 6.1.16 b4ada752eaf1341f47bfa3d8ada377eca75a8d4=
4
> > +# Backported in version 5.15.99 67f9f02928a34aad0a2c11dab5eea269f5ec> =
+CVE_CHECK_IGNORE +=3D "CVE-2023-1076"
>=20
> If you want it, here is the full list of backports for this fix :=20
> # Backported in version v5.4.235 d92d87000eda9884d49f1acec1c1fccd63cd9b11
> # Backported in version v5.10.173 9a31af61f397500ccae49d56d809b2217d1e217=
8
> # Backported in version v5.15.99 67f9f02928a34aad0a2c11dab5eea269f5ecf427
> # Backported in version v6.1.16 b4ada752eaf1341f47bfa3d8ada377eca75a8d44
> # Backported in version v6.2.3 4aa4b4b3b3e9551c4de2bf2987247c28805fb8f6
>=20
> > +
> >  # https://nvd.nist.gov/vuln/detail/CVE-2023-1077
> >  # Patched in kernel 6.3rc1 7c4a5b89a0b5a57a64b601775b296abf77a9fe97
> >  # Backported in version 5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11=
f7
> > diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/rec=
ipes-kernel/linux/cve-exclusion_6.1.inc
> > index ec7ff9c1a7b..b74e9675e15 100644
> > --- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
> > +++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
> > @@ -13,3 +13,16 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3566"
> >  # Patched in kernel since v6.1 364f997b5cfe1db0d63a390fe7c801fa2b3115f=
6
> >  CVE_CHECK_IGNORE +=3D "CVE-2022-3567"
> > =20
> > +# https://nvd.nist.gov/vuln/detail/CVE-2022-38457
> > +# https://nvd.nist.gov/vuln/detail/CVE-2022-40133
> > +# Patched in kernel v6.2 a309c7194e8a2f8bd4539b9449917913f6c2cd50
> > +# Patched in kernel 6.1.7 7ac9578e45b20e3f3c0c8eb71f5417a499a7226a
> This is a backport, this line should read:
> # Backported in version v6.1.7 7ac9578e45b20e3f3c0c8eb71f5417a499a7226a
>=20
> > +CVE_CHECK_IGNORE +=3D "CVE-2023-38457 CVE-2022-40133"
>=20
> This overlaps with the patch I sent here :
> [PATCH 1/2] cve-exclusions_6.1: ignore patched CVE-2022-38457 & CVE-2022-=
40133
> https://lists.openembedded.org/g/openembedded-core/message/179775
>=20
>=20
> > +
> > +# https://nvd.nist.gov/vuln/detail/CVE-2023-1075
> > +# Introduced in v4.20 a42055e8d2c30d4decfc13ce943d09c7b9dad221
> > +# Patched in kernel v6.2 ffe2a22562444720b05bdfeb999c03e810d84cbb
> > +# Backported in version 6.1.11 37c0cdf7e4919e5f76381ac60817b67bcbdacb5=
0
> > +# 5.15 still has issue, include/net/tls.h:is_tx_ready() would need pat=
ch
> > +CVE_CHECK_IGNORE +=3D "CVE-2023-1075"
> > +
>=20
> That said, the content is good :
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

Thanks, that patch was a mess on my part, sorry.

I knew I'd seen some of the CVEs somewhere but I must have missed a
queuing patch. Should all be resolved on next now.

Cheers,

Richard



