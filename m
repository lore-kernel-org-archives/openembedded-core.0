Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347F4CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 11:21:46 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.5925.1759404100461535412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 04:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ip30M5+2;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-579d7104c37so1219388e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 04:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759404099; x=1760008899; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxqdEkE71dud9oM2Eg/FF8xxo+h7nBYg1++CTpuw7oA=;
        b=ip30M5+2rsfVFnp649KK9Vv6MkB4ck5UqBWr4vZDNPn2uC2ut0d4GYOsKNeGWfHhLK
         oAVyECgREdIVh7d39CxefHROKaVTHtJ/pvbLwitRNtrUaqry7dsIoh3Cv984b5TY/HVL
         0IkqlOimJkFlNEPJdD1hi+5/xEZKjQOivYi3BdSev4sgIg8VX20USvffOeloVGNyu+Tq
         ocwu3H6arhd5CqL6dkoAqZewiQMEdQ7df08rmW+6VqVQbp4jl8aiKSQWBQPvOXGTQatD
         yKmmL7eX1Q9oPTDQAFrfva8UNC/yGy5l5LtZIt00ky4gaPCxHsk3ZjL0jzNNjoay03I9
         0Cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759404099; x=1760008899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxqdEkE71dud9oM2Eg/FF8xxo+h7nBYg1++CTpuw7oA=;
        b=BNr+TL2s9JwZWIXOJwd86C5seSir7bQ6IIHdQXVx9maEx7jCyovapSA1lCVY3cVHV+
         yxetqgcd6GEBIsDwidpQtxrrcehA1iJjI8k8QXCQuVU23CKsimGjkLe3EznSthd61mpF
         BV/zkF+tCzdE/fMWEFVO1VZOiW8JSnF7uhISCwdDF55WzMitsO6+5FKPkkHCYxzz9BPE
         4Qy+mW1ZRIjbCxs4ernAOGpDk4Mv24WTF3JO5yuMF22FEGOkPSQjpU7M7JnKWlRUA9b/
         cxk4EpffUraWac2jQRHLV/tHhNrw9QgY2kXEvVm4AoZWBU/W0oPKjgyGbTo3wdxuLP/z
         rEfg==
X-Gm-Message-State: AOJu0YwoBfGxrLcnW6Bhryqs+Rc6DzN01EBAASe2Qjk6G40ypeJkl5dC
	eslfV4CCEYf6JwdKSnSuos13mJftP/Dgcg4yYHBwgj72PJGO0jVJ+o73k4Sgk85fPXkBgMCOSE9
	UD50tE9ae6NvakpJXQ4c+2j58HOonCms=
X-Gm-Gg: ASbGncs+p7adIdUUvhaNOeAkyrVCVTsIHKf/bAxMbw2Aeqee9eQSoSlCKBHRhtRAgZU
	TmKBqCTGTgtbyIA+UQg/N0VvGQXSf9nempWxRuIXZXtOXvzvaCqnDSVG51t/5JdtN1eTwbCcfch
	IFX2WPaUCYaGsA2m8L4jyrID37I7yCgep8kdG5gJRMX8E7ZBI4VjNcegaT7Xv1yI5BFnd7HBCDo
	jm3c7vTY7GNU7l5NxHTIiH7I9oPMpNsYne9KsTuvr9A68vLovkHAaOy8Wn/yw==
X-Google-Smtp-Source: AGHT+IH8Jq1UhD5NV8dAuGVWsBVeGNq3A7vTgkccMScd/Pf4+mDGXzKTUa9IE9SZ/BGOdr/UXGVPKoDTgB5y2ToqOh4=
X-Received: by 2002:a2e:bc85:0:b0:372:9420:9509 with SMTP id
 38308e7fff4ca-373a739648emr17230701fa.15.1759404098298; Thu, 02 Oct 2025
 04:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251002111844.10404-1-zboszor@gmail.com>
In-Reply-To: <20251002111844.10404-1-zboszor@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 2 Oct 2025 08:21:27 -0300
X-Gm-Features: AS18NWA1hNP3V-WLuA7NQ1Q0_j7nRQMn-NI7AwU-Q6WFP2QFx1b2kTAn-ICPDdk
Message-ID: <CAOMZO5CxxJvxRc-f9Ze8FZVYkZV6_O5mqHvHX9Q45cknz1eXqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: 25.3.4
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 11:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224353

On Thu, Oct 2, 2025 at 8:19=E2=80=AFAM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Announcement:
> https://lists.freedesktop.org/archives/mesa-dev/2025-October/226554.html

There's a typo in the Subject line: 25.3.4 --> 25.2.4

