Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4627C05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 23:06:42 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.26082.1675465593526912172
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 15:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AQLNHxS/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id y1so5953802wru.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 15:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BNVqgYDO8KVcrn1r/vLhMwMxxa9W1Me3KI3DcV9KVgU=;
        b=AQLNHxS/QnD9KSv8M0IXBHB+9wW9NQnZJgzYnDuuP4tl9OedP74Mz2deVt9+DrVKKa
         s07Nmm36v5bH5Pkv+iY1dLtP9+c0iPPFpaB4r8P9YzTyW1YnZo71m+pJu6ODfRwF4Qmb
         z10C1TjV7ZOnU+nJ6OyNYl/Lq7sVB2jBH5KWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BNVqgYDO8KVcrn1r/vLhMwMxxa9W1Me3KI3DcV9KVgU=;
        b=qbVuw+Lkgiuk7OJNqDThc6S6H8aTBRaHldxjY+ROZxGrswkPaxfE5cNd+J1cKCcOe+
         urkb12IHcyejJo/INLUrDOmCZurY9ZwyCY2NNwZf4h8UHAIylzFBgT/STv5hPhLoScBW
         i8bk+DxJs2G6fGFc3Hw8e6JGYcSAfmxYwwVZEqTmS7QU93a11lgptNwIyx+AgtnHQOgH
         b91QgoezkZpUlz+TJv3kKn90snbVB4I1Q2IPGME5si3ZI56C+qivhscjvO8Tsg3dd+z2
         B/Z/TuxkrhbVggaiB5+odcTVJTUnkRtUj96qT7ZReindTcrh6JntZgDR0hn3A3giI87r
         oZuw==
X-Gm-Message-State: AO0yUKUz0/YarxXObkORGokHKoZxNG15qOwolKHBsgx/NUCHoGzJitvs
	fmfl4eX20faiCHamj5yyefb6SA==
X-Google-Smtp-Source: AK7set9efzjYmOepJL5OpBYXsQyIff1dT7X9iQZ7yL0cJvYT8S3iiw2cnUIyBt0EpAGtSWv3KrNagw==
X-Received: by 2002:adf:f481:0:b0:2bf:f6e6:edde with SMTP id l1-20020adff481000000b002bff6e6eddemr8352338wro.3.1675465591692;
        Fri, 03 Feb 2023 15:06:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b45c:7b35:1c6a:a06d? ([2001:8b0:aba:5f3c:b45c:7b35:1c6a:a06d])
        by smtp.gmail.com with ESMTPSA id j8-20020a5d6048000000b002bfb02153d1sm2971554wrt.45.2023.02.03.15.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 15:06:31 -0800 (PST)
Message-ID: <a23ee023a5ead9c3d66a69b101a8facca3b3fdbf.camel@linuxfoundation.org>
Subject: Re: [OE-core] SPDX 3 and OE-core CycloneDX support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Stewart <alex.stewart@ni.com>, Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 03 Feb 2023 23:06:30 +0000
In-Reply-To: <6eab52f4-8666-294b-3931-8a111b60627b@ni.com>
References: <6eab52f4-8666-294b-3931-8a111b60627b@ni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 23:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176756

On Fri, 2023-02-03 at 12:26 -0600, Alex Stewart wrote:
> Hey Josh,
>=20
> I have been roadmapping SBOM generation for NI's yocto distro and have a=
=20
> few open questions about the future of SPDX and the create-spdx bbclass.=
=20
> Since your name seems to be attached to both of those, I figure you=20
> might have the best insight here.
>=20
> Also posting to the OE-core ML so that this discussion can help other=20
> members.
>=20
>=20
> 1. SPDX 3 timeline. I hear that SPDX 3 is going to be a complete rewrite=
=20
> of the spec, with more support for modern SBOM discussion topics like=20
> VEX and more comprehensive vulnerability tracking. And it also seems to=
=20
> me that the timeline for its release is very behind schedule [1], but=20
> still in active development. Can you give a SWAG for how close that new=
=20
> spec is to completion? Are we months away or years?
>=20
> 2. If/when SPDX 3 support is released, is it to be assumed that the SPDX=
=20
> facilities in OE core are going to be upgraded to handle it?

Assuming someone does the work, which is likely, yes. We did namespace
the class in master to prepare for that.

> 3. The rest of my org is interested in CycloneDX as our common SBOM=20
> format. Have there been any discussions about supporting CDX SBOMs in=20
> OE-core? Any blockers there; or is it something that my org could author=
=20
> and upstream if we decide to go that route?

At this point OpenEmbedded/Yocto Project has decided to go the SPDX
route for various reasons. I'm not sure I want to see two formats being
added directly to the core, the better solution would likely be to
translate the SPDX output into CycloneDX if/as needed.

Cheers,

Richard




