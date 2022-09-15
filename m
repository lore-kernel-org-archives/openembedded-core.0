Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28773C6FA89
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:28:54 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web12.10687.1663252124459696485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ycj+e/tM;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so37980783fac.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=STSwL9swTjV5ik++8CLFfT90GUVfCvaQm7eR7S1TtzQ=;
        b=Ycj+e/tMBWDv7iUYdmvYzSNAGuqMKolCNK98+HS1qS9h745C+L6w7n+NCJvHDNARzm
         F0dE3f9JeTzuz3bBDhlWfg1CAsq4tij9TX62LnB0D66biCJjBL+y/dl3LCTCjR1enc/p
         0/pWNf75WKnQG6g5fMJE8hiDiJVVWgG9VoLmjoJpGP8KwCS6AgvicWZwkBEGti2+JClE
         UGvHAlk5Ukr0NBtT+SI3mavSIaHrhs3jyFxG9sZK3ZByM1gMJVkPC4MNxptqWbUBNOTF
         v+xZfgkIooLxRNbtApmt2p//mQVVtqGjzz6YzC5C0tGRKmceUEAmm4ojWgAnt6SAhTSU
         NoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=STSwL9swTjV5ik++8CLFfT90GUVfCvaQm7eR7S1TtzQ=;
        b=6WbAA8dYPI2r22/1/Udbi439LsWIID3WvaoMyT7r4MuTENgYu386/G+3L5DRv7yXLV
         G2U9AMe7iUZ2KSltJF5xAX8C1jkDEfDNb4Qg6myLYGGcT9bIZMQ8gr3Nf/nw3j7cPq1+
         +y4UjvnFR8m2ND164CKKbLXnqhSR9MTI6Ms5CNkMUN86ro29Xakbzb5GVZrdbJW8X0qg
         jnMDSuNxsP1vP4Sa5TeT1ESeCLXQ0aJOMLmv1kPKffVqMF4pCheWrB08PACKsPcsPro7
         yLarc0vnuZ23GiDdZnVRArrXsREZpixYRPxyYte/3vqgECzbqY0sEXxxFsJC6os8PC5k
         WNuw==
X-Gm-Message-State: ACgBeo021jMu0SWqnHOrJhTML9auCCjdlWzWsPsDH5amZnHFDRtF8sXm
	pPcpdjYovhv8ZqMKf5Cf61WN45J86dcfzgobKWk=
X-Google-Smtp-Source: 
 AA6agR5N91tVA66BwEUX4cvdyatcF3H173AJp16oGUbWSyWMUoMMuY7M6LVZwV1MMAh9A1rAsS85N9QohRGU1sD98UQ=
X-Received: by 2002:a05:6870:f222:b0:10b:7326:18c2 with SMTP id
 t34-20020a056870f22200b0010b732618c2mr5299588oao.55.1663252123630; Thu, 15
 Sep 2022 07:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220915111440.2121310-1-sundeep.kokkonda@gmail.com>
 <28696.1663240817153040654@lists.openembedded.org>
In-Reply-To: <28696.1663240817153040654@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Sep 2022 07:28:17 -0700
Message-ID: 
 <CAMKF1sqGSE3La+aMDtJTgNxUmXSmM7MxtjmnqPpcbkOydQOxVQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] glibc : stable 2.35 branch updates.
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:28:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170771

On Thu, Sep 15, 2022 at 4:20 AM Sundeep KOKKONDA
<sundeep.kokkonda@gmail.com> wrote:
>
> Regression test are performed and below is test summary.
>
> Test summary after glibc updates:
> 204 FAIL
> 4341 PASS
> 41 UNSUPPORTED
> 12 XFAIL
>  6 XPASS
>
> Test summary before glibc updates:
> 200 FAIL
> 4343 PASS
> 41 UNSUPPORTED
> 12 XFAIL
>  6 XPASS
>
> There are 4 tests added newly and 2 are removed with latest glibc commits.
>

which ones fail. can you describe them a bit here

>
>
> Thanks,
> Sundeep K.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170690): https://lists.openembedded.org/g/openembedded-core/message/170690
> Mute This Topic: https://lists.openembedded.org/mt/93697438/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

