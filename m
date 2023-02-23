Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D18C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 17:02:51 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.16298.1677171763095013918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 09:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dHdQsJ8+;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id h16so44737686edz.10
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 09:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gsnSkQ/bkFJ0lFzyjNYPbESBr71DYXtOA/x81QfPKwU=;
        b=dHdQsJ8+srEovkiENxJt8RSWBkrr3ZzQysqA8ze/4wL9pAWC8iJVri1BtauFQn6KGu
         3cBVf0TVFMl/+fPeUKqQTAr9CRZ0Uw5D3SvQPbXc+HO7Mc/leZzNHKwiB8Byl/pF0t8f
         adgRWCly0Lp4uWqAouLHwoyBojjkbrChlD7OebagaHyigmOybrMQJEIzLEn9A7qXENmI
         le84/KK2BiHrwDza8OjMj560Ad/zDcJvvh54WAzd4Ge7oOXahuvH9ejNGxV1nqj6M+2n
         ZZ2Gzd828L+Uq+9mhZTZLS8Vpsy+LHUBeCy+0OUVyZbAlczdSJwY8sFyO5F90i9ly57F
         +AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsnSkQ/bkFJ0lFzyjNYPbESBr71DYXtOA/x81QfPKwU=;
        b=JrWPkSJFr7U7nR13e0uK/j0+xn/KAFFCTnyxXksgomLHEv0/kUO4NaK0S2Qi0GdKx2
         b0QfUfx3Uin46SEhjpGxNBy+nC6GHqs85eFPJVj2qC0DWu8h2GF9iZmflgf+HHVi5cds
         JcdwFeg9uJU1TOQqwLSKwFdo82dDNK/vZuYI7EQipiy0xRlKxTp1SC+t6H1W/KKONKXI
         Pb7Pvrg7+C8S42V2Q+iXcJWjtGf8w9fR5AhXJrHjvwGuHgFOEpQOop2BlGvMkuSjA5BB
         1VCYtcnZYXP8ZQefSjl6RJaIANQw/Hnrddg1+QhbZh+Y9lMkqtt2MAYVHamcwKuc+HAE
         O6jA==
X-Gm-Message-State: AO0yUKV9NQax0b8hKJbeygH3DcYuEmABjEoPtL4kZPmE2nhM0jVE8k6I
	8vZ0geJVXFUs0ausRPUNrVd5TDMgF9wUUzNfEeM=
X-Google-Smtp-Source: AK7set/QmPs9vPxAZHei9uuaVOC3358d9Qj3UO2m517xm/Zq6GXJgo/lDP7J2+h5H4bKn4AWWH/EWCU+ZKV0pdE/SyQ=
X-Received: by 2002:a17:907:8c1a:b0:8e7:905b:cbc9 with SMTP id
 ta26-20020a1709078c1a00b008e7905bcbc9mr4039288ejc.6.1677171761302; Thu, 23
 Feb 2023 09:02:41 -0800 (PST)
MIME-Version: 1.0
References: <8a4852e0-7d49-dfc3-7f41-9bf6c0c28016@bootlin.com>
In-Reply-To: <8a4852e0-7d49-dfc3-7f41-9bf6c0c28016@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 23 Feb 2023 11:02:29 -0600
Message-ID: <CAJdd5GaxBbk6bSUDKYyZcSsDM_kdgSUkaDF+kHzU_+AjJp1x+Q@mail.gmail.com>
Subject: Re: [docs] [DISTRO|MACHINE]_FEATURES_BACKFILL_CONSIDERED: confusing
 variable names?
To: michael.opdenacker@bootlin.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 17:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177615

On Thu, Feb 23, 2023 at 10:59 AM Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>
> Greetings
>
> Anybody else finding the DISTRO_FEATURES_BACKFILL_CONSIDERED and
> MACHINE_FEATURES_BACKFILL_CONSIDERED variable names confusing?

I believe the history there is that those are "features" that were
just always available and couldn't be turned off (e.g. they were
implicit). When they became available to be turned off, it was desired
to not break existing setups by making them "off by default", so you
have to explicitly opt-out of said feature. I always think of it as "I
CONSIDERED this features and don't want it"


>
> According to the documentation about "feature backfilling"
> (https://docs.yoctoproject.org/ref-manual/features.html#ref-features-backfill),
> these variables allow to exclude some features from being backfilled.
>
> I'm not a native English speaker, but for me, "considered" carries the
> intention to include a feature, not to exclude one.
>
> Shouldn't we call these variables DISTRO_FEATURES_BACKFILL_EXCLUDED and
> MACHINE_FEATURES_BACKFILL_EXCLUDED instead ?
>
> Thanks in advance
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3728): https://lists.yoctoproject.org/g/docs/message/3728
> Mute This Topic: https://lists.yoctoproject.org/mt/97187179/3616693
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

