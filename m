Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCF5C531CC
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 19:50:02 +0000 (UTC)
Received: from mailer9.gate185.sl.smtp.com (mailer9.gate185.sl.smtp.com [192.40.185.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2211.1784827692963824224
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 10:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=LEIxvTAW;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=uEwJFhmw;
 spf=pass (domain: centricular.com, ip: 192.40.185.9, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.172] (unknown [10.138.12.16])
	by mtl-mta01-out1 (Halon) with ESMTP
	id a6fb527e-6857-484c-92a3-e4da34cf235f;
	Thu, 23 Jul 2026 17:28:12 +0000 (UTC)
Received: Received from 10.138.12.53 by Caffeine (s0-aws-app-swarm-manager-4)
 with SMTP id d90b825d-6b6d-4bf3-bc1f-9a18f67e29c5  for
 openembedded-core@lists.openembedded.org;
  Thu, 23 Jul 2026 17:27:23 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app-mta-in-2 (Halon) with ESMTPSA
	id d90b825d-6b6d-4bf3-bc1f-9a18f67e29c5;
	Thu, 23 Jul 2026 17:27:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9DCFF9CA4E;
	Thu, 23 Jul 2026 19:27:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1784827642;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=jLD9ggdviNVSmZO82xNnruRDgg+ORk0sxMx1K9RpvDY=;
	b=LEIxvTAWbT7GzDxcDvxCryL+2nkELnXzcoIP0EgtssLyYZnrDnghWW1tePqI3tw+0CJULR
	S+7wPs57kUQbGJFYseT003yRBpE/4cg4gpkZrWSbp8y5SbWAYcx8bcCmN0T3RUbuYySUCa
	HG+ZsEAahu3L3uVCZjY5TYSyIiYdiwdi+JITWE5zq9uanlPTUOYnYyGP47voEuF1HrzW4q
	5iCS6UXu2UjVfaGmK3cU1ikRLIFVNeH86p3D5I1Lut8M4NmGqRnTswZN9niTmmzGHGgENz
	hUT8YyTsiNbL0vGzddKQaCTYHVEB7N4Bth4OAKHCWZ2aQmVbFlkShGyU+vMhYA==
Message-ID: <c0954cf3c3f481a7bbbe9143c44a25f5a4e74b41.camel@centricular.com>
Subject: Re: [OE-core] [PATCH v5 2/2] gstreamer1.0-plugins-rs: add new package
From: Taruntej Kanakamalla <tarun@centricular.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	openembedded-core@lists.openembedded.org
Cc: sebastian@centricular.com, nirbheek@centricular.com, jan@centricular.com
Date: Thu, 23 Jul 2026 22:57:16 +0530
In-Reply-To: <DK61WCMPQZSR.23U8FFRDU3P0@smile.fr>
References: <20260707081701.1525114-1-tarun@centricular.com>
	 <20260714105541.2812170-1-tarun@centricular.com>
	 <20260714105541.2812170-2-tarun@centricular.com>
	 <DJZ45A2IL6XB.172T8CGXQUIPH@bootlin.com>
	 <DJZ6ZB5JTYSV.ZUCFUNHW05GN@bootlin.com>
	 <d460480501e19d59ac2a7bec0f15020692f0b855.camel@centricular.com>
	 <DJZTA3XYAG4T.1DDQE4ASD7JPI@bootlin.com>
	 <4d95a8c8b8bcb0e1f5e01576466301f69eb2aa9b.camel@centricular.com>
	 <DK54RIOEU340.33ALWQ7AGPKEJ@bootlin.com>
	 <613be9d21a4a0f6fbec1c71aeca3a5874fbe4e60.camel@centricular.com>
	 <DK61927PZM4C.2UUP8BSKKC6NY@smile.fr>
	 <9b05bc4c4c0ae9e817111347a473a268d3fd3584.camel@centricular.com>
	 <DK61WCMPQZSR.23U8FFRDU3P0@smile.fr>
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: d90b825d-6b6d-4bf3-bc1f-9a18f67e29c5
X-SMTPCOM-Message-ID: 08ca009c-4018-4e83-a611-19fe62f6ee4c
X-SMTPCOM-Payload: 
 og_xjl-Vw2e09WCfPDHKUW_ikx8ArmVn9k3XLb3Am-WqZ-HWC_kSgHntm4blNMVY5AMvoqtbBBz7Lx09qygrwHhMU11qyzfBL6nkkgNXAYLY0GQOq7ksIq2hs__LErJCMCTdlXjeEAA6ZxHoLsMhNKwGqXj0pHUfQB86paMB4YEpjb52Ck-Mr8Ng8OBak5amuPM2f8GJew5LwjT0vGKt2A==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=08ca009c-4018-4e83-a611-19fe62f6ee4c_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=08ca009c-4018-4e83-a611-19fe62f6ee4c&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1784827676;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : mime-version :
 list-unsubscribe : list-unsubscribe-post : subject : from : to : cc :
 date; bh=jLD9ggdviNVSmZO82xNnruRDgg+ORk0sxMx1K9RpvDY=;
 b=uEwJFhmwQcxEUB49FfsmYQ6DUHo4By7rquOZuhaeqbGOSv3t16m0qMJYuzzN9P6qV9wPC
 OWoBbJIm65SSIAaNwJyA/hB9pQK1xqPEqPNbWTgLL4I1mA6IkHewJ5IHDeloBhhFSc+L2qO
 RmknmSYwiTQPbxexqRNcAiD2a1PNYpuq24StvN88bi/+/ImHY/0N5eVWXCSV8QZOJHqx5WB
 IlfxMBaFffAS+yrEzmYN4d7+67PIEm1qGjxFafCnZXLASgMO6OZQ6LLt/AHeGY8tOeR5OCL
 We7xtuCQUkByDZq07TwYwjrh5sB9jMOnpyB2YTau6LAyvL1Nykt5zPSex42Q==
Content-Type: multipart/alternative; boundary="=-Hi+ck1drJUtbCah2T99o"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 19:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241868

--=-Hi+ck1drJUtbCah2T99o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-07-23 at 17:20 +0200, Yoann Congal wrote:

> > > Hello,
> > >=20
> > > "issues with freedesktop gits" were a red-herring.
> > >=20
> > > The root cause is that the submitted recipe gstreamer1.0-plugins-rs
> > > is
> > > "floating": ie has not SRCREV value to anchor it to a particular git
> > > commit.
> > >=20
> > > Please send a new version with the appropriate SRCREV value.
> > >=20
> > > Thanks!
> >=20
> >=20
> > Thanks for spotting it, I will send a new version shortly.
> >=20
> > Now while building after pulling the latest master, I notice the
> > warnings Mathieu previously mentioned about using old syntax for
> > LICENSE for this recipe as well multiple others.
> >=20
> >=20
> > > gstreamer1.0-plugins-rs: LICENSE is using an old syntax and should be
> >=20
> > upgraded to: "Apache-2.0 OR MPL-2.0"
> >=20
> > Should I make the LICENSE format change as well in the new version?
>=20
>=20
> I guess, yes. Sounds like the consequence of the recent LICENSE =20
> developments.

Thanks, I have just submitted a new version with the changes.

--=-Hi+ck1drJUtbCah2T99o
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>On Thu, 2026-07-23 at 17:20 +0200, Yoann Congal wrote:</p>
<blockquote type=3D"cite">
<blockquote type=3D"cite">
<blockquote type=3D"cite">
<p>Hello,</p>
<p>&quot;issues with freedesktop gits&quot; were a red-herring.</p>
<p>The root cause is that the submitted recipe gstreamer1.0-plugins-rs
is
&quot;floating&quot;: ie has not SRCREV value to anchor it to a particular =
git
commit.</p>
<p>Please send a new version with the appropriate SRCREV value.</p>
<p>Thanks!</p>
</blockquote>
<p>Thanks for spotting it, I will send a new version shortly.</p>
<p>Now while building after pulling the latest master, I notice the
warnings Mathieu previously mentioned about using old syntax for
LICENSE for this recipe as well multiple others.</p>
<blockquote type=3D"cite">
<p>gstreamer1.0-plugins-rs: LICENSE is using an old syntax and should be</p=
>
</blockquote>
<p>upgraded to: &quot;Apache-2.0 OR MPL-2.0&quot;</p>
<p>Should I make the LICENSE format change as well in the new version?</p>
</blockquote>
<p>I guess, yes. Sounds like the consequence of the recent LICENSE<br />
developments.</p>
</blockquote>
<p>Thanks, I have just submitted a new version with the changes.</p>

--=-Hi+ck1drJUtbCah2T99o--

