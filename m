Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74983C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 10:37:07 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.35132.1721039826822349347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 03:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JCtbHBdi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3678aa359b7so3095362f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 03:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721039825; x=1721644625; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g9IkuBQBJzpHMwtmd/DoyusCTEkBEdPGQMYBXUWw+ak=;
        b=JCtbHBdiuOFSeh0Ku7lSbqXAu0UCb0qhEl3IcD+C7+h4R2W1b3bsivHzUdogzyPPvh
         +eZDJchKrV65EvYglJ6sU2KYWRvwWVqcw+QyBhyoRAO8fLINvZHyOSYvVNBjSjy8ihfq
         3FEa762JQeE7NuXg9NuWqZCnAlnM7TkObZDZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721039825; x=1721644625;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9IkuBQBJzpHMwtmd/DoyusCTEkBEdPGQMYBXUWw+ak=;
        b=WsdwPzepTD27AUujn6W7DoMjSrUtztq/tebJ3PrwzqR/tbwMCagN0hTf4T7WoxVbEn
         ByYmsiiGMdwnv1ueSBPyoHhWYW7QFw79P9lXCCARCS/q10ITEJZPH+FAI5QDLaRX1Dt9
         a/1fp4a/OtIgoXDpL+P49CAksRLEv1X9AMVjTgr5J3hEmZLkQXbIPC+35FOYjx5GosrT
         Zy+DD6pQkCSnftsyd1aWGHbMjqeVmSzoQOUt+tsBHuTcMu6cSQ6Xr/LQbuY0FNGPju6F
         4M874isF/bz/aHyF9XrDVWC8DlN2NVv2J34UX8I3+25qHb5VI3Zm8+xyufC0oMLzEf19
         lmZg==
X-Gm-Message-State: AOJu0YxaYh2wV7j0ax9xSLoWoYHKY+UUtp6QkspVnfJc61ZoFpdcrcJ0
	ifCYegzhNME8ySwqAeL4NTV/KDrz0SKeayj53jd957+lQj973J5j1UGjth131fk=
X-Google-Smtp-Source: AGHT+IHIqarH5AY16orcPzmyQ4Kvim+o5l5DdCVC/TZhJAW8Q41J2+5G67nYJAjoaWHNGVYkvpXWNQ==
X-Received: by 2002:a05:6000:cc:b0:362:69b3:8e4d with SMTP id ffacd0b85a97d-36804fd37cemr6442337f8f.25.1721039825031;
        Mon, 15 Jul 2024 03:37:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b820:e15f:2b8d:2478? ([2001:8b0:aba:5f3c:b820:e15f:2b8d:2478])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf445sm6034248f8f.46.2024.07.15.03.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:37:04 -0700 (PDT)
Message-ID: <e49942ebd6e0a59880819dfe39ced869b12d7aad.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/1] gfortran: update runtime dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai <kai.kang@windriver.com>, Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2024 11:37:03 +0100
In-Reply-To: <6a947a6b-4052-413a-bd90-fb460be51ce5@windriver.com>
References: <20240616153135.3058410-1-kai.kang@windriver.com>
	 <20240616153135.3058410-2-kai.kang@windriver.com>
	 <17DA6AA6C1087792.28936@lists.openembedded.org>
	 <CA+chaQexmQso_xy45yCMU_EsVDq9RsX+qmmuuVb3r8ur3XQe4A@mail.gmail.com>
	 <7001a7c7-f500-49bd-ae2b-711d42a97f06@windriver.com>
	 <CA+chaQczh+jy5tEz67r+dcLUJzV=tpnbMad3dHGGR1+KOmLFbw@mail.gmail.com>
	 <6a947a6b-4052-413a-bd90-fb460be51ce5@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 10:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201911

On Mon, 2024-07-15 at 18:20 +0800, Kai wrote:
> On 7/15/24 17:59, Martin Jansa wrote:
> > Hi Kai,
> >=20
> > are you also seeing these buildpaths warnings from libgfortran?
> > These
> > will be fatal since ERROR_QA update from yesterday:
> > https://git.openembedded.org/openembedded-core/commit/?id=3Db79b191cc43=
a45dde2adb61ea349b426cb2461d1
> > and it probably wasn't detected in AB builds which might not enable
> > fortran.
> Yes, it seems exists for long time. My colleague worked on it for=20
> several days. But it seems hard to resolve that
>=20
> host path are somehow set to the intrinsic path.
>=20
> I'll discuss with him tomorrow and check if we can fix it.

We're seeing these in automated testing now too.

I'm wondering if adding -ffile-prefix-map might avoid them. Sadly there
are tools which don't support that option so it isn't an easy thing to
add/test.

Cheers,

Richard

