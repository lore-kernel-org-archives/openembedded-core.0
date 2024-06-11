Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E795C27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 08:50:15 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.4865.1718095809779321346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 01:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aii9GMQR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-35f1c209893so2813808f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 01:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718095806; x=1718700606; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9Af+Gz2L7dRFrkwUaBnQFWszc6zSNu1ghlz6SdIGgs=;
        b=aii9GMQReJvLMor56BtnDJNyCQ01ZFxvxr2cRSGbTyOj1QB4IGUCJTX/nyn7Ncb4yk
         Otgt1GE2M2PWQ2SHLZ+lSOXm1M4p2LAzQArXW5SBl/uf6EBPLV5O5l61BvVpJotiImDV
         rabqq06mhCmHvhzFI3SrXl1OPQoRvcTncMNK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718095806; x=1718700606;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w9Af+Gz2L7dRFrkwUaBnQFWszc6zSNu1ghlz6SdIGgs=;
        b=a6bRwkgpjFyCj6LzcohtYNQqlSQsK/cuL4ebqFjsozx1V86m8V1HHKcqMNbi26cMy7
         CJ+AnXK1P2RyR7UoSCEDQeFJ6FSa//n4qeQXUNQGxflwFngIpktWFmamhCmEJb/uWzjj
         yNvvi5vRecDyXn/IrgxYXfb/1oJkU75nLJnCCcESCB+nyNM4n6CsCD3fyYNKnx84kOFV
         PqxwRKL/OHOMt3fVFjpfoMA3rodW8+mKtvepXPVhfjcBKzkfd6lqHA9Z7ChjOv6dG4Wc
         xOeWG5Cv3+iOkYBjEPWnzjtS3P3RuIGaUcFvEGBV+5Dt5BMg93tuPcM0jq5cqutHfHj4
         GHtw==
X-Forwarded-Encrypted: i=1; AJvYcCUbOkc9kVCrw9AxL5I4mHRkbsE6/mfK2oVVZtfN4VgeqhQ6BY9ONIjv5VCzmOIDL/hzmb/PG2GpQdsO4yeCrDFO9TjayEx3b4aoXAvjCOfS9Oe5+cuLPoeK
X-Gm-Message-State: AOJu0Yxdc+NBCuMvtNvfhvgxC4le6ZSB4X/3oHNpJDKXbcQlKhlAzEH/
	gH9lfANd24qgYHSJm2Pz1Bfz5Th+ebL/Vl9RcXOmwhkIRgFwjWTufC0LNahZn2E=
X-Google-Smtp-Source: AGHT+IGDbl7nTMupf46q6aJ3oJmLDtzrnl1DR1Uvzqfv3UgJ5V5cWLNiXulLIb+ngBSDaBtXAxIZiA==
X-Received: by 2002:a5d:4ed1:0:b0:35f:1eba:cf66 with SMTP id ffacd0b85a97d-35f1ebad093mr6105732f8f.61.1718095806215;
        Tue, 11 Jun 2024 01:50:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d58d:9b4d:d265:3c2e? ([2001:8b0:aba:5f3c:d58d:9b4d:d265:3c2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215814e7cbsm204350765e9.39.2024.06.11.01.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 01:50:05 -0700 (PDT)
Message-ID: <b58f0cbac90ff787b4dbc9756c30348e38d53433.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/6] Add SPDX 3.0 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2024 09:50:05 +0100
In-Reply-To: <20240610214456.2757397-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 08:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200494

On Mon, 2024-06-10 at 15:41 -0600, Joshua Watt via lists.openembedded.org w=
rote:
> This patch series add support for SPDX 3.0. Currently it is not possible
> to have SPDX 2.2 and SPDX 3.0 enabled at the same time; users may choose
> to specifically use SPDX 3.0 instead of 2.2 by doing INHERIT +=3D
> "create-spdx-3.0"
>=20
> The default version is not changed yet, although that will likely happen
> soon

Does this series depend on other patches?

Cheers,

Richard

