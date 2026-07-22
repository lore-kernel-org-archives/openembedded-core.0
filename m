Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3188EC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 19:51:23 +0000 (UTC)
Received: from mailer165.gate185.sl.smtp.com (mailer165.gate185.sl.smtp.com [192.40.185.165])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2374.1784733231836461314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 08:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=gn0ziC4T;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=oOgTWqS1;
 spf=pass (domain: centricular.com, ip: 192.40.185.165, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.86] (unknown [10.138.12.92])
	by mtl-mta02-out1 (Halon) with ESMTP
	id b8aa4c87-d904-479e-838b-c0a9ccf30c43;
	Wed, 22 Jul 2026 15:13:50 +0000 (UTC)
Received: Received from 10.138.12.40 by Caffeine (s0-aws-app-swarm-manager-2)
 with SMTP id cd3cd236-17ef-4d78-a22a-797748705eb0  for
 openembedded-core@lists.openembedded.org;
  Wed, 22 Jul 2026 15:13:14 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app-mta-in-1 (Halon) with ESMTPSA
	id cd3cd236-17ef-4d78-a22a-797748705eb0;
	Wed, 22 Jul 2026 15:13:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B2DA29CB0A;
	Wed, 22 Jul 2026 17:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1784733192;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Ko0+Usyb/V4Glef5bR8DgP6Ei6/lUejVfl9fo1/fdr0=;
	b=gn0ziC4TLrC2GDctXlROrYOU+V6u/wegL4jxBk+j9qqx9ftN5X8mnbyzkchzxJaVHz27C7
	WZioKAnNXu2xpbHMxTqBaXqTXGPTmEqLLCXU7wEr+Rw0kIqVoj1zRFqHWOLWu4o5HY4VAw
	ypjmeqxZIhYfj90FZbj0P0ogdukDCKTgwKuLWHykXJq0x46rW4MWEjiVgVDx0Ox3Sc2G3r
	/8xpmTYUuIuxG4UxJbC21bByInTmOZ6sx1sUie4Ml38/Xn37ADci9a/tifhTJfMtdvC1Ul
	5oXjC8jRmDCGO3mesmAyM0Ea8Fj7hARrIal8KHT0VHlhG7Krxp1V/R+kUEqOrA==
Message-ID: <613be9d21a4a0f6fbec1c71aeca3a5874fbe4e60.camel@centricular.com>
Subject: Re: [OE-core] [PATCH v5 2/2] gstreamer1.0-plugins-rs: add new package
From: Taruntej Kanakamalla <tarun@centricular.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org
Cc: sebastian@centricular.com, nirbheek@centricular.com, jan@centricular.com
Date: Wed, 22 Jul 2026 20:43:07 +0530
In-Reply-To: <DK54RIOEU340.33ALWQ7AGPKEJ@bootlin.com>
References: <20260707081701.1525114-1-tarun@centricular.com>
	 <20260714105541.2812170-1-tarun@centricular.com>
	 <20260714105541.2812170-2-tarun@centricular.com>
	 <DJZ45A2IL6XB.172T8CGXQUIPH@bootlin.com>
	 <DJZ6ZB5JTYSV.ZUCFUNHW05GN@bootlin.com>
	 <d460480501e19d59ac2a7bec0f15020692f0b855.camel@centricular.com>
	 <DJZTA3XYAG4T.1DDQE4ASD7JPI@bootlin.com>
	 <4d95a8c8b8bcb0e1f5e01576466301f69eb2aa9b.camel@centricular.com>
	 <DK54RIOEU340.33ALWQ7AGPKEJ@bootlin.com>
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: cd3cd236-17ef-4d78-a22a-797748705eb0
X-SMTPCOM-Message-ID: 8b5c364c-7e93-420e-ab35-4dcf75ab6a4a
X-SMTPCOM-Payload: 
 S1vVEWMmn3y-PhnDISf34mFU1W5qP8RoRHxq50qaGZUCWs5dwgteR8e7fnA1U2mGh3hZWyW91wedD1FeNNTGDrkjd60Vnzc80XIMh637jqYdw6GTL4LjRYOJt3xvNASzdSY8pO2CB8q1W4mCt_C5nNfcsOnD1SEylpW8fXG0Qw2UKO875jernfu_h932tYfjRRpXiHL3EpCVLz6nu2cB4A==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=8b5c364c-7e93-420e-ab35-4dcf75ab6a4a_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=8b5c364c-7e93-420e-ab35-4dcf75ab6a4a&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1784733221;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : mime-version :
 list-unsubscribe : list-unsubscribe-post : subject : from : to : cc :
 date; bh=ogD5k70feQWop7q2favmeY8I03nqFTXjXlfS1aXVW5U=;
 b=oOgTWqS1uXBexf6i7b6ESYect+T6DhJID2i5njL1TiaqdIQehWKhthOZ1UwYRxHY997QF
 aypW5k0RkKt7dS4ZzehF8gYFFcabSvyoxnd4aCk9/PAEvdSZBAPT63qjzs0YXDgJPlKaS9F
 HAZkyJ5sGxk2y4GO585AIlc0rD1G9FWfdOEc0bb4EiP4G0gYYnOqOz0ZYe05t5gaRJFxJYh
 0Diff1UNCSJ/gsdXfJ/lg7nBbqa0Fgwr7OaflEZvgquNmKrBo88T8qsI0kpseJpoTxlVsgQ
 KgVq5Qu+79YyixgVzXjU8JMFpCjLTzjISL1RLsN1acwFDs3PuTDiueexoiJQ==
