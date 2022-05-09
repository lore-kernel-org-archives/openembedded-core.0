Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C533AC433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 16:34:24 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.241.1652114058164684825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 09:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bf8DlmGF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id q23so20245385wra.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 09:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=sGIcUXsULeiaNp+Y8OWXwbX8x0O99KdNZqIvwngCHKE=;
        b=Bf8DlmGFLlgIVDuAcAsDs0y69Xi1QvfTZSL7x0Yh4fII1o85xdKg/6qqTP5hCvIzMX
         Q1v0uMYBEvCEmAvSEwl3ZeW5QDamJy+rkWVOhuLwSMSA8FoOffv6jrj+UGj69GrvREMn
         +INXIdDSFi+ykgVwnB6rh0+i9e8lYKE3kY/Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=sGIcUXsULeiaNp+Y8OWXwbX8x0O99KdNZqIvwngCHKE=;
        b=fnDQ0VrP+kPjnEjI95jUMHY9GyTuGloyRtUTchSoeQOamlz82B/vHyBnLbEM33DPi/
         CCV9EdQosOLBPMeQ7EYeip9D/nBw/hT0MkUTTOPAhIgX9b6Lx5cXDSuIA5KXKZYjx9s5
         T2A2wIbfrcz4Vs+QZY0i5wo/OPOy16dG953iwBb7gQQQUHdZ56Am6ROZdi/qAPP16Yzs
         isfBbKi5yVWlqzkrQIKXDA9znddadhCNBUbFX09aOVvN5uRm/SAa0gFsH/TANVBcVu/Z
         Z+LREfyb941S/Peeo+PBJiDZHP9JPN0w+uj5/Vr9TBa8VGt/17dFa3RlujvsuMRcKrao
         cOPg==
X-Gm-Message-State: AOAM5316HDAs6nR34Z04OVww2Z99MGtxwOMj4/aFGoDbAmL2s7luOG0O
	UJ6m/LocuttlMEhYCFGxQfGJdg==
X-Google-Smtp-Source: 
 ABdhPJzeQOdzaUJKDXzzgb7fKpli13dYm++fUcuNvbRuv0OblFlWlcE0f8kenljk49KMp2q0SSTUrA==
X-Received: by 2002:adf:e642:0:b0:20c:b18f:f607 with SMTP id
 b2-20020adfe642000000b0020cb18ff607mr11148018wrn.293.1652114056307;
        Mon, 09 May 2022 09:34:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d65b:620b:4b88:bb29?
 ([2001:8b0:aba:5f3c:d65b:620b:4b88:bb29])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b0020c5253d8e0sm11712418wrv.44.2022.05.09.09.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 09:34:15 -0700 (PDT)
Message-ID: 
 <e5b0f0f42b1fe5cfe94901387ff9d18225b76368.camel@linuxfoundation.org>
Subject: Re: [OE-core] gcc12 testing results
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Ross Burton
 <ross.burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Khem Raj
	 <raj.khem@gmail.com>
Date: Mon, 09 May 2022 17:34:14 +0100
In-Reply-To: 
 <CADkTA4MuiKGp-PqEC2B4UmsiUrVi89kTxm_Bn9=-myOGsoWo_A@mail.gmail.com>
References: 
	<0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
	 <CADkTA4MuiKGp-PqEC2B4UmsiUrVi89kTxm_Bn9=-myOGsoWo_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 16:34:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165401

On Mon, 2022-05-09 at 09:24 -0400, Bruce Ashfield wrote:
> On Fri, May 6, 2022 at 11:14 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > I reran the gcc 12 testing. We still have an issue with linux-yocto
> > 5.10 and edgerouter:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/3046
>=20
> I just sent the yocto-bsp bump to 5.10.113, which had the identified
> -stable fix for gcc12. I can't say it is 100% complete at runtime for
> gcc12, but this moves us along.
>=20
> >=20
> > and meta-virtualization has a couple of issues:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/46
> >=20
>=20
> I pushed the patch that Ross found on opensuse for gcc12 and Xen. I
> can only say that it doesn't break gcc11 at the moment, but again, it
> moves us along.

Thanks, that looks like it fixes xen but xen-tools still has an issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/60/steps=
/13/logs/stdio

Cheers,

Richard

