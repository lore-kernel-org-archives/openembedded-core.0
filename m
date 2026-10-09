Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4F6CC6B1A
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 17:52:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3915.1791913952636558445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 10:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RwFVFtmm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 59BF84E41217
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:52:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E14560362
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:52:30 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id B748311D7188E; Tue, 13 Oct 2026 19:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913949; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aY3xkbMOIcmWyHM198xASOjvY/dscLrS7W37Cw8oK1M=;
	b=RwFVFtmmU09+XnSBgElVsdWLadPjB63Rdsbt3yoTmjXOLQpq9lEtn3+qI0S8ZW5DtiG3lU
	TxTIseve3pO3AZ8pWXZuf98/xfBrgNv/Z2g9yMh7A+I4VuimxSyNEKm5PvGZlrreWAcDQp
	GJShOrBnHRByCcXzCoSYF7UFkt2yxJbCQri3pQ22Hx/VV149kWXkvMrumouX3bXI2XcFxf
	iGgILJpES9pUXAmgPxBdudcfO9eWiRDffip3wEb3Xp8HQcaaK8ZyriqT8CEe3ScOt/QrhN
	RNTqMS/QJ7EFoOACuCDHOT8hhAACtscTC/AVWvi2AurcDeb6SE6QblP6c0ZO/w==
Authentication-Results: mail.galae.net;
	none
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 11:17:29 +0200
Message-Id: <DM070UI0TERG.1A3WINVYE19HJ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][patch] python3: upgrade 3.14.7 -> 3.14.8
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261008090135.1485765-1-vanusuri@mvista.com>
In-Reply-To: <20261008090135.1485765-1-vanusuri@mvista.com>
X-TUID: BVB7XN7/avRg
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: B748311D7188E
X-Spamd-Result: default: False [-4.10 / 30.00];
	BAYES_HAM(-5.50)[99.99%];
	DATE_IN_PAST(1.00)[104];
	MV_CASE(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	BCC(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:url,mvista.com:email,yoctoproject.org:url,openembedded.org:url,localhost:rdns,localhost:helo,python.org:url];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim]
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247733

On Thu Oct 8, 2026 at 11:01 AM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> Release information:
> * https://www.python.org/downloads/release/python-3148/
> * Python 3.14.8 is an expedited security release and the eighth maintenan=
ce release of 3.14, containing around 354 bugfixes, build improvements and =
documentation changes from 142 contributors since 3.14.7.
>
> Handles CVE-2026-19445 CVE-2026-19553 CVE-2026-19672 CVE-2026-15310
> CVE-2026-15806 CVE-2026-17084
>
> Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-14-=
8-final
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---

Hi Vijay,

Thanks for this upgrade, but we have failing ptests when building with
musl:

WARNING: core-image-ptest-python3-1.0-r0 do_testimage: There were failing p=
tests.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrappe=
d_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrappe=
d_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrappe=
d_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptest=
runner_expectfail
    self.do_ptestrunner()
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestr=
unner
    self.fail(failmsg)
AssertionError:
Failed ptests:
{'python3': ['test_append_limited_history', 'python3']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1353
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1341

This was recently discussed here:
https://lore.kernel.org/openembedded-core/DLUD1OK99YO3.1QPQV67EMZI06@bootli=
n.com/

Are you willing to investigate this further? We need to understand if
the test is failing because an issue in python code or because of a
dependency we are using in oe-core.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


