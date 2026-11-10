Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1080.1794329544516994659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 08:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gfArKY8x;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 72142C69156;
	Tue, 10 Nov 2026 16:52:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 121EE60012;
	Tue, 10 Nov 2026 16:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE0AD103291AE;
	Tue, 10 Nov 2026 17:52:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794329537; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sIGjiAehqJiw5V8RVtFvamog4dJ4+KUUyRvFvaB44ow=;
	b=gfArKY8xUPG/IxbO5e8YNfm2MiP8j8kHXdyReNirjUlF09X7SBDRCcZyyCt1n9cf3ET84i
	VGwAiUPTvH6lH8tpQRxRswa3W01pWr9UTv1johGExYGfXO2LeUe8iYLPI2rVNk40/5OY3Y
	87UeqVnT5h20o8gtKklPWKC6Y2zexORVd/HoePUgZqZSw5T0Uqe7b0l93pND91ym3LVK9y
	1OEw7M2HXsAPtTehPdH9hcFhSbPk/ntkBHHz3BMDpdRPESQ/xDFotkTVMnFnqHK0CguWFN
	lrrHR+/8fLoAaREGQ8+IUUFA1nsgcgZGWICa6v0aG8LcuF6U9dVt7CriKVn6Pg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 17:52:15 +0100
Message-Id: <DMROQGZJRL7N.3QN1UPWBZNROY@bootlin.com>
Subject: Re: [OE-core][PATCH 1/7] bluez5: upgrade 5.87 -> 5.88
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 16:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249928

On Tue Nov 10, 2026 at 4:52 AM CET, Ankur Tyagi via openembedded-core wrote=
:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> - Upstream deprecated gatttool[1]
> - Dropped patches that are merged in the upstream version
> - Refreshed 0001-tests-add-a-target-for-building-tests-without-runnin.pat=
ch
>
> Changelog:
> https://github.com/bluez/bluez/releases/tag/5.88
>
> [1]https://github.com/bluez/bluez/commit/a7da60ed45e9b7aea429f1472588c907=
0ebecdf7
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---

Hi Ankur,

Thanks for the upgrade.

I can see some failing ptest:

WARNING: core-image-ptest-bluez5-1.0-r0 do_testimage: There were failing pt=
ests.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunn=
er_expectfail
    self.do_ptestrunner()
    ~~~~~~~~~~~~~~~~~~~^^
  File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/openembe=
dded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestrunne=
r
    self.fail(failmsg)
    ~~~~~~~~~^^^^^^^^^
AssertionError:
Failed ptests:
{'bluez5': ['test-sdp-xml']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1540
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1560
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2769

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

