Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D41C4167B
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 14:15:58 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.150744.1669731348079324510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 06:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xz+QjNhH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id g12so22276491wrs.10
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 06:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qD29Zzgd4SQ3aPJHX4nAb1olyHyF5kErnGMeK+JnSE=;
        b=Xz+QjNhHgJE+bPAu2hJ6aO3uGP8FigMPOxdsDdhtogeiOPGek1O0TVkNeMoQxI/AX7
         qQWRx20iYZxsNmX1U0ilMRdO4nrg3PBw/E9/q8yw01gwCvvoEAPq2bp46G32dBCvgo9I
         QztSyEQuerMEi+OHcb9yPf5ixEcXkiuYjCK2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0qD29Zzgd4SQ3aPJHX4nAb1olyHyF5kErnGMeK+JnSE=;
        b=IziFbTbr0dtwIiAMTPt7AN4gW1urKde1KN611POILxgpC/td4hC5BXX3CimLeMQ6eD
         4mVdVfklie+mu4OnAOHr5+R1+kBVYpMImP/nCxEcD+wsPgSgfe4b7VE1PQWiTZ/GnXTB
         3J7J6AyM8kzW9WYQbpiQOi0EuxiN/o3OHF92KJODGvHRQtsmJhOX7M2fKfjPVQu3z5Mr
         eQgXAaEQRMU5O5L02EmdtlwfmukIbnzm4NRenO/fEtXhwkyERJQaycL+CnjnVU3kRFvJ
         0zQyD3Ox6SJ7K2J+M1qujkiNXm8SnlGHRVSpDij1pYgpjfXHG1/Ituua+SNkioGvgkmA
         uUSw==
X-Gm-Message-State: ANoB5pnCERV5j0OllbuLfGZBztnSW23lmBWtPIZXoKOJsBjR0ud+mzye
	PErAEMmCJURtLRVtgTYxXiehzw==
X-Google-Smtp-Source: AA0mqf6A8J6+R7OcH+5CbdjN/qn0gJylxu0d92cgkp96O/sRX+QMBAmJwcQJ4+HwryfMurAmkftANw==
X-Received: by 2002:a5d:604b:0:b0:236:6442:3a48 with SMTP id j11-20020a5d604b000000b0023664423a48mr24946076wrt.41.1669731346149;
        Tue, 29 Nov 2022 06:15:46 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:426:d29f:e451:e2dd? ([2001:8b0:aba:5f3c:426:d29f:e451:e2dd])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c490600b003cf6e1df4a8sm2096348wmp.15.2022.11.29.06.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:15:45 -0800 (PST)
Message-ID: <c9c1630165f51411750d4ca7715bfb4c625916e1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2][master] go: Update reproducibility patch
 to fix panic errors
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: reatmon@ti.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2022 14:15:44 +0000
In-Reply-To: <20221129122302.14589-1-reatmon@ti.com>
References: <20221129122302.14589-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 14:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173974

On Tue, 2022-11-29 at 06:23 -0600, Ryan Eatmon via
lists.openembedded.org wrote:
> Based on a discussion on the mailing list [1], there are panic
> errors that occur on a few platforms caused by the patch.  We
> cannot simply remove the original patch due to the
> reproducibility issues that it addresses, so this patch on the
> original patch fixes the cause of the panic errors.
>=20
> The previous version of this patch was a little too aggressive
> in cleaning up the environment.  Some of the variables impacted
> by the filerCompilerFlags() function require at least one value
> to remain in the array.  In this case, the values for ccExe,
> cxxExe, and fcExe require a value or later code that access
> them result in a panic related to accessing a value out of range.
>=20
> This updated patch adds a flag that requires keeping the first
> value so that at least one thing remains and the assignments
> for the Exes set that flag to true.  The first item in the
> array should be the executable name, so leaving it should be
> safe.
>=20
> I have run the oe-selftest and everything passed in my setup.
>=20
> There is a bug report [2] filed for the issue that this patch
> addresses.
>=20
> [1] https://lists.openembedded.org/g/openembedded-core/topic/94022663
> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14976
>=20
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...ent-based-hash-generation-less-pedan.patch | 30 ++++++++++---------
>  1 file changed, 16 insertions(+), 14 deletions(-)

If I remember rightly, the filter function removes anything starting
with -m. Are you saying you found a case where the executable itself
was called -m<something?

I'd like to understand what this was stripping out which was valid?

Cheers,

Richard



