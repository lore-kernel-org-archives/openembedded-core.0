Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02263C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 14:27:48 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.50178.1654007260098407118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 07:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RatasDNp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id s24so11610205wrb.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=FPvQpuwBsvfPRwgZ6yumq2BVsw9hMq9cAJVghR8pSCA=;
        b=RatasDNptqySqHJg4xskSZLG710R8gmijV1piychXbQURC9KKGl70L8Ns2kCDuv8dz
         HLYpG4hlQ7QYM+k41r2QRxJPV9ZIBcIE37VQpJ4Km/wCWcHRiEg6z1tyme1Fe4b1vxL6
         0xRT7BKUAuQy1b5YB92ffJr57GnHgGgxfqqR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=FPvQpuwBsvfPRwgZ6yumq2BVsw9hMq9cAJVghR8pSCA=;
        b=JgwkaJOflUUE1wdRHsQPaqVWpadN/mFU96tsGaN24m3M1PXcawwdr8Zke8pv+2UUFt
         gQ3C99Sh9UOfZZm9zB1cbJbb6wWxBjWXSm8rncqAGU1O5kdG5lN/4lBoVZZ+2ZwkOSlL
         auUdiABnJKodNRlVxGy4igl1fqLLEkWD2qDTsIN3CPgdUXBE+h3Fq/xcO1siZthcVjHm
         AmeLsZZHDdGOpx5XnSbrLIP3JmDUW91M+AK5LdD1KwkCKN/25ThMFCIv3fBWO0xhWS6F
         Xax9RivIyA2KIEkChY3JhdGVDZEadEWqCBJd6PK8/ANmHgcDEQIhZcttCwZ8a5PH8bS3
         azHg==
X-Gm-Message-State: AOAM532biyXGpH95I9CCZ1UZN3YSiwc48vZ4UG2IASYok7wosQlZwazv
	k1CjY8elBhKQsFUxSnYD0PlbQnn0T6km3Yqq
X-Google-Smtp-Source: 
 ABdhPJwm2nLnXt6JNHX0M73gFENPLBwlGwXyo8PGaMyoPF9ME7okASEt87unMqcQa+xt6+QECi5aeg==
X-Received: by 2002:a05:6000:1d86:b0:20f:fcae:57f8 with SMTP id
 bk6-20020a0560001d8600b0020ffcae57f8mr26254693wrb.262.1654007258636;
        Tue, 31 May 2022 07:27:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d16:2159:4370:b82e?
 ([2001:8b0:aba:5f3c:d16:2159:4370:b82e])
        by smtp.gmail.com with ESMTPSA id
 j26-20020a05600c1c1a00b003973e27b789sm3176908wms.27.2022.05.31.07.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 07:27:38 -0700 (PDT)
Message-ID: 
 <c8bf274fe7b9abc3754b5be5b2b6b5cfe92b2603.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] tiff: Add jbig PACKAGECONFIG and clarify
 CVE-2022-1210
From: richard.purdie@linuxfoundation.org
To: akuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2022 15:27:37 +0100
In-Reply-To: <8b96627d-1760-3239-c178-c19b7bed2a23@mvista.com>
References: <20220528100501.508207-1-richard.purdie@linuxfoundation.org>
	 <339ded2d-6648-0016-50cd-0f2769792f00@mvista.com>
	 <db6f07a51d626042cff279bdd7119ca920d2d6d3.camel@linuxfoundation.org>
	 <8b96627d-1760-3239-c178-c19b7bed2a23@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 14:27:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166315

On Tue, 2022-05-31 at 07:10 -0700, akuster wrote:
>=20
> On 5/28/22 12:43, richard.purdie@linuxfoundation.org wrote:
> > On Sat, 2022-05-28 at 11:07 -0700, akuster wrote:
> > > On 5/28/22 03:05, Richard Purdie wrote:
> > > > We never depended upon libjbig so this was never present. Add the
> > > > PACKAGECONFIG to make this explict.
> > > >=20
> > > > CVE-2022-1210 is an issue in libjbig so we don't have a problem the=
re,
> > > > mark as such.
> > > But what if I am a user or have a customer that needs that enabled? N=
ow
> > > that issue is masked if I run the CVE checking tools , I will have a
> > > false sense of security.
> > >=20
> > > I understand that Redhat or Suse can make statements like that=C2=A0 =
as they
> > > provide install-able=C2=A0 binaries but for a Project that starts fro=
m build
> > > your own DISTRO, should the community take on this responsibility?
> > This is the same as any of the other decisions we make for
> > CVE_CHECK_IGNORE. If you bbappend and/or change the configs of recipes,
> > you need to do some further due diligence.
> >=20
> > The fact there isn't a PACKAGECONFIG for it at least suggests it isn't
> > being used.
> Maybe.

I did check and there is no recipe for jbig2-kit in the layer index
which is what tiff would use.=20

> > What is the alternative? We just list this as unpatched for OE-Core and
> > let everyone have to look it up for themselves?
>=20
> The first two ideas that come to mind are:
> 1) Make the PACKAGECONFIG =3D CVE # and a note in the recipe to provide a=
=20
> clue.
> 2) Create some sort of frame work to warn if that pkg config is enabled.

I did document it in the recipe. The recipe name on the dependency the
PACKAGECONFIG would add will break as things stand too so I'd hope
someone would notice if they were trying to enable it.

Cheers,

Richard



