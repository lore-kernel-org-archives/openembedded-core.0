Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E8AC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 13:48:07 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.68628.1722520078316066157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 06:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aZpNMrL8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so38105585e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 06:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722520077; x=1723124877; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oJcK95VRkuADlwbdJJZSomBQYl8ZfrPEWMgGKE4Ur0U=;
        b=aZpNMrL8WYwCxP7OhsZBdCjVnrgmbzN7thKIaE+4OKn9yKHRduaUBJq4QGJvcb2cu6
         LYLjL0WlE+JJeeqk/SKgeXEmxw/Myge8v45ajzKXRZLZiiTvWuZPerKXIi1xKVO7Y1sP
         zlvH36TPJGQEeOg0IDLu39yoNfn3z/5FA3aOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722520077; x=1723124877;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJcK95VRkuADlwbdJJZSomBQYl8ZfrPEWMgGKE4Ur0U=;
        b=R7bP4hmJyqk+h4mfxUV8LJ/MnpYWQqDmJrXb2THpTynUuNryP3iPS2OPY+VbKge/3a
         oeEda0yrCHrUKtyiWnhzWCB2Ec1uKeXjiErnFT2eITM4ql1LEN6ZpHEJsEaP+iEkv9IJ
         jJCW3f/9C+xA4C9OYKT/KbMMovRLGPNL65ATDXIyJaphqKnBrMyRSNCT8va+c+zlg5Bc
         rUWq348ATvHd7TO9A+K3x0GaVoBUyALs89M7i8dR4F5cH2QzXcex8Wv5806jfSLP+0Jj
         qKp+d+NW5sZEr/YnOV01nvazuWGf1WZLCwwTiwnB34zc5sviwwuj9PwKfV+EDoEg0ovc
         gFsA==
X-Gm-Message-State: AOJu0YxgEEm5y11sYy/+yPvaI4+TOQ9ULgQR76qdntmk1Flvx39FxF+h
	VYwBPBQCDlC3GSSubFkoRsi5Eb3ybLNiJ/ucoVttW9a+kdOn3Q9Jw6AJI6SRT6PfEcq9Fr8KCUy
	UQFc=
X-Google-Smtp-Source: AGHT+IHjxPkYUh0lVOgoXm+B7VfezIM+IIcmzVpNbTp8YEcIFEAoxyN6CZXWIh8V/J3QNF8iqRl45g==
X-Received: by 2002:a05:600c:4ecf:b0:426:554a:e0bf with SMTP id 5b1f17b1804b1-428a9bdd0a5mr20439505e9.16.1722520076604;
        Thu, 01 Aug 2024 06:47:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f1c:86e8:7d42:8e2f? ([2001:8b0:aba:5f3c:6f1c:86e8:7d42:8e2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b8adaadsm59879485e9.12.2024.08.01.06.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 06:47:56 -0700 (PDT)
Message-ID: <606d5852aec8e7bb29350cfb27aa3df8f706dc72.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 5/5] cve-extra-exclusions.inc: add
 deprecation notice
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rybczynska@gmail.com, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Marta Rybczynska
	 <marta.rybczynska@syslinbit.com>
Date: Thu, 01 Aug 2024 14:47:55 +0100
In-Reply-To: <CAApg2=S_2uiyd=g2Zn6RQBvBxDc-iRKFSZmpWBZWJx1M0RjYgQ@mail.gmail.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
	 <20240724152530.25856-5-marta.rybczynska@syslinbit.com>
	 <44B6F27C-F828-46B0-8DCB-FCE37FB8DC9D@arm.com>
	 <CAApg2=S_2uiyd=g2Zn6RQBvBxDc-iRKFSZmpWBZWJx1M0RjYgQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 13:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202735

On Fri, 2024-07-26 at 14:28 +0200, Marta Rybczynska via
lists.openembedded.org wrote:
>=20
>=20
> On Fri, Jul 26, 2024 at 2:24=E2=80=AFPM Ross Burton <Ross.Burton@arm.com>
> wrote:
> > On 24 Jul 2024, at 16:25, Marta Rybczynska via
> > lists.openembedded.org
> > <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> > >=20
> > > This file contains CVE_STATUS without machine-readable
> > > information on which
> > > recipe it applies to. All entries should be verified and, if
> > > appropriate,
> > > moved to their corresponding recipes.
> >=20
> > The point of this file was to be an opt-in for more exclusions
> > where we didn=E2=80=99t feel 100% confident asserting the issues could =
be
> > ignored.
> >=20
> > How much of a problem is it if this file contains a a limited
> > number of CVEs?=C2=A0 We can review what is in there and move/remove as
> > needed to cut it down.
>=20
> With the vex class (and with SPDX too, I think) they end up copied
> present in every single package of the build. This brings enormous
> confusion.
> Impossible to filter them out as there is no information about the
> affected recipe/package.

Difficult, yes, impossible, no.

Surely we know which recipes a given CVE apply to?

Cheers,

Richard



