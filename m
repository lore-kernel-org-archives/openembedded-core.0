Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D9ED1812F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 16:23:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.1246.1728923019291915609
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 09:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZjFzol4O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43057f4a16eso38958435e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728923018; x=1729527818; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rFwp8HwvVn9NX4QRhG68d0XUi5IBQ+t/LRv6eX1YZlI=;
        b=ZjFzol4OZbnAuGYeFI/V5xU+0jsGJLWhsJWQ4ihWs1quihnwLrQzVHzyxi1RrLMgaE
         SYzb4w10CjJZaPRu37S6SpgjwxGblEedOpuLP9Ks9r4bET/lPRjrNQF6O3BFVuUjiDZg
         GWTZk401dEeifYQVC2RjhEWFm3aeJmAM2imh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728923018; x=1729527818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFwp8HwvVn9NX4QRhG68d0XUi5IBQ+t/LRv6eX1YZlI=;
        b=Tg/Ty6L6tDwcQa/CFzp7s/3elPWRmVy70nhremACpqju540t40BDeMFwqd53XD3UIH
         jk8DqHUJs6C9OCzt/Br5iOBeLjNuwA+qOxi/lg4HI8d910pcJ9XaTIHl7cSGxmvPKcfQ
         UG+yx1C35BR0mTIiX66vIWb7648gp2qq/cVA4y3/rhuOi4fW+2HwrMk1Lbi93MPpOWf+
         3o3HrqPTFQuwtA+upAoT2FIHkhKZdIhGcFL9y84Ql9gKgl9DgObn/l395CTY8aPTuEN9
         7/l8pbMzOtnQhDgmW5TpZiGIbvN3lhKVGiiDart5BHEKIJBZ+ZarWLOzcFqVsGenBpP7
         w6Yg==
X-Gm-Message-State: AOJu0Yz3e3VjNpR/HhPW3zdQPRkWQViEV2y5PsIAvJIXrMh9GihA1bI1
	JD1xJ+LDncECxGfWFVqSZZ9VhcoXA1+VZiGQ9zJGzW3Ykhgp6uxiW0pkve2f4Mk=
X-Google-Smtp-Source: AGHT+IEuGN9QvzF4P+UlfjdtS6o5E9U9I2FxFSCnznIVxicFdbUdYy38HW81Lgh0eTrwKESr6YggdQ==
X-Received: by 2002:a05:600c:4fd4:b0:42c:bdb0:c61e with SMTP id 5b1f17b1804b1-4311ded4a00mr116171835e9.13.1728923017595;
        Mon, 14 Oct 2024 09:23:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4468:7613:7612:e2d5? ([2001:8b0:aba:5f3c:4468:7613:7612:e2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf49910sm157642075e9.20.2024.10.14.09.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 09:23:37 -0700 (PDT)
Message-ID: <0031350061094c8c141651239ea1073bd0736815.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check-update-nvd2-native: Incremement
 DL_DIR database location
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Marta Rybczynska
	 <marta.rybczynska@syslinbit.com>, Steve Sakoman <steve@sakoman.com>
Date: Mon, 14 Oct 2024 17:23:36 +0100
In-Reply-To: <CAApg2=QMcH1rZRrZS14W5534GZh39JsVAaLm=YBP4SbOJEjnhg@mail.gmail.com>
References: <17FD60BEC9A54A4B.2207@lists.openembedded.org>
	 <8281d9cb51a5e652f99ed998fd71c7b6a84e1e63.camel@linuxfoundation.org>
	 <CAApg2=RmrYULa7KMi6EMdGAhW3-uVA81ggVJg5BGDMSg0M0nLA@mail.gmail.com>
	 <0092cbd5b19661f2c88084cc2c00811c7c2f6563.camel@linuxfoundation.org>
	 <CAApg2=R_F-YUiv23wC_ACZFNe590h+RGxJ4R=-n2uT_LE5rqFg@mail.gmail.com>
	 <17FDF275CE46F21A.4702@lists.openembedded.org>
	 <08e6b15b245d20bcece798cac0ffbaa11c6be13b.camel@linuxfoundation.org>
	 <CAApg2=QMcH1rZRrZS14W5534GZh39JsVAaLm=YBP4SbOJEjnhg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 16:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205788

On Mon, 2024-10-14 at 18:15 +0200, Marta Rybczynska wrote:
> I've analysed the corrupted file a bit. This is somewhat complex as I
> do not have a "golden" copy with the
> exact same content. However, what I can see:
> 1.=C2=A0 This is not a partial download, quite new CVEs from 2024 are
> there (as from other years)
> 2. Damaged records come from various years (a theory to check: if
> they all have been recently modified)
> 3. Only part of the database is broken and both NVD and PRODUCTS
> tables. You can read various CVEs depending on how you format your
> SELECT (getting all cve_ids works fine, for example)
>=20
> If you suspect there are jobs accessing the file that shouldn't, what
> about installing inotify hooks on the file?
>=20
> As I've never seen such a corruption on my side, I could imagine
> either an external job, or an effect of a re-download of the database
> during tests (but this should use locks).

That is all useful data, thanks.

I can add that on the autobuilders, the file is on NFS since DL_DIR is.
Any worker can therefore in theory access it and inotify could be
tricky to setup and monitor correctly in that setup.

In your tests, do you run multiple releases against the database? I'm
wondering if older sqlite versions in one of the older releases may be
triggering this somehow it if tries to update the database?

Cheers,

Richard

