Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573F5C8303F
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 06:18:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.7134.1756448296672703579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 23:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=agATQS/4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D637D1A0B85
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 06:18:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD85C606B9;
	Fri, 29 Aug 2025 06:18:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE1D21C22DA66;
	Fri, 29 Aug 2025 08:18:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756448293; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NMvKg/8A3pBZdStYgZS3USehvy9JFMCINHW5SF12GxI=;
	b=agATQS/4m6NJ0kcn1T15tsbYGoxFDKzcndExQbNfqDpxTAyyecd1JxtClDuUWyzPIT8RVO
	jUkTGeHr+TAzk1tFJnXo54U3cwwbqyNQGSaH8R9aSswjMZ0mSWxkvvk/0K2Km2GjUG8BEj
	sF4Bc5qt6Z5nAoLdTRjLmmFILfmRffPEgRnBCThJ9Z1v2/Gir3TTIVzDzTHSEnzPRtU4mU
	UcpLto9oSAOYF0wuP6NDDSlDVH+vGMa43FwzckdpKHrzXGn0YdIHVTTo5C4rzIfzEV9sQe
	5IsJvGywMn+xp8+yEfeuUETlg5qMg+3qKMBwc4VBuDBCAjUtPjj15D45xpRLDA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 08:18:01 +0200
Message-Id: <DCEOY8ZC7LJH.2M9UKRHFOGJSD@bootlin.com>
Subject: Re: [OE-core] [PATCH] pinentry: upgrade 1.3.1 -> 1.3.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250827170807.1853599-1-skandigraun@gmail.com>
In-Reply-To: <20250827170807.1853599-1-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 06:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222601

On Wed Aug 27, 2025 at 7:08 PM CEST, Gyorgy Sarvari via lists.openembedded.=
org wrote:
> Shortlog:
>
> -qt: Replace icons for dark mode with 16x16 icons
> -qt,qt5: Ensure that input field is large enough for generated password
> -qt5: Add dark mode icon variants and detection
> -Make Show/Hide Password functionality accessible
> -qt5: Make Show/Hide Password functionality accessible
> -m4: Update libassuan.m4.
> -build: Remove defining GPG_ERR_ENABLE_ERRNO_MACROS.
> -build: Fix warning about obsolete pinentry-emacs.
> -curses: Factor out dialog release to separate function.
> -qt: Add dark mode icon variants and detection
> -m4: Update gpg-error.m4 and libassuan.m4.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---

Hi Gyorgy,

Thanks for your patch.

It looks like this is breaking some selftest:

2025-08-28 11:10:05,568 - oe-selftest - INFO - oescripts.OEListPackageconfi=
gTests.test_packageconfig_flags_option_all (subunit.RemotedTestCase)
2025-08-28 11:10:05,569 - oe-selftest - INFO -  ... FAIL
...
2025-08-28 11:10:05,570 - oe-selftest - INFO - 0: 31/43 460/635 (231.91s) (=
0 failed) (oescripts.OEListPackageconfigTests.test_packageconfig_flags_opti=
on_all)
2025-08-28 11:10:05,570 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
selftest/cases/oescripts.py", line 161, in test_packageconfig_flags_option_=
all
    self.check_endlines(results, expected_endlines)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
selftest/cases/oescripts.py", line 125, in check_endlines
    self.fail('Missing expected listings:\n  %s' % '\n  '.join(expected_end=
lines))
  File "/usr/lib64/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError: Missing expected listings:
  pinentry-1.3.1

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2228
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2161
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2379

Can you have a look at this issue please?

Thanks!
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


