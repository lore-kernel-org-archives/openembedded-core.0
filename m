Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4546CC44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 06:31:54 +0000 (UTC)
Received: from mailer113.gate185.sl.smtp.com (mailer113.gate185.sl.smtp.com [192.40.185.113])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6527.1784181854701480468
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 23:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=OVG6/7G9;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=aAIH2YMr;
 spf=pass (domain: centricular.com, ip: 192.40.185.113, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.72] (unknown [10.138.12.203])
	by mtl-mta03-out2 (Halon) with ESMTP
	id 8c3063a0-c007-4c39-84b9-a74fbe75c3d7;
	Thu, 16 Jul 2026 06:04:13 +0000 (UTC)
Received: Received from 10.138.12.155 by Caffeine
 (s0-aws-app2-swarm-manager-3) with SMTP id
 b2ef8cc7-6cdf-4931-a775-a8f91e0f4346  for
 openembedded-core@lists.openembedded.org;
  Thu, 16 Jul 2026 06:03:19 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app2-mta-in-1 (Halon) with ESMTPSA
	id b2ef8cc7-6cdf-4931-a775-a8f91e0f4346;
	Thu, 16 Jul 2026 06:03:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 20AA59D264;
	Thu, 16 Jul 2026 08:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1784181798;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FA0XW9bXsaVSjtdPPq4Q34OcErOuCDX96mCwfwZDCEw=;
	b=OVG6/7G95DYOKmsV7bljLSlDd/O62OBtlqaM15kd9i/iIuLGQXwqJWj3X1rE947GxpKTZt
	1SWTOIzo/+4iXls+Esw77E7zJRqChu9GiVTRWvvjbtl5stocrSfxJpfOxova+Qvigu5H9p
	s5IuH1OjcP1KNLJMjnFLK0u9IYHXcpZac0TmMFd+QAlqYQhyJ517wYzHoSbdZhVhRsPHzv
	GNm2qZkgeyhSFk5mEOxXq+K/CpSTODvZ9ynGpFBbIiF+jP3avldq9ahnkx59wTb1IYEh8g
	6kvyhQA8/eBnfYQKqMEH8hn521iL5MhCLI53n+ogQyF31sGkOS25MX7Rh/lcag==
Message-ID: <d460480501e19d59ac2a7bec0f15020692f0b855.camel@centricular.com>
Subject: Re: [OE-core] [PATCH v5 2/2] gstreamer1.0-plugins-rs: add new package
From: Taruntej Kanakamalla <tarun@centricular.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org
Cc: sebastian@centricular.com, nirbheek@centricular.com
Date: Thu, 16 Jul 2026 11:33:11 +0530
In-Reply-To: <DJZ6ZB5JTYSV.ZUCFUNHW05GN@bootlin.com>
References: <20260707081701.1525114-1-tarun@centricular.com>
	 <20260714105541.2812170-1-tarun@centricular.com>
	 <20260714105541.2812170-2-tarun@centricular.com>
	 <DJZ45A2IL6XB.172T8CGXQUIPH@bootlin.com>
	 <DJZ6ZB5JTYSV.ZUCFUNHW05GN@bootlin.com>
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: b2ef8cc7-6cdf-4931-a775-a8f91e0f4346
X-SMTPCOM-Message-ID: 4c87e121-4edf-40e6-8662-33279bd004a7
X-SMTPCOM-Payload: 
 h82vWlG1CWl1d8sME_qnvVdLb18tSwvsxBhZHgvAMea39K9XAVNOF0nP-R_D6plSMsKvRatdrJrMNGfe2Npdb-AYxsS9GzJCSc2qlhg1LRRpRP06nd44SSpm-b2kXgZ5LD9bEgEh5ZbRXtJHwslpV1tAPhwz8dDrnVaqVTbWxcjsaNabXfeQbTqn3idBn6I_UMBqQg6StkVzxruF87_VSA==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=4c87e121-4edf-40e6-8662-33279bd004a7_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=4c87e121-4edf-40e6-8662-33279bd004a7&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1784181821;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : content-transfer-encoding :
 mime-version : list-unsubscribe : list-unsubscribe-post : subject :
 from : to : cc : date;
 bh=FA0XW9bXsaVSjtdPPq4Q34OcErOuCDX96mCwfwZDCEw=;
 b=aAIH2YMrKF8Je/W2t2aBnrL3Gix/1whh5GzO9yJijskXG3lI2ExEw5RbM/fZ3D66vuRr8
 g1yei3OIOaFZdZ6sHxZqyiHp7uLaRc86llgWW9QOORneOGiEK2WAkIRd4xAB9RzQPMiMLKD
 CQzjyXA4YD2khqx69fzohiU1ScnQl//qb4MZB7mZqwuHYsnFjTgjWAmPoSouOvUt//3eu+s
 a3rOm3/aRUyxcA/3yIW1YsdVA/JM05gwZE5dRvzGzut1jsU/hNYU83KQpZ6wEv61Lg17ozG
 Mmn2lHwXkyAChrk39xrdlE1QFZFDgDgxtO6NZCYhOUIrePfGMVUqKg3v1uXA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241052

Hi Mathieu,

On Wed, 2026-07-15 at 15:50 +0200, Mathieu Dubois-Briand wrote:
> On Wed Jul 15, 2026 at 1:37 PM CEST, Mathieu Dubois-Briand wrote:
>=20
> >=20
> > Hi Taruntej,
> >=20
> > Thanks for your patch.
> >=20
> >=20
> > > +LICENSE =3D "MPL-2.0 | Apache-2.0"
> > > +
> >=20
> >=20
> > This should be "Apache-2.0 OR MPL-2.0". You should get a warning about
> > it during the build:
> >=20
> > WARNING: /tmp/devtoolqa93fsj3gg/core-copy/meta/recipes-multimedia/gstre=
amer/gstreamer1.0-plugins-rs_0.15.3.bb: gstreamer1.0-plugins-rs: LICENSE is=
 using an old syntax and should be upgraded to: "Apache-2.0 OR MPL-2.0"
> >=20
> > Thanks,
> > Mathieu
>=20
>=20
> Sorry, this comes from Joshua series and is not merged so far. We will =
=20
> probably handle the fix on our side.
>=20
> No action needed on your side so far.

Thanks for update, the patch is in still in "Changes Requested" state thoug=
h. Just want to check if that is expected.

Thanks,
Tarun

