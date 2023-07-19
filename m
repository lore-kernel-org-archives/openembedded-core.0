Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1111FC0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 17:04:36 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.727.1689786268106256525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 10:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=hGYFAkBn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fbd33a57dcso73511785e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 10:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689786266; x=1690391066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bHMmSVgqEkgdnCxNIAgeNJ6jZDOVwBjBqiEPCNm4sSI=;
        b=hGYFAkBnp5FRxrSIFPHBj5evbEo1dx3/SDDclH37+DtJamC5PZuyOl3+/TMrC7aCVE
         oCcWpCX9pR+T3DJ7faDqPWPxoGECE6NkUFaUfUsXLMcG2WT818pzyPl//bWdB2Utk1sL
         LG6trhzeVedw8ajRWJCSQ+cyCO3FEYHcoc73c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689786266; x=1690391066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHMmSVgqEkgdnCxNIAgeNJ6jZDOVwBjBqiEPCNm4sSI=;
        b=W5WjoGY+zn2ZrSPHa76+uEEnahyRAycYScy+mEfQbt0ND1VrqQZM8M4ab1lJyhTNR2
         1TZYeK0rFUxjZpYgT/EQMzpkA+UwhZgqHzDtDvw5jWrDMNWyyfsjfjEKSKJSSWiMYK+U
         k1q6Q6v26kwLMq1gfzJZ2xglR6q/czvE28PZ1uwyhiAHS7CGMLKtg41lRt3PFeeodVv1
         wjn/t6NuPuV1VfIiFAYu0WHCAXpmuByfTVefu1VxfZ3s7n7We+QkAneB7Zp9AF1/EDKb
         tqfABpqRWuKuZII/yg+QhaL2fs0demXnxWZTAugjyMOnuhj64GxdxQjLjMSYmhDRLyvw
         ZJFA==
X-Gm-Message-State: ABy/qLZX68QtNJtGzk2ktV1Q8Vri3Iy8G/qGd/3013poNaqP2SiVcQzZ
	Xa97WqjmEh9WZagrKWr7m5ifdg==
X-Google-Smtp-Source: APBJJlEdWheaIIV0lf+h5EmktMClE/aX7TqwWEeoZHPJ0G+9FhN/4qyXPt1+BS7tnJjzl8pmR8KFGQ==
X-Received: by 2002:a05:600c:2209:b0:3fc:85:6b26 with SMTP id z9-20020a05600c220900b003fc00856b26mr4814503wml.25.1689786266472;
        Wed, 19 Jul 2023 10:04:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6248:d29c:dec5:5723? ([2001:8b0:aba:5f3c:6248:d29c:dec5:5723])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b003fbc0a49b57sm2155057wmi.6.2023.07.19.10.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 10:04:25 -0700 (PDT)
Message-ID: <38b5f87f82739ca3d37056d31d21dad703c85ba0.camel@linuxfoundation.org>
Subject: Re: [OE-core] Rust Oe-Selftest implementation V15 Testing
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "Shinde, Yash"
 <Yash.Shinde@windriver.com>, openembedded-core
 <openembedded-core@lists.openembedded.org>, "MacLeod, Randy"
 <Randy.MacLeod@windriver.com>, "Kokkonda, Sundeep"
 <Sundeep.Kokkonda@windriver.com>, "Gowda, Naveen"
 <Naveen.Gowda@windriver.com>
Date: Wed, 19 Jul 2023 18:04:24 +0100
In-Reply-To: <CAO5Uq5RCBj7YC1iML5ZRuOxBvfgNMGmtvHbanOnasCYgL0JaSw@mail.gmail.com>
References: <efa2be27-b66e-3ec5-dc5c-872e4480055a@windriver.com>
	 <CH2PR11MB44707BB142B48AA62AB5FF5A89499@CH2PR11MB4470.namprd11.prod.outlook.com>
	 <SJ1PR11MB6129C95690F5CECB834AF2EBEB5BA@SJ1PR11MB6129.namprd11.prod.outlook.com>
	 <2023061619564473739a2d@mail.local> <2023061809292129ae9b9e@mail.local>
	 <SJ1PR11MB6129BF560606CCE63FF83457EB23A@SJ1PR11MB6129.namprd11.prod.outlook.com>
	 <365cabd0-72a1-6ec8-d7be-fff24311934c@windriver.com>
	 <d6c84ad89f53c685be3defa3f8ac9fa6a19c889c.camel@linuxfoundation.org>
	 <20230630131626130a658b@mail.local>
	 <SJ1PR11MB6129783A802FD0B5B8713D64EB36A@SJ1PR11MB6129.namprd11.prod.outlook.com>
	 <20230717143459f37f8da6@mail.local>
	 <8d7b610d82cb606aebba1bc582176b072375f3ed.camel@linuxfoundation.org>
	 <910f3165b7ba14fdd89e1ce89e3a70b9b5cbc014.camel@linuxfoundation.org>
	 <CAO5Uq5RCBj7YC1iML5ZRuOxBvfgNMGmtvHbanOnasCYgL0JaSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 17:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184589

