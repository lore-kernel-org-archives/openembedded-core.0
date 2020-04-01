Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.3650.1585766060510496101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 11:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=Lj8HS09y;
 spf=pass (domain: google.com, ip: 209.85.167.67, mailfrom: paulburton@google.com)
Received: by mail-lf1-f67.google.com with SMTP id j17so545292lfe.7
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 11:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g78/6G6H1nCUospKX1I2EGMstw5Tc64JOmvYSPZ8EBk=;
        b=Lj8HS09yb8LnEfCW1i400TB1NflnAcAN2JYARCn98FhxeiI1UXz2n4g7QVnnXW2ofc
         nMWWaYqlN1EjaNkB2AiULtIQilXi05b2WO0EsFTD+JKj3ZeGJ5MRUy1z93R0vETccLvm
         fKrpoHOato1Qjsn8wLBF6S94OWtYBj6aAo/Pa+P1a96upyFpOUoiqNA1zb4Rhggn6juu
         pnbf2yMCbAIEvgnG5ZIifeXZADvwTsGqIE5NroGr5kcyowkj0fixBRJzxrgi+r8mrZ07
         EGo1/pxRZv0gpKMk7GW5WyC61v01bxKfMfrIni3WXqxdSepf9kP4+/mCVNQkeNt3TB6w
         tiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g78/6G6H1nCUospKX1I2EGMstw5Tc64JOmvYSPZ8EBk=;
        b=PbOFsJkz15oRyO3nxBPEub7IA2wrfB7x58wDvG2ObIAq7Pv1AGwchne3fPqspUTN48
         DHYZwb8q2/szhTsRiEe4z+eK/+Z0MV5nMjPkNghyWzdH/ZPMWzmhE+s03mBjukgtk2lx
         fdgeE2u5jzsD/9mv+6nqmQZpWhHdvq23bT0KkQNfBj34AwWrConFVDdsuZ4oEZCDAnvU
         zV0Xr5bjF5L8WfJ3Pq0NZQbjJvNvjXg+mqSGbEEH87rzOVXoOUJbPG9LzLxxLb3xrepr
         g/04X71xULQcWQgj3emsWB8TDc93/IclpXj3BqsPdKqbEppts67b2KWKBtliDoyyZwhG
         fIsg==
X-Gm-Message-State: AGi0PuaRefxiRK8tWKC4AYfCytdN7scq86Cs3guBhkrpWZWEWnlzCnyd
	qJUCOxJ/P8z5pDs53LazVPMIcfiOyMvP3KJPekZj+A==
X-Google-Smtp-Source: APiQypJwFIfw96hTRaHSennLyI2qPPF6yJo4sbXA8+2xgX6kArY14rcB48ICefj0SpttkX30Y/FWD8T91yGzR6Sq3Fo=
X-Received: by 2002:a05:6512:3189:: with SMTP id i9mr5864363lfe.178.1585766058530;
 Wed, 01 Apr 2020 11:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200331235607.93023-1-paulburton@google.com> <CADkTA4NEN1PPVrm7N2HF+tVa4j2Tgv1_=YYFmQhbFscV5RSjWA@mail.gmail.com>
 <CADkTA4NQ4g1qOrbi1fdzmUq6Xk_8fm=QtNPpm7C+0U-oVpmU=w@mail.gmail.com> <CA+chaQcg5NS+DJ0be92Wz+EaozpomKg12fkFrmFFaJcr7RGdiA@mail.gmail.com>
In-Reply-To: <CA+chaQcg5NS+DJ0be92Wz+EaozpomKg12fkFrmFFaJcr7RGdiA@mail.gmail.com>
From: "Paul Burton" <paulburton@google.com>
Date: Wed, 1 Apr 2020 11:34:07 -0700
Message-ID: <CAB_4824tHLRghj8gewGd8kLSRor7uLUmus1X5nvvKWipz5C3tQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: Stop creating empty .scmversion files
To: Martin Jansa <martin.jansa@gmail.com>, Trevor Woerner <twoerner@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin & Bruce,

Thanks for your responses & filling in some of the background here.

On Tue, Mar 31, 2020 at 6:32 PM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> Also note that in 2017 Trevor Woerner tried exactly the same fix that
> you are doing, but ended up retracting it when he found a test case
> that was still adding a + to the version.
>
> see: [OE-core] [PATCH] meta/classes/kernel.bbclass: revert 56fe5300ab5
>
> It might be worth checking with Trevor to see if he recalls what case
> it was where the + snuck back in.

Absolutely - Trevor if you recall any details they'd be very much
appreciated. I have my fingers crossed it might have been a case like
the one Martin describes below :)

On Tue, Mar 31, 2020 at 7:03 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
> Another piece of this puzzle might also be that in 2012 I was still using=
 minimalistic gentoo chroot, which was shared across all builders as git re=
pository, so even when you were building some kernel from tarball it might =
have incorrectly assume that the kernel repo is dirty (even when it was the=
 git repo in top level rootfs directory which was dirty).

Interesting - I think we should be able to deal with that case by
setting the GIT_CEILING_DIRECTORIES environment variable, I'll give
that a go.

Thanks,
    Paul
