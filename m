Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43836CA5FD9
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 08:25:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6713.1790929528224022405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 01:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=x0uOvgz3;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1A0204E41110;
	Fri,  2 Oct 2026 08:25:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E139C603DC;
	Fri,  2 Oct 2026 08:25:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91A7F103281E8;
	Fri,  2 Oct 2026 10:25:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790929525; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8R2CxG2IgRGCkg/u004BO6SvRp1MrFc0o872BecBrNk=;
	b=x0uOvgz3RLyidy81cxYmrwJb8uFnZJaK7yxSIFopo+4zbAkYR7qgXuAfhYQbLBcYw6w7a/
	lWoTX5VqahjBFcGaJPRLDzicnhebKAMQIM20GwgZNFWEqTyLg6KV8AZt3aFvjpSofnrDCS
	wQcZ1GdgdkmrDsW9SznxmKQrvYu1l+5Fjp2vCrm/x75pWseOIsPHSXgQRC/0JMzq0dFEO1
	3NPcaadc/htbxURg6vUd+BmuuuRVXr4LLrrJADaFFks7q82OwbCcwAjikU3BBS22r5HfmE
	Sa7toyZaLACnx2JYMROqoexYBrDDM/ZA0EQmaXjgHIAfhxIcXoDTuVC0kP7/aw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 10:25:23 +0200
Message-Id: <DLU7J55HJ9YV.14WKSNSKCXDSM@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/4] shadow: upgrade 4.20.2 -> 4.20.3
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
 <20261002071557.74249-4-jaipaul.cheernam@est.tech>
In-Reply-To: <20261002071557.74249-4-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 08:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247089

On Fri Oct 2, 2026 at 9:15 AM CEST, Jaipaul Cheernam wrote:
> ChangeLog:
> https://github.com/shadow-maint/shadow/releases/tag/4.20.3
>
> Compare log: https://github.com/shadow-maint/shadow/compare/4.20.2...4.20=
.3
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Does it build on your side? Here I get this error:

| ../../sources/shadow-4.20.3/lib/commonio.c: In function =E2=80=98dec_lock=
_count=E2=80=99:
| ../../sources/shadow-4.20.3/lib/commonio.c:425:51: error: passing argumen=
t 1 of =E2=80=98nscd_flush_cache=E2=80=99 makes integer from pointer withou=
t a cast [-Wint-conversion]
|   425 |                                 nscd_flush_cache ("passwd");
|       |                                                   ^~~~~~~~
|       |                                                   |
|       |                                                   char *

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4753

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


