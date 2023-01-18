Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD093C004D4
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 09:13:32 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.11143.1674033207693894766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 01:13:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p/iYQjWw;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-15b9c93848dso26541327fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 01:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GC6L6i+nf1vz2nlt9piGqL/nnadNFzk/3vkL6xtY034=;
        b=p/iYQjWwKA5IZgaC9EuTGbqwnWysV0OzGPcDfXaxy2TCHlfWoIUB5Zlrr7m5ZTK1k/
         yhBggxk0heOKJBQdU2gW1Mpm1CsehwA0i7038x8DtSb3v1aE0PHxe2c7s08iSa6Nb5QH
         k/HIavM3e7/7O6dIXypPlz/TT86fdx5PSDDJ+EhKUb6nW3zsNXJiTYxUNXl0iPY9+gKn
         UCs8VKOMCxkt7R/poHGfAdcCFZQsgjRnVfkf1qEalTTp23J6yPJRPS3oy5f1qYLoxxO2
         bf9CVwsQQFyLzrVfDMDzoegj3duTrsTxyP+pbEBr2cP9S9j4LO7izApvr9vWfhgPizYz
         eWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC6L6i+nf1vz2nlt9piGqL/nnadNFzk/3vkL6xtY034=;
        b=25YcgMKaiMJ6HV5meRLayVK+Yrwj/+a+Al+zcc4oieUb/QFTa43SVeLdsCRA2FR8m+
         40KY65eGPf6DsGKWdhRx831ACDHO0SJjR6QmJnSfL9jPVrDVKilA0zFZKDy3Faa72Xum
         mgms8YzZuliTshH70B5yQVE3YAjE6ZQeAVCtWSWQrm9YilMXDgMR84GdArLIU/Co2f+a
         C1dOG1AAD8VstRN1TQXncnNv1cxmXaWGXUAiFRnhPisn5PNqVt3v3a3IIbJ5xC6sTiWB
         ROLDSXnHd0YZf19Gd1MxEQiRMq1kdSFR8rVot2GHR1G+nGxrn39ItvTieX88lnFp+42l
         d2TQ==
X-Gm-Message-State: AFqh2kpCMQeMRugvamq8iGaqxNM0Lio07u/LJakLpeU5IoHWdPd9eSPJ
	vsBDLAjaf45NRKrbw+fjXXO3Cgh1kq9eQNn4KwU=
X-Google-Smtp-Source: AMrXdXsgCR39LSO2Kbennzib6ViroZIPJMeI8mNtaZ0Vj/qRrh0B193S3PizEQ6cIwxlFY6dY5rA2u+PD+MRMyGQKFQ=
X-Received: by 2002:a05:6870:514a:b0:15e:d5b1:33df with SMTP id
 z10-20020a056870514a00b0015ed5b133dfmr462462oak.55.1674033206861; Wed, 18 Jan
 2023 01:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20230115184358.2276696-1-raj.khem@gmail.com> <20230115184358.2276696-3-raj.khem@gmail.com>
 <CAHMutraaE2nSJWgVxFLDQXsCpyCmX941CYvdbtvUgL0fm7X6MQ@mail.gmail.com>
In-Reply-To: <CAHMutraaE2nSJWgVxFLDQXsCpyCmX941CYvdbtvUgL0fm7X6MQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Jan 2023 01:13:00 -0800
Message-ID: <CAMKF1spHg5pOdF7TuS3keohjYUiQVdK6OJ6H6KgsS9ua0Twhqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] binutils: Delete gdb and supporting sources
To: Alejandro Hernandez <aehs29@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 09:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176080

On Wed, Jan 18, 2023 at 12:47 AM Alejandro Hernandez <aehs29@gmail.com> wrote:
>
> Hey Khem,
>
> On Sun, 15 Jan 2023 at 11:44, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/binutils/binutils.inc | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
>> index 98acf0a222..2b38aeb62d 100644
>> --- a/meta/recipes-devtools/binutils/binutils.inc
>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>> @@ -140,6 +140,16 @@ export CC_FOR_BUILD = "LD_LIBRARY_PATH= ${BUILD_CC}"
>>
>>  MULTIARCH := "${@bb.utils.contains("DISTRO_FEATURES", "multiarch", "yes", "no", d)}"
>>  do_configure[vardeps] += "MULTIARCH"
>> +
>> +addtask do_prepare_sources after do_patch before do_configure
>> +
>> +# Remove gdb and supporting source directories, they are detected by
>> +# configure otherwise and demands additional gdb deps e.g. gmp, mpc, mpfr
>> +do_prepare_sources () {
>> +       rm -rf ${S}/gdb ${S}/gdbserver ${S}/gdbsupport ${S}/gnulib \
>> +       ${S}/libbacktrace ${S}/libdecnumber ${S}/readline ${S}/sim
>> +}
>> +
>
>
> This seems to have been fixed upstream, I wonder if its better to backport that patch to 2.40 so it aligns properly with the --disable-gdb flag we are passing:
> https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=5fb0e308577143ceb313fde5538dc9ecb038f29f
>

Thanks yes its better to backport it, I will add it to v2.

> Cheers,
>
> Alejandro
>>
>>  do_configure () {
>>         (cd ${S} && gnu-configize)
>>
>> --
>> 2.39.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#175949): https://lists.openembedded.org/g/openembedded-core/message/175949
>> Mute This Topic: https://lists.openembedded.org/mt/96291245/3619605
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alejandro@enedino.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

