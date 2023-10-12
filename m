Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1691ECDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 06:33:00 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.5553.1697092372885671013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 23:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W5/VC7Qt;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1e987b1981eso356111fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 23:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697092372; x=1697697172; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAG9E59wrfYoRuZ5wXUJrt9L0AqwHOM+OBnmGZEg0KA=;
        b=W5/VC7QtNQ8zl5MjV2UpnH33c4GpcCq+I8aa5TJ7keYf5s5eTZQcZBUidH7gzXVpu7
         bhY02FKvgfsoVyCyGwrUnjAU5y+CGtrt3++ZhepKlvI8iUEfPaAXasB3LmRO4qwF3PMs
         T7mTnhVhJyrv8otpRdJk6X01rb+FxoE+n62+wjygtER+CUkb2FqHMzMql25xRtnrK/cM
         YagHxdYw4/ZY05SflPHSuY0RFR+wsbi6c/ieUAZ41aDkzZBwfejerV/u2wEMOd/7ASf2
         WnwsE3blSYQzvSde2R4w6ylxYMn8qpG6McctpdiEETrBE+C37LoK5jJSaXceqFPHg3X1
         Dmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697092372; x=1697697172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAG9E59wrfYoRuZ5wXUJrt9L0AqwHOM+OBnmGZEg0KA=;
        b=n2kAs3h4RMW9h4bEk8SPT02oRB3rd3xOy7M3yXQV1rZB7+P92BpZMC6b6Sv+plAzUb
         Vg5kPAqbYZhxqRBYPO/Ff2TIjbw3pEr5zhyccgx6xNNgHv2guvmkAc86ba99pl5bVGRC
         40yGpCHx0k8YSjMSZModzyj5oWVMIjTUZgSK9m37u6mcDhHfdbPxM1WMYKxVIRCzlMuE
         5rUF11/Cv5iJ0NlvZV6tviOvpSWDXYThbU0DDviZhEv4Ji07SIXhxLEBQPGBZLs3lzeJ
         QttbzIht+lR26GJk6FI27SMayZvHzaAfu2GKr+l4DJ1QFMh8XvdMITY/s8Rjyd2FsKXU
         ctJA==
X-Gm-Message-State: AOJu0YyCbhGECkIRx69G+J/ftxTGdbO0UqbsnQmL3X2CZlGzu/ur14l7
	I4snK5lyqutsNE/MDlUF6mWhidi+JIQbFMCmLqurdQVq9sk=
X-Google-Smtp-Source: AGHT+IGvX9q14lfNB8RhDBQimchZVZRM3DeYWV/btAUx2Q7SWgD89eID7x5jUPRNj53e/fQf0N47ZN9VN2iflrSM748=
X-Received: by 2002:a05:6870:3310:b0:1e9:b4b6:55d4 with SMTP id
 x16-20020a056870331000b001e9b4b655d4mr1208099oae.8.1697092372087; Wed, 11 Oct
 2023 23:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231005110207.1582338-1-Yash.Shinde@windriver.com> <20679.1697091557461045335@lists.openembedded.org>
In-Reply-To: <20679.1697091557461045335@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2023 23:32:26 -0700
Message-ID: <CAMKF1sp1_ATk5=2k=5UVf9few7Er9HTAcWePBjyJ7qo_q4T-RQ@mail.gmail.com>
Subject: Re: [OE-core] [mickledore] glibc: stable 2.37 branch updates.
To: Sanjana V <sanjanasanju1608@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188987

Thanks for the update and reduced list of pass/fails, its really
useful. How much memory does the device under test have ?

On Wed, Oct 11, 2023 at 11:19=E2=80=AFPM Sanjana V <sanjanasanju1608@gmail.=
com> wrote:
>
> Regression testing is done and below are the test results.
>
> Before glibc update
> Summary of test results:
> PASS:4727
> FAIL:240
> XPASS:4
> XFAIL:16
> UNSUPPORTED:220
>
> After glibc update
> Summary of test results:
> PASS:4729
> FAIL:239
> XPASS:4
> XFAIL:16
> UNSUPPORTED:221
>
> These are the newly added test cases
> PASS: io/tst-fcntl-lock-lfs
> UNSUPPORTED: nss/mtrace-tst-nss-gai-hv2-canonname
>
> And below are new failures
> FAIL: nptl/tst-thread-affinity-pthread
> FAIL: nptl/tst-thread-affinity-pthread2
> FAIL: nptl/tst-thread-affinity-sched
>
> And below are new passes
> PASS: malloc/tst-mallocfork3-mcheck
> PASS: nptl/tst-pthread-setuid-loop
> PASS: resolv/tst-ns_name_length_uncompressed
> PASS: string/test-strcasecmp
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188984): https://lists.openembedded.org/g/openembedde=
d-core/message/188984
> Mute This Topic: https://lists.openembedded.org/mt/101774187/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

