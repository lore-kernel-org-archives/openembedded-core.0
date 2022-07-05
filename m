Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B562C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 10:18:27 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.82673.1657016298564397016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 03:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fXpHPJ/5;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id a15so4985636pjs.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 03:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=k3obYFKcG2gQt0Oe+3XcJgaHyKtw759JGO7mKBb4YMw=;
        b=fXpHPJ/58GuZacyoNI+fidt7iGpU8WDFwf6lipp8+uwIkmfseGyEClp2DtMFEjm4Y/
         sMfCHDEu7AdWGx6e/EcyHNvV50fDpSHhUAYLJ7rPDts5GSJNzxG+N+13HOu846qvj3Y5
         lNOuv+lURd5z4Vev+oBQQ9pEC8bE/Kn8yqk6OcVuoTL8AGvE0fyD+6pfT/qJGNp50DPu
         GIrqmBYHlfxRozYyyTEjeaQRoFvfJGfVct4V0m9SEYgISPv6hBcuvnt1fKfx5x+PUQff
         cpEVF6pDwWqvDuyF5Gt27RdaEDHGqg8TdrW3tLhLcU/EZdFCtajwYTplosk9RHY//iA6
         TyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=k3obYFKcG2gQt0Oe+3XcJgaHyKtw759JGO7mKBb4YMw=;
        b=RNSf6Kr0Hg1inNhtAAglXlmzMzNktKJ05lrbc9HJaBN36rUqtKmTCtkc8vR22ogcxE
         0dytTF3X6L3iDRwyIGJc4vETtgaT8ARIPPi9oFvbsfW0u2lbOurVl/cRv29FRsxlmW58
         cEtrsybNpfFVnUCbWTSu7OBjXqq7ytgdgiyUi3Sp6rhm5eW8mRVXuZyIdGz49yQfU9wb
         2R+GofKuzSq7AjJiA88nhKeELHkgxP5xkxdA5w7/1PejGV+a+DSFCHD5GUnjAAo2QcV+
         5i8/+C161p45+bqLmInnWJn1xapkoWLnbv8K5x+dRXPxL6hduo56zK5gD+MuXS4OXJFW
         kWHw==
X-Gm-Message-State: AJIora9iQLI851X5oNR3DbtsmP/vrigz44SYVLFu5C7JZSFIeD3bZkz8
	EaciEQ4OoYgAattowNVNU+PdeLfeF9To4w==
X-Google-Smtp-Source: 
 AGRyM1tXqJm9zzVLwHXc9arNzmLCFd6jGuDboY0H/rJxQVth/VB1acgn/mfAbZRN9Zmync7rAFyPfw==
X-Received: by 2002:a17:90a:8815:b0:1ee:f3f3:2607 with SMTP id
 s21-20020a17090a881500b001eef3f32607mr41082154pjn.72.1657016297538;
        Tue, 05 Jul 2022 03:18:17 -0700 (PDT)
Received: from LPTBFTI009 ([49.205.113.207])
        by smtp.gmail.com with ESMTPSA id
 x3-20020a170902a38300b0016be4d78792sm3812444pla.257.2022.07.05.03.18.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:18:16 -0700 (PDT)
From: sundeep.kokkonda@gmail.com
X-Google-Original-From: <sundeep.Kokkonda@gmail.com>
To: "'Richard Purdie'" <richard.purdie@linuxfoundation.org>
Cc: <openembedded-core@lists.openembedded.org>
References: <20220704071832.3400931-1-sundeep.kokkonda@gmail.com>
	 <26024.1656921064972068793@lists.openembedded.org>
 <9e541f91d002db8ef50b187ea8a6ad470e6dc49a.camel@linuxfoundation.org>
In-Reply-To: 
 <9e541f91d002db8ef50b187ea8a6ad470e6dc49a.camel@linuxfoundation.org>
Subject: RE: [OE-core] [kirkstone] Binutils,
 Glibc: Updated with latest commits
Date: Tue, 5 Jul 2022 15:48:12 +0530
Message-ID: <002101d89058$89ef9010$9dceb030$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQHBdFi2sRiDFESjUm9WnTELqfO6sgLZOUD8AiI4JFetdet+QA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 10:18:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167648

Hello Richard,

> -----Original Message-----
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> Sent: 04 July 2022 14:20
> To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [kirkstone] Binutils, Glibc: Updated with =
latest commits
>=20
> On Mon, 2022-07-04 at 00:51 -0700, Sundeep KOKKONDA wrote:
> > The regression test for Binutils and Glibc is performed.
> >
> > 1) Binutils test shows no regression after update.
> >
> > 2) Glibc test result:
> > Test summary before glibc update on Kirkstone:
> >     204 FAIL
> >    4320 PASS
> >      43 UNSUPPORTED
> >      12 XFAIL
> >       6 XPASS
> >
> > Test summary after glibc update on Kirkstone:
> >     204 FAIL
> >    4339 PASS
> >      41 UNSUPPORTED
> >      12 XFAIL
> >       6 XPASS
> >
> > Test results analysis:
> > Total 4585 test cases before Glibc update & Total 4602 test cases
> > after Glibc update.
> > 17 new test cases added (out of those 16 PASS & 1 FAIL)
> > 12 new FAIL test cases after glibc update
> > 14 new PASS test cases after glibc update
>=20
> Do we know why some of the failing test cass now pass and why some of =
the
> passing test cases now fail? Is this some issue with the way we're =
testing things?
> I'm wondering if this is "normal" noise between test runs and if there =
is some
> underlying instability or glibc changes do cause changes in pass/fails =
of tests like
> this in general?


Hello Richard,

The test results are impacted by Execution procedure OR by Changes in =
glibc.

Execution procedure:
I tested the glibc with the cross-compiler method given in =
https://sourceware.org/glibc/wiki/Testing/Testsuite for the aarch64 =
architecture on qemu.
However, based on our past test experience, we're following a few =
additional steps like copying the 'glibc-locale/2.28-r0/image/usr/*' to =
booted qemu image /usr/ directory (This step is not mentioned the glibc =
wiki) etc.
Also, the glibc test is aborted when the -Werror=3Dformat-security flag =
is used and to get the test done we've removed this error flag and =
compiled glibc sources.

Since the glibc test not performed very frequently, I am not sure the =
additional steps what we followed are obsolete or not. I am now working =
on adhering to the test procedure mentioned in the glibc test wiki and =
will see the results.

Changes in glibc:
To comment on the code change impact on the test failures I've to look =
into each failed test case by case and what are the changes in glibc and =
how it is impacting the test.


I'll keep you posted on this and since the glibc test execution is =
taking a lot of time my response may be delayed.



Thanks,
Sundeep K.


>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20



