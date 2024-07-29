Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEA8C3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 12:03:16 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.54654.1722254594939363315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 05:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HQSYQSyF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-59589a9be92so5248236a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 05:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722254593; x=1722859393; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R56VVHteTwn1UCeG3DQy9HaEjYBEkMstdY9UfplXvhU=;
        b=HQSYQSyFetNCFcG+J1Gt6JHprP+HKgUI3kJid5RKGQv13PYLEQkGWIsjLkSYjnd9ja
         F5bkLOWfsin8+dIr03ixHXoxoXRlxsIee/8u8Te8PWVcvBCFzLVH5CflHQ0UCtZreRen
         RKDuv8hpCiN/R5Im3eIrmsfKPV1pNkVuvLlPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722254593; x=1722859393;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R56VVHteTwn1UCeG3DQy9HaEjYBEkMstdY9UfplXvhU=;
        b=j39Yq9lQgrYWlC2q8ckgHx0MzyWvC9ZgOl8WEhxCLhOWAs0U0hYb4c4STZ330jYXM2
         +TSzB2Zm5mawNf2YMvw1RG7GCOomGEVByaWR8AD/Dsi1pFwAIv9cusMY1Ic0o2Qom0QG
         r1kD8ldMghn4ZiV+Donr3xhhudgWlOOb3T29Vnw5qpDS9EJSdkOFhz/82YhIOCi1HDD9
         mCcG1NRKquDXhc2L58gkMD449p0kahfzxz7CEnZ796GckfNyM5yvkueQf1cYACaXxj1+
         4TfkE5YUvAZE+lkKauxfyABH0KcvzoBZ2M/n19H7ildAC672ME5ChbpX89FhQsMVZEuz
         AUqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN6134cd6e2qHfpoGT24QiHN1dR0mYeaWIfW+6vYI16HR7HEUcELlcDUdq5VLvFdCUvrJclV+jHnrG5djoWxCZfiQO5sj7HMxI4BdqVCTk/8L8SeYxIN/1
X-Gm-Message-State: AOJu0Yx3GhrDCoP/3+SaaixdNGnFhdkotF5zBewkfIeSFZ+kOL4hyuqH
	F2yayZxg5ansJD3+vPhMUS9c+sGz2+2tMuw9BZhWUgZ8WWOxylDkuFjuNuUB870=
X-Google-Smtp-Source: AGHT+IHyQVBE7DW8hH2LAzpa9Iiq3kPeB6CzI21SRlgqrVZgaOOcfyFdBVHeGW61XjTKR7EVJBCzbQ==
X-Received: by 2002:a05:6402:3595:b0:5a2:763e:b8bf with SMTP id 4fb4d7f45d1cf-5b021f0db85mr5488449a12.25.1722254593099;
        Mon, 29 Jul 2024 05:03:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3282:52e6:d708:90b2? ([2001:8b0:aba:5f3c:3282:52e6:d708:90b2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac631b0491sm5714058a12.8.2024.07.29.05.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 05:03:12 -0700 (PDT)
Message-ID: <e1612674aafcad3d3fc08285fe2bf0c6e85c44ec.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check-map: Add 'cannot-backport' to
 status map
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dnagodra@cisco.com, openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Date: Mon, 29 Jul 2024 13:03:11 +0100
In-Reply-To: <20240724044412.3343884-1-dnagodra@cisco.com>
References: <20240724044412.3343884-1-dnagodra@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 12:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202611

On Tue, 2024-07-23 at 21:44 -0700, Dhairya Nagodra via lists.openembedded.o=
rg wrote:
> - Sometimes, the difference in the codebase of the fixed CVE's version
> =C2=A0 and the current version of the package is huge.
> - This would make the backporting of the CVE not a feasible option.
> - And due to other dependencies and limitations, the upgrade of the
> =C2=A0 package might not be possible as well.
> - This commit would allow users to add a description via CVE_STATUS and
> =C2=A0 still show the CVE as vulnerable.
>=20
> Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
> ---
> =C2=A0meta/conf/cve-check-map.conf | 2 ++
> =C2=A01 file changed, 2 insertions(+)

I don't think this status make sense as it is too hard to define. For
one person, a cannot backport might be a patch that doesn't apply
cleanly, all the way through to a patch which would need many hours of
work to correctly apply to an earlier version.

I think this classification would be too arbitrary and depends on the
person's skill set too much.

Cheers,

Richard

