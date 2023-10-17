Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20514CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 21:50:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.268388.1697579450801191220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 14:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T/IG8Zca;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32dcd3e5f3fso182980f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 14:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697579449; x=1698184249; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NgBNoXRNEe2nLkN+cH5InGOjhiOwXCpJXZp7lg8E0Sw=;
        b=T/IG8ZcawCIGQJ7ArgxBv30U5KWSlS1tVcb0zu717eWxWYhdIEjZn95dhkJUdAN7Ls
         53ZiBl2J2Q8337aiSGIMNIGMnBgdihJO1p04/XM6b2UyRHiP5R9eyhwwLkDpVlmMzqfT
         cSb20fMt38BFvCZMN1O/HBqG06g/nMKGUNn2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697579449; x=1698184249;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NgBNoXRNEe2nLkN+cH5InGOjhiOwXCpJXZp7lg8E0Sw=;
        b=IXoHzBZY5He1W2GZg3kp23m38nfbEv5rCW9oCn6rRunEJF+HOISkT2luLcaFhNjKA/
         CGJtJC8wprjz5iPwtXG0NizirseHQJ3GFQwt2RlahosbHWMmGyuce81PmCrzm6E/adD1
         vJwOhqvmysvjRITgXjGPgFTR/6FHSDAVTSU3Gdk+/cgH5ecEOWUJFIVirF5OhQitoFce
         2QzlIqKR/WyhG5YXhSx6FLbP14o8exulb9eM1INsOh8IVcPkuZld2Cgql42w+t3qYY32
         lDq6po2v3qDzEY2y4/SediJZIbIc37CHoadtKmyhDqM8s3dp3/Pn2JbHMJBxjVjKYU8H
         94Lg==
X-Gm-Message-State: AOJu0YxZiO7thBMarEAV+20LA5Uc70x5WyL8wTsnsTBS/OXdCPHaaEdN
	lSOWOR1XhXKRkM85jt3njBnn0Q==
X-Google-Smtp-Source: AGHT+IGJkRywDGACDCuN9FNjV23D2npYNi515kaziOnRshWi4moGVIbGyzMVkf7mcM4c4d/fQlN3oQ==
X-Received: by 2002:adf:e44c:0:b0:32d:8c6d:cda4 with SMTP id t12-20020adfe44c000000b0032d8c6dcda4mr3261562wrm.43.1697579449164;
        Tue, 17 Oct 2023 14:50:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa42:b755:fc77:86e9? ([2001:8b0:aba:5f3c:fa42:b755:fc77:86e9])
        by smtp.gmail.com with ESMTPSA id j1-20020adfea41000000b0032dcb08bf94sm643527wrn.60.2023.10.17.14.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 14:50:48 -0700 (PDT)
Message-ID: <c3e775b4b76cbedfa9a4b0cdaff70deb575bd293.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Add SECURITY.md
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Date: Tue, 17 Oct 2023 22:50:46 +0100
In-Reply-To: <20231017152517.26675-1-rybczynska@gmail.com>
References: <20231017152517.26675-1-rybczynska@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 21:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189362

On Tue, 2023-10-17 at 17:25 +0200, Marta Rybczynska wrote:
> Add a SECURITY.md filr with hints for security researchers and other
> parties who might report potential security vulnerabilities.
>=20
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> ---
>  SECURITY.md | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 SECURITY.md
>=20
> diff --git a/SECURITY.md b/SECURITY.md
> new file mode 100644
> index 0000000000..900da76e59
> --- /dev/null
> +++ b/SECURITY.md
> @@ -0,0 +1,17 @@
> +How to Report a Vulnerability?
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +Please send a message to security AT yoctoproject DOT org, including as =
many details
> +as possible: the layer or software module affected, the recipe and its v=
ersion,
> +and any example code, if available.

Rather than send everyone to the security address, can we suggest
bugzilla as the first port of call for anything public knowledge and
less urgent and to only to use the security address for non-public or
urgent issues?

We do have the ability to mark bugs as security and private and then
triage unlocks them too.

Cheers,

Richard

