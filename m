Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F751C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 10:12:54 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.154750.1680775969769869441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 03:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dSDbA8cP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so19940626wmq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680775968;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fh45rupJAdKDuhcem/XUElG8kfhvibeD43SFujemk8c=;
        b=dSDbA8cP1dIs0fr50yYEV5zDyQIhlkW4pFKO87gDXCHVxSa+dupMnNFA7nTxt6frJW
         BC17i3NK92OJV9xlvDksieO0WLqEmc631WmxJOZ3tqd3XZ5x5zJnrbypW80nQNGE0UTU
         p56FJEX7yuNfPngBgEW93J6tBZ23ubmPDkwqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680775968;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fh45rupJAdKDuhcem/XUElG8kfhvibeD43SFujemk8c=;
        b=sVqeq8f3Yt1mglsGkt7O7R50+237qixOXoDx36NI3YlYD6YznfDrpXebEBvfAw6NzO
         hNbMxZDefokbtKfgvE4phs+/gEvzWQ3m+hIXAllIfMmJ6fuZl+XOQd+zTD/aWbxo5YF5
         0aEYogpT6h42A/q7rlJONdVja4p4Tf/EPGZi6MsF7NP5X8IRt8izWtSeINNwYo5ZF+ED
         5iJw/TdvH7XTs4WCvwi4WjxFj/nuRU7IvixfGVlldwSDhAF/Pdg//kgiyKAZeF9jgxpM
         EvuuEPVQpcmJQrSspcy5o6AQf00APRiY8s+hTzXsbp2XvHTxbS/EPN9/Q7oe0jFatOy7
         qJyA==
X-Gm-Message-State: AAQBX9edHBNhPPJ96w18HxOZE/UiPxdA08pXk7kvj6gRumh42cOznaCd
	Dkm7Nqvln0oy8Ob2zvFAr4IX5w==
X-Google-Smtp-Source: AKy350Z9oO9XHPB8cJZ86GFgnO+4U1EiobQQ7oOmI1vIpclGqIqDJvAcSq1L/JRgaU6ZkViBK7JLRg==
X-Received: by 2002:a1c:790b:0:b0:3ed:2b49:1571 with SMTP id l11-20020a1c790b000000b003ed2b491571mr6464490wme.20.1680775968266;
        Thu, 06 Apr 2023 03:12:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6a84:552d:cd38:8d5? ([2001:8b0:aba:5f3c:6a84:552d:cd38:8d5])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b003ef5e5f93f5sm4946950wmb.19.2023.04.06.03.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 03:12:47 -0700 (PDT)
Message-ID: <927715c9e53832471789990ddccaba4cfc77c3ca.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] migration-guides: update 4.2 migration and
 release notes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>, Marta Rybczynska
 <rybczynska@gmail.com>, Paul Eggleton <paul.eggleton@linux.microsoft.com>, 
 Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 06 Apr 2023 11:12:47 +0100
In-Reply-To: <20230406091254.248215-1-michael.opdenacker@bootlin.com>
References: 
	<CA+cAkepkVZJ-WsrFeZ8Y7+=95CwD4Fu9e5ddD7WJaWnMjSs5Qw@mail.gmail.com>
	 <20230406091254.248215-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 10:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179768

On Thu, 2023-04-06 at 11:12 +0200, Michael Opdenacker via
lists.openembedded.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> CC: Frederic Martinsons <frederic.martinsons@gmail.com>
> CC: Marta Rybczynska <rybczynska@gmail.com>
> CC: Paul Eggleton <paul.eggleton@linux.microsoft.com>
> CC: Alex Kiernan <alex.kiernan@gmail.com>
>=20
> ---
>=20
> Changes in V2:
> - Add details about filling checksums using the 'cargo-update-recipe-crat=
es'
>   class, as suggested by Frederic Martinsons.

We should add something about ptest changes:


"""
The ptest images have changed structure in this release. The underlying
core-image-ptest recipe now uses BBCLASSEXTEND to create a variant for
each ptest enabled recipe in OE-Core.=C2=A0

For example, this means that "core-image-ptest-bzip2", "core-image-
ptest-lttng-tools" and many more image targets now exist and can be
built/tested individually.=C2=A0

The core-image-ptest-all and core-image-ptest-fast targets are now
wrappers that target groups of individual images and means that the
tests can be executed in parallel during our automated testing. This
also means the dependencies are more accurately tested.
"""

Cheers,

Richard




