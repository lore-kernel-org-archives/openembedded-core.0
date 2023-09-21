Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7551E706FE
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 09:45:49 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.12209.1695289542870375309
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 02:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout05.t-online.de (Postfix) with SMTP id 2F7731086A;
	Thu, 21 Sep 2023 11:45:41 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.174.95]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjGFf-0AyIzo0; Thu, 21 Sep 2023 11:45:40 +0200
Date: Thu, 21 Sep 2023 11:45:39 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, Kai Kang <kai.kang@eng.windriver.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <3SXB1S.VJD0PU0SDSPS1@t-online.de>
In-Reply-To: <CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com>
References: <20230921064727.1260198-1-kai.kang@windriver.com>
	<CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
	<f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com>
	<VGUB1S.EQNLFG4U297D@t-online.de>
	<CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-qr9r7/ktshlU8wQ1GDIR"
X-TOI-EXPURGATEID: 150726::1695289540-1D19EA80-C3556B9F/0/0 CLEAN NORMAL
X-TOI-MSGID: 823fc749-216c-4d4e-b8d5-3aecac38a6e0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 09:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187984

--=-qr9r7/ktshlU8wQ1GDIR
Content-Type: text/plain; charset=us-ascii; format=flowed

GTKIC_VERSION = "4"
this line might be added to use gtk4 update-gtk-icon-cache ?

and probably also the DEPENDS line could be removed ?

On Thu, Sep 21 2023 at 10:40:49 AM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> On Thu, 21 Sept 2023 at 10:34, Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>>  Maybe it is somehow related to ${prefix}/share and replacing by 
>> ${datadir} would help?
>> 
>>  This fixed an issue I had with gnome-themes-extra
>>  
>> <https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=ab1f6ee8bf4835fabdf02cb0e30b20e4ff11e5fb>
> 
> Things diverge much earlier:
> -  'adwaita-icon-theme/do_write_config':
> 'cdb1f880efd08a498798793a1cbc51e48272a71b2ec48b71f263b7af9c8b8ca9',
> +  'adwaita-icon-theme/do_write_config':
> '690686d4d2721c21520f4736e3718e414f70366bea48b2df805b37a6a5193a1b',
> 
> Something in that task is contaminated by target-specific value.
> 
> Alex


--=-qr9r7/ktshlU8wQ1GDIR
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">GTKIC_VERSION = "4"<div>this line might be added to use gtk4 update-gtk-icon-cache ?</div><div><br></div><div>and probably also the DEPENDS line could be removed ?</div></div><div id="geary-quote" dir="auto"><br>On Thu, Sep 21 2023 at 10:40:49 AM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Thu, 21 Sept 2023 at 10:34, Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote> Maybe it is somehow related to ${prefix}/share and replacing by ${datadir} would help?

 This fixed an issue I had with gnome-themes-extra
 <a href="https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=ab1f6ee8bf4835fabdf02cb0e30b20e4ff11e5fb">https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=ab1f6ee8bf4835fabdf02cb0e30b20e4ff11e5fb</a>
</blockquote>
Things diverge much earlier:
-  'adwaita-icon-theme/do_write_config':
'cdb1f880efd08a498798793a1cbc51e48272a71b2ec48b71f263b7af9c8b8ca9',
+  'adwaita-icon-theme/do_write_config':
'690686d4d2721c21520f4736e3718e414f70366bea48b2df805b37a6a5193a1b',

Something in that task is contaminated by target-specific value.

Alex
</div></blockquote></div>
--=-qr9r7/ktshlU8wQ1GDIR--


