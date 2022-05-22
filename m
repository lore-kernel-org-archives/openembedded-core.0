Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB01AC433EF
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 09:24:56 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.14710.1653211490485437193
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 02:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dadZCl3t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id p189so6789893wmp.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 02:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=IWq2Kd2jbLZvl8HH9oH8eQxXkjxOWjbVJI9WYk7Xq18=;
        b=dadZCl3tKEZJR98MZlSFrV3dV/qOaVfZJXhH3ZBSFJdKEjpnZZgWkAvfCOQcc47FT5
         EwN4UzFR6Jm9v80sC0r4piTDBgG2G0Z/TAgh8eEsqV+q9pUlQSQvyK48Ks/CveKrPC+3
         5nNiJLrZKpmRdUjWDHNJvimGfzeumzrDJ/hSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=IWq2Kd2jbLZvl8HH9oH8eQxXkjxOWjbVJI9WYk7Xq18=;
        b=4+Azi9T46TT0ld6YzREdO+BJcjO6UKLndSydreJznmNqVNuinIYOXnHA2/rG9KmqI1
         rjS5nhzB37Rfzw2otjab9hTdqMDVILhjHf6EpHSHxi2yrmUvf/5+6wbaXIR+RJ4ZDrEs
         TofcHcRbj14V0RP9Ww6GorLNwfxw7mm+AH3ZAJGkbn9rN7pareZafrtaVXht9cVaodtA
         GzRUqkQAFVT8DE5NcbsKVhJ3G4ckyzzuR8lPbjs0Uxt5DOLg9Kh3eCacgG4eWcQ2fpFg
         Yh39X9ZAXP2PCeEvpsEvn4NzUDk1pM8wBFGYPmG8KUk//nRqUVELDLyt6tP16PJKmSRN
         l2iA==
X-Gm-Message-State: AOAM533vBeeHPQyFFQZRhZ10sHpd3VDYBX762A5G08yGtj1LDjpGICz+
	B8gO5Tep+Jt7FqJ3JZyawhne7Q==
X-Google-Smtp-Source: 
 ABdhPJzc9W6FT1Qz3xbPGXbrC/SHSEXtBYcAT5Nu/bSpcNaw7tFRrzIbSeVe3BPMbx0blRtmwqwJ5A==
X-Received: by 2002:a05:600c:5126:b0:397:4862:e477 with SMTP id
 o38-20020a05600c512600b003974862e477mr1848426wms.123.1653211488818;
        Sun, 22 May 2022 02:24:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a337:fcd8:5dd9:46df?
 ([2001:8b0:aba:5f3c:a337:fcd8:5dd9:46df])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a1ccc02000000b0039466988f6csm6041592wmb.31.2022.05.22.02.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 02:24:48 -0700 (PDT)
Message-ID: 
 <f304f84a8bb4bd353898d54cf1378b5c0084498e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
From: richard.purdie@linuxfoundation.org
To: Markus Volk <f_l_k@t-online.de>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 22 May 2022 10:24:45 +0100
In-Reply-To: <1286dfdb-a0ac-67a7-a026-f95da89c35da@t-online.de>
References: <20220519064312.391164-1-f_l_k@t-online.de>
	 <20220519184315.1e91b017@melee>
	 <70887c7d-4063-93d5-025f-46c4a17e5940@t-online.de>
	 <31d4ac7f1c8db63e0bcc2028c787dc59e30a2781.camel@linuxfoundation.org>
	 <1286dfdb-a0ac-67a7-a026-f95da89c35da@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 09:24:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165973

On Sun, 2022-05-22 at 10:48 +0200, Markus Volk wrote:
> Those are valid objections and I wasn't happy with how invasive the=20
> necessary changes were either. The reason I'm still working on it is=20
> that I'd really like to have an alignment for native/target for libsdl2.=
=20
> As it is, libsdl2-native unconditionally adds x11. From the perspective=
=20
> that we eventually want to reach the point where wayland/x11 becomes an=
=20
> either/or decision, I think that should be changed.

The background helps thanks. Keep in mind that:

a) users can change the default PACKAGECONFIG, even for the native
version only.


b) we have a general policy of trying to support most user's configs
with the default native configuration. This isn't always possible and
libsdl/mesa are particularly tricky as they reach further into the host
than almost any other component we have.

x11 on the host should be separately controlled to the target x11 since
I can imagine developers with it on the desktop but not their target
and the other way around too. As such I'm not sure the goal of making
them match is compatible with the other things OE-Core tries to do.

> I did some cleanup and it is much less invasive now. To align=20
> native/target PACKAGECONFIG, only patches 1-3 are needed. 4-5 add=20
> pipewire and libdecor and I added them just for completeness.

We should add the PACKAGECONFIG entries, that is straight forward. What
the defaults should be is a different question and trickier. If the
config is there, that should be easier for you though.

I'm actually personally roughly in favour of adding libdecor, I know
others are less inclined.

>=20
> The patches are made for kirkstone because I have too many problems with=
=20
> the poky master branch distracting me at the moment.

What kind of issues? :/=C2=A0

I did merge one of your simpler patches to master FWIW but that does
mean this series doesn't apply now which makes testing harder.

Cheers,

Richard



