Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D74CD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 13:06:21 +0000 (UTC)
Received: from mailer35.gate185.sl.smtp.com (mailer35.gate185.sl.smtp.com [192.40.185.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2121.1778657126946682277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 00:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=uTQaCjqE;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=RAfMvZza;
 spf=pass (domain: centricular.com, ip: 192.40.185.35, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.253] (unknown [10.138.12.176])
	by mtl-mta01-out1 (Halon) with ESMTP
	id 67060f88-59ec-4016-9f45-7ab40715e7cf;
	Wed, 13 May 2026 07:25:26 +0000 (UTC)
Received: Received from 10.138.12.155 by Caffeine
 (s0-aws-app2-swarm-manager-4) with SMTP id
 d7530e83-7e96-4d78-9dca-48b9a3678ea0  for
 openembedded-core@lists.openembedded.org;
  Wed, 13 May 2026 07:25:16 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app2-mta-in-1 (Halon) with ESMTPSA
	id d7530e83-7e96-4d78-9dca-48b9a3678ea0;
	Wed, 13 May 2026 07:25:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1DB849CB1B;
	Wed, 13 May 2026 09:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1778657115;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=wmGhCiU6I6PIuL3to2iCcHRdS+8n4bqiDBSt6ywM3l0=;
	b=uTQaCjqESRxSabaWKc+4aKqfbPLsfPq24bKNANMaIKJtD5yBq2Ex9cLKsYqd1di1W3iUhl
	VhF2XuMtGzOIm8hw0gJIxuKYQsJFd/PrOGoZfo+Wy1mf+tusGrvTGO8H6439HmXGZ093pG
	JVgzWR1HyDo43SiiYXPBcLgqNFFXmqaQgkI9vpGii8Zz04i3NLjqd0e+G31kmfO1lShxj1
	/trIv9dQJL9hujVX2r4FFJ8xVCfjrj+jIgOHNij7kf6grUmYqsQ0Fe8xIGLodykNoz2mvk
	ackIwEvjhKYHKS8QVNQhxPE6Vc1Hn4x+MQEl9RrU+E0z11aIo/nkzOisbKPxrw==
Message-ID: <9aa88cfb4590219b93894806744c6de5bd5b0481.camel@centricular.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-rs: add new package
From: Taruntej Kanakamalla <tarun@centricular.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "sebastian@centricular.com" <sebastian@centricular.com>,
 "nirbheek@centricular.com"
	 <nirbheek@centricular.com>, tarun@centricular.com
Date: Wed, 13 May 2026 12:55:08 +0530
In-Reply-To: 
 <DB5PR02MB10213B7E2D21553836D68AAE2EF392@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260511133450.50595-1-tarun@centricular.com>
	 <DB5PR02MB10213B7E2D21553836D68AAE2EF392@DB5PR02MB10213.eurprd02.prod.outlook.com>
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44app2) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: d7530e83-7e96-4d78-9dca-48b9a3678ea0
X-SMTPCOM-Message-ID: 0c66b7cd-b050-4ebe-8157-75cee7f34407
X-SMTPCOM-Payload: 
 2FcvVUUf4VQs5eEMja2Nl4DZwnjwvQlS1rwIiJDdW51rLNAtilcbtMa6yZYrk0iL6Pn0vw1oaAWwZ8X7hlPMPUAzcGkPNziCs3FF4YrVe2j3OLFzpDsBd20sDldmmUkTtzjPOjGZD-f6a6sMMfoILHB3fxK7hR12F4E4AN5gFWap8ZKZh6uqnEfEkfpv0KhZ23TtraC4MpbCMy0_1mlC6g==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=0c66b7cd-b050-4ebe-8157-75cee7f34407_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=0c66b7cd-b050-4ebe-8157-75cee7f34407&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1778657120;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : mime-version :
 list-unsubscribe : list-unsubscribe-post : subject : from : to : cc :
 date; bh=v71oBe2ycZ2N9Do6DP1owxlylhLc0OtVC5vFQp1Opps=;
 b=RAfMvZzatRtA5yN4HvELPahthC5ugx9umICpOLAQzMOm2BPEvExIyOAhJvFyxIWvlqPAc
 8obEWVJjsmpNyNgOlWfIaAxFa4ZDyg5odVKWLslPHZPCOB8fCWIElkcYGTh71/l4N9LKvqN
 yBSjw37dDYHU5R2Y5e730FuFwA/vHaZ1yZ7P7gc3Vn18IUoiVzBd8WlrEmKhOkO5o3dQyU5
 3osOiBqfe93WzRFR+ZGnCYu1YJoPVmOovmagZJFlKuDIdMb2NoHR0UlW0Lj108T53IvwJyh
 uhhr+3Td0ictgYUC2zQDxyOB5owf7L9oNptnrLjtjOe2MJzjAAQzqM2Nl7lA==
Content-Type: multipart/alternative; boundary="=-2OsCGxwCNXSuC4mIEclI"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 13:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236974

--=-2OsCGxwCNXSuC4mIEclI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter

> AFAICT, there is no splitting of the individual plugins into separate
> packages as is done for the other GStreamer plugin recipes.
> Is this intentional?

Yes, there is no splitting into separate packages in this at the
moment. The gstreamer1.0-plugins-rs is=C2=A0considered as a single package
and it only depends on the PACKAGECONFIG options to include or strip
any particular plugin(s).

Thanks,
Tarun

--=-2OsCGxwCNXSuC4mIEclI
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
</style></head><body><div>Hi Peter</div><div><span></span></div><div><br></=
div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #=
729fcf solid;padding-left:1ex"><div>AFAICT, there is no splitting of the in=
dividual plugins into separate <br></div><div>packages as is done for the o=
ther GStreamer plugin recipes.<br></div><div>Is this intentional?</div></bl=
ockquote><div><br></div><div>Yes, there is no splitting into separate packa=
ges in this at the moment. The <span class=3D"codespan__pre-wrap"><code>gst=
reamer1.0-plugins-rs</code></span> is&nbsp;considered as a single package a=
nd it only depends on the <span class=3D"codespan__pre-wrap"><code>PACKAGEC=
ONFIG</code></span> options to include or strip any particular plugin(s).<b=
r><br>Thanks,<br>Tarun</div><blockquote type=3D"cite" style=3D"margin:0 0 0=
 .8ex; border-left:2px #729fcf solid;padding-left:1ex"></blockquote></body>=
</html>

--=-2OsCGxwCNXSuC4mIEclI--

