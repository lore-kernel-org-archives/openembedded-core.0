Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAB6E8FDB1
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 20:05:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.794.1696363509536254972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 13:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SyW0FbrC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-406589e5765so13284335e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 13:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696363508; x=1696968308; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2ADTsE0KD7f7QXnO8cQk0/Ljl6gq4Z2PH5FM+00PFI4=;
        b=SyW0FbrCEh+vE24ix/Q1TuvswtlJFEnxJ89IWzTZN4Icmd/WKIjln1Fheo58TIDa6u
         wz1nHYdLUxFG9CP4wp4mqm59r3KBQIuo3NeS41P/h/lynaMj9wYLELxwyFf4mI+btmPx
         OB0N7HWWDYeZeyEh5ouEH3SzgU7rJeHLvYTmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696363508; x=1696968308;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ADTsE0KD7f7QXnO8cQk0/Ljl6gq4Z2PH5FM+00PFI4=;
        b=hMGx20RW8woYZ53nT62c6QgelCoqO3S6eHhbd5iI59pYGGbnDmfYQnrQmNgXfuIVoD
         E9YHAybHeGIrAG5dclm9YlKq9ete5Bu0QUc5jfNjYf3Oe+6eeZO09RIt/bN8gS16Y+Mh
         ZHS+9HfUyL6GxvzBWQ/Xq+aLUdEoy8qCTiR33jewGtIt+5vJdWoSd0lKUP6aew9ZtLhU
         K0AB4VjrN29NGGIU0+/rEroUL1Rb/HP6DBBhu/feIqoHaQhCi+C5kUJz1R2+ne+alMfI
         FjgAVO32xcrNtRbgdnbCoRrgysTedNBvCSUGstYWae0eT/0r6syDKZFUyfym5w/x3eFg
         9Cwg==
X-Gm-Message-State: AOJu0Yz1hiGbh+VWjd0Q1uBDJpBkbw1oYPfrzQKVF9MKNy+u4sjHyDNm
	OmzhBFD5nxl+iDsLtkjyha9w/Q==
X-Google-Smtp-Source: AGHT+IEBG5lq86iF7pfZjqsFnL6OUgFSigdUcXbA/q/kNOu6sIU/yCAYsuqe0mBQRsP58eAye+tvIQ==
X-Received: by 2002:a05:6000:12d2:b0:321:6953:6ae4 with SMTP id l18-20020a05600012d200b0032169536ae4mr247050wrx.37.1696363507840;
        Tue, 03 Oct 2023 13:05:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc7c:410f:894f:7a55? ([2001:8b0:aba:5f3c:cc7c:410f:894f:7a55])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d5507000000b003247f732c11sm2282504wrv.76.2023.10.03.13.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 13:05:06 -0700 (PDT)
Message-ID: <9fee63c4b894f28196039ee62db3b0f1b8e28203.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3] glibc: stable 2.38 branch updates.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com, 
	Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Date: Tue, 03 Oct 2023 21:05:02 +0100
In-Reply-To: <20231003030917.3593279-1-Deepthi.Hemraj@windriver.com>
References: <20231003030917.3593279-1-Deepthi.Hemraj@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 20:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188661

On Mon, 2023-10-02 at 20:09 -0700, Hemraj, Deepthi via
lists.openembedded.org wrote:
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>=20
> Below commits on glibc-2.38 stable branch are updated.
> 0e1ef6779a (HEAD -> release/2.38/master, origin/release/2.38/master) manu=
al/jobs.texi: Add missing @item EPERM for getpgid
> d94461bb86 string: Fix tester build with fortify enable with gcc < 12
> 63250e9c57 iconv: restore verbosity with unrecognized encoding names (bug=
 30694)
> 00ae4f10b5 getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806=
)
> b25508dd77 CVE-2023-4527: Stack read overflow with large TCP responses in=
 no-aaaa mode
> 89da8bc588 NEWS: Add the 2.38.1 bug list
> d3ba6c1333 elf: Move l_init_called_next to old place of l_text_end in lin=
k map
> 750f19526a elf: Remove unused l_text_end field from struct link_map
> a3189f66a5 elf: Always call destructors in reverse constructor order (bug=
 30785)
> 7ae211a01b elf: Do not run constructors for proxy objects
> 92201f16cb libio: Fix oversized __io_vtables
> 5bdef6f27c io: Fix record locking contants for powerpc64 with __USE_FILE_=
OFFSET64
>=20
> 0024-CVE-2023-4527.patch is dropped
>=20
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>  .../glibc/glibc/0024-CVE-2023-4527.patch      | 219 ------------------
>  meta/recipes-core/glibc/glibc_2.38.bb         |   1 -
>  3 files changed, 1 insertion(+), 221 deletions(-)
>  delete mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patc=
h

I suspect that as well we deleting the patch, you need to add something
like:

CVE_STATUS[CVE-2023-4527] =3D "fixed-version: Fixed in stable branch update=
s"

otherwise we'll see CVEs reported against this again?

There may be other CVEs which need adding too?

Cheers,

Richard

