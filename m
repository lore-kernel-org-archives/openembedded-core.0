Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112A0C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 12:29:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.17597.1669120177639026929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 04:29:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DCUgVn9J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id o30so10613286wms.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 04:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vm5XGhpVgYla8C1qnZD7c4QzFvI8+vblhAiZKx9sTzE=;
        b=DCUgVn9JDz7y6D/UDWPUPLv3lQzDSPmOFcwTOQ02DuB1DzsDN/+rbJPZKhFXR/iGfv
         UnZWY/bQKZxb6pdIneNvRzKTsqZ3cwRvRe5Rc9uxAnfmSurhNn5L89z9hoA9wABUKeUE
         DTRO+bY7Lrm/IS9+oPgLcgArYpLzO2wAgZeQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vm5XGhpVgYla8C1qnZD7c4QzFvI8+vblhAiZKx9sTzE=;
        b=A4KOh1e8MxpfdSosNqD0ptt6jgK6sB3wMPANQP9yxRmZh9R2xmEZEe/rZmRyLT96RL
         G+NOwY2VS9BidfmT+as86CSDmXH633kaFSmWnxp29zzenMNhv2RMI4wXW+qNXjWVPXOZ
         IO+a+djCCGSo+SDn6E5YxceRGPumOROW4qffSxo88/2h/MDN/ZKpK6JUusmyTuucNp2C
         4zXbXKMskOy4SUNwPNNNblsLGRKvhHTyklWgKitxakOkffkCDaEdqiPN4pkEZTbF+duC
         rw9pgzp45PWHLCY0AMuu5KtKoqRn7USPTDPR7E/uy7FH8SeLNKIQmdKEG5yEKX8ZVaao
         Cl1w==
X-Gm-Message-State: ANoB5pmjFv4vwG+i1YoTaoLaO82BpZyA2ANaa+B/d0wpLaVTvBgk5vsG
	BVaOx1EUsE9MaUYCK9FPLoK4vw==
X-Google-Smtp-Source: AA0mqf5nvJV0c1nNPreIcNOTtPFIkSVc3lZ2IKaSv6TkkjvaRCrF2TUk8aB54dYWrPGEJHbRjaxNsA==
X-Received: by 2002:a05:600c:a10:b0:3cf:75f4:794a with SMTP id z16-20020a05600c0a1000b003cf75f4794amr19639492wmp.16.1669120176094;
        Tue, 22 Nov 2022 04:29:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445? ([2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445])
        by smtp.gmail.com with ESMTPSA id y15-20020a1c4b0f000000b003cf7292c553sm16877349wma.13.2022.11.22.04.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 04:29:35 -0800 (PST)
Message-ID: <fb9b0440c73d2d287b6dce447e652d7b0986c33e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/17] unfs: update 0.9.22 -> 0.10.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Tue, 22 Nov 2022 12:29:33 +0000
In-Reply-To: <20221120133122.2464634-5-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
	 <20221120133122.2464634-5-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 12:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173676

On Sun, 2022-11-20 at 14:31 +0100, Alexander Kanavin wrote:
> This is the first release in 13 years;
> accordingly I took the liberty of dropping all the patches
> (none of which were ever reviewed or merged, and all of which
> are difficult to impossible to rebase), and removed all
> non-standard hacks from the recipe.
>=20
> Drop -N from oeqa nfs helper; the option was provided by tcp_no_delay.pat=
ch
> and is not needed for the tests.
>=20
> Please otherwise test and fix as needed, with upstream-first approach.

I understand why you want to do that but this will totally break the
nfs export support, I could see at least one issue having looked at the
first few patches this was dropping.

Whilst I understand the desire to upgrade and keep pace with upstream,
making the support we have unusable isn't going to work here :(.

I think we'll need to look into this one in more detail. If the
upstream is active again, it is a good opportunity to get some of this
merged.

Cheers,

Richard



