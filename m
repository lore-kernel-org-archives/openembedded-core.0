Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA76CC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 20:34:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.4362.1677098038226533054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 12:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PrDOt/t3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id m14-20020a7bce0e000000b003e00c739ce4so6210598wmc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 12:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oWhyvCW0g7x17bSsvOiNpmLzQ7zETCExcH/ALQmoXo=;
        b=PrDOt/t3mUkpmc27Ag4Y6QrpGWf80suQf5diwuMiHfVGpHv+7y+JGowZbVLkNKHIU+
         Upu7umAYzQ8mNuSJIzaz2i0n/Nv4oHSrRBQSCctucX5XQV2RrlHigSZZe/rHLwHwDQDR
         IBJzciHN+uO+DA5eUXsjNF1A8r35yxQe3SJLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5oWhyvCW0g7x17bSsvOiNpmLzQ7zETCExcH/ALQmoXo=;
        b=gQPOiANQt/UV8rk1gRock6+2BgAzSE14Ui53KjMUa8KSQiwnWw25/AkclcrRp3ziFs
         ITJQyHV2aRceDC9FxDR2wLkMuDfyyJVog9p9XlaCpYV+5BzB7mhEfzM56sPeh14bGPYR
         CnceSSrOvs13USx3HBV144wLtNz3AKJzKU86q4lazF/zgI4PSATMNm8ZnAAnh5JnS+NK
         J5ySvfUuPgK6diD4ywjUB//A26FvnjC6uohUbZ+9xDz8SKsio6CgAY1FXL/IIswFtBkT
         YqrIyKQxpqKaBBBk0Hwg6E6H0DFhXjTgEk2lYZ5ak6WZaO8hiGZpwtCxNDeXZyLnMNGs
         k3Mg==
X-Gm-Message-State: AO0yUKX22D+NgwvtyIIQ5XbJdR1MrMPSmIoOZ0VgbRKqu8DAmW6vuCru
	iJOy4+zZVbfvtvitzxgRWvH+Rg==
X-Google-Smtp-Source: AK7set/cum78vpXOb/OPs9tzPq9Xq3kbn3kLVdGZKE7OPdWy/57qYKTz2luxrQltz5Sw4t8KC9lMXA==
X-Received: by 2002:a05:600c:80f:b0:3df:e46f:c226 with SMTP id k15-20020a05600c080f00b003dfe46fc226mr6646145wmp.16.1677098036550;
        Wed, 22 Feb 2023 12:33:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b127:77d0:f034:5d8a? ([2001:8b0:aba:5f3c:b127:77d0:f034:5d8a])
        by smtp.gmail.com with ESMTPSA id o27-20020a05600c511b00b003e21dcccf9fsm9987772wms.16.2023.02.22.12.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 12:33:56 -0800 (PST)
Message-ID: <3983cc0aa3ab47e2b726103ab9dbd2a5408c76bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] sstate cache management
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2023 20:33:53 +0000
In-Reply-To: <CAO5Uq5Qe4+kJANi+HuDrNK=9okEj9XgaFYzhhuixpVqdtZft1w@mail.gmail.com>
References: 
	<CAO5Uq5Qe4+kJANi+HuDrNK=9okEj9XgaFYzhhuixpVqdtZft1w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 20:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177584

On Wed, 2023-02-22 at 17:56 +0000, Alex Kiernan wrote:
> I needed to do something about our shared sstate store and waded into
> the sstate cache management problem as the existing script takes hours
> to run over NFS (which for better or worse is where ours is). I've set
> myself the problem of replacing the existing script with something
> more extensible, understandable and performant.
>=20
> I've got something which I believed was roughly right, but I'm ending
> up with questions I can't answer when comparing the two outputs...
>=20
> If I run the existing shell script against a tiny sstate-cache (on my
> laptop) I get 420 duplicate files eligible for removal, if I run my
> script I get 491, looking into the delta, I pick out things like
> these:
>=20
> $ find sstate-cache/ -name
> sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:*_populate_sysr=
oot.tar.zst*
> -ls
>     49067     16 -rw-r--r--   1 alexk    alexk       14435 Feb 18
> 15:29 sstate-cache/25/59/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:co=
re2-64:10:2559429e2a553085bc657f3d2a21a111818061448e5fa2aa16398afb5dad8b90_=
populate_sysroot.tar.zst
>     49129     16 -rw-r--r--   1 alexk    alexk       15205 Feb 18
> 15:29 sstate-cache/25/59/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:co=
re2-64:10:2559429e2a553085bc657f3d2a21a111818061448e5fa2aa16398afb5dad8b90_=
populate_sysroot.tar.zst.siginfo
>   2490392     16 -rw-r--r--   1 alexk    alexk       15204 Feb 20
> 13:24 sstate-cache/bf/08/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:co=
re2-64:10:bf08f26e6bc5ab56ed128441fb05edeef41aa881330d04eea127a93ede51713d_=
populate_sysroot.tar.zst.siginfo
>    339439     16 -rw-r--r--   1 alexk    alexk       14423 Feb 20
> 13:24 sstate-cache/bf/08/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:co=
re2-64:10:bf08f26e6bc5ab56ed128441fb05edeef41aa881330d04eea127a93ede51713d_=
populate_sysroot.tar.zst
>=20
> Which look to me like I should be able to delete the older ones, or am
> I missing something? Trying to follow what the existing script is
> supposed to do is challenging!

I'd say delete the older one but it does depend a lot on what you're
building against the cache (e.g. multiple releases). The system is
meant to touch files it uses and the autobuilder just ages out things
not touched for X time where X has varied depending on the pressure on
our NAS.

Cheers,

Richard




