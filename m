Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35294E706F0
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 08:34:08 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.11374.1695285247398647567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 01:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout01.t-online.de (Postfix) with SMTP id A4B74DAB7;
	Thu, 21 Sep 2023 10:34:05 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.174.95]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjF8P-1x98u80; Thu, 21 Sep 2023 10:34:05 +0200
Date: Thu, 21 Sep 2023 10:34:07 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <VGUB1S.EQNLFG4U297D@t-online.de>
In-Reply-To: <f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com>
References: <20230921064727.1260198-1-kai.kang@windriver.com>
	<CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
	<f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-kp7SXL6e52EELc8tJqDF"
X-TOI-EXPURGATEID: 150726::1695285245-D27EEFD5-2B484360/0/0 CLEAN NORMAL
X-TOI-MSGID: 8d9469af-5b0d-4c3a-bd44-3e5f85fed7b2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187981

--=-kp7SXL6e52EELc8tJqDF
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 21 2023 at 04:16:42 PM +08:00:00, Kai Kang 
<kai.kang@eng.windriver.com> wrote:
> Yes, it is caused by the update. I'll check the root cause.

Maybe it is somehow related to ${prefix}/share and replacing by 
${datadir} would help?

This fixed an issue I had with gnome-themes-extra
<https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=ab1f6ee8bf4835fabdf02cb0e30b20e4ff11e5fb>


--=-kp7SXL6e52EELc8tJqDF
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Sep 21 2023 at 04:16:42 PM +08:00:00, Kai Kang &lt;kai.kang@eng.windriver.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Yes, it is caused by the update. I'll check the root cause.</div></blockquote><div><br></div><div>Maybe it is somehow related to ${prefix}/share and replacing by ${datadir} would help?</div><div><br></div><div>This fixed an issue I had with gnome-themes-extra</div><div><a href="https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=ab1f6ee8bf4835fabdf02cb0e30b20e4ff11e5fb">https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=ab1f6ee8bf4835fabdf02cb0e30b20e4ff11e5fb</a></div></div>
--=-kp7SXL6e52EELc8tJqDF--


