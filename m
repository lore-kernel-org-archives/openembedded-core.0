Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB493C44511
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 16:57:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17850.1784221067067586015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 09:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yTesftfO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 250B4C2B9D6;
	Thu, 16 Jul 2026 16:58:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 876A76035F;
	Thu, 16 Jul 2026 16:57:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9827811BD3D27;
	Thu, 16 Jul 2026 18:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784221063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z6UpM+mttWFJcPnlOVy9/0qnvfwK4LcXKQGjDGF/an0=;
	b=yTesftfOxOPQkqT+b+Wll139ve+j92SgVeI2A22ZhBm2ZpF/PJvuKPgcT76bCOgB40sKYs
	BMsXbVZCLIqda9/mdtr+DPWU80lMEBxnCkAsuWBVjb1LhjBvDOdSN2uDZXe0J9EVeELEVa
	iBuG+EUio2ufzY54OODdM9BADvKl+EZKYl2Lsqq5NVHJS9As6HyLz2e4BHrEdx00wUrRcK
	Y6ZUp1+TWQ/kRh2r03GG7mmP9pPLXbY+5JpGI1ZwUAUOTS8hcoVSJ5cv/sZwHlJ+BA20Lb
	CDPNNw1DG/cc+9gyAHbPqXq9unqJdM5uYU6HmtnE1WhmFzO3NloMP1SdBzoMjA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 18:57:40 +0200
Message-Id: <DK05KVUSPC2Z.2P1RYIPFLW9SI@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Deepesh Varatharajan" <Deepesh.Varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/3 v6] Oe-selftest for Clang, LLVM, LLD
Cc: <Sundeep.Kokkonda@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
 <DJZT67DMVUOV.3CPQL3DTBS745@bootlin.com>
 <95e58c26-7eea-4f68-8bb6-fbd3b85041e3@windriver.com>
In-Reply-To: <95e58c26-7eea-4f68-8bb6-fbd3b85041e3@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 16:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241099

On Thu Jul 16, 2026 at 12:14 PM CEST, Deepesh Varatharajan wrote:
>
> On 16-07-2026 12:44, Mathieu Dubois-Briand wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Wed Jul 15, 2026 at 8:00 AM CEST, Deepesh via lists.openembedded.org =
Varatharajan wrote:
>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>
>>> This patch series introduces a test framework to run selftests for
>>> target builds of Clang, LLVM, and LLD.
>>>
>> Hi Deepesh,
>>
>> Thanks for your patch.
>>
>> It looks like it does introduce reproducibility issues:
>>
>> AssertionError: The following deb packages are different and not in excl=
usion list:
>> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ex=
tended/tmp/deploy/deb/./x86-64-v3/rust-dbg_1.97.0-r0_amd64.deb
>> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ex=
tended/tmp/deploy/deb/./x86-64-v3/rust_1.97.0-r0_amd64.deb
>> The following ipk packages are different and not in exclusion list:
>> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ex=
tended/tmp/deploy/ipk/./x86-64-v3/rust-dbg_1.97.0-r0_x86-64-v3.ipk
>> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ex=
tended/tmp/deploy/ipk/./x86-64-v3/rust_1.97.0-r0_x86-64-v3.ipk
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4386
>> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260715-161pbd=
ip/packages/diff-html/
>>
>> I did not really identified where the difference come from. Can you have
>> a look at the issue?
>>
>> Thanks,
>> Mathieu
> Hi Mathieu,
>
> I don't think the reproducibility issue is caused by the clang testsuite=
=20
> changes.
> Those changes are guarded by the `CLANG_ENABLE_TESTSUITE` variable, so=20
> they should
> not affect a normal Rust build. Before sending the patch, I also ran a=20
> couple of
> tests, including reproducibility testing, and did not encounter any issue=
s.
>
> I did a bit more digging into the AB builds and found the following:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4378
>
> It looks like the same Rust reproducibility failure occurred in your test=
ing
> two days ago, when the clang-testsuite related changes were not yet prese=
nt
> in your branch. I am not sure what is causing rust repro failures in AB.
>
> Could you please run the reproducibility test one more time and let me kn=
ow
> if the failure occurs again?
>
> If the reproducibility issue doesn't occur again, we should consider fili=
ng
> a Yocto bug to track these intermittent Rust reproducibility failures.
>
> Regards,
> Deepesh
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>

After a few more builds, it might be and intermittent failure from
another patch. I will add back this series, in a few days; I first want
to get more data on the failure.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


