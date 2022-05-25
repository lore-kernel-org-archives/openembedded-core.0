Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68393C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 20:29:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.11840.1653510568718914226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 13:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=apjw8kNy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 i82-20020a1c3b55000000b003974edd7c56so1422186wma.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=HPQVyT+0MaUJCSTsTO3qCqLA1VEZkCowPlLo5vUfvQM=;
        b=apjw8kNy0Uo9ZOOmf88tNnL41aLTthQHNfmhWBpiiWW2C8hBPiS/SP6+IU3SaEQzTs
         WnERElMXRmtNayBlTTBS1IXuOLBhRIRjScTEzWDmNPObP2KBNb8ERAPbli9H/6SsQJ+N
         Kyrf9upgObnQTbyeX5TsteIIKVhmQY1pUkTDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=HPQVyT+0MaUJCSTsTO3qCqLA1VEZkCowPlLo5vUfvQM=;
        b=kq3DCIvv0vkcEAAJi9JspMFolLZbwe0DzQ5TDIYGPeuAFeDzFZBFlObrYigBWd4yTr
         6/IMc1Jc7lRHkz//ewswYSHkeSS049JTsurQdr8Z5srbhYg5myk9uw/aF7LFB0a15lz3
         pQ86Dr7cF0Tgl5M30U/SpS/n3lBQJEdavO+rJRjK1GNRy0SFnG9EJqJtDU19S0bOWPyo
         0XIS0N3udLdRqA/i3s0dcOjhYkC6+wuqshyxngcV0h2FoTGwxxcpYlhmcnm/MutqEk9j
         B4cshf4rLtDltuWRJ3TD3o2U8es/spytvoPqGZYEs2KAjAXWSsGlcpQE+pXraRxzZsyI
         7t4A==
X-Gm-Message-State: AOAM531kvagJrMLzT5Sl+JeqjE7k+upJ4UjQ/q+vZ8z2WM6MXmg5UO0X
	FD4QniMREZsaT2dq6nIFW124PQ==
X-Google-Smtp-Source: 
 ABdhPJxXryNcDI3y1RRe14J+1Pwjsghxm56rWjTxysmZLSzfYPUAmGMNWMdJDb92FsL8+2hEIaPbpA==
X-Received: by 2002:a05:600c:34d2:b0:397:7209:c1f0 with SMTP id
 d18-20020a05600c34d200b003977209c1f0mr3146950wmq.132.1653510567130;
        Wed, 25 May 2022 13:29:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:e02b:90d6:3f52?
 ([2001:8b0:aba:5f3c:5808:e02b:90d6:3f52])
        by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003972dcfb614sm2905073wmc.14.2022.05.25.13.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 13:29:26 -0700 (PDT)
Message-ID: 
 <48f575397ef6c8836aaa39409c0cee47ec92041a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] makedevs: Don't use COPYING.patch just to add
 GPL-2.0-or-later into
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 25 May 2022 21:29:25 +0100
In-Reply-To: 
 <CAMKF1srdMiA=HpLOTYoL0PuN4sRJXjVwNM5Q6hMR+4Vs5cJrfA@mail.gmail.com>
References: <16F26ACEC3C7C32B.14582@lists.openembedded.org>
	 <CA+chaQd5GBkAx=pBky5FFjQkXCXXEjvoz2DC+QEYEvYR2e5PQg@mail.gmail.com>
	 <CAMKF1sp-TA8PgE=QVtMH4oBUbyPB5V47MEf1v1bgEq-d6uzM+A@mail.gmail.com>
	 <CA+chaQejt3fCBSjYzBcXAijECJaBG-r3uDiTxUEMLpS3_K-pKA@mail.gmail.com>
	 <CAMKF1srdMiA=HpLOTYoL0PuN4sRJXjVwNM5Q6hMR+4Vs5cJrfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 20:29:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166171

On Wed, 2022-05-25 at 12:47 -0700, Khem Raj wrote:
> On Wed, May 25, 2022 at 11:39 AM Martin Jansa
> <martin.jansa@gmail.com> wrote:
> >=20
> > Should I resend this with just GPL-2.0-only (as buildroot header) and o=
nly SPDX header in source like RP did for keymaps in: https://git.openembed=
ded.org/openembedded-core/commit/?h=3Dmaster&id=3D17d981005a0c0c97702ad8860=
2b7181b69bcc9eb ?
> >=20
>=20
> yeah that looks better to me.

Lets make it GPL-2.0-only which seems safest given the confusion and
put an SPDX-License-Identifier in the source file.

Very happy to see this cleaned up though!

Cheers,

Richard


