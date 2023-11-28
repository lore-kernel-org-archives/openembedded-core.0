Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E299C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 17:04:37 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.38582.1701191069612186296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 09:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jePfRAqg;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1fa486a0e10so1613750fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 09:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701191069; x=1701795869; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RH0P/NeKd7gEkT6ViGhif+p2NEpwtAsGdQ9Oode5e5I=;
        b=jePfRAqgoHMnB30ecHZiFhczmR0/3Wsa/9ByrufU5xQ6fvUvoW5XCfs+UC1kPhBELn
         TtcpR5EwLzv5EaBeluqBo4g68LsVg78MpsWP3lvxtuAL8CfxQcU+01S3RaIWCRGeGBPj
         cQz1yD05bm3CruQyXL4TM+29FrMZ8O2Z9VQ5zTgdSk8FL+6j7Vu77uDHRkiyAouM3iOx
         ILofq+OAaQ4ElUqPAOY8LaBfUnDXgThUhxnFDisYGvPPx3Bz5JiihSMFXaOMiRBRmfr+
         RPlgIm2dcvVFsrRGQ7XuUNkEnVLlQUbAF5CtpoQ7ZvKETEwLz4CyEqX9CV4Bu6eikzW8
         lU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701191069; x=1701795869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RH0P/NeKd7gEkT6ViGhif+p2NEpwtAsGdQ9Oode5e5I=;
        b=fssGUHGHvTC4XQeqI4kK52/4o9xyWk61oodNZL6kAyR2Ue0HYpb80omczgWJ3JJuwp
         10+By5WMs4EfWy5EEWIaILtDiL2VZuYU0vrsdqfu/M4ZMCqL69HYz9S5OYNl2Gadn7h8
         t2R9U2NTS3SJpsMcSr5UxVwpkrM/Jq1VJNbH7Aj60iLPv0OSlmq2UGPP82VWsdaWhzzR
         /G9hjJaddmBpbbbRmiPp/sdBvV6/JpVmU6/1Bxp2n3BiDFon7OdnPf6ojUBE/B5MbWJw
         4hymE3zaMdB6/egpnCaDQSr3QkWvGK5UaqQIFyUlRiLl4BuHFrN07To7BNyFf0UBwUMs
         Mu6Q==
X-Gm-Message-State: AOJu0YyCFLwZt45L7U5/K+jU1gVJN/8BC+Wm2W91nLgdlhbrJu8kwL6Q
	yCF8vHc6/x4VYjLb9QWhQA6XJ8jEa3k7Yg7Iilo=
X-Google-Smtp-Source: AGHT+IHS1cntPgvwDDd9uRFghCsGO89KffpzNzUqnNVsts89dBk0SVpCEOqkp3bc38do6A1qA+MISsshIDfuT4DR0jA=
X-Received: by 2002:a05:6871:5824:b0:1fa:26b7:af18 with SMTP id
 oj36-20020a056871582400b001fa26b7af18mr13456058oac.17.1701191068578; Tue, 28
 Nov 2023 09:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20231128074201.40056-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20231128074201.40056-1-alexander.sverdlin@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Nov 2023 09:04:02 -0800
Message-ID: <CAMKF1so77eVJx+xmy62X==DUtGbCNySjRQPqminWYBSW23q5WA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] rdfind: remove (move to oe-core)
To: alexander.sverdlin@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 17:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191380

please send it to oe-devel mailing list,

On Mon, Nov 27, 2023 at 11:42=E2=80=AFPM A. Sverdlin via
lists.openembedded.org
<alexander.sverdlin=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> Newer linux-firmware (oe-core) requires rdfind-native, move the new
> dependency to oe-core as well.
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb | 13 -------------
>  1 file changed, 13 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb
>
> diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb b/meta-oe/rec=
ipes-support/rdfind/rdfind_1.6.0.bb
> deleted file mode 100644
> index 3a15fe6c9..000000000
> --- a/meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SUMMARY =3D "Rdfind is a program that finds duplicate files"
> -HOMEPAGE =3D "https://rdfind.pauldreik.se/"
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfa22e16ebbe6638b2bd253338fbde=
d9f"
> -
> -DEPENDS =3D "nettle autoconf-archive"
> -
> -SRC_URI =3D "https://rdfind.pauldreik.se/${BP}.tar.gz"
> -SRC_URI[sha256sum] =3D "7a406e8ef1886a5869655604618dd98f672f12c6a6be4926=
d053be65070f3279"
> -
> -inherit autotools
> -
> -BBCLASSEXTEND =3D "native"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191336): https://lists.openembedded.org/g/openembedde=
d-core/message/191336
> Mute This Topic: https://lists.openembedded.org/mt/102846946/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

