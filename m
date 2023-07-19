Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBF0EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 10:08:55 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.10463.1689761331942217667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 03:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=KiQZXEEx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.181, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b703a0453fso109163411fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689761330; x=1690366130;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fDpOaoYPUnufxWa5Fz4EAIQYin3anX+OO5KZioFBI0A=;
        b=KiQZXEExuyQD8iEwv/DkwUkr60GCAhHHbzzo9easiSiLuDo92Pe6ELb1bfbu10sYCF
         oJ/yV0/6+ysaMrg+WMwkzmsW6fMKWhHf+cmO4/PxLg1X9JB8iCqxYRrIeMy0HcrZsgKD
         xCAFoEJRiRuYIYXthrBie9P32Cp1QZeWzMrqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689761330; x=1690366130;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDpOaoYPUnufxWa5Fz4EAIQYin3anX+OO5KZioFBI0A=;
        b=Z7LAeYTYx1SS06c0YXcZPFRbL8hvrA3TuL1OBThR9qX4EHVSfreD4P/Rc6WpfdHOdC
         rfETh4I4Z7ftC6M1cCa0FjYSLZeUh+vDomXOBqp/boLha4dbqqg69TvKpjt4pJIq2AVg
         Nr6it19uSsWxhNyi+rm/FEp1NHLVoYYrdAsA7M4oWDMg4w52K62V3/yXb5M7GZ7UMW90
         WQss72wD5LqFvsgzedTu3qrVdwxy4NjXYxXR22izIPg/u46cJBmMHUKXz2y0C76b9G+N
         wVcweYGAUtKfHr65K1+JNFMpe/YoxGDEzOiSDz/1GHZEGdHCRizVuznimq56Vmb3XS0k
         8LxA==
X-Gm-Message-State: ABy/qLb9kizY0UerAeTFEXZOokJWl/RhxtnBUiOP0pq97GFDlTfp4/9S
	A/WbHSw36pjdjbhCf44pj0gc4g==
X-Google-Smtp-Source: APBJJlER7c0QYdsQS69KRVDdAOw8JRKYfTlZxL+aKnWCqTbblK1rg1vjWS392n8HeVVihudyrYBq/w==
X-Received: by 2002:a2e:9f4d:0:b0:2b9:35ae:c9ac with SMTP id v13-20020a2e9f4d000000b002b935aec9acmr10014632ljk.2.1689761329916;
        Wed, 19 Jul 2023 03:08:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6248:d29c:dec5:5723? ([2001:8b0:aba:5f3c:6248:d29c:dec5:5723])
        by smtp.gmail.com with ESMTPSA id n23-20020a7bc5d7000000b003fc06169abdsm1351300wmk.2.2023.07.19.03.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 03:08:49 -0700 (PDT)
Message-ID: <a49258e57c93b7aafd3269952e073f24d5c217a6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] qemu: Add qemu-common package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Date: Wed, 19 Jul 2023 11:08:48 +0100
In-Reply-To: <078073d8-60c9-1cdd-e7be-cd3cf63e7dda@windriver.com>
References: <E57733DA-39D3-494F-A91D-9AA8306DBDAB@arm.com>
	 <20230710103218.3834001-1-mingli.yu@eng.windriver.com>
	 <2023071611474165f97b23@mail.local>
	 <919cae59-a542-5a51-e70e-164b5306eb41@windriver.com>
	 <202307171246212fd06366@mail.local>
	 <9441c96a-33fe-19d4-4228-54a8f4ea413a@windriver.com>
	 <20230719092014d84e04f9@mail.local>
	 <5ef0c81123f4abb3be2234cd8598cfa0a4cffea5.camel@linuxfoundation.org>
	 <078073d8-60c9-1cdd-e7be-cd3cf63e7dda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 10:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184574

On Wed, 2023-07-19 at 17:39 +0800, Yu, Mingli wrote:
> On 7/19/23 17:24, Richard Purdie wrote:
> > >=20
> > > It is relevant, this is because of the dependency that this gets buil=
t
> > > and fails. I've seen v4 but didn't have the time to test it yet.
> >=20
> > I've still not seen an answer to Ross' question or mine about why we
> > can't just add a couple of dependencies and resolve things that way.
>=20
> Sorry for delayed respond!
>=20
> Have added qemu-common to make qemu as meta package to keep backward=20
> compatibility. For user who install qemu rpm such as=20
> qemu-7.2.0-r0.corei7_64.rpm, it still pull in all of things as before.=
=20
> For user who cares the rpm size, can just choose to install the needed=
=20
> qemu arch rpms such as qemu-system-aarch64-7.2.0-r0.corei7_64.rpm.

So why not just add:

RRECOMMENDS:${PN} +=3D "${PN}-system-all ${PN}-user-all"

as I think we've then covered all the options we need?

Cheers,

Richard

