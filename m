Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11432E7D0C4
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 03:23:25 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.13834.1695353002556781854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 20:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout11.t-online.de (Postfix) with SMTP id 95D5922956;
	Fri, 22 Sep 2023 05:23:20 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.238.241]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjWl8-0hRj600; Fri, 22 Sep 2023 05:23:14 +0200
Date: Fri, 22 Sep 2023 05:23:09 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, Kai Kang <kai.kang@eng.windriver.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <LQAD1S.UGTSIS239E9B@t-online.de>
In-Reply-To: <CANNYZj-7ZFnGg914eZ3rVd5TcpNwdPADgY8Ph5-A=fftsYr3AA@mail.gmail.com>
References: <20230921064727.1260198-1-kai.kang@windriver.com>
	<CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
	<f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com>
	<VGUB1S.EQNLFG4U297D@t-online.de>
	<CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com>
	<3SXB1S.VJD0PU0SDSPS1@t-online.de>
	<CANNYZj_zWqLUdoO7PNWJU139y4T6icZeaFOfxUFVK1D-PzihBQ@mail.gmail.com>
	<V3DC1S.GMOO9XQMVAE72@t-online.de>
	<CANNYZj-JBgC0NQGcjhV_h-EETBp0i59AhvpGVc8fHyxvU3bbxg@mail.gmail.com>
	<EPEC1S.ET9N9UD2HEU43@t-online.de>
	<CANNYZj9qZX1yH4aH922Xb8fiM2U_Q57R8UQJiVfS73xn1BvJ3A@mail.gmail.com>
	<BDRC1S.9ON3267ENA9Q@t-online.de>
	<CANNYZj-7ZFnGg914eZ3rVd5TcpNwdPADgY8Ph5-A=fftsYr3AA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-yiv+EqZ1wC+0O0gC4X0h"
X-TOI-EXPURGATEID: 150726::1695352994-26196295-C5872753/0/0 CLEAN NORMAL
X-TOI-MSGID: 3ca79bff-f9de-4301-a090-55765e89e093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 03:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188035

--=-yiv+EqZ1wC+0O0gC4X0h
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 21 2023 at 10:35:13 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Please read again what I said about task signatures because the
> problem with allarch compatibility is there.

I read it and also looked at the signatures. But it didn't tell me as 
much as it would have told you. At least it pointed me in the right 
direction. But I needed more research to get a handle on it. In my 
case, it was a combination of two problems. In the case of the original 
recipe, it's just the first one.

- allarch must be last in inherit
  'inherit gnomebase gtk-icon-cache allarch'

- you should not set GTK_IC = "4", as I had previously assumed




--=-yiv+EqZ1wC+0O0gC4X0h
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Sep 21 2023 at 10:35:13 PM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Please read again what I said about task signatures because the
problem with allarch compatibility is there.</div></blockquote><div><br></div><div><div>I read it and also looked at the signatures. But it didn't tell me as much as it would have told you. At least it pointed me in the right direction. But I needed more research to get a handle on it. In my case, it was a combination of two problems. In the case of the original recipe, it's just the first one.</div><div><br></div><div>- allarch must be last in inherit</div><div>&nbsp; 'inherit gnomebase gtk-icon-cache allarch'</div><div><br></div><div>- you should not set GTK_IC = "4", as I had previously assumed</div></div><div><br></div><div><br></div></div>
--=-yiv+EqZ1wC+0O0gC4X0h--