On Wed, 2023-07-19 at 12:58 +0100, Alex Kiernan wrote:
> On Wed, Jul 19, 2023 at 11:49=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Mon, 2023-07-17 at 16:08 +0100, Richard Purdie wrote:
> > > On Mon, 2023-07-17 at 16:34 +0200, Alexandre Belloni wrote:
> > > > Hello,
> > > >=20
> > > > I got some feedback from RP:
> > > >=20
> > > > http://autobuilder.yocto.io/pub/non-release/20230716-18/testresults=
/testresult-report.txt
> > > >=20
> > > > This shows warnings for duplicate tests and he also asks being wher=
e the
> > > > qemuarm64 went, both issues being probably related.
> > >=20
> > > I had a look and you probably need to add a:
> > >=20
> > > @OETestTag("toolchain-user")
> > > @OETestTag("runqemu")
> > > class RustSelfTestBase(RustSelfTestSystemEmulated):
> > >     def test_check(self):
> > >         self.test_rust()
> > >=20
> > > section to the tests to allow the tests to run for the non-IA
> > > architectures that use usermode emulation for the other tests which
> > > rust can't.
> > >=20
> > > That then just brings the question of why there are duplicate tests
> > > results being reported. This is where the result for an ID is being
> > > reported more than once. I haven't looked into why that might be
> > > happening.
> >=20
> > I really do want to get this rust test suite issue resolved so I went
> > digging into the code to find out what is really going on.
> >=20
> > Firstly, the duplicate test results. The issue is that you defined the
> > core class like this:
> >=20
> >  class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTest=
Case):
> >      def test_rust
> >=20
> > and python unittest has a convention where anything starting "test_" is
> > a test.
> >=20
> > This meant that the rust test ran unguarded in all the oe-selftest
> > targets on the autobuilder and not just in the toolchain-system
> > filtered section.
> >=20
> > The easiest fix is to drop the RustSelfTestBase class and move the
> > toolchain-system decorator to RustSelfTestSystemEmulated. That will
> > resolve the duplicate test warnings and ensure things run where they
> > should. You could have worked out this issue by finding that there were
> > rust test results in oe-selftest-* testresults.json files, e.g. here:
> >=20
> > http://autobuilder.yocto.io/pub/non-release/20230716-18/testresults/oe-=
selftest-centos/oeqa/testresults.json
> >=20
> > Moving on, the test result names really don't look good with the
> > "[ui]  " and similar prefixes in the results file. I've patched a tweak
> > in to drop that.
> >=20
> > I also noticed that there were no skipped tests being reported in the
> > results. This was due to "SKIP" being used instead of "SKIPPED" which
> > resulttool looks for.
> >=20
> > We need to also add the toolchain-user decorator to make sure that the
> > tests run for the "user" architectures since we don't have any user
> > mode rust test equivalent.
> >=20
> > I've rolled all these changes into a patch on master-next:
> >=20
> > https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D46ab8478=
5da15ac156ee0b4a693ce8bb5ccf8c22
> >=20
> > which I'll put into testing.
> >=20
> > Looking to the future, I have concerns about the ease of maintenance of
> > this huge patch to rust to disable failing tests. I'd propose we change
> > this to a hardcoded list of tests to ignore in the result parsing code
> > which will be easier to maintain in the future.
> >=20
>=20
> That feels far more maintainable - the scale of the  patch really
> concerned me. Also I guess if it's just a list, then running with
> everything enabled on upgrade to see what passes/fails would be a
> relatively easy option.

I've gone ahead and merged the rust selftest changes since we had a
successful test run on the autobuilder and I think that patch series
has gone on long enough. I pushed my tweaks in a follow up commit.

I'd happily take a patch changing the current patch for the approach
mentioned above as a next step. I appreciate it will mean we need to
tweak the 1.71.0 update but felt getting the tests in was probably the
next logical step.

Cheers,

Richard



