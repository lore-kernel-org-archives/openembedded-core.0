Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEC4C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:02:45 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.8125.1662559356482319002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gK0KZzxE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id bp20so20068921wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=Cc5Nx+uqgAi/VzRQ4A70m3RJukGFMiyP2BlO86DI5Co=;
        b=gK0KZzxEIwlVmHdyNHwcGk5wQPVHEKReOE3ivSri0kIlZdRqmX1Nsnt1oF+YKm84PR
         NDgl/iz6jexoyo3mqw+SOahsDfUMkolb46Ul5Dae1AGGbBb5PBewvvLVh9RGtMCUIicI
         jwZt9oYZ7I7FHaL+CLnUhcSATYasekEk89fmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=Cc5Nx+uqgAi/VzRQ4A70m3RJukGFMiyP2BlO86DI5Co=;
        b=SRQm6mc3eeD3tCXpE+YM0N8/6m7i5UmmgPYI9vlUWHJtgP6+rRW6sp5pkfFECjd2Tq
         E4TiIobZQz0mXUqAcxjM26L/D0mURMvFZBD8rcztQ9muuHKvwxOMNPcPZMNUQeDeAiUq
         BbceTbS4dcqwsX1xcG5RW8mUuaNkaqLY1PQh+Dmj3NjXdVq1aDeymvR2qm6HoAcJxwbG
         kmdM0eYCedK9hOvjjV0wsYCj2rWtq8P5tpykSCs6JKiSecM2zygxNGUTVBPmKfX84MFi
         nqgWoDseozrii9PoyD/uN2XNqKXfitXz7YH40x9sQxxw7nZ9Zn6/zey3PxR8RusuHdaI
         eCwQ==
X-Gm-Message-State: ACgBeo3i++k4IwUiMDdzkQwagLL/L5/iCoKUhhcWLeNF7jGCQ6i4sw90
	f+WDLL70fb/udYxZFk2AlHLcJA==
X-Google-Smtp-Source: 
 AA6agR5DrDPPgScWr2D630/NKddY89uGrvgOv/2rZt/xRerMjOeIXZuu4lomeZ6uEfaWK/dRhZSujw==
X-Received: by 2002:a5d:59a8:0:b0:228:dfe7:64f0 with SMTP id
 p8-20020a5d59a8000000b00228dfe764f0mr2241597wrr.308.1662559354765;
        Wed, 07 Sep 2022 07:02:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb69:bb70:edb:6315?
 ([2001:8b0:aba:5f3c:eb69:bb70:edb:6315])
        by smtp.gmail.com with ESMTPSA id
 e7-20020a05600c4e4700b003a60f0f34b7sm19781380wmq.40.2022.09.07.07.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:02:33 -0700 (PDT)
Message-ID: 
 <507380539cd784f515982c3fa9a5798bac45b8dd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] gcc: remove obsolete 0012-export-CPP.patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Wed, 07 Sep 2022 15:02:32 +0100
In-Reply-To: <20220907130207.2258074-3-ross.burton@arm.com>
References: <20220907130207.2258074-1-ross.burton@arm.com>
	 <20220907130207.2258074-3-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:02:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170393

On Wed, 2022-09-07 at 14:02 +0100, Ross Burton wrote:
> This patch is no longer needed, the upstream Makefile exports CPP from
> CPP_FOR_BUILD since 12.1.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/gcc/gcc-12.2.inc        |  1 -
>  .../gcc/gcc/0012-export-CPP.patch             | 50 -------------------
>  2 files changed, 51 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0012-export-CPP.patch

Someone convinced upstream to fix that:

https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D84401ce5fb4ecab55de=
cb472b168100e7593e01f

:)

Cheers,

Richard

