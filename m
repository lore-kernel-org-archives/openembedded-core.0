Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7351E71089
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 15:17:13 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.20798.1695309424892769179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 08:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id 3278541AF3;
	Thu, 21 Sep 2023 17:16:45 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.174.95]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjLQ3-2BVXGa0; Thu, 21 Sep 2023 17:16:44 +0200
Date: Thu, 21 Sep 2023 17:16:43 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, Kai Kang <kai.kang@eng.windriver.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <V3DC1S.GMOO9XQMVAE72@t-online.de>
In-Reply-To: <CANNYZj_zWqLUdoO7PNWJU139y4T6icZeaFOfxUFVK1D-PzihBQ@mail.gmail.com>
References: <20230921064727.1260198-1-kai.kang@windriver.com>
	<CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
	<f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com>
	<VGUB1S.EQNLFG4U297D@t-online.de>
	<CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com>
	<3SXB1S.VJD0PU0SDSPS1@t-online.de>
	<CANNYZj_zWqLUdoO7PNWJU139y4T6icZeaFOfxUFVK1D-PzihBQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-LrsB0IpcdHGwGnYLkQq+"
X-TOI-EXPURGATEID: 150726::1695309404-E0D82FD5-A27B59DD/0/0 CLEAN NORMAL
X-TOI-MSGID: f3f98489-9ada-49f0-8205-7f311e026207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188014

--=-LrsB0IpcdHGwGnYLkQq+
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 21 2023 at 11:51:03 AM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> If you'd like to help, it
> would be more productive to take the patch and build it locally to
> have first hand evidence of what is happening.

I try ;)

 Had a look at core-image-sato and all icons were still present as far 
as i can tell
And I tracked the issue down to this in allarch.bbclass
<https://git.yoctoproject.org/poky/tree/meta/classes-recipe/allarch.bbclass#n11>

Running addhandler allarch_package_arch_handler causes the diverge


--=-LrsB0IpcdHGwGnYLkQq+
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Sep 21 2023 at 11:51:03 AM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">If you'd like to help, it
would be more productive to take the patch and build it locally to
have first hand evidence of what is happening.</div></blockquote><div><br></div><div>I try ;)</div><div><br></div><div>&nbsp;Had a look at core-image-sato and all icons were still present as far as i can tell</div><div>And I tracked the issue down to this in allarch.bbclass</div><div><a href="https://git.yoctoproject.org/poky/tree/meta/classes-recipe/allarch.bbclass#n11">https://git.yoctoproject.org/poky/tree/meta/classes-recipe/allarch.bbclass#n11</a></div><div><br></div><div>Running addhandler allarch_package_arch_handler&nbsp;causes the diverge</div></div>
--=-LrsB0IpcdHGwGnYLkQq+--


