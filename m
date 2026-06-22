Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C75CDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:17:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38434.1782116256790093391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 01:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YytwgKeA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D3D01A07AD
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:17:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D56A1601BB;
	Mon, 22 Jun 2026 08:17:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FC28106C895B;
	Mon, 22 Jun 2026 10:17:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782116254; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3xnFRoRHugmYxm6pNqf2P44QXdkv4nMgL2skWx6amnY=;
	b=YytwgKeAbKGcVJTTqQriFkoWWZha+TFQz4f+r/oQxAwWxHqeGsNl3lshbMbVjf3YjQiYTT
	2ouOPwV12NqbODno2VTk9JHHvbHUPp7I5wU4Izo0u6LfiLRKniKrN9NuE6AOqsmqrirGB6
	yGOigIJPh3NNajx70kMi6OgvuIhj0U4hH34BUXrLgeGw/8Ak72oTTKWfsi1FMi5/T/ja+s
	kkdqlABQex1J4O8iqFhiUtEKY1KegIFcPMe12h3s87cyKRpW1V1m68CIpWYvxlbjaVk61n
	m66bGzX54NEA8vvVN8YevV+5bHB6CwVt2vbv4QupxCUeqxbWQ2mE2W/biN26Qg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 10:17:32 +0200
Message-Id: <DJFFHKBZR8UH.319Q33MG5CVZJ@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/1] fix tests for kernel-fit-image.bbclass:
 Do not include kernel property in DTBO config subnodes
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260621101222.669557-1-adrian.freihofer@siemens.com>
In-Reply-To: <20260621101222.669557-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239273

On Sun Jun 21, 2026 at 12:11 PM CEST, Adrian Freihofer via lists.openembedd=
ed.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> This patch
> https://patchwork.yoctoproject.org/project/oe-core/patch/20260616220700.4=
1516-1-marek.vasut@mailbox.org/
> requires a fix in the oe-selftest.
>
> Without this the tests fail on the autobuilder with the following error:
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7316435/raw_inl=
ine
>
> @Mathieu would it be possible to pick the patches in the following order =
as I
> tested them successfully on my WIP branch here?
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dadrianf/f=
it-improvements-tests-dtbvendored
>
> It's esentially the same as you have it on
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmathieu/m=
aster-next-tests
> but with the patch here before the two patches from Marek.
>
> Adrian Freihofer (1):
>   oe-selftest: fitimage: Do not expect kernel property in DTBO config
>     subnodes
>
>  meta/lib/oeqa/selftest/cases/fitimage.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

I confirm this this now working, it should be in my
mathieu/master-next-success branch in the coming hours.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


