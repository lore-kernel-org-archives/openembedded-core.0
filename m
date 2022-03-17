Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA2DC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 15:32:02 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.11599.1647531121190523674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 08:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WHHGlF+H;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id 1so4632368qke.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 08:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wTnFAjH7eacEYaHS4f1plwQUfj4DOGfaacVltR+k5u0=;
        b=WHHGlF+HuTq2YdGT2pvKDpRuVAdSPQEppAVq5jp8ogFMN4AFXroAPgkHSIAHALOgjD
         mA6KlczkTZxLgozEVo1zGDrRMrnTzqE5yYS6Ji/rlPcFConpvFVWT6bRbBqMJXsVVKKz
         NLEbrKi4Rj58hoNjNUxo2f58AUlot6WSc/pjetM16K9aI12U5xFZEi5YGgKpfBDTZ9gk
         gEe7VXl9YV+WzaXhVKufn90rBAF7u7ynH6AVdTSs4F5lZY1io36eFYO7MJQYtohmXMA6
         d1mMXXS3D1vDidltFWs7B32g7iUAQpeVPAdHhn+NBEkLzzo3boJZLwGcfX6lMJR9DKfm
         g/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wTnFAjH7eacEYaHS4f1plwQUfj4DOGfaacVltR+k5u0=;
        b=rZnqpAwEx1o/5rhrcaW98HyF6+p+knWSh4D93nRpepw8LppkEuDEzKXRZepmIS2yN5
         w/heW9tTl/T/gTdfEiHa8zM8kKDlRkbbUIGA9ZhIlC1m8nWI8fROIEZiSua99z42EKmv
         R244XMErJX4Ax71OOzcyttNpsUAs7rofPiNblHyIqPPNSbBFd1jePNrqlvVWht+zLSav
         89nAyOkjFRLWhZmIXiWJNtbblyfWVNHUzjV+LhrfQdKJw+UdHPtDuiiWdnYbjCP/c9pz
         JvTv3MWj1Ahsw5UTrUY4lXAtgYQ3t3XsgskSv9ge2wgbbtVq+fH00QP4HP8SmCQleyJH
         B5Pw==
X-Gm-Message-State: AOAM532MWrONFq86eL1pykalk3T38SYIr8w3pkeKmkFV53UPKoyHJclZ
	IgkWZv31Xesq6rZTcIqUZAKmSAMBmgjGCyjmdmcScSx8ScQ=
X-Google-Smtp-Source: 
 ABdhPJxT9+V7eCMieQeXe92ZeZxjtjLdTIfU7CwMNxxCNPCMpPnoNiun5crlxIIcnLKPs86ce0MpXKrDPlModPXqlbM=
X-Received: by 2002:a05:620a:4626:b0:67d:1857:cdd2 with SMTP id
 br38-20020a05620a462600b0067d1857cdd2mr3135550qkb.227.1647531120209; Thu, 17
 Mar 2022 08:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220316222526.264261-1-raj.khem@gmail.com>
 <CAAnfSTvpWwfUKUo7AHAuN_DdPZ2Qus88HG5rqvz6Et8_ZyabiQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvpWwfUKUo7AHAuN_DdPZ2Qus88HG5rqvz6Et8_ZyabiQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Mar 2022 08:31:34 -0700
Message-ID: 
 <CAMKF1spUtkgz9BqGx=mw64O4vu_B5pUAg_05gFM0cKX+CusNkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: Upgrade to 36.0.2
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 15:32:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163424

On Thu, Mar 17, 2022 at 8:22 AM Ross Burton <ross@burtonini.com> wrote:
>
> Note that python3-cryptography and -cryptography-vectors *need* to be
> updated in lockstep:
>
> FAIL: tests/test_utils.py::test_vector_version
>     def test_vector_version():
> >       assert cryptography.__version__ == cryptography_vectors.__version__
> E       AssertionError: assert '36.0.2' == '36.0.1'
>

hmm, thanks for noticing it

> I'll send a corresponding upgrade shortly.
>


superb.

> Ross
>
> On Wed, 16 Mar 2022 at 22:25, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...-cryptography_36.0.1.bb => python3-cryptography_36.0.2.bb} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-devtools/python/{python3-cryptography_36.0.1.bb => python3-cryptography_36.0.2.bb} (96%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> > similarity index 96%
> > rename from meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
> > rename to meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> > index e33eaa50834..940df60d441 100644
> > --- a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
> > +++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
> >                     "
> >  LDSHARED += "-pthread"
> >
> > -SRC_URI[sha256sum] = "53e5c1dc3d7a953de055d77bef2ff607ceef7a2aac0353b5d630ab67f7423638"
> > +SRC_URI[sha256sum] = "70f8f4f7bb2ac9f340655cbac89d68c527af5bb4387522a8413e841e3e6628c9"
> >
> >  SRC_URI += " \
> >      file://run-ptest \
> > @@ -42,7 +42,7 @@ SRC_URI += " \
> >      crate://crates.io/indoc/0.3.6 \
> >      crate://crates.io/instant/0.1.12 \
> >      crate://crates.io/lazy_static/1.4.0 \
> > -    crate://crates.io/libc/0.2.112 \
> > +    crate://crates.io/libc/0.2.120 \
> >      crate://crates.io/lock_api/0.4.5 \
> >      crate://crates.io/num-integer/0.1.44 \
> >      crate://crates.io/num-traits/0.2.14 \
> > --
> > 2.35.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#163362): https://lists.openembedded.org/g/openembedded-core/message/163362
> > Mute This Topic: https://lists.openembedded.org/mt/89833574/1676615
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

