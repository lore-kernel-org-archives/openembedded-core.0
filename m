Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235E7C27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 09:05:30 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.6706.1718183115177505514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 02:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h1kVHPzC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52962423ed8so7627196e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718183113; x=1718787913; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Go2Av4alBSh5JtGq6F2COEn6jCvGCBKnyKevojUEf6o=;
        b=h1kVHPzCx2sOp0QVHXDHgI12u7uSTz/oqrSW6kWO/FG5c/UGrwcJhB53TTmRREX3DB
         gXIBeG4ogbMADAAH/TIGuIT5+Qv+dv+co6YOZwdmcMMqCEEY4mlVa6/HZCVHPuYuatCQ
         R9KHiEOHva2oVVdGD72DsQwMOHFKcwtVRvqug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718183113; x=1718787913;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Go2Av4alBSh5JtGq6F2COEn6jCvGCBKnyKevojUEf6o=;
        b=fPu1dmPkMlBN1kTR5jwlRprUyRxF1s2mlo1Oa1wySPXTRLO2O+MpY33CjPCHQzIzwR
         b0vlbV4DBye1ROGWZ/yaRhUNdJCjtCz6evO9bbotFrywyz6hmTCa72sm65bu+Tk5L/v8
         Q1aGypGjuvcxFN7wjrN027DaG8c36KNQoBtrfSi3pYCb8Ay8ePHg87FXel1iEzVNmN+K
         9YArfGbZ07puIAPDMovAC98rvXH0+7ZYTpq4YOlRdp4rfwHfKZ3SFbJqvCFtqpTDIgQ1
         9Gsx+Xj/r4iCCAyXcFEQpwtAF8KM+Sr54CaO2i0GOW2jqdVoF7EGzeS8NS9qV/l1cEYi
         dOiw==
X-Gm-Message-State: AOJu0YxVr4TFsUVOAYgwbMIa3Ljm8zjjnjN93mWP0Y+qMQSjaDCwnReQ
	bHYl8tcnqUXNga99YqaoFDF6Xs8NbXZIKdra8PkjyPMhZe5fyIRs1t2uBbm5O4A=
X-Google-Smtp-Source: AGHT+IHsQ59KihTa382K9equk3/EMwQblDj4mcIUGX6crwBIpSn06/l4W7AUF/e1/pSSD97/uMvkLw==
X-Received: by 2002:a2e:a791:0:b0:2eb:d95f:10cb with SMTP id 38308e7fff4ca-2ebfca4cc05mr9918401fa.41.1718183112743;
        Wed, 12 Jun 2024 02:05:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8b94:58f5:4551:6fef? ([2001:8b0:aba:5f3c:8b94:58f5:4551:6fef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871f8f34sm17411925e9.42.2024.06.12.02.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 02:05:12 -0700 (PDT)
Message-ID: <2f7d7ad9e539b65b2523d1426c68223dd61b2647.camel@linuxfoundation.org>
Subject: Re: [OE-core] Patchtest results for [PATCH v2 1/2] ccache: 4.9.1 ->
 4.10
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, "liezhi.yang@windriver.com"
 <liezhi.yang@windriver.com>, "patchtest@automation.yoctoproject.org"
 <patchtest@automation.yoctoproject.org>, Trevor Gamblin
 <tgamblin@baylibre.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jun 2024 10:05:11 +0100
In-Reply-To: <DB5PR02MB102133966EA39448EEB68B773EFC02@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
	<cb1a3e14bd806b9603df4f0f772db86056fb57d5.1718168026.git.liezhi.yang@windriver.com>
	 <010101900affd5a7-04458148-2bf5-4090-a425-4001c7f394c6-000000@us-west-2.amazonses.com>
	 <4d377b0b-ea4b-47ad-8e34-23d6c5fbe6c1@windriver.com>
	 <DB5PR02MB102133966EA39448EEB68B773EFC02@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 09:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200568

On Wed, 2024-06-12 at 08:54 +0000, Peter Kjellerstedt via
lists.openembedded.org wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-
> > core@lists.openembedded.org> On Behalf Of Robert Yang via
> > lists.openembedded.org
> > Sent: den 12 juni 2024 07:54
> > To: patchtest@automation.yoctoproject.org
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] Patchtest results for [PATCH v2 1/2] ccache:
> > 4.9.1
> > -> 4.10
> >=20
> > On 6/12/24 13:50, patchtest@automation.yoctoproject.org=C2=A0wrote:
> > > Thank you for your submission. Patchtest identified one
> > > or more issues with the patch. Please see the log below for
> > > more information:
> > >=20
> > > ---
> > > Testing patch /home/patchtest/share/mboxes/v2-1-2-ccache-4.9.1---
> > 4.10.patch
> > >=20
> > > FAIL: test lic files chksum modified not mentioned:
> > > LIC_FILES_CHKSUM
> > changed without "License-Update:" tag and description in commit
> > message
> > (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_ment
> > ioned)
> >=20
> > I did add "License-Update:" in V2:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 * License-Update:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Update LIC_FILES_CHKSUM becaue a=
 few third party licenses
> > have
> > been
> > removed:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ git diff --stat v4.9.1..v4.10 LI=
CENSE.adoc
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LICENSE.adoc | 222 +++=
++++++---------------------
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 file changed, 15 ins=
ertions(+), 207 deletions(-)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 And add more licenses for third pa=
rty files.
> >=20
> > // Robert
>=20
> I believe it is expected to be at the start of the line, i.e., as a
> Git trailer=20
> (similar to, e.g., Signed-off-by).

I think we can relax the constraint for Lincense-Update a little, the
main point is that it gets mentioned somewhere in the commit.

Cheers,

Richard

