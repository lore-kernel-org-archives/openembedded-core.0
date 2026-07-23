Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73125C531F7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 15:31:22 +0000 (UTC)
Received: from mailer55.gate185.sl.smtp.com (mailer55.gate185.sl.smtp.com [192.40.185.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25739.1784819357486479122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 08:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=fjpeKvzN;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=V5lsRU50;
 spf=pass (domain: centricular.com, ip: 192.40.185.55, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.94] (unknown [10.138.12.245])
	by mtl-mta01-out1 (Halon) with ESMTP
	id c5200cf4-a209-483d-885e-8531541f4a2e;
	Thu, 23 Jul 2026 15:09:16 +0000 (UTC)
Received: Received from 10.138.12.169 by Caffeine
 (s0-aws-app2-swarm-manager-2) with SMTP id
 1515d427-2cac-4b3f-8793-52aef5888ad0  for
 openembedded-core@lists.openembedded.org;
  Thu, 23 Jul 2026 15:08:35 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app2-mta-in-2 (Halon) with ESMTPSA
	id 1515d427-2cac-4b3f-8793-52aef5888ad0;
	Thu, 23 Jul 2026 15:08:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 141BF9CADA;
	Thu, 23 Jul 2026 17:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1784819314;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=CJPE+hdcN0DE5tRG0RFLyotx5B3V7eEqS3KKHQAFs0w=;
	b=fjpeKvzNXap6PDII5huvqvFQwuPKP9C72F7TeShPfiG/er4UjcZyCOGuPiIg98C4jdO7hc
	wjsYdUCLMTzPEj8RjNpURk1zWrC9cUadxknXYkO2Hd+09o08C1cbEJUJ88bnO1LJeCA2q2
	24nAoo5YQc4EgV5PpOMTtiY54bjZrNr7wmWPgfsRIJgT48GdO0brX6aoAHJjoWKcuUO/wu
	kzZOHDpsXWEHbPLMB+luR+DgWXybfRs7oFgGxZYLjTlBBfai5fFM1XUOu1V+cNQAtVIryA
	o56gO02sNfZ9ivUhPE+ETVgF3SbGx7FZk9tskaSTBjnrE+S65cpB8k1R8WQ6iQ==
Message-ID: <9b05bc4c4c0ae9e817111347a473a268d3fd3584.camel@centricular.com>
Subject: Re: [OE-core] [PATCH v5 2/2] gstreamer1.0-plugins-rs: add new package
From: Taruntej Kanakamalla <tarun@centricular.com>
To: Yoann Congal <yoann.congal@smile.fr>, Mathieu Dubois-Briand	
 <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: sebastian@centricular.com, nirbheek@centricular.com, jan@centricular.com
Date: Thu, 23 Jul 2026 20:38:28 +0530
In-Reply-To: <DK61927PZM4C.2UUP8BSKKC6NY@smile.fr>
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
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: 1515d427-2cac-4b3f-8793-52aef5888ad0
X-SMTPCOM-Message-ID: 95fc9d1d-73f8-4810-9ee2-0c1f41dad489
X-SMTPCOM-Payload: 
 Z-gonutvV3auiYeQnDm2qqvzHIsnKE9y0HgXHDzEzDHHCKwyHNIJkHZ6pBjWBUJI30QoHL-_m4AiwAzR023T8RlPdDdcU1cKAHIyEwwDnR0_uYdzPfiY0FbojG8H0fgcJr7xUzbWJ0L8cyBdTxy8TiGySR179gvGNVavR9X1o27cjCS-JEPxG7Gxc2UAGogu-ixW091V2KJxDO6YNY0JoQ==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=95fc9d1d-73f8-4810-9ee2-0c1f41dad489_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=95fc9d1d-73f8-4810-9ee2-0c1f41dad489&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1784819338;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : mime-version :
 list-unsubscribe : list-unsubscribe-post : subject : from : to : cc :
 date; bh=jLK7gXAfOAMMx66lf9tZZo0C68guSk/G8299UuLHnBc=;
 b=V5lsRU50k3cPlR7QWCh1QWbL4SvR5lU86f1TtMW8db+B6wxjZcnVuX6Z1PW8LiC89Dmtl
 OCzkf7uI70V3xKF1Yu6oBO2lgara6qqGkfakoBO3EwbPlJ/7D474RlouFRubWZH+Mtkcvfm
 Vpl+6KbnRZl4HJZuHslW7Bm+RWExeUDngLBqpuJJSVW/LDStYbCNYj+S45IA492guaI6g/+
 bSnGXuRwcVEqqCTJ05s+JgEW3Pmw+WtWRe5hCdkZPTzlF3Y8356azmdEgTh0Wc8H8ud+Psz
 spmk8ZlX3SqNUc+S6UF9pkFH+VtUVp84PawldTimZmdFR+G3Uv2ToZEsl7CA==
Content-Type: multipart/alternative; boundary="=-BZ5Nn+GIfXTw2+e8nWqx"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 15:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241857

--=-BZ5Nn+GIfXTw2+e8nWqx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

On Thu, 2026-07-23 at 16:50 +0200, Yoann Congal wrote:
> On Wed Jul 22, 2026 at 5:13 PM CEST, Taruntej Kanakamalla via
> lists.openembedded.org wrote:
> > Hi Mathieu,
> >=20
> > On Wed, 2026-07-22 at 15:22 +0200, Mathieu Dubois-Briand wrote:
> >=20
> > > We do have issues with freedesktop gits, I hope to discuss this
> > > during
> > > the next patch review meeting. No change needed on your side so
> > > far.
> >=20
> > Thanks for the confirmation.
> >=20
> > Regards,
> > Tarun
>=20
> Hello,
>=20
> "issues with freedesktop gits" were a red-herring.
>=20
> The root cause is that the submitted recipe gstreamer1.0-plugins-rs
> is
> "floating": ie has not SRCREV value to anchor it to a particular git
> commit.
>=20
> Please send a new version with the appropriate SRCREV value.
>=20
> Thanks!

Thanks for spotting it, I will send a new version shortly.

Now while building after pulling the latest master, I notice the
warnings Mathieu previously mentioned about using old syntax for
LICENSE for this recipe as well multiple others.

> gstreamer1.0-plugins-rs: LICENSE is using an old syntax and should be
upgraded to: "Apache-2.0 OR MPL-2.0"

Should I make the LICENSE format change as well in the new version?


--=-BZ5Nn+GIfXTw2+e8nWqx
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
 space; line-break: after-white-space;"><div>Hi Yoann,</div><div><span></sp=
an></div><div><br></div><div>On Thu, 2026-07-23 at 16:50 +0200, Yoann Conga=
l wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex"><div>On Wed Jul 22, 2026 at 5:13 P=
M CEST, Taruntej Kanakamalla via lists.openembedded.org wrote:<br></div><bl=
ockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf =
solid;padding-left:1ex"><div>Hi Mathieu,<br></div><div><br></div><div>On We=
d, 2026-07-22 at 15:22 +0200, Mathieu Dubois-Briand wrote:<br></div><div><b=
r></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2=
px #729fcf solid;padding-left:1ex"><div>We do have issues with freedesktop =
gits, I hope to discuss this<br></div><div>during<br></div><div>the next pa=
tch review meeting. No change needed on your side so far.<br></div></blockq=
uote><div><br></div><div>Thanks for the confirmation.<br></div><div><br></d=
iv><div>Regards,<br></div><div>Tarun<br></div></blockquote><div><br></div><=
div>Hello,<br></div><div><br></div><div>"issues with freedesktop gits" were=
 a red-herring.<br></div><div><br></div><div>The root cause is that the sub=
mitted recipe gstreamer1.0-plugins-rs is<br></div><div>"floating": ie has n=
ot SRCREV value to anchor it to a particular git<br></div><div>commit.<br><=
/div><div><br></div><div>Please send a new version with the appropriate SRC=
REV value.<br></div><div><br></div><div>Thanks!<br></div></blockquote><div>=
<br></div><div>Thanks for spotting it, I will send a new version shortly.</=
div><div><br>Now while building after pulling the latest master, I notice t=
he warnings Mathieu previously mentioned about using old syntax for LICENSE=
 for this recipe as well multiple others.</div><div><br></div><div>&gt; gst=
reamer1.0-plugins-rs: LICENSE is using an old syntax and should be upgraded=
 to: "Apache-2.0 OR MPL-2.0"</div><div><br>Should I make the LICENSE format=
 change as well in the new version?<br><br></div><blockquote type=3D"cite" =
style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"=
></blockquote></body></html>

--=-BZ5Nn+GIfXTw2+e8nWqx--

