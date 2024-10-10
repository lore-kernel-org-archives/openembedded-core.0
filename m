Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A72CF11E1
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:19:19 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.41798.1728562749843781968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 05:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A13QX6e7;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fabc9bc5dfso8181291fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 05:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728562748; x=1729167548; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dx6VMnF8xyt1HZkNbttYiNK0HEaBEf/DbK3IwC0F8Gw=;
        b=A13QX6e7JztxiX1CCtNm5v6tYtIERpuhZQg9qx7EM1Skhm2uzbpUfURv+QlQppDad8
         G3haGRzF1aP/3rixSEjWg2foYOr0gvZlPxubgvH39wdO8/fahcS+HhlU9AMvWZCVG2P3
         gV+bX0v0tyad6yA/TLzJ2YREa2sMvHE2KSdwzT7dP9h7Hm1HmKcnLHJCdi34aOMMyXp2
         i9K+b8uVh1vdhn6Y/cNUIT/LQjOGdTtu3iWczsTFbLT/amqNV26ZIJR87DCksPRAvqYH
         s7BPs994Kik0OiGkge3N+neAfdv1HMQQPo1rhwjsykbCwS01VY+eQNe9crpEzWtvWE5P
         uuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728562748; x=1729167548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dx6VMnF8xyt1HZkNbttYiNK0HEaBEf/DbK3IwC0F8Gw=;
        b=QZe/XQiuzkzNRiILddVl7AQGGFT6FguCM616oURfMXbvrDMuYYXQnLhqH3Fro5ubJx
         rrNvt8QDmjK02iI1G2VPC9yZRcSiAzHXTOf7/UlQyHs8xiS3ED40IRI8POIIJ0IkBjjw
         WnoPqVJA7SKC5fohW3SmnqnLaM0PcWkn1mqJygjAzPlIrV1Yijcionpg8hJR5s7QMHoD
         anXQ/dCFh6IulTmQ8EArz3uD1ND7FWsVREuTzegrFb/iPEGjqOoEpWGz2jDJ4QJ0WJvB
         IklWQ3CSC666TrYA8lOzKmR1qJvadsJmIYGx+LSqXD37/fOinB0a0NOQGKqs7dgNTqUM
         ze8A==
X-Forwarded-Encrypted: i=1; AJvYcCXCwbBkHU8wBH3eFPXQrqvMLVtzr2eTyaRZKhoSO3zpEoo45VBR/sIwvZOWU/yAjBxG93cpKAE352QQO+OtiHceNw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHSbGY8iOjYAG/zl/hDQ3Ltn9hnhA+/FRn3nBhnyiO0i29UPof
	25vWTI7dqL4ViFbKH8jXmlGemE5zT/lYMuV9BGldAu5bs6adY8z8yUPVkvOFPfFwX5U9J/9RzLs
	osKRzxUxv+boB6Z/QZiCJcw9j9wI=
X-Google-Smtp-Source: AGHT+IF9J/SzEtjAZJDogSO1ZTP2cP1QuVz5cA+wl3d3Sp8ogirIVSLRQaLyrME+iW22G8WOU6wF6Zx4s0f4LQvo1kE=
X-Received: by 2002:a05:651c:2105:b0:2ef:2490:46fb with SMTP id
 38308e7fff4ca-2fb187d1bf0mr32425701fa.37.1728562747413; Thu, 10 Oct 2024
 05:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <a77f128585324bb49c95d2ddd56edb25@amazon.com>
In-Reply-To: <a77f128585324bb49c95d2ddd56edb25@amazon.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Oct 2024 14:18:55 +0200
Message-ID: <CANNYZj-hM2bXWt8UBJVdy_gV_9OR9=G4UHEr2CM_397U9V8gew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: remove corrupted artifacts from local mirror
To: "Sobon, Przemyslaw" <psobon@amazon.com>
Cc: "Yu, Max" <yumx@amazon.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 12:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205405

On Tue, 8 Oct 2024 at 20:47, Sobon, Przemyslaw <psobon@amazon.com> wrote:
> The "only one reporting" does not mean the problem does not exist, it may be
> just not as big problem for others as for us. Similar problem exist for DRAM
> memory corruptions? Most of the people don't care about that but for some
> this is important problem, e.g. when you see 1 OS crash per 10 years it is
> not a big deal but if you own 10k servers you see 3 crashes per day. That is
> the scale factor that is important. Max talked about our scale already.
> Summarizing, the manual work is not a solution for us due to scale.

But can you say what your scale actually is? How many sstate objects
are written into the shared cache per day? How often do you see
corruptions?

Basically it helps if you introduce yourselves and your product first,
as this is I think you first time interacting with the community?

> I disagree, we can overwrite bad artifact. Yocto indirectly does that as it has
> to rebuild the package. This is "by design" behavior. And to be honest, there is
> no difference between (1) rebuilding the package every time and (2) overwriting
> sstate cache so any other build can reuse it. Is there any concern around
> uploading such freshly built artifact?

The concern is that your patch does not overwrite the artifact, rather
it deletes it first, and recreates it later. This creates a time
window where a cache object exists, and then it doesn't, and then it
exists again. This will break builds running in parallel in all sorts
of interesting ways, as sstate is not designed for objects
disappearing after they've been checked and confirmed to exist by
bitbake.

For example, when we do need to test cache deletions (for instance in
oe-selftest), we make super-sure that this is done on a private small
test cache that isn't shared with anything, as otherwise there have
been notoriously strange failures in random places.

The other concern I expressed to Max: this auto-recovery sweeps the
'flaky hardware' problem under the rug, instead of being loud and
clear about it. If someone had a perfectly working sstate (and many
people do, including the yocto upstream), and then it started throwing
random fails, they're not going to notice it. If someone had very rare
corruptions and then the rate increased, they're not going to notice
that either. Except when they start to wonder why builds seem to take
longer and longer and longer.

> This is random thing, we are not in control of e.g. DRAM bit flip error, they
> simply happen. To simulate the situation you can inject an error yourself by
> e.g., overwriting the random byte of the zstd file before it is uploaded.

Yes, I saw it. The key issue is this bit in sstate.bbclass before
actually creating the sstate archive:

        if sstate_pkg.exists():
            touch(sstate_pkg)
            return

If sstate item exists, then it will not be replaced, even if it's been
determined to be corrupted earlier.

I don't know yet how to best handle this, but I would want to improve
*reporting* of corrupt sstate before we can decide whether yocto can
do something about it that doesn't make things worse than they are
now.

Then you can take the report and run a script that deletes the
offending items. This all can be automated, and doesn't have to be
executed manually.

Alex

