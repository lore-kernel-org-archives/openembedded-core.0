Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF53ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 14:56:13 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web11.25816.1662389769922196938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 07:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W/+PlZhb;
 spf=pass (domain: gmail.com, ip: 209.85.217.50,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id 129so663499vsi.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 07:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tHh0q3dmYseAUaNXxWxH1kYlcwMgLMzifJYI9jhf8XQ=;
        b=W/+PlZhbSJ+YouFyiD/flZqkEZ4Y68XpO2U+uvdbmttLupfN8HnpfGGNR1Dc1mxqml
         iFXDr3QNUNbcdLIGZA33SzsfNlujuMHgJ/wXF9ombppts5cyq8jfMtXzfYCysSm9PdsH
         a0I0lGnTOdlBSjvDaomJVgyn4YHMVUwq1dDXKcV6Yk/q8nP3inIlcCzuEjNzQcGaoeRN
         1CTy4nQC0TUxhCCKux0fa1ZhgYKNtfNunAUUZEg/Z5iTA6HeauchLNrA7wCA60kREF9D
         JlxFv3nJ1u+Fsdk2teRvERiAk2ZvG2HQ9II5Kggof+JDyPh41SplyEPl+s7N+4g3sxKG
         rC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tHh0q3dmYseAUaNXxWxH1kYlcwMgLMzifJYI9jhf8XQ=;
        b=mDMjxkd4jHKr+b7A/hZ8w1FnQIQQQMSaNBn3zociLu/R+0/RUkpL6s3lIlRTXO2etd
         2vRGUN5yWZypQcpFMpbR066ccq3oMP3AKokL7UvRtxn2FwKjQ8O62fVgHTAJeEW54hJJ
         j/pFIQPtZ0LAh3ls5McSz73QzeoLOOC5pzWmbcafCQSUH2sFQYsha90m2/SR3CVi6Hq4
         5zzWFJpyNGVWev/6c/1ya7RU31I0hEvnfMvJchRgY8kG5sCpnCh/pzZZ4+QKuiq4XhZ/
         7przMdVXnNkGdY3QaTQW16OGELI38vbe2gUxzSlYe1kpG/CZR+aA+AMvhV+CIfINat57
         cxIQ==
X-Gm-Message-State: ACgBeo33n1saX5IMeCKaYVgX2x+5i7Z2psuOq5h/xzKt+jYkH5jyqKe5
	X2vXACM3HVA5U7iC584a09l/Yip+UiFUqXrJQ2c=
X-Google-Smtp-Source: 
 AA6agR5zkqH/HLK8iowqSMriC2XiCSrX/T17hLuteAYQSEIUXLzJ6O5Ae2/STXL7D0EHiEcYdcokk80zLp3ThJh29sI=
X-Received: by 2002:a05:6102:e8d:b0:38d:a4f2:41a5 with SMTP id
 l13-20020a0561020e8d00b0038da4f241a5mr14212442vst.5.1662389768878; Mon, 05
 Sep 2022 07:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220904063331.82988-1-naveen.gowda@windriver.com>
 <071f8e1caf21c6ba8b043f416e07629969e7f213.camel@linuxfoundation.org>
In-Reply-To: 
 <071f8e1caf21c6ba8b043f416e07629969e7f213.camel@linuxfoundation.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Mon, 5 Sep 2022 20:25:57 +0530
Message-ID: 
 <CALY4986Pc-HmuguPuoe=CKXqX8U=cN4VroAaEwSSuUXDsOOLUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v10] Rust Oe-Selftest implementation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
	vinay.m.engg@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 14:56:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170317

Hi Richard,

Thanks very much for reviewing the patch and your comments regarding it.

>> thread 'main' panicked at 'RUSTDOC_LIBDIR was not set',
>> src/bootstrap/bin/rustdoc.rs:15:48
>> note: run with `RUST_BACKTRACE=1` environment variable to display a
>> backtrace
>> error: could not document `core`

I tried on different environments but could not reproduce the error.
Can you please share with me the oe-selftest.log file to reproduce and
work on it?

>> Something is mangling spaces in your patch. There shouldn't be tabs
Modified the complete file to remove TABS and use white spaces.

>> I think this can be merged with the RustSelfTestBase class as I don't
Merge with RustSelfTestBase.

>> If we want to change grammar, it should be in a separate patch.
Removed it from the patch

>> put that alongside the task definition.
Done.

All modifications are done as per the review comments.
However, I still see that the test PASSes and did not see the mentioned error.

=============================================================
rust.RustSelfTestSystemEmulated.test_rust: PASSED (4812.37s)
2022-09-05 13:43:50,332 - oe-selftest - INFO - SUMMARY:
2022-09-05 13:43:50,332 - oe-selftest - INFO - oe-selftest () - Ran 1
test in 4875.349s
2022-09-05 13:43:50,332 - oe-selftest - INFO - oe-selftest - OK - All
required tests passed (successes=1, skipped=0, failures=0, errors=0)
=============================================================

I am using the following command to run the rust-testsuite:-
oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust
Please let me know if I am missing anything to reproduce the error.

Thanks,
Naveen