Content-Type: multipart/alternative; boundary="=-mbjDD9Rgk7J4P/LCWVu2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 19:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241740

--=-mbjDD9Rgk7J4P/LCWVu2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

On Wed, 2026-07-22 at 15:22 +0200, Mathieu Dubois-Briand wrote:

> We do have issues with freedesktop gits, I hope to discuss this
> during
> the next patch review meeting. No change needed on your side so far.

Thanks for the confirmation.

Regards,
Tarun

--=-mbjDD9Rgk7J4P/LCWVu2
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
</style></head><body><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0,=
 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-var=
iant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; widows: 2; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0,=
 0.4); -webkit-text-stroke-width: 0px; text-decoration-line: none; text-dec=
oration-thickness: auto; text-decoration-style: solid;">Hi Mathieu,</div><d=
iv style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &q=
uot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: normal; widows: 2; word-spac=
ing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-str=
oke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto=
; text-decoration-style: solid;"><span></span></div><div style=3D"caret-col=
or: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot=
;; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-=
spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-tap=
-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-=
decoration-line: none; text-decoration-thickness: auto; text-decoration-sty=
le: solid;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0=
, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; widows: 2; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0=
, 0.4); -webkit-text-stroke-width: 0px; text-decoration-line: none; text-de=
coration-thickness: auto; text-decoration-style: solid;">On Wed, 2026-07-22=
 at 15:22 +0200, Mathieu Dubois-Briand wrote:</div><div style=3D"caret-colo=
r: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;=
; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: start; text-transform: none; white-=
space: normal; widows: 2; word-spacing: 0px; -webkit-tap-highlight-color: r=
gba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration-line: no=
ne; text-decoration-thickness: auto; text-decoration-style: solid;"><br></d=
iv><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #7=
29fcf solid;padding-left:1ex"><div>We do have issues with freedesktop gits,=
 I hope to discuss this during<br></div><div>the next patch review meeting.=
 No change needed on your side so far.</div></blockquote><div style=3D"care=
t-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans=
&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webki=
t-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; =
text-decoration-line: none; text-decoration-thickness: auto; text-decoratio=
n-style: solid;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans:=
 2; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; widows: 2; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0,=
 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration-line: none; te=
xt-decoration-thickness: auto; text-decoration-style: solid;">Thanks for th=
e confirmation.<br><br>Regards,<br>Tarun</div></body></html>

--=-mbjDD9Rgk7J4P/LCWVu2--

