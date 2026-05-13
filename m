Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520AACD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 07:15:15 +0000 (UTC)
Received: from mailer192.gate185.sl.smtp.com (mailer192.gate185.sl.smtp.com [192.40.185.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2018.1778656473948614827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 00:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=PIcZkr2x;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=PDdIbLb/;
 spf=pass (domain: centricular.com, ip: 192.40.185.192, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.10] (unknown [10.138.12.203])
	by mtl-mta04-out1 (Halon) with ESMTP
	id 96d8c198-bbc1-44ce-8cee-3492b0ff40c2;
	Wed, 13 May 2026 07:14:31 +0000 (UTC)
Received: Received from 10.138.12.40 by Caffeine (s0-aws-app2-swarm-manager-3)
 with SMTP id 9efaae64-023f-4479-83d6-42286fecd50e  for
 openembedded-core@lists.openembedded.org;
  Wed, 13 May 2026 07:14:17 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app-mta-in-1 (Halon) with ESMTPSA
	id 9efaae64-023f-4479-83d6-42286fecd50e;
	Wed, 13 May 2026 07:14:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1EE4F9CB17;
	Wed, 13 May 2026 09:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1778656456;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=VnwgyTFmNkr82jw0CycbpI1dF67H12qKuTLfK4pIWC4=;
	b=PIcZkr2x05DRu1hOgTGllDZqNsOUmsaVuyUMXIN9gev4eJ00TcIABAY3umqoUuRNR9WFCR
	Kjq2NWm7cRNVEevzmJlTXZcSCiBpaBe6IumuVQxXqoLgTN34KAWm/rSkyAAYy6tzua5u1C
	BM5dezrQDLlGwxl8btFZhx8EoLGM/pqk0GZAwox1D0FKy/6iOTT1cg+JyzOqFlxoRylS9l
	hDwcsrbyEWccdePxAyVhvWAQK3nTkjWBXtF1LYKA6Xv+dM10D2hGDPJ9nvM16AekKgh2l/
	wCkQ2ppdGvYVgJogTkzCXGjpb5iuhofPwJjAx/gmwrAoryLFUFKvw950NSEntw==
Message-ID: <321abacadf3ff53a9c3f561c62f7bc37111d9fe6.camel@centricular.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-rs: add new package
From: Taruntej Kanakamalla <tarun@centricular.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org
Cc: sebastian@centricular.com, nirbheek@centricular.com
Date: Wed, 13 May 2026 12:44:13 +0530
In-Reply-To: <DIGMMXA709JT.2E77IPME1VZ0G@bootlin.com>
References: <20260511133450.50595-1-tarun@centricular.com>
	 <DIGMMXA709JT.2E77IPME1VZ0G@bootlin.com>
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44app2) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: 9efaae64-023f-4479-83d6-42286fecd50e
X-SMTPCOM-Message-ID: 8671786d-4d5e-4683-8f1b-f34c8186e05f
X-SMTPCOM-Payload: 
 e4Kl1lmJ7c2LFA0I_YJH0soXhK4sjxu1IH-9oeooAMWSM0FAGoE5bAJ5Za5F3MS-fWx_vYIgOXvutWeHhVWoJGM_KN4bYFB5V31XMTrD2OOkL9RNRZZNdJS9YvoB3NPOGLBxgRcrA2963jXuw2MmP-bHjgT0UTBuYfh6Q7AVr2qUL6MQInaQi4-7E8Qx4N8ucEznLaBKDRERH_b1rXgUWw==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=8671786d-4d5e-4683-8f1b-f34c8186e05f_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=8671786d-4d5e-4683-8f1b-f34c8186e05f&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1778656465;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : mime-version :
 list-unsubscribe : list-unsubscribe-post : subject : from : to : cc :
 date; bh=Vm3Rj3jpns4YgHdPBheueSkZa7mQqrEQLpEKyZxnd5I=;
 b=PDdIbLb/QWTS9/ot3RekmTHFcSrRbgMUdw4X7prYa9EiGMAwE3om6ddqWbdnVGNjuTNG3
 rZqcOGJpFGwdKnqp4qFW7VyAh+LSPR3txn4Au3qVmc5riD4NSDv7mEviOqaJxjsEgWhmilx
 ordY0a5nHAm6R3g+91arsEegv6s23DEt7N+mW232Jx3hSPJEGv84T3yDu0rnl2SYMvnShoE
 rq10j0f6XNrZgdna03bqGGm7y+PKL0GemfQ7S2vKV2UgRaFsDsJJquT2ZzSRZTWb1DF7qXj
 Lk6v9vLfkgLR2lx0zvyCWgP6bXE6VmWyQkigfUb1OhDsG80tK0baYB5HTkiw==
Content-Type: multipart/alternative; boundary="=-z0eNw/T7+hY9NnEVYhZb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 07:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236933

--=-z0eNw/T7+hY9NnEVYhZb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

> Having a PACKAGECONFIG depending on meta-openembedded is probably ok,
> but we can't have this in default PACKAGECONFIG values: oe-core has
> to
> be buildable stand-alone.

Thanks for the review, addressed this in the V2 patch

Thanks,
Tarun

--=-z0eNw/T7+hY9NnEVYhZb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode:=
 space; line-break: after-white-space;">Hi Mathieu,<br><br><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div>Having a PACKAGECONFIG depending on meta-openembedded is pr=
obably ok,<br></div><div>but we can't have this in default PACKAGECONFIG va=
lues: oe-core has to<br></div><div>be buildable stand-alone.<br></div></blo=
ckquote><div><br></div><div>Thanks for the review, addressed this in the V2=
 patch<br><br>Thanks,<br>Tarun</div><blockquote type=3D"cite" style=3D"marg=
in:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"></blockquote=
></body></html>

--=-z0eNw/T7+hY9NnEVYhZb--

