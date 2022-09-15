Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C89ECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 12:16:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.9074.1663244202752955451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 05:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=enihne9z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id l8so8384142wmi.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 05:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=Hb+7A/mEVZ2U+wD+YDo4xZILhtPD2/AwSTJP67UixzU=;
        b=enihne9zlaxblQQ+U0dU69d8kuOflB1kFVW1vKCTjI/aWbkD1ZI2j3dg6mxBRd8H46
         F9E35oVQDJt6flYI5FzQg+GU5TTHm/m6MMRJyxFKn3TC6NWEO3xN8BRnI/7eo1RYlR7y
         2pxaacNQmM8BtbANoH8xREUI/IMO4X69dy4ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=Hb+7A/mEVZ2U+wD+YDo4xZILhtPD2/AwSTJP67UixzU=;
        b=m8VwsMVg2M0Fu8HroRExNNxmUDD2U3KBi2N9xr8mtn6hIsfPOM5dT+xuipZIFkr5KY
         Cwi0ETThp1lk3G383gNVxiAeSIvf697Pr03Undy6NLzVKxYdQjylftpEUTmwTc40T4D8
         SwdNcxu9D3GlItr2uM1EHdGBrbo8M+zikSeiHsBcJeZS+n4Lwz7Pllvm3euLOb1yCyg/
         aXvYsSfF+E56bFu8q+BvZiwIZpuJ7ObS92uFWF8uSc0qgpgNWfwqelQ7AN9nitRZYwUm
         JskgNufHFOLIRetYoMhH+OaLffqXIpSpOfaFEtFlkLJQOwJVdEUL6QKlFP4hXMl7BLif
         7Phg==
X-Gm-Message-State: ACgBeo3YLcqEkc8mnvbCJtfqgNpeSPvGqP5zjr0yB+lgST/BOGdozEa8
	p1PVRk8miHu67FDG5A2dTe+lQg==
X-Google-Smtp-Source: 
 AA6agR51/ghz7rYzA4tFGN9t3wawy6ntXHi23DDxxPOutxuchsxWxyWRx5dNgGADCYSQeu+MH8yAbA==
X-Received: by 2002:a05:600c:4651:b0:3b3:3f99:4ad6 with SMTP id
 n17-20020a05600c465100b003b33f994ad6mr6619216wmo.90.1663244200998;
        Thu, 15 Sep 2022 05:16:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e07:270e:85c1:e593?
 ([2001:8b0:aba:5f3c:e07:270e:85c1:e593])
        by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4bc3000000b0022ac12fff29sm2456463wrt.65.2022.09.15.05.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:16:40 -0700 (PDT)
Message-ID: 
 <e0ece56dc5b05480313c5eee78a3d31081478687.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Adding more information to the SBOM
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>,
	openembedded-architecture@lists.openembedded.org, Joshua Watt
	 <JPEWhacker@gmail.com>
Date: Thu, 15 Sep 2022 13:16:39 +0100
In-Reply-To: 
 <CAApg2=Q0+GqNVfyhnnadaEhXUB67_vbf5=ukKHdD8xRHqSOptg@mail.gmail.com>
References: 
	<CAApg2=Q0+GqNVfyhnnadaEhXUB67_vbf5=ukKHdD8xRHqSOptg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 12:16:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170693

On Wed, 2022-09-14 at 16:16 +0200, Marta Rybczynska wrote:
> The sources with a long README are available at
> https://gitlab.eclipse.org/eclipse/oniro-compliancetoolchain/toolchain/ti=
nfoilhat/-/tree/srctracker/srctracker
>=20
> What do you think of this work? Would it be of interest to integrate
> into YP at some point? Shall we discuss this?

I had a look at this and was a bit puzzled by some of it.

I can see the issues you'd have if you want to separate the unpatched
source from the patches and know which files had patches applied as
that is hard to track. There would be significiant overhead in trying
to process and store that information in the unpack/patch steps and the
archiver class does some of that already. It is messy, hard and doens't
perform well. I'm reluctant to force everyone to do it as a result but
that can also result in multiple code paths and when you have that, the
result is that one breaks :(.

I also can see the issue with multiple sources in SRC_URI, although you
should be able to map those back if you assume subtrees are "owned" by
given SRC_URI entries. I suspect there may be a SPDX format limit in
documenting that piece?

Where I became puzzled is where you say "Information about debug
sources for each actual binary file is then taken from
tmp/pkgdata/<machine>/extended/*.json.zstd". This is the data we added
and use for the spdx class so you shouldn't need to reinvent that
piece. It should be the exact same data the spdx class uses.

I was also puzzled about the difference between rpm and the other
package backends. The exact same files are packaged by all the package
backends so the checksums from do_package should be fine.


For the source issues above it basically it comes down to how much
"pain" we want to push onto all users for the sake of adding in this
data. Unfortunately it is data which many won't need or use and
different legal departments do have different requirements. Experience
with archiver.bbclass shows that multiple codepaths doing these things
is a nightmare to keep working, particularly for corner cases which do
interesting things with the code (externalsrc, gcc shared workdir, the
kernel and more).

Cheers,

Richard

