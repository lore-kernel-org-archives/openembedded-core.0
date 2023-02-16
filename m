Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3632C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 14:15:00 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.10883.1676556892926934822
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 06:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=StEu+TdV;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id c2so2205136qtw.5
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 06:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=19TKb6hHvWPYy8tXavITNdufQYvF02xFlidFoovO3PY=;
        b=StEu+TdVIkPoXDATQ2Ze6pegwhpFdzr3WqnDqIwkWuk3KZH9FPilKdHJTFICPfvNki
         sgdVboDOdZ+45fmAhyYwk6WjZkfLsYvbthyY3fyXvjCOguTk4cz7q7fCT+AxehDAgu7s
         IAMuYrFoX611Nl+yU2AqgGMpCqGLKPpKgZOpPOYEg1dtw5WE/IuMbafGQp4dhwGUP8N7
         fBTeFq79iEDmgKFtFOJxrdpldFM7+z3EBZAsPh7GsLEsgjuLN5TbfDiz+073ZVQKxQ4A
         w5b7W8vJ9Cw1ScYfQTeMuU8PRNHdmNdnmkt587zxVr+UlKNATWcXEoFSE4qbaYrjO4Bd
         /wdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19TKb6hHvWPYy8tXavITNdufQYvF02xFlidFoovO3PY=;
        b=nua+zEnED9KfYNGzcB0dUxYdHS6ClIJAkg0GIFBLpXtJVOfytcxpDPsbxNu204f97l
         u7OJrO59KgCBsx61SfXby/ZHx7uMBYKZk+RLYCnsc8YEqAPGXhx+nll0YbCE2CqHC/YE
         Omz1RnyIARW1TRSVAgg0oRbVzQkiLUJLChmOG73/cg8b8RfxZffssiG4rXntdbbEA69G
         X4/MYiIoy/JsxMEdNSwQLD8nlolt8zfmh6a0mfICA7J+19D+ozgkLaMDsRm7BuGl4cdO
         wsy9GSkkRbMbcibQGGq7eTwB6ArYRWt82nOYX86MOwcNiKUoNmNKynTk0F/4k/UeW4HG
         oNHw==
X-Gm-Message-State: AO0yUKXSmEQkt+C4HXvj+0zoNogBWC8tP7sHeIyfoF7xOgV4/BoGcHFD
	F0j8frby4n5yLXyc3UOV6OHN4cIDfqQ=
X-Google-Smtp-Source: AK7set9qa7HIqtvpiUCutT9IFataAL06voTrd7XkhWxYd+Mhh69kZ0KMeXjng8A4uah0/u8a2FBBHQ==
X-Received: by 2002:ac8:5c86:0:b0:3b8:5810:561e with SMTP id r6-20020ac85c86000000b003b85810561emr9288631qta.6.1676556891932;
        Thu, 16 Feb 2023 06:14:51 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id s200-20020a3745d1000000b006fed58fc1a3sm1222946qka.119.2023.02.16.06.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:14:51 -0800 (PST)
Date: Thu, 16 Feb 2023 09:14:49 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 1/4] dtc: version bump and add python wrapper
Message-ID: <20230216141449.GA12438@localhost>
References: <20230214183101.33761-1-twoerner@gmail.com>
 <a8e26944-63a6-6160-2bbd-e1fc93f30144@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8e26944-63a6-6160-2bbd-e1fc93f30144@theobroma-systems.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 14:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177288

Hi Quentin,

On Thu 2023-02-16 @ 10:23:07 AM, Quentin Schulz wrote:
> Hi Trevor,
> 
> On 2/14/23 19:30, Trevor Woerner wrote:
> > Bump the version of dtc from 1.6.1 to to 1.7.0.
> > 
> > Add support for building the python wrapper around libfdt.
> > 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >   ...tdump-fix-Werror-int-to-pointer-cast.patch | 40 -------------------
> >   meta/recipes-kernel/dtc/dtc/0001-meson.patch  | 37 +++++++++++++++++
> >   .../dtc/{dtc_1.6.1.bb => dtc_1.7.0.bb}        | 18 +++++----
> >   3 files changed, 48 insertions(+), 47 deletions(-)
> >   delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
> >   create mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson.patch
> >   rename meta/recipes-kernel/dtc/{dtc_1.6.1.bb => dtc_1.7.0.bb} (51%)
> > 
> > diff --git a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
> > deleted file mode 100644
> > index 4c3e34b1ffd2..000000000000
> > --- a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -Fix the build of fdtdump with mingw.
> > -
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -From ae0ce1fa7f4d679b5f8df1fc0e797246e43547fe Mon Sep 17 00:00:00 2001
> > -From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
> > -Date: Wed, 25 Aug 2021 16:13:50 +0400
> > -Subject: [PATCH] fdtdump: fix -Werror=int-to-pointer-cast
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=UTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -With mingw64-gcc, the compiler complains with various warnings:
> > -error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> > -
> > -Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > -Message-Id: <20210825121350.213551-1-marcandre.lureau@redhat.com>
> > -Acked-by: Rob Herring <robh@kernel.org>
> > -Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ----
> > - fdtdump.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/fdtdump.c b/fdtdump.c
> > -index d9fb374..483f367 100644
> > ---- a/fdtdump.c
> > -+++ b/fdtdump.c
> > -@@ -21,7 +21,7 @@
> > - #define MAX_VERSION 17
> > -
> > - #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
> > --#define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
> > -+#define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
> > - #define GET_CELL(p)	(p += 4, *((const fdt32_t *)(p-4)))
> > -
> > - static const char *tagname(uint32_t tag)
> > ---
> > -2.25.1
> > -
> > diff --git a/meta/recipes-kernel/dtc/dtc/0001-meson.patch b/meta/recipes-kernel/dtc/dtc/0001-meson.patch
> > new file mode 100644
> > index 000000000000..10c4f8706194
> > --- /dev/null
> > +++ b/meta/recipes-kernel/dtc/dtc/0001-meson.patch
> > @@ -0,0 +1,37 @@
> > +From faa02d4a60859089017bf92e0e3f49d600c44d73 Mon Sep 17 00:00:00 2001
> > +From: Trevor Woerner <twoerner@gmail.com>
> > +Date: Sun, 12 Feb 2023 14:37:04 -0500
> > +Subject: [PATCH] allow pylibfdt in cross
> > +
> > +Allow pylibfdt to be built even in cross-development scenarios.
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +
> 
> Is this really inappropriate? Cross-compilation is not THAT niche anymore
> that people aren't open to support it?

I guess not. The way I looked at it was: they put in an explicit condition to
not cross-compile, I guess they know what they're doing ;-)

> What about opening an issue/ticket
> upstream and see what they tell us?

Yes, I will do that.

> Or do you already have such info, in
> which case can you give a link to this justification here?
> 
> Cheers,
> Quentin

