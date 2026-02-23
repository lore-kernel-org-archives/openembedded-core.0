Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94525E98DF2
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 07:11:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30775.1771830672229557821
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 23:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MDkKjXxk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB6BAC139AE;
	Mon, 23 Feb 2026 07:11:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA6D85FD43;
	Mon, 23 Feb 2026 07:11:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 915CB10368D7F;
	Mon, 23 Feb 2026 08:11:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771830669; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RGN6y6RfypobHTGqYcnZx/S+Lct1WHDVmjJMnfS2o+Y=;
	b=MDkKjXxkbElVB1ppSDBRH9mRFkcB+IRgd7Rc5DMT9IHhqW30ymzZ9A516ariY4WBzdgNU+
	2LK+/EC+sAnowOEZv5HOv65IN3/IH36Jtg7pCJJ4nGYXzkpIYu68M99/VWNJJDHWE6Esyn
	1Mn5X2OAvutqML68A1pkvzBMxu+yZOlKBh9z+LxkgiimwaHOXh8qwkyC2lZbWvT0pw4DEv
	jmYo75ITEMriRKtyOTdsTkBd1i4AxrikAZnREMQN4ROu7l2FwivMRQAiFNMtl/CgZKx1PK
	5+4/n9Kl9ZmxVNDz4ESey0fTjpvtH6CFQRpSr/ho8JGbO4hSi9K/sy5gMHRhdA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 08:11:00 +0100
Message-Id: <DGM5JSM2NNSY.39WBWJXZMDKCJ@bootlin.com>
To: <randy.macleod@windriver.com>, <deepesh.varatharajan@windriver.com>,
 "Khem Raj" <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.43 release
Cc: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260127053941.792825-1-raj.khem@gmail.com>
 <982964.1769514056170035817@lists.openembedded.org>
 <e057c0b8-6c9b-4d2d-b3dd-f71362f0808f@windriver.com>
In-Reply-To: <e057c0b8-6c9b-4d2d-b3dd-f71362f0808f@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 07:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231647

On Sat Feb 21, 2026 at 3:30 PM CET, Randy MacLeod via lists.openembedded.or=
g wrote:
> On 2026-01-27 6:40 a.m., Varatharajan, Deepesh via=20
> lists.openembedded.org wrote:
>> On Tue, Jan 27, 2026 at 11:09 AM, Khem Raj wrote:
>>
>> Hi Khem,
>>
>>     -CPPFLAGS:append:class-nativesdk =3D " -Wno-error"
>>     +CPPFLAGS:append:class-nativesdk =3D " -Wno-error -Wno-error
>>     -Wno-error=3Dincompatible-pointer-types-discards-qualifiers"
>>
>> I noticed a small typo */-Wno-error/* is added again.
>
> Thanks Deepesh,
>
> That can be fixed in place or as a follow-up patch since duplicate flags=
=20
> are harmless.
>
>
> Mathieu,
>
> I don't see this in:
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmathieu%2=
Fmaster-next&qt=3Dgrep&q=3Dglibc
> or
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmaster-ba=
cklog&qt=3Dgrep&q=3Dglibc
> or
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmaster-re=
view&qt=3Dgrep&q=3Dglibc
>
> Did you miss it ?
>
> ../Randy
>

No, I was waiting for a reply on the above comment. Which you did, so
this one is back in the queue.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


