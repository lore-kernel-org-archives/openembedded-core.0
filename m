Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D32EC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 15:07:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.8888.1662563270007046867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 08:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P6JEOPjW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id e20so20830250wri.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 08:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=l7W98KStZ1QSo2o7AObaAMIiTphtGC+51n+TPg6oH2U=;
        b=P6JEOPjW8iyrOcF5HjXcA4L2bmYipYl8iRPs778a99i2HNxldLdu0kC1ykywramuMT
         92JPXHG1pvrytSSIAFw1IIioSb+/IF2jGrYQrA/rBUIq3sZuBlGBWa1f0r6UdHWECXEA
         jyNp1jewb7M7UX5ptau4SsJiIFSkZxV7d4oM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=l7W98KStZ1QSo2o7AObaAMIiTphtGC+51n+TPg6oH2U=;
        b=Y9mQ4PkfcO1Ag6Hmj9UGX88bvSXk6e87ioqvahguhbo6j7vqQl8bvwdbCifp7Iz1Ry
         uSLSgz9vvkUmmWPqFXS7069XmoVUDFmjziioSt7BxwBeefL3KJc5rNk+rXaYGx/m9r7B
         JqVBXl1DXSBJle22hUKhRH6hCAGMmPpsP+XECWuDZl5njw2zkvXv8HPx9oD8HBPckPxI
         r+mzKG5EIA+gonKn9MetBkdnYJ2tu8wzfZ4WyOukLUWZsXHJNlgpYgbPmkhpGcRZCtkC
         uajBqLMIYT8t/xBjdvP3SsnsJEul6nMeJWiLdwIEqihl/QIx1OZtmUiFB07RLw+bpAHH
         93Rg==
X-Gm-Message-State: ACgBeo1tTm77diTov4iNp7a+ftzPXam36XypRW5Z/1F04NlkIRIj6xPT
	AeWmo/NvZVcxdvWVOpzPDxscvQ==
X-Google-Smtp-Source: 
 AA6agR4UG7hOkIQxJD9WawfdiaCQQ6bmYm2uiDmtL7MGyvIJ5VrsKbDiwUfi/reXd4DNIuFF+HOBcg==
X-Received: by 2002:a5d:64e9:0:b0:220:7dd7:63eb with SMTP id
 g9-20020a5d64e9000000b002207dd763ebmr2423091wri.590.1662563268168;
        Wed, 07 Sep 2022 08:07:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb69:bb70:edb:6315?
 ([2001:8b0:aba:5f3c:eb69:bb70:edb:6315])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003a5f2cc2f1dsm32875816wms.42.2022.09.07.08.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 08:07:47 -0700 (PDT)
Message-ID: 
 <ef6bdb20f27290c82f60f1f3ea04a2b4f066bd2a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v10] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda cve <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
	vinay.m.engg@gmail.com
Date: Wed, 07 Sep 2022 16:07:45 +0100
In-Reply-To: 
 <CALY4987n9cs0EWx-+yTd37mPcxJkNAK95B_uB278vGy_RvdqRg@mail.gmail.com>
References: <20220904063331.82988-1-naveen.gowda@windriver.com>
	 <071f8e1caf21c6ba8b043f416e07629969e7f213.camel@linuxfoundation.org>
	 <CALY4986Pc-HmuguPuoe=CKXqX8U=cN4VroAaEwSSuUXDsOOLUA@mail.gmail.com>
	 <6e4acb0b302d1d841c765283b12a3b1976d06a51.camel@linuxfoundation.org>
	 <b3185ce5cca1b255cc96f5413db5c51cdb665175.camel@linuxfoundation.org>
	 <CALY4987n9cs0EWx-+yTd37mPcxJkNAK95B_uB278vGy_RvdqRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 15:07:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170422

On Wed, 2022-09-07 at 20:34 +0530, pgowda cve wrote:
> Hi Richard,
>=20
> Thanks for pointing this out and your help in improving the patch.
> I am using an Ubuntu-18.04 machine and am not able to see the error.
>=20
> > > Something is mangling spaces in your patch. There shouldn't be tabs h=
ere.
> Fixed.
>=20
> > > I think this can be merged with the RustSelfTestBase class as I don't
> Merged.
>=20
> > > If we want to change grammar, it should be in a separate patch.
> Removed it.

Thanks for tweaking these.

>=20
> > > addtask do_test_compile after do_configure do_rust_gen_targets
> > > put that alongside the task definition.
> Added along with addtask definition.

I clearly wasn't clear enough!

It should be next to where the task is defined in rust_1.63.0.bb, i.e.
alongside the do_test_compile task definition itself.

Cheers,

Richard



