Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746D6E8FDBB
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 21:26:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.2734.1696368371551122415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 14:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=geOpohFr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4066692ad35so13881955e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 14:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696368370; x=1696973170; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YjQGKY0G/l/UE+vnCGmQ993KfwNnZWEPn44jIU6MhiY=;
        b=geOpohFrg4mfw/xB1BjBsrjB7KoPtvaX9NnJt0CjclRAq+W4zws64vU7jetKh8nEHH
         8lmXF1TrAT+k4NmEb0fsZWdorq+X5Xv12MtdDTV5QuXmEq6toU51Dw4xBiTG059IhOGJ
         M9ZgsBBMWmq4dJ+4J1GrOozGb8SotuNzN3mnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696368370; x=1696973170;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjQGKY0G/l/UE+vnCGmQ993KfwNnZWEPn44jIU6MhiY=;
        b=VgZaFN+WCSU4toSHbHkaO8Atgl5Uqe1XNN9MOkbiUiBndpRIGq529/y+WKWtogd5ko
         MXQ0PleOdyU11x4TRHHMYVpepfjIL+TapJqzckn5obWTW4f9oYosD6vY/cE/KpqtlzmM
         B0uRfkR9WEnjhPuPFWY9OihGULUzjFi2/zDu4I8LqpxsoZ5NbzNoS2gJ5WBrNlZrWOnA
         fQkOIp+p9NGL//neWFt1eSxMVZjB5m06/PsW0EIUndSAOkZkOwTHZ9mUzBM9WyuksSYY
         bLRqji5BfiZayrZO0cueC7bugZvNpKmBNUr8sWbWT/OLHy+nS89txpwXDNjDW9hJ6hxX
         DhoA==
X-Gm-Message-State: AOJu0YyEXH4qTqBTbwbaXDApzHRDiMnOvzcJLKLcLvBHxpiZuCoNWEbb
	T/bscQ+uyuVAAzy9qBDgPtPWTDAn8siu9m9FE98=
X-Google-Smtp-Source: AGHT+IHNLobD4FZU0z8XZVGURjVrMf5gFIZDPrvthofM5CH4xRDAQVEv6AvhIdX5znYu2slrAoZqJw==
X-Received: by 2002:a05:600c:2113:b0:402:e6a2:c8c7 with SMTP id u19-20020a05600c211300b00402e6a2c8c7mr670544wml.7.1696368370024;
        Tue, 03 Oct 2023 14:26:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc7c:410f:894f:7a55? ([2001:8b0:aba:5f3c:cc7c:410f:894f:7a55])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b004060f0a0fdbsm53217wmi.41.2023.10.03.14.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 14:26:09 -0700 (PDT)
Message-ID: <99cd6be931380e600d21380ee0d2250f853ef15a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3] glibc: stable 2.38 branch updates.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com, 
	Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Date: Tue, 03 Oct 2023 22:26:08 +0100
In-Reply-To: <178AB19FE2AFFC45.17086@lists.openembedded.org>
References: <20231003030917.3593279-1-Deepthi.Hemraj@windriver.com>
	 <178AB19FE2AFFC45.17086@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 21:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188664

On Tue, 2023-10-03 at 21:05 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2023-10-02 at 20:09 -0700, Hemraj, Deepthi via
> lists.openembedded.org wrote:
> > From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> >=20
> > Below commits on glibc-2.38 stable branch are updated.
> > 0e1ef6779a (HEAD -> release/2.38/master, origin/release/2.38/master) ma=
nual/jobs.texi: Add missing @item EPERM for getpgid
> > d94461bb86 string: Fix tester build with fortify enable with gcc < 12
> > 63250e9c57 iconv: restore verbosity with unrecognized encoding names (b=
ug 30694)
> > 00ae4f10b5 getaddrinfo: Fix use after free in getcanonname (CVE-2023-48=
06)
> > b25508dd77 CVE-2023-4527: Stack read overflow with large TCP responses =
in no-aaaa mode
> > 89da8bc588 NEWS: Add the 2.38.1 bug list
> > d3ba6c1333 elf: Move l_init_called_next to old place of l_text_end in l=
ink map
> > 750f19526a elf: Remove unused l_text_end field from struct link_map
> > a3189f66a5 elf: Always call destructors in reverse constructor order (b=
ug 30785)
> > 7ae211a01b elf: Do not run constructors for proxy objects
> > 92201f16cb libio: Fix oversized __io_vtables
> > 5bdef6f27c io: Fix record locking contants for powerpc64 with __USE_FIL=
E_OFFSET64
> >=20
> > 0024-CVE-2023-4527.patch is dropped
> >=20
> > Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> > ---
> >  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
> >  .../glibc/glibc/0024-CVE-2023-4527.patch      | 219 ------------------
> >  meta/recipes-core/glibc/glibc_2.38.bb         |   1 -
> >  3 files changed, 1 insertion(+), 221 deletions(-)
> >  delete mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.pa=
tch
>=20
> I suspect that as well we deleting the patch, you need to add something
> like:
>=20
> CVE_STATUS[CVE-2023-4527] =3D "fixed-version: Fixed in stable branch upda=
tes"
>=20
> otherwise we'll see CVEs reported against this again?
>=20
> There may be other CVEs which need adding too?

Since there appears to be a serious glibc issue we need to patch, I've
gone ahead and added an update on top of this patch to pull in the new
urgent pieces and set the CVE_STATUS accordingly. Please follow up with
an additional patch for any other CVE_STATUS pieces I didn't cover.

Cheers,

Richard



