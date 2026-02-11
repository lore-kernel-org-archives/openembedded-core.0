Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D78E9E2FA
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:10:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17735.1770811819578104838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=W+pguL7W;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C915AC243AC;
	Wed, 11 Feb 2026 12:10:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E03DB606BE;
	Wed, 11 Feb 2026 12:10:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43D1511948D8C;
	Wed, 11 Feb 2026 13:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770811816; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HqxG4dyKTLiwPUuf3A3RtjwQFzVHlAathse8Et7m74E=;
	b=W+pguL7WIAU0IThYCnaiQVHtJKwnmLADsBuWFGTHZabAIcKJbP/RQUxLyZjKowBI0kcMIu
	nrdIg8YmAkCZoW/3qhycqwiG5oTqqPtwXAhLzNe24djjTIF1JgFdVVnq0ZPlHNZpJrDIKW
	AdqmDKi3A3yvJzqI1URMmwHRGHrrzuG/bj7rwW1sl9idx7PwstlKFMHcRCl08Hj8yLN97x
	DyoNNcLzHrMz8dM6ogd/o0h2VRct8mMcqeaqUKktGPd7DIsScYE1RZHFg3zLgR8AkgHGfZ
	BpdGTAugRRxyw5ukvy2/4xSZYk3ADMUcqYuk+HgaORz9mu4J0ntavhrDxjHw0Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 13:10:14 +0100
Message-Id: <DGC4ED9DGD9G.2PAQXZDB5E8VY@bootlin.com>
Subject: Re: [OE-core][PATCH v2] libsolv: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260202223606.19978-1-pratik.farkase@est.tech>
 <20260210184908.7373-1-pratik.farkase@est.tech>
In-Reply-To: <20260210184908.7373-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 12:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230982

On Tue Feb 10, 2026 at 7:49 PM CET, Pratik Farkase wrote:
> Add ptest support to enable automated testing of libsolv
> using ptest-runner.
>
> The implementation uses upstream's test infrastructure:
> testsolv binary, runtestcases.sh script, and testcase data.
> The test suite runs 28 test categories covering solver
> functionality, package dependencies, and repository handling.
>

Hi Pratik,

Thanks for the new version, as Ross said, the previous one got merged.

Still your changes are valuable.Can you send them as another commit on
top on the current master branch?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


