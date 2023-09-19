Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32BBCD5BB3
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:54:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.7587.1695128076680269363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 05:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wv9Egvc/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31ff985e292so3765669f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 05:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695128075; x=1695732875; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOD8J4bu1yGuPFITetju2PiUTmZSNB85xnDFC2Adqbo=;
        b=Wv9Egvc/Jqh0H25kckJP9tO+GNIdtuj976QcfDCCncf3aSvFD0QKE49jXACbQzR9wN
         zLyYrO1HW5F360HQABs93YUQl3eDccK/HE2JqhrsqGZ4Q9Fj/YjAT9OpzevDDuoolD1G
         wQ0om7beL6m1EUflT72vXRE/Wq8GqY9HnICng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695128075; x=1695732875;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VOD8J4bu1yGuPFITetju2PiUTmZSNB85xnDFC2Adqbo=;
        b=PcfI6zH9cRnW5+6WVS2LmF3PKfvbWhju/tW/U6XTwBh8kOH29e8GpV4O6/VlfZesI3
         m2f7oRq80wF3kyxWRcJVJffJvG1BcQvrAJm6HfKobByrwTz2ELT9vIYGYQUHX7z/U2fz
         VFwcGDxH2UhRfW3+CnjJTNFtiFQoutPMnhanKXsdnUJ8C3AvzJ3iw4F+WlGdveF2KIT9
         klL3LpeDPIPa2yYXiqWJNSlOqczzo+PjHuN6sgFwoOabHIHtDE4waAlB/Bq81vDYYfNq
         oIg4tNimDAq8G94nqeKqsy/mjIS/86ZoSVBcnRj5muaxwRqWd4wtBIGR2W3N+m3mm8CM
         aIEQ==
X-Gm-Message-State: AOJu0YyN7mzFkemibvTv+wXioCk5iB0V6eJjxHZ5OMRO0p9Cu7s4ndts
	TrZ0VHZwmiVR3JVWlN2gpXjz8A==
X-Google-Smtp-Source: AGHT+IHzEm+c25B9uwApNSmFJ7huwnAWAVUcrCbDznJ5CuT6NEL9lwVme1RqIO7x+e1W+lipmMHaUg==
X-Received: by 2002:adf:ee03:0:b0:317:727f:3bc7 with SMTP id y3-20020adfee03000000b00317727f3bc7mr10185885wrn.17.1695128075013;
        Tue, 19 Sep 2023 05:54:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f50:2b60:4068:dda8? ([2001:8b0:aba:5f3c:f50:2b60:4068:dda8])
        by smtp.gmail.com with ESMTPSA id n7-20020a5d6b87000000b0031ae8d86af4sm15476003wrx.103.2023.09.19.05.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:54:34 -0700 (PDT)
Message-ID: <c9df2926bf3f14a8f89eefe110171b500a8e85c3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] curl: Update from 8.2.1 to 8.3.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Joslyn <robert.joslyn@redrectangle.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 19 Sep 2023 13:54:31 +0100
In-Reply-To: <919339d4-a7cf-44b1-952e-d37cdd972075@redrectangle.org>
References: <20230918015735.391442-1-robert.joslyn@redrectangle.org>
	 <a91ac1e923426bcd1848a54f8aeec34155ffa13a.camel@linuxfoundation.org>
	 <919339d4-a7cf-44b1-952e-d37cdd972075@redrectangle.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 12:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187862

On Tue, 2023-09-19 at 05:40 -0700, Robert Joslyn wrote:
> On 9/18/23 4:59 AM, Richard Purdie wrote:
> > On Sun, 2023-09-17 at 18:57 -0700, Robert Joslyn via
> > lists.openembedded.org wrote:
> > > NSS support was removed, so adjust PACKAGECONFIG options.
> > >=20
> > > The --enable-crypto-auth option was removed and split into separate
> > > options for basic-auth, bearer-auth, digest-auth, kerberos-auth,
> > > negotiate-auth, and aws. Enable basic, bearer, digest, and negotiate =
by
> > > default as these are probably the most common.
> > >=20
> > > Disable test 1279 since this requires libcurl and hangs the tests.
> > >=20
> > > Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> > > ---
> > >   meta/recipes-support/curl/curl/disable-tests       |  1 +
> > >   .../curl/{curl_8.2.1.bb =3D> curl_8.3.0.bb}          | 14 +++++++++=
-----
> > >   2 files changed, 10 insertions(+), 5 deletions(-)
> > >   rename meta/recipes-support/curl/{curl_8.2.1.bb =3D> curl_8.3.0.bb}=
 (88%)
> > >=20
> > > diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/reci=
pes-support/curl/curl/disable-tests
> > > index b687b2bb76..fdac795662 100644
> > > --- a/meta/recipes-support/curl/curl/disable-tests
> > > +++ b/meta/recipes-support/curl/curl/disable-tests
> > > @@ -21,6 +21,7 @@
> > >   # This test is scanning the source tree
> > >   1222
> > >   # These CRL tests need --libcurl option to be enabled
> > > +1279
> > >   1400
> > >   1401
> > >   1402
> > Thanks for the patch. Unfortunately there were warnings generated on
> > the autobuilder test run for this:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5452
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5631
>=20
> I'm not very familiar with the autobuilder infrastructure, but it looks=
=20
> to be running something like "bitbake core-image-ptest-curl -c=20
> testimage". When I run this, I do get a warning:
>=20
> WARNING: core-image-ptest-curl-1.0-r0 do_testimage: There were failing=
=20
> ptests.

Running with -v might help show a touch more information.

> Unfortunately, I don't see any failing tests. When running the tests=20
> manually (called runqemu, then ptest-runner curl in the VM) there are=20
> some tests that print an error about not finding a library and get=20
> skipped. I removed those test cases as well, but I still get the warning=
=20
> about failing ptests.
>=20
> What's the ptest code looking for to trigger a test failure? I should=20
> have some more time to look at this later today, I'm probably just=20
> missing something obvious.

Commands like:

resulttool report ./tmp/log/oeqa/

resulttool log --dump-ptest ./output-logs ./tmp/log/oeqa/

Might help amd/or have a look at the testimage log in core-image-ptest-
curl's WORKDIR/temp/log.do_testimage


Cheers,

Richard


