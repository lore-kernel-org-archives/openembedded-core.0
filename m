Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D91DC4167D
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:50:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.18583.1702547413588484833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AP2LmEL4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c29f7b068so74675925e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 01:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702547412; x=1703152212; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NJJwA01pmm4Rab62lcgONt2nTM+7AsdYUaMpRRo7zYA=;
        b=AP2LmEL4evgMuJBDVK8H8Ed3QcnzqLK2KerhmrRnjo32HpzaYODn3gORjxtHVN1hjM
         DRxvB/qVS310IwTGxoqJ0i6rSCsRP7M2CN6E2B3dinyd+oQcG0mwKNV2tal/MZWMsAZ0
         3tOzUZOyx1wNQPLGKq18TfHg1HOM7T4Yl3FzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702547412; x=1703152212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJJwA01pmm4Rab62lcgONt2nTM+7AsdYUaMpRRo7zYA=;
        b=q6Vy3Gl00T3rqxYB1VgRQ6KQj2e7opZORqXPI9tljxVfepPteiXEPjdGxAKd7rzkGU
         mtsGLM87S4G7LKBiQp+VEoZGZeP0F8TLu04r+h2fkKc3yXqYOq4oq0Q/vX4fMowt0j8G
         Q8Ptx31wEL7ERqkBwnq0Q13rmhbODmngqTRs5vpApjDn35Mw3p0dlM9DsI8ZRM5qwd79
         kVpac12IL7xDDCd1kNFVw7Wmfnx2zFxhU7oL5YqjAQF5eq9iv+l7Erbe4avXUPDpsxnk
         1tydO3AGn5Nf1SHecvBjnn/vqM8J7EBzC24tWK1rFCvnLlVNu1dlKMalWQbYV90lKv1l
         zVAQ==
X-Gm-Message-State: AOJu0Yw+bB9Yaa8e1kpL4gQgfcqOSkBxVyUG0wysJF3tmQIGRRNqeCtH
	zBG4pS/Cgd1R6aKMS9AEe6YXPA==
X-Google-Smtp-Source: AGHT+IE5fiacDlpUtgy8dQGk6ZztqnVgtPLrIekwB+ZbmzaGDffo8ViSZL8riQ79boPmvakOHgLp5g==
X-Received: by 2002:a05:600c:2108:b0:40c:23c7:8cf7 with SMTP id u8-20020a05600c210800b0040c23c78cf7mr4912867wml.167.1702547411834;
        Thu, 14 Dec 2023 01:50:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e972:7f32:1182:98d2? ([2001:8b0:aba:5f3c:e972:7f32:1182:98d2])
        by smtp.gmail.com with ESMTPSA id fa17-20020a05600c519100b0040c46719966sm15070777wmb.25.2023.12.14.01.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:50:11 -0800 (PST)
Message-ID: <6cfb111def75c0f1549e7f004deac4e8a44365cf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by
 default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yoann Congal
	 <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Tim Orling
 <ticotimo@gmail.com>,  Martin Jansa <martin.jansa@gmail.com>, Ross Burton
 <ross.burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 14 Dec 2023 09:50:10 +0000
In-Reply-To: <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
	 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192343

