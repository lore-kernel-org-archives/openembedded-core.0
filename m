Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF97C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 13:46:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.11021.1661348806892759885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 06:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qlb+k7Km;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id j26so8819006wms.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=BCvHE1lHtVqcEMH8k7/issXF4wMIFVyY2oMPZcaUpp4=;
        b=Qlb+k7KmWJ+c8gu02K/XBZUfq2ZwTjeuNECNSoSMMj0MGfwV3udxahs7vkBc+4D3qf
         PJ3obDHr90r7n1AbADnBcMzq4fQrgamgf4htEGuMoUX3FFgBp/RGimCrJJnDn7xStVf9
         oPcS/FZMw+rOAnMwyBn2HoBwUN3cj3aRGHVQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=BCvHE1lHtVqcEMH8k7/issXF4wMIFVyY2oMPZcaUpp4=;
        b=tkMLO6HoYhEeXY1Xf2uRYfG/Q42cHNmIKbxqdqUe2IqZYEVoBGVWU2ujj3dcFUpb2Q
         zYvoUUBjHYuhrdTWpYZb+xg/5HDfXdKg25xuHKcaJYBi28kFGh9HzAShgEgcMQmx2Eq4
         DWQyMuZ1gfNQ15MtIzwhEoTRJUhOHCmjRoKtaPfoYBXhA1crwTrx15gPkIwzUVQX/aDE
         dJjtbXN5CHrtM3uDWX/k1Z8PxgjIidHQnD7vBeohxLoplw6vSWGFPqa8qP2l0dlylrdk
         OoArIGqjWJQ7DA76U5JoUEg6FJdfHqDJSprlpCIc6BbvDWPHp6wOabqKTbKP4fj0ELn1
         JYZw==
X-Gm-Message-State: ACgBeo2l5NB/1xFSahiriz/VqWJhp55CS+Yxx28laysrutrUxo39f/Jk
	oK5Ass0z7rqPRBxGmxq9ltuEkQ==
X-Google-Smtp-Source: 
 AA6agR4QmFEOaWowNnPR94PPVj7J5wFq4iXeurBFRuXOS0VBIVzp7Sju59fd7CXDmbPuu9LJjG0k8w==
X-Received: by 2002:a1c:7408:0:b0:3a5:c9c1:f226 with SMTP id
 p8-20020a1c7408000000b003a5c9c1f226mr5291411wmc.47.1661348805128;
        Wed, 24 Aug 2022 06:46:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4e4:9da0:6de0:5e33?
 ([2001:8b0:aba:5f3c:4e4:9da0:6de0:5e33])
        by smtp.gmail.com with ESMTPSA id
 a8-20020adfdd08000000b0022537d826f3sm14766211wrm.23.2022.08.24.06.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 06:46:44 -0700 (PDT)
Message-ID: 
 <ef60dab0d664b5dd67f46afb1d3a87404b99539d.camel@linuxfoundation.org>
Subject: Re: [OE-core] Should BB_DEFAULT_UMASK be set with ?=
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Aug 2022 14:46:44 +0100
In-Reply-To: <40098bb7-f655-ba79-3516-d77ea6041bbb@prevas.dk>
References: <16F3D7774B148A57.31466@lists.openembedded.org>
	 <40098bb7-f655-ba79-3516-d77ea6041bbb@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 13:46:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169816

On Wed, 2022-08-24 at 15:23 +0200, Rasmus Villemoes wrote:
> On 30/05/2022 11.19, Rasmus Villemoes via lists.openembedded.org wrote:
> > Hi,
> >=20
> > Suppose I want to define BB_DEFAULT_UMASK in site.conf or local.conf (I
> > do have a use case for setting it to 002). But bitbake.conf includes
> > those files before it then goes on to use an unconditional assignment
> >=20
> > BB_DEFAULT_UMASK =3D "022"
> >=20
> > So how/where is one supposed to be able to set BB_DEFAULT_UMASK? Should
> > the assignment in bitbake.conf be ?=3D or perhaps ??=3D instead? Or sho=
uld
> > the assigment instead be moved above the inclusion of the user's
> > configuration files?
>=20
> ping (and cc +=3D RP)

We have a general problem that not all defaults can be altered from all
contexts. We can come up with some set of rules that values in file X
after certain includes should be ??=3D and before, they should be ?=3D and
in recipes should be =3D and so on but that then presents two problems,
that there are still cases where users can't set as they need/want and
the migration problem where changing to that model would break users.

So in short, send a patch and we can change it. It was assumed people
wouldn't need/want to change the default umask as that does have quite
far reaching implications.

Cheers,

Richard




