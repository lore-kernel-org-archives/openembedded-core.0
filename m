Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6D1CD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:55:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75210.1780995346252088083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PcR7e2Io;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6D3BD4E41E3E
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Jun 2026 08:55:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 432BB5FFC1;
	Tue,  9 Jun 2026 08:55:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C223A106A14C3;
	Tue,  9 Jun 2026 10:55:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780995343; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nWGCoqcl+GbQlPHCunFo9YT8kpTH54f1XYyQaRpjndo=;
	b=PcR7e2IoqxYcfKSM352k8KH8ayGFgebzniB/IoUhFHR+mTqw71DbIOrs2gAjMg2JJbmhQX
	J0pou6lRCzxh8Co+MI58mR5/hs/AFrGrCx+ce+7hUmLqBRUFvpVaqIRroZpMSq0TJJvWn2
	knu17slkQ9ZnGtvnpxFOqFbbnI8kvRDntIHTnMIHz4AJ+RHtL8RpULdgkWICRIKlNcwlws
	4oufm6Hdu+XkzScu64VsjMJjaNpL+cuINXOrY5ZqjijTAsP2SwffIkekqh1pzc4yxf2jGa
	U+CtXX/hnHrF4ilr5H7sZTDtafemqvVH0oDoPM7I6cUtGP533GPFcSTlJ2/xrA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 10:55:41 +0200
Message-Id: <DJ4E5OTQSRTG.JX0ANFWCLECZ@bootlin.com>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Shilong.Jiao@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260609014110.3859502-1-Shilong.Jiao@windriver.com>
In-Reply-To: <20260609014110.3859502-1-Shilong.Jiao@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 08:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238277

On Tue Jun 9, 2026 at 3:41 AM CEST, Shilong via lists.openembedded.org Jiao=
 wrote:
> From: Shilong Jiao <Shilong.Jiao@windriver.com>
>
> Add ptest for python3-six using pytest to run the test_six.py
> test suite included in the source package.
>

Hi,

Thanks for your patch.

It looks like some tests are failing on the autobuilder:

Failed ptests:
{'python3-six': ['test_six.py::test_lazy',
                 'test_six.py::test_move_items[html_entities]',
                 'test_six.py::test_move_items[html_parser]',
                 'test_six.py::test_move_items[BaseHTTPServer]',
                 'test_six.py::test_move_items[CGIHTTPServer]',
                 'test_six.py::test_move_items[SimpleHTTPServer]',
                 'test_six.py::test_move_items[xmlrpc_client]',
                 'test_six.py::test_move_items[xmlrpc_server]']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3794
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/522
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/505

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


