Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A5DC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 04:43:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4879.1785213832574882062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 21:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GCleJSyU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 531801A12B0;
	Tue, 28 Jul 2026 04:43:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 27A67601BF;
	Tue, 28 Jul 2026 04:43:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA36F11C13C9E;
	Tue, 28 Jul 2026 06:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785213825; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OD24oJuE2j5KktcWyWuQ3nCdEN6NQ41NypV3zB/Sp/c=;
	b=GCleJSyU7ZCa/3etfIkK6EeG0o1K4ryw9yY6kSXP54OrmSfc+AlAexze09AaIGkrVS+hMr
	CQ6YV1D8nJTqJR8in4UcF0mjvhN7LFsmPtSnT4p668heD+KoQ6Mr5c+EAJmu0UUN74UZ43
	IrsafY+CDr1DvsuiHjwU3CKGBNi3cIgHyikXxWqhy5wVdMPD9WfZvJ49SPoLOpkWVXQIPs
	7AX35qZEaUzn+2niviVeeP0yvKOW/H8YzlUGrhh8Gzlhb2x1gpjTeOadewndn66FlME9gZ
	QoniyeGAerevGZJ1zRSY25vbEZV3ewwy0FkhmkmAZPphF6dUyyj0FlW4/76qgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 06:43:43 +0200
Message-Id: <DK9XHGRCG7LU.1L6EFEVZGMPXB@bootlin.com>
To: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] glibc: stable 2.43 branch updates
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260727112902.1653529-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260727112902.1653529-1-adarsh.jagadish.kamini@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 04:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242156

On Mon Jul 27, 2026 at 1:29 PM CEST, Adarsh Jagadish Kamini wrote:
> Update SRCREV to pull the latest fixes from the upstream
> release/2.43/master branch, including fixes for the following CVEs:
>
>   CVE-2026-5435  resolv: More types as unknown in ns_sprintrrf
>   CVE-2026-5450  stdio-common: Fix buffer overflow in scanf %mc [BZ #3400=
8]
>   CVE-2026-5928  libio: Fix ungetwc operating on byte stream [BZ #33998]
>   CVE-2026-6238  resolv: Fix buffer overreads in ns_sprintrrf
>   CVE-2026-6791  posix: Fix stack overflow in wordexp tilde expansion (BZ=
 34091)
>
> Commits between the old SRCREV (e9517114ac) and the new SRCREV (1c9988e52=
5):
>
> 1c9988e525 rtld: cache cpuid results on the stack for intel
> dae425b554 posix: Fix stack overflow in wordexp tilde expansion (BZ 34091=
, CVE-2026-6791)
> 8759917de5 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
> 3a418da6a3 resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
> e64ae5a591 resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
> c9225a3e73 resolv: Check for inet_ntop failure in ns_sprintrrf
> c46f7b2fd6 resolv: Improve formatting of unknown records in ns_sprintrrf
> 1d7d1a16b0 resolv: Fix ns_sprintrrf formatting of class, type values (bug=
 34289)
> 349297a4eb resolv: Declare __p_class_syms, __p_type_syms for internal use
> fdf10644d6 hppa: Fix missing call to __feraiseexcept (BZ 34306)
> a6fa9a9594 arm: Save/restore VFP registers in PLT trampolines (BZ 34144, =
BZ 15792)
> fe0ccc9564 iconv: Suppress intermediate errors with //TRANSLIT (bug 34236=
)
> 22f3d24a6b Hurd: restore some SIOC ioctls
> a13ebdbc7e Hurd: comment ioctls which cannot currently compile
> 446f708e4c Hurd: comment PF_ROUTE/AF_ROUTE defines
> ced45fd472 Hurd: comment PF_LINK/AF_LINK defines
> 89cbf46693 elf: don't clobber ld.so.conf in tst-glibc-hwcaps-prepend-cach=
e [BZ #34210]
> 18b97b03b7 Rename __unused fields to __glibc_reserved.
> a47b5b2b3e math: Fix fma alignment when exponent difference is exactly 64=
 (BZ 34183)
> 4070d808be stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
> 2890b35cd3 libio: Fix ungetwc operating on byte stream [BZ #33998]
>
> Testing Results:
>              Before    After    Diff
> PASS         6609      6611      +2
> XPASS        4         4          0
> FAIL         131       132       +1
> XFAIL        16        16         0
> UNSUPPORTED  554       555       +1
>
> Changes in testcases:
>
> testcase-name                                before  after
> resolv/tst-ns_sprintrr(new)                    -     PASS
> nptl/tst-robustpi7                            PASS    FAIL
>
> [Note: The uplift adds new testcases including resolv/tst-ns_sprintrr
> from commit 8759917de5, which passes, accounting for the PASS and
> UNSUPPORTED increases.
>
> nptl/tst-robustpi7 shows as PASS->FAIL, but it is a flaky test under
> QEMU user-mode emulation (PI robust-mutex handling). No nptl code was
> changed in the SRCREV range.]
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hi Adarsh,

Thanks for your patch, but this is not building at all. You will need to
refresh or drop some patches:

ERROR: nativesdk-glibc-2.43+git-r1 do_patch: Applying patch '/srv/pokybuild=
/yocto-worker/genericx86-64/build/layers/openembedded-core/meta/recipes-cor=
e/glibc/glibc/0023-CVE-2026-5450.patch' on target directory '/srv/pokybuild=
/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-nativesdk-pokysdk-l=
inux/nativesdk-glibc/2.43+git/sources/glibc-2.43+git'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4241

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


