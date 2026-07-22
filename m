Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDB8C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 13:12:05 +0000 (UTC)
Received: from mailer73.gate185.sl.smtp.com (mailer73.gate185.sl.smtp.com [192.40.185.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47807.1784725839278712876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 06:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=Kaxui0LH;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=lYYMLuvb;
 spf=pass (domain: centricular.com, ip: 192.40.185.73, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.245] (unknown [10.138.12.203])
	by mtl-mta03-out2 (Halon) with ESMTP
	id 97ca30dc-7654-4db9-8d7a-48c6b78de490;
	Wed, 22 Jul 2026 12:50:36 +0000 (UTC)
Received: Received from 10.138.12.155 by Caffeine
 (s0-aws-app2-swarm-manager-3) with SMTP id
 f3343222-a425-4560-a290-4255439ac04a  for
 openembedded-core@lists.openembedded.org;
  Wed, 22 Jul 2026 12:50:15 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app2-mta-in-1 (Halon) with ESMTPSA
	id f3343222-a425-4560-a290-4255439ac04a;
	Wed, 22 Jul 2026 12:50:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B4FF89CB0A;
	Wed, 22 Jul 2026 14:50:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1784724613;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=BRTy8QyhetZUN1E9Wk7YwDgnITTAv7V6H9yxq2LPs3s=;
	b=Kaxui0LHEFXH1TWGOINgS+/NqkzOIvc581/qd3BpFKMZkVUtm+V501VELEa95X8Yt7dQmn
	eipkme1BM9Ijio+dRj7x+sQNh4phb6bOij6p+0AaUV4+kZd6EfLvZDefPEna4medWVD+r9
	N4qfXPHxb9c0FoAAr5/+TWszttiL8MEe8T/Uh6DhAiAo1DF4Wnn/ZkmGul0rw6gdWT6R00
	RrfsO73jhn77HH830lSWi/uGTp95TVk6Dur3W6KDw0b+s6clXux4mxMDaNiGGqCd7r32vW
	q2esiViRWXwt52oa64T2/fsqThJkSRQAlaFqE0+3WVBQoIHC//mgAxJcPVeSvQ==
Message-ID: <4d95a8c8b8bcb0e1f5e01576466301f69eb2aa9b.camel@centricular.com>
Subject: Re: [OE-core] [PATCH v5 2/2] gstreamer1.0-plugins-rs: add new package
From: Taruntej Kanakamalla <tarun@centricular.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Richard
 Purdie	 <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Cc: sebastian@centricular.com, nirbheek@centricular.com, jan@centricular.com
Date: Wed, 22 Jul 2026 18:20:07 +0530
In-Reply-To: <DJZTA3XYAG4T.1DDQE4ASD7JPI@bootlin.com>
References: <20260707081701.1525114-1-tarun@centricular.com>
	 <20260714105541.2812170-1-tarun@centricular.com>
	 <20260714105541.2812170-2-tarun@centricular.com>
	 <DJZ45A2IL6XB.172T8CGXQUIPH@bootlin.com>
	 <DJZ6ZB5JTYSV.ZUCFUNHW05GN@bootlin.com>
	 <d460480501e19d59ac2a7bec0f15020692f0b855.camel@centricular.com>
	 <DJZTA3XYAG4T.1DDQE4ASD7JPI@bootlin.com>
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: f3343222-a425-4560-a290-4255439ac04a
X-SMTPCOM-Message-ID: 5bf2f0ac-f736-4e27-8b17-bd56ce3b09f1
X-SMTPCOM-Payload: 
 8syhFOBumtRqmRVPUaRfVA_EFkeqWa0KFeXYpwNQRvMeAmiXjD4O9rOVeb-cjhsJ_T_z_VOfX1ixa29P79ITV-FnTC8MCnzSQT-xUkEOBhICj62pZq0dgOJbID7F1aoAbcHredx4DkhvxIY1Uz5A65dgREXEuxYIFA3GWzzZdcwB1peBy23hFP3y8en8SzSxk9H4H6dTJU5csx68kFOcHg==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=5bf2f0ac-f736-4e27-8b17-bd56ce3b09f1_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=5bf2f0ac-f736-4e27-8b17-bd56ce3b09f1&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1784724633;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : mime-version :
 list-unsubscribe : list-unsubscribe-post : subject : from : to : cc :
 date; bh=wKhhrbMwKD360/+ECGK02oh8yIOJj8ysshHgt+RUojE=;
 b=lYYMLuvbB8Js2DfPGbUi1+DQ0hW6eY8ydelrvGUACks/b/nEwan+dmmuZNT3Cz5vuZ/WF
 Wj32kjX+T3S7AHIw9aYtnCGIdh46IoqPceklbuCv2jD97+OMNjUPWZmO8wTf4Fh1z0/Ejc9
 vJ38qoybx1/tJUVO4aT6kWBXVMwaqwj0BvZyVWFgT8wocbblKLEtE5Qa++IW2S4xw4PvZgB
 vnBLnZpE9Br0tUQmko1Iq/4hvixcO16qvSOG+AxcN0X+9NePC8Y0cjZdzFR7fCvludOh71/
 kgJnXbTzVfcTxmMUbVw8irXm1p2ZQxczooi+9h9VmCZBzidaZ25Ztxezp2Sw==
Content-Type: multipart/alternative; boundary="=-RGynrJQyKkBOidA+hOot"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241689

--=-RGynrJQyKkBOidA+hOot
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,Richard,

I noticed the first patch in this series "cargo_c.bbclass: pass --
libdir to cargo cinstall" got merged to the master branch, but this
patch ("gstreamer1.0-plugins-rs: add new package") did not.
So just wanted to check with you if the review is still in progress or
if some action needs to be taken by me.

Thanks,
Tarun

--=-RGynrJQyKkBOidA+hOot
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
</style></head><body><div>Hi Mathieu,Richard,</div><div><span></span></div>=
<div><br>I noticed the first patch in this series "cargo_c.bbclass: pass --=
libdir to cargo cinstall" got merged to the master branch, but this patch (=
"gstreamer1.0-plugins-rs: add new package") did not.<br>So just wanted to c=
heck with you if the review is still in progress or if some action needs to=
 be taken by me.<br><br>Thanks,</div><div>Tarun</div></body></html>

--=-RGynrJQyKkBOidA+hOot--

