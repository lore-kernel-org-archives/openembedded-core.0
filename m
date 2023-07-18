Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F594EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 09:14:08 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.3782.1689671645889546786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 02:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=SjYLJlip;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.175, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b701e41cd3so83640021fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689671644; x=1692263644;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VchFPursqz1DqBeHVEob1qYRRFKGALBDcKtmA1+Wa98=;
        b=SjYLJlipMskkRb+F6gDHGoGN4T+BB5V3MKdMqZOAWt/f6PaL5gms5dYchxENi0qgcq
         TNEaYDZLSysdIHJqTLOTi9aUK4eb3PzLPeMkefoJRwC29qlteyS5kdWLmCfx9SfopgDV
         HndUc609foFityqcgztrAELjRYIXicJIM52zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689671644; x=1692263644;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VchFPursqz1DqBeHVEob1qYRRFKGALBDcKtmA1+Wa98=;
        b=FuTT7N1TUgD/H0ouo9CpkVFWEd8DNLuAgNzwlZXYkTikmeYAbZsNo5dUmjV+uhxR2l
         9h1VOi8Tz4PUtTrZdAXjQ7U+A4hCjRKV0OuPrmPuxRrT2yGrr91XqrhtwkUi3EnJaXsz
         jTEERqgpZlyBiz+Mr0vLlgQYfkq5lfBFhbiJk372fRAgzhYmjPtByjy1mhJMSuwhi9H1
         XA7DJI3l8easjHcB39mazSsfkzrdQaxymbuXVxcroPadb/3tJHCWhs4YvQVdCzKb/pUD
         5Afg3q5YqurRqsCnm3njc7i+Q9LLt9hNV8NtRP5OdEDJwAyhAdMX989oT8A8ObtUt/ad
         aJzg==
X-Gm-Message-State: ABy/qLZG2zd5UryR9A7KhyYegsUdkJ3Kktd3C7Mzkkx+O/N8hsHmYKWd
	YmWYCy9L6DJC/3kOKMTUG2urRYVGMbeC/mX0AKc=
X-Google-Smtp-Source: APBJJlEHIpsDuQf1jqugCAZhHczrdvTyna9h23xqR6ng9n0FaNYz4P8clMXdNPZFmBg298ZNVXc77g==
X-Received: by 2002:a2e:b053:0:b0:2b9:4476:ab28 with SMTP id d19-20020a2eb053000000b002b94476ab28mr3352038ljl.38.1689671643757;
        Tue, 18 Jul 2023 02:14:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:363c:9ce3:3c57:ed22? ([2001:8b0:aba:5f3c:363c:9ce3:3c57:ed22])
        by smtp.gmail.com with ESMTPSA id j8-20020a5d4488000000b0031417b0d338sm1788839wrq.87.2023.07.18.02.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 02:14:03 -0700 (PDT)
Message-ID: <b491d83d02d9665a397dafcd6842f1c959fefad0.camel@linuxfoundation.org>
Subject: Toolchain test results
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>, Ross Burton <ross.burton@arm.com>, 
 "Mittal, Anuj" <anuj.mittal@intel.com>, Randy MacLeod
 <randy.macleod@windriver.com>, "Kokkonda, Sundeep"
 <Sundeep.Kokkonda@windriver.com>
Date: Tue, 18 Jul 2023 10:14:02 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184498

[Anuj/Steve/Ross - questions below!]

I thought I'd share a summary of the recent toolchain test
changes/work. We can see the "baseline" from the 4.2 test report:

https://downloads.yoctoproject.org/releases/yocto/milestones/yocto-4.2_M3/t=
estresults/testresult-report.txt

showing that we run 2.9 million tests (2946881) with 174470 failures.

Once we noticed qemuarm64 toolchain test results were showing ~125,000
failures and had done since the 3.4 release, Ross was able to find and
fix it:

https://git.yoctoproject.org/poky/commit/?id=3Db0f1ab9810d87960d2753b0fe780=
39b874fd15fd
https://git.yoctoproject.org/poky/commit/?id=3Daf39b83e58ec159a9a13d85067c2=
595535442566

Thanks Ross (even if you did break it too! :)

I've also merged:

https://git.yoctoproject.org/poky/commit/?id=3Dc94fd2737e7e341188c8c41d911f=
1c60240088a2

which takes care of many of the qemuppc failures.

This brings the report down to:

https://autobuilder.yocto.io/pub/non-release/20230717-18/testresults/testre=
sult-report.txt

so 3229355 tests and 15496 failures.

qemuarm has ~350 failures
qemuarm64 has ~350 failures
qemux86-64 has ~4000 (3900 in glibc)
qemux86 has ~4000 (3500 in glibc)
qemuppc has ~600 failures
qemumips64 has ~5000 failures (all over)
qemumips has ~1600 failures

We could also do with understanding the qemuarm64 ltp syscall failures.
The other ltp failures look the same for x86 and arm.

Anuj: Can Intel look into the glibc test failures on x86?
Steve: Can we backport those patches to kirkstone/mickledore?
Ross: Can ARM look into the ltp syscall issue?

Is anyone else interested/able to help in cleaning up these results a
bit further? Once have a good baseline, it will make it much easier to
look for and spot regressions.

Cheers,

Richard







