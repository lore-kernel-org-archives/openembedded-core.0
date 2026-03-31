Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B9C1061B21
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 10:07:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16773.1774951610611402507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 03:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lMm58Lv+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9C9B74E42884
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 10:06:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BF5B6029D;
	Tue, 31 Mar 2026 10:06:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34747104511BF;
	Tue, 31 Mar 2026 12:06:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774951608; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MbVLeOz9+NyA4+jbe1Rrsdzj4vr3zpcXsWNDJwP69WY=;
	b=lMm58Lv+DXWKLBRobALYZ7ayzth0mvakhHkIl17dkxV0Oclw0LnCa8FIKoYkQS2RUKfK8J
	NO9BgE4IJjsHjAEcM83286p25aufyBob7zRmoWE5TjelGuwbS47wkshh4h2z5mCb8MnNCj
	L/9AwVYi8aqEJgsDyHA4y+Fa5rV9Kj9+fySLfWGB2IQKjyb6gNrruu/Eu9zQk3oZHK9Etq
	yAxF8nJfFqIaMRScVhPN5O4eKQZnGUWUU2lQhhXzV3ZSy9+/bgLivk/tQUICJmZsJ7KwR0
	ZWae0CIFhdVdVwQO2oqK5eak+S5wCo1DGGjI5RqlyVQHsw2UmZWiI7f7NA0peA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 12:06:46 +0200
Message-Id: <DHGVTZ2B0M17.37ALOGP39VJKV@bootlin.com>
Subject: Re: [OE-core] [PATCH] lttng-tools: upgrade 2.14.1 -> 2.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260327120939.1261-1-wangmy@fujitsu.com>
In-Reply-To: <20260327120939.1261-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 10:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234280

On Fri Mar 27, 2026 at 1:09 PM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> disable-tests2.patch
> refresshed for 2.15.0
>
> 0001-tests-do-not-strip-a-helper-library.patch
> removed since it's not available in 2.15.0
>
> 0001-common-Autodetect-musl-libc-and-fix-C-compilation-er.patch
> added to fix compile error when enable musl
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the new version.

The build looks better now, but some selftests are failing:

AssertionError:
Failed ptests:
{'lttng-tools': ["tests.serial_47_-_Test_script_'tools/trigger/test_add_tri=
gger_cli'_returned_code_6._289_passed,_6_failed,_0_skipped,_295_planned_[to=
tal:_295]",
                 "tests.serial_48_-_Test_script_'tools/trigger/test_list_tr=
iggers_cli'_returned_code_4._146_passed,_4_failed,_0_skipped,_150_planned_[=
total:_150]",
                 "tests.serial_78_-_Test_script_'ust/stall-buffer/test_stal=
l_buffer_complex.py'_returned_code_1._0_passed,_0_failed,_0_skipped,_unknow=
n_planned_[total:_0]",
                 "tests.serial_79_-_Test_script_'ust/stall-buffer/test_stal=
l_buffer_simple.py'_returned_code_1._0_passed,_0_failed,_0_skipped,_unknown=
_planned_[total:_0]",
                 "tests.serial_80_-_Test_script_'ust/stall-buffer/test_stal=
l_buffer_timer.py'_returned_code_1._0_passed,_0_failed,_0_skipped,_unknown_=
planned_[total:_0]",
                 "tests.serial_82_-_Test_script_'kernel/test_callstack'_ret=
urned_code_1._23_passed,_1_failed,_0_skipped,_24_planned_[total:_24]",
                 "tests.serial_94_-_Test_script_'kernel/test_userspace_prob=
e'_returned_code_48._59_passed,_48_failed,_0_skipped,_107_planned_[total:_1=
07]"]}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3409
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3387

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


