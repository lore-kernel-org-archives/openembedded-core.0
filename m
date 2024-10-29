Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F621D7494C
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 22:34:18 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.1575.1730241251694813444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 15:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cSM/6Hrb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so59238755e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 15:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730241250; x=1730846050; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HfdBCNLwsPKY0VtkGHhceCx8EuR9313nrJ/dWY5KG/c=;
        b=cSM/6Hrb9rIvt59e7iX9lbIZCF3ePML3enE13k+wLXC9QkQgDRHza/10+6BF6pNS6G
         pIQBuW8OMGcSqWpeliTsgk3R4RIDgaImVK8z80t4XHwbNhqOA8kIDp2Jmbthm8ui9SaR
         CwH9BTNbTgmXlG5BKyerOMZ2ZDI9VScTCLkhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730241250; x=1730846050;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HfdBCNLwsPKY0VtkGHhceCx8EuR9313nrJ/dWY5KG/c=;
        b=YGsIccTFHVPC4T6DWVReQLbnFEojcGuykypetRhSzZl/+IVRVVKWMNcIoJxcSpneug
         cw4q/dxMyC29ewNaLpn30GsdW/SpsPpQVrm1e5wgGQULN3W2bZ0bRK0uYHaXw4gmUiq6
         iFzUVVKI03RdI3JmOKb/lIoY4qmholAW4IDGHuCaabrWz1qSfhOIr5DpyOaOdh6jJPuf
         BMiXKrjF2A3xi8615EEfKpsNIw/9A9v1ZYogWWy1PhNof0gGPjxIfmjn8SnceagQmwTC
         /ziE8I1wxZC6391qc94Hyheph+Z+RewOV9xyKtzD6rGlrW1cp/aBheVstExLmZO57RUV
         AbIw==
X-Gm-Message-State: AOJu0Yzwm/5GeqGYEKHQFufnoguLlE0lOz05/HNY8NT3oel4oPyEtEuB
	wka/z8e/LopRNRLc2VAX+Rsu7ksVQeFwOP110rUl4Tnf6+b4qXAOsLqSsK8T3Tg=
X-Google-Smtp-Source: AGHT+IE6srquPpLs7pYrmshLNwkTrg/K5fX158mTO3gom8gACJ+VMdha81C0XgdjubvoXEd1yMpuww==
X-Received: by 2002:a05:600c:1c82:b0:430:699b:7d22 with SMTP id 5b1f17b1804b1-4319ad14d14mr129921815e9.26.1730241249863;
        Tue, 29 Oct 2024 15:34:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbb2:5c44:fa05:1e5f? ([2001:8b0:aba:5f3c:bbb2:5c44:fa05:1e5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd97d77dsm2392475e9.22.2024.10.29.15.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 15:34:09 -0700 (PDT)
Message-ID: <46c758350449ee0da44519d8575c5e245aafd8de.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 14/22] ptest-runner: upgrade 2.4.5 -> 2.5.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Mingyu Wang (Fujitsu)"
	 <wangmy@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Mathieu Dubois-Briand
	 <mathieu.dubois-briand@bootlin.com>
Date: Tue, 29 Oct 2024 22:34:08 +0000
In-Reply-To: <CANNYZj89yS92RVWiu1q+AXpfCdBL7e1RF8MkQxybHY+2qhObZQ@mail.gmail.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
	 <1729834769-4717-14-git-send-email-wangmy@fujitsu.com>
	 <CANNYZj_BGyi_Gz=h_62x2QSU+BWE2Ae-UB_fmbTP6BnVuccscg@mail.gmail.com>
	 <TYWPR01MB11861A53BDFF03E210AFB60E6DC492@TYWPR01MB11861.jpnprd01.prod.outlook.com>
	 <1802B5823947D89C.18751@lists.openembedded.org>
	 <CANNYZj89yS92RVWiu1q+AXpfCdBL7e1RF8MkQxybHY+2qhObZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 22:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206534

On Tue, 2024-10-29 at 12:56 +0100, Alexander Kanavin wrote:
> On Mon, 28 Oct 2024 at 20:46, Alexander Kanavin via
> lists.openembedded.org
> <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >=20
> > On Sun, 27 Oct 2024 at 04:12, Mingyu Wang (Fujitsu)
> > <wangmy@fujitsu.com> wrote:
> > > It was indeed done using devtool upgrade, but the version number
> > > of the resulting bb file is 2.5.1.
> > > Although the version number is recorded as 2.4.5.1 in the bb
> > > file, I deleted that line when modifying the content of the bb
> > > file.
> > > When modifying the patch, I forgot that the actual version number
> > > was 2.4.5.1, so I made a mistake.
> >=20
> > That's fine. But why did you have to modify the file? Did devtool
> > change something that you had to fix afterwards?
>=20
> This has now merged in master :( I'll send a quick fixup.

Sorry, and thanks!

Cheers,

Richard

