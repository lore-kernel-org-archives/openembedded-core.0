Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BA4CD5BB4
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:54:53 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.7591.1695128088690370801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 05:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XsVH4hzz;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b703a0453fso93741271fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695128087; x=1695732887; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TYnQ8HH/W4oI/Pzujr8LK030S7UuaEEZw8a8qAb0oNs=;
        b=XsVH4hzzMY58NHli+Vas+xrlD5XW1DR0dgtkpm0q/0rpy0oluYBXre3KwABuHVJo7/
         Qx16l9w3OuIUfTGWOD6ot67lIEJLQEi17SwkhKLUt7DPFzFHGpBBnrR4PZ+PCmIXjdYS
         cLnipMn+uhqxCOslWT5ASJjRvKIk49vi81TC5bUhRFB0aSWzq+PbFAs0q1QKru2kXvRQ
         X+hsGSw02Es8X3TxPN5GRJTk64rnsX7PG57RNbjsyKJLmvdIoaivkWT2NGSdoIa/IOuc
         9ybwbsuF7XRjNTp2Bh6FiAKON6vyGjACAFx1h83rwS7PdPo//9bCqoTQMQQoKRivcDeA
         G9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695128087; x=1695732887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYnQ8HH/W4oI/Pzujr8LK030S7UuaEEZw8a8qAb0oNs=;
        b=ilwVMrzLZG2c7E4cbSLU+1MLc5YRFceQZTHrVO4KrP2HWigKBTY2L1ka1LkdhEFLEC
         HZsNbXVw612CdHvZNk71gkQxSIMuv3eLXUne5L/PGbv/T+BE/oh64tN7YpKv5ep5jG/z
         uJ34pk5un37ecKbSgUskRbyHmJzocJSAh+hQIRohp3l/TcYyQm1iTlMVdpmRwfB0gMpg
         Lno/G25mwpNCH1Dtrf7Vf/QcG/MWdLGsacagQ96XWYUzjm5CwWiQwD4JIeZAOmOEWRL5
         cNfprf7EVAftCrft9pyvCA9A/dkHIDlIkg0T5d4wUNyTTaM8Xh8SRlUqAaXBnvIcNUKC
         ozoA==
X-Gm-Message-State: AOJu0YxIkXkFRjCjffcIdjF0a7AQhxO/zegk0HrTP5hjN9WfdiBdSOvZ
	61tOGCcfDC8ICLWOA0GZ5R+Zl0P6ruVGOKDVVcPavYcg
X-Google-Smtp-Source: AGHT+IFdKbPCl/7BvN5Oj8S5MCQHl84qmByOLoIKaSwVWig7bb1lwByO0F8P6Sr2UXzrSZodnU23V9aTV2WPlQXCZEA=
X-Received: by 2002:a05:6512:e91:b0:503:34b8:20b with SMTP id
 bi17-20020a0565120e9100b0050334b8020bmr1583747lfb.65.1695128086492; Tue, 19
 Sep 2023 05:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230918015735.391442-1-robert.joslyn@redrectangle.org>
 <a91ac1e923426bcd1848a54f8aeec34155ffa13a.camel@linuxfoundation.org> <919339d4-a7cf-44b1-952e-d37cdd972075@redrectangle.org>
In-Reply-To: <919339d4-a7cf-44b1-952e-d37cdd972075@redrectangle.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Sep 2023 14:54:34 +0200
Message-ID: <CANNYZj_EfdKtFb8FA3_aYA7941Or2+691aLQ42W8eodBMrg5qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] curl: Update from 8.2.1 to 8.3.0
To: robert.joslyn@redrectangle.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 12:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187863

It helps if you copy-paste the complete output of ptest-runner
somewhere where we can see it and identify what fails. It might be not
a particular test case, but something in the test harness.

Please do not randomly disable tests if they are not actually failing:
quite often tests are safely skipped even though what they print
resembles an error.

Alex

On Tue, 19 Sept 2023 at 14:40, Robert Joslyn via
lists.openembedded.org
<robert.joslyn=redrectangle.org@lists.openembedded.org> wrote:
>
> On 9/18/23 4:59 AM, Richard Purdie wrote:
> > On Sun, 2023-09-17 at 18:57 -0700, Robert Joslyn via
> > lists.openembedded.org wrote:
> >> NSS support was removed, so adjust PACKAGECONFIG options.
> >>
> >> The --enable-crypto-auth option was removed and split into separate
> >> options for basic-auth, bearer-auth, digest-auth, kerberos-auth,
> >> negotiate-auth, and aws. Enable basic, bearer, digest, and negotiate by
> >> default as these are probably the most common.
> >>
> >> Disable test 1279 since this requires libcurl and hangs the tests.
> >>
> >> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> >> ---
> >>   meta/recipes-support/curl/curl/disable-tests       |  1 +
> >>   .../curl/{curl_8.2.1.bb => curl_8.3.0.bb}          | 14 +++++++++-----
> >>   2 files changed, 10 insertions(+), 5 deletions(-)
> >>   rename meta/recipes-support/curl/{curl_8.2.1.bb => curl_8.3.0.bb} (88%)
> >>
> >> diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
> >> index b687b2bb76..fdac795662 100644
> >> --- a/meta/recipes-support/curl/curl/disable-tests
> >> +++ b/meta/recipes-support/curl/curl/disable-tests
> >> @@ -21,6 +21,7 @@
> >>   # This test is scanning the source tree
> >>   1222
> >>   # These CRL tests need --libcurl option to be enabled
> >> +1279
> >>   1400
> >>   1401
> >>   1402
> > Thanks for the patch. Unfortunately there were warnings generated on
> > the autobuilder test run for this:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5452
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5631
>
> I'm not very familiar with the autobuilder infrastructure, but it looks
> to be running something like "bitbake core-image-ptest-curl -c
> testimage". When I run this, I do get a warning:
>
> WARNING: core-image-ptest-curl-1.0-r0 do_testimage: There were failing
> ptests.
>
> Unfortunately, I don't see any failing tests. When running the tests
> manually (called runqemu, then ptest-runner curl in the VM) there are
> some tests that print an error about not finding a library and get
> skipped. I removed those test cases as well, but I still get the warning
> about failing ptests.
>
> What's the ptest code looking for to trigger a test failure? I should
> have some more time to look at this later today, I'm probably just
> missing something obvious.
>
> >
> > I'd also wondered if you'd mind setting your from address correctly for
> > patches please? For more info see:
> >
> > https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixing-your-from-identity
>
> Thanks, for this, hopefully it's fixed now. My email provider recently
> changed, which does have DMARC enabled.
>
>
> Thanks,
>
> Robert
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187861): https://lists.openembedded.org/g/openembedded-core/message/187861
> Mute This Topic: https://lists.openembedded.org/mt/101426058/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

