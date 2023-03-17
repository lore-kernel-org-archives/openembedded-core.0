Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFCFC6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 11:53:28 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.17124.1679054000026731181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 04:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hVQorDP8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id t15so4166151wrz.7
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 04:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679053998;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l9K3eICi80ilsCOiSrZeB9XpKWvl1Ocvv6aC+2Gafr0=;
        b=hVQorDP8hxVIX8h7GbTXC2wmDl7CPhPHSYs1UJtTtz+L/CQ5Y81iN/uXBJi4q+VeWA
         erx8SXrDmZ7ItLZFmOyJs9Wq/P+3z/hMiLQ1PfTE8QR6VLqJXSeRru26wvvWdHz/bJMR
         NW+d2HUBBS+2N435g2wvtQ3jmw4xutGrkM/CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053998;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9K3eICi80ilsCOiSrZeB9XpKWvl1Ocvv6aC+2Gafr0=;
        b=BOq8BVveWLDbpXfATnLN2S2r1J42+kSLKPxC1h9M7q5uRecsEaGnWGhs1CZsXDmf+x
         UoMqIiU5VaxW0hf9NdqMwiT3awlgodG7j9XRROaXbXUhiJFcFIWarVAcpbB+B0Tn85X2
         L99pbpeeJ3U4d8IC/IGMBvmpJHUSbQMqqUkVTHakdn7KXvDG9g+5ef7oEE2AKOo39+rk
         1NiFIqZJjqYOzKvST+fKzNCY2yhomcE7FxF92KbmToBmcf4XRgBlgFQ/+lHVUOdcnnFA
         V/Sy/+b8SEI2L8/iwpxOdgfp91acYzkgzn8awJ81hEH8ZdWnMjWLNY7XIX/o/jM9GJ9U
         J1Kg==
X-Gm-Message-State: AO0yUKXcr3oe91/DqAhjg73krJmIGRLjKtXje9d1y5gkwbwzJzIvj5aD
	T5jSknWGPIVfrzceGP2En1OASg==
X-Google-Smtp-Source: AK7set9CHeurB+j+9/Mj5Bxon/AbtIpbgF/yIURsNhO3QACJjLbzaSg85D4Z0kSRGlGDXw/9MZp4TA==
X-Received: by 2002:a5d:684e:0:b0:2c9:e585:84b0 with SMTP id o14-20020a5d684e000000b002c9e58584b0mr6141855wrw.1.1679053998303;
        Fri, 17 Mar 2023 04:53:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4a14:4396:c3b7:b66e? ([2001:8b0:aba:5f3c:4a14:4396:c3b7:b66e])
        by smtp.gmail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm1778971wrr.69.2023.03.17.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:53:17 -0700 (PDT)
Message-ID: <a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2023 11:53:17 +0000
In-Reply-To: <9FONRR.ZLSABXKTP67E@t-online.de>
References: <20230317060202.385862-1-f_l_k@t-online.de>
	 <dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
	 <9FONRR.ZLSABXKTP67E@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 11:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178749

On Fri, 2023-03-17 at 09:18 +0100, Markus Volk wrote:
> Am Fr, 17. M=C3=A4r 2023 um 08:00:37 +0000 schrieb Richard Purdie
> <richard.purdie@linuxfoundation.org>:
> > This changes the system layout to what systemd wants but what
> > happens
> > to sysvinit or anything else though? Some systems won't have
> > systemd-
> > tmpfiles and so on present. The commit message above makes it sound
> > like systemd is the only thing that exists/matters.
>=20
>=20
> I like systemd and I like that it standardizes a lot of things, but I
> really don't care about politics. That's why I also sent a patch for
> a different way. But the commit message is right, that would clearly
> be a step towards systemd.

Regardless of what anyone thinks of systemd, I can't take patches which
change existing behaviours if that change isn't explained, justified
and documented.

As such there is no way I could ever take a patch with the commit
message in the current form since it doesn't mention anything about the
impact on sysvinit, how to mitigate it (if needed) and what users
should expect.

I appreciate you likely don't care about sysvinit=C2=A0and don't want to
spend any time on that. That is fine, I do understand. Equally, as the
maintainer for OE-Core, I do have to care and I just can't take a patch
like this. I just want to make it clear why it isn't something I can
even consider in the current form and to make any change like this,
we'd need more insight into the other impacts (e.g. busybox init too).

It would help me if adverse effects are mentioned in commit messages.
In this case I can spot it easily enough but I don't always know/spot
all the issues.

Cheers,

Richard