On Thu, 2023-12-14 at 10:09 +0100, Alexander Kanavin wrote:
> On Wed, 13 Dec 2023 at 09:57, Yoann Congal <yoann.congal@smile.fr> wrote:
> >=20
> > The bluetooth support adds a bluez5 dependency (and,recursively, a lot
> > of other stuff). Disable it by default to avoid having to build all of
> > this when it is not needed.
> >=20
> > This decrease the number of tasks run for a core-image-minimal build by
> > ~1000 (-21%).
> >=20
> > To re-enable bluetooth support in strace, add "bluez" to strace
> > PACKAGECONFIG. For example, in local.conf:
> >   PACKAGECONFIG:append:pn-strace =3D " bluez"
> >=20
> > Fixes [YOCTO #15323]
>=20
> I'm afraid I have to raise objections.
>=20
> First, this needs an explanation: what functionality in strace does
> this disable? Is that functionality important from the point of having
> bluetooth in DISTRO_FEATURES? Not respecting DISTRO_FEATURES sets a
> bad precedent, and should be more carefully justified and treated as
> an exception.

This was raised as a question on the call on Tuesday. I appreciate you
weren't there and the commit message above does give the reasoning but
let me elaborate.

The bluez support in strace is basically for protocol decoding. This is
not something most users of strace use, I personally can never remember
using it. Yes, if you need it, it is extremely useful. If you know how
to debug bluetooth wireless, you can probably work out how to turn on
the packageconfig.

The downside to having this enabled by default is a significant
dependency chain increase (21%). Sometimes we need to think about the
big picture and whether one single packageconfig is really worth the
increased build cycles it places upon everyone by default.

> Second, why is strace even needed in the context of
> core-image-minimal? It's not installed into the image, so I went and
> checked:
> util-linux-ptest needs mdadm
> mdadm-ptest needs strace.
>=20
> Which begs the question. Should we continue to enable ptest by default
> in poky? Should we create and use a ptest-less distro configuration?
> It does pull in a ton of extra stuff all over the place which
> lengthens the builds a lot. And the resulting ptest packages aren't
> even used until one explicitly requests one of the ptest images.

This was also asked. We did use to have it off by default but then
nearly every package upgrade broke ptest since the upgraders didn't
remember to turn it on for testing. I decided on for poky, off for oe-
core was a better compromise.

> As an example, I saw an oe-selftest-armhost yesterday, which ran
> nearly 17 hours:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2587
>=20
> If you go and look at what tests in it took the longest time, you see:
> 2023-12-13 15:45:22,812 - oe-selftest - INFO - RESULTS -
> runtime_test.Postinst.test_postinst_rootfs_and_boot_systemd: PASSED
> (32620.46s)
> 2023-12-13 15:45:22,794 - oe-selftest - INFO - RESULTS -
> prservice.BitbakePrTests.test_import_export_override_db: PASSED
> (12789.45s)
> 2023-12-13 15:45:22,789 - oe-selftest - INFO - RESULTS -
> overlayfs.OverlayFSEtcRunTimeTests.test_all_required_variables_set:
> PASSED (35205.79s)
> 2023-12-13 15:45:22,781 - oe-selftest - INFO - RESULTS -
> minidebuginfo.Minidebuginfo.test_minidebuginfo: PASSED (15395.76s)
> 2023-12-13 15:45:22,782 - oe-selftest - INFO - RESULTS -
> multiconfig.MultiConfig.test_multiconfig: PASSED (11098.06s)
> 2023-12-13 15:45:22,776 - oe-selftest - INFO - RESULTS -
> incompatible_lic.IncompatibleLicensePerImageTests.test_bash_and_license:
> PASSED (24012.67s)
> 2023-12-13 15:45:22,775 - oe-selftest - INFO - RESULTS -
> imagefeatures.ImageFeatures.test_mandb: PASSED (19394.74s)
> 2023-12-13 15:45:22,762 - oe-selftest - INFO - RESULTS -
> devtool.DevtoolExtractTests.test_devtool_build_image: PASSED
> (27341.75s)
> 2023-12-13 15:45:22,760 - oe-selftest - INFO - RESULTS -
> debuginfod.Debuginfod.test_debuginfod_qemu: PASSED (25784.11s)
> 2023-12-13 15:45:22,759 - oe-selftest - INFO - RESULTS -
> containerimage.ContainerImageTests.test_expected_files: PASSED
> (19453.84s)
> 2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
> buildoptions.SanityOptionsTest.test_options_warnqa_errorqa_switch:
> PASSED (10492.68s)
> 2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
> buildoptions.ToolchainOptions.test_toolchain_fortran: PASSED
> (11367.46s)
> 2023-12-13 15:45:22,743 - oe-selftest - INFO - RESULTS -
> baremetal.BaremetalTest.test_baremetal: PASSED (24196.04s)
>=20
> The same a-full selftest, but on a x86 host has these times, quicker
> than arm but still measured in hours:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6179/st=
eps/15/logs/stdio
>=20
> What do most of these tests do? They do indeed build
> core-image-minimal (sometimes full-cmdline or some other images), and
> sometimes in multiple variants within a single test. But they never
> use ptest. And so we need to find a way to make it happen faster.

Once a given build has run through the system, things do run much
faster but this is basically the performance issue I've been mentioning
in the weekly status reports. Even the above packageconfig change in
this patch would actually speed a lot of these up, but you're objecting
to that.

The tests themselves are actually quite valuable as we're way beyond
the point I can work out which patch will break which features. Some of
the tests could undoubtedly be improved. If we disable the ptests for
the selftests, we run the risk of not reusing sstate so a better
question might be, why are all the tests not reusing sstate more
efficiently?

> I'm going to get some numbers, first without any changes, then with
> your proposed change, then with ptest dropped - this will take a bit
> of time, so I wanted to get the concerns written and sent first.

I don't think dropping the ptests is the right approach, we should
likely focus on sstate reuse?

I am also pretty in favour of this patch.

Cheers,

Richard



