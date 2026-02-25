Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6AEF3C99C
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 07:19:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40706.1772003973409372120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 23:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZpmdUgsZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 58F9E1A12ED
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 07:19:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 246925FDE5;
	Wed, 25 Feb 2026 07:19:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86F26103690E8;
	Wed, 25 Feb 2026 08:19:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772003970; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pvuYzUZo38b5kviilia3j4ODwuQxIKhIZvGQgQFKQIE=;
	b=ZpmdUgsZMUiXuQr3nWY7Wbm510/plfVojgAdyGrykvaZB+uFzSaRcrGGmxRhUGbrVgM0pp
	viTpm1LRMkClSZ/fEDrrXtt9uLvSI9yp5BTc+btqW6ICadcaScMC23b6cZ3yMWtBuwPdfU
	6Wm9uqGOfd7w8P1o2WcqlStjxclAV5zlr+bJpXYwUr/WjUmi92W87IFaQtSGrRU9VdEO/4
	+U14j4258FSjhHoLMti3YhnxHR6rwItcmdRpFWUiEJ4ifrEWo8p/LZXl9hBJLj7TPrZrBl
	BcAVKg+gzgvsFfIdbXUoruFTpVC1J0wAXb5itP5yjGY5x10+g9xlmFueVPF9og==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 08:19:28 +0100
Message-Id: <DGNUZCXZGR1V.3GZ38NGR23M4E@bootlin.com>
To: <careers.myinfo@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] libsamplerate0: Adding ptest for
 libsamplerate0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260224020311.167778-1-moins@kpit.com>
In-Reply-To: <20260224020311.167778-1-moins@kpit.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 07:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231928

On Tue Feb 24, 2026 at 3:03 AM CET, Shaik Moin via lists.openembedded.org w=
rote:
> Executables Description:
>  callback_hang_test		-	Verifies that callback-based processing does not h=
ang and that the library properly returns control without deadlocks.
>  callback_test			-	Tests the callback-driven processing mode of libsample=
rate (SRC's non-blocking interface).
>  clone_test			-	Ensures the SRC state objects can be cloned correctly and=
 continue producing identical output.
>  downsample_test		-	Tests accuracy and behavior when downsampling audio (=
reducing sample rate).
>  float_short_test		-	Tests conversions between float and short integer sa=
mple formats.
>  misc_test			-	Runs assorted sanity and utility tests that don't fit into=
 other categories.
>  multi_channel_test		-	Verifies correct handling of multi-channel audio (=
e.g., stereo, 5.1) during sample-rate conversion.
>  multichan_throughput_test	-	Measures throughput and performance for mult=
i-channel SRC processing.
>  nullptr_test			-	Ensures libsamplerate properly rejects or handles NULL =
pointers and invalid state.
>  reset_test			-	Tests the reset() behavior - state clearing, flushing buf=
fers, resetting filters.
>  simple_test			-	The most basic test of sample-rate conversion functional=
ity - often converting a small buffer to ensure fundamental correctness.
>  snr_bw_test			-	Measures Signal - Noise Ratio (SNR) and bandwidth perfor=
mance for different converter algorithms.
>  src-evaluate			-	Evaluates internal SRC filter performance, quality, and=
 algorithmic behavior.
>  termination_test		-	Ensures end - stream / termination behavior is handl=
ed correctly without artifacts or crashes.
>  throughput_test		-	Benchmarks throughput for mono or simple use cases to=
 measure raw processing speed.
>  varispeed_test			-	Tests variable sample-rate operation (changing SRC ra=
tio on the fly).
>
> Time taken to execute the ptest:- Approx ~3 mins
>
> Signed-off-by: Shaik Moin <moins@kpit.com>
> ---

Hi Shaik,

Thanks for your patch.

It looks like something is off with this test. While running on the
autobuilder, no results are found:
WARNING: core-image-ptest-libsamplerate0-1.0-r0 do_testimage: There were fa=
iling ptests.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunne=
r_expectfail
    self.do_ptestrunner()
    ~~~~~~~~~~~~~~~~~~~^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 120, in do_ptestrunner
    self.fail(failmsg)
    ~~~~~~~~~^^^^^^^^^
AssertionError:
ptests which had no test results:
['libsamplerate0']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1124
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3112
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3153

Test results can be seen here:

https://valkyrie.yocto.io/pub/non-release/20260224-104/testresults/qemuarm6=
4-ptest/core-image-ptest-libsamplerate0/
https://valkyrie.yocto.io/pub/non-release/20260224-104/testresults/qemurisc=
v64-ptest/core-image-ptest-libsamplerate0/
https://valkyrie.yocto.io/pub/non-release/20260224-104/testresults/qemux86-=
64-ptest/core-image-ptest-libsamplerate0/

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


