Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66FFC54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 17:33:33 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.42543.1710092010783115745
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 10:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout11.t-online.de (Postfix) with SMTP id 8C7291D06D;
	Sun, 10 Mar 2024 18:33:28 +0100 (CET)
Received: from [192.168.178.67] ([84.154.166.16]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjN37-3BKn2G0; Sun, 10 Mar 2024 18:33:25 +0100
Date: Sun, 10 Mar 2024 18:33:48 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH] gtk4: update 4.12.5 -> 4.13.9
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <CG75AS.OR5DO8OBFJKL2@t-online.de>
In-Reply-To: <CANNYZj-KYLo3jdXj8GeQJjDU9sEEXvgO9KhmtUKBjcQnNHyRKA@mail.gmail.com>
References: <17BB704B3D5D1758.5850@lists.openembedded.org>
	<R915AS.S2SD7P4CMM6X2@t-online.de>
	<54530dfa95ef0ca744fde5ab2b83bb402e4a50fd.camel@linuxfoundation.org>
	<17BB725268800180.5850@lists.openembedded.org>
	<G165AS.UHPXD5QHY4K91@t-online.de>
	<CANNYZj-KYLo3jdXj8GeQJjDU9sEEXvgO9KhmtUKBjcQnNHyRKA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-O9f9gN3XstlEslfIgUud"
X-TOI-EXPURGATEID: 150726::1710092005-87FFC968-39E777EC/0/0 CLEAN NORMAL
X-TOI-MSGID: 89c7b868-6aeb-4593-90fa-fbfaa8c7d97f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 17:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196905

--=-O9f9gN3XstlEslfIgUud
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Mar 10 2024 at 10:29:32 AM -07:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> I think you can first add the needed file with a separate DIY patch?

Or maybe convert the recipe to use git? Like this we wouldn't need to 
patch at all:
<https://gitlab.gnome.org/GNOME/vala/-/commits/0.56/?ref_type=heads>


--=-O9f9gN3XstlEslfIgUud
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Mar 10 2024 at 10:29:32 AM -07:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I think you can first add the needed file with a separate DIY patch?</div></blockquote><div><br></div><div>Or maybe convert the recipe to use git? Like this we wouldn't need to patch at all:</div><div><a href="https://gitlab.gnome.org/GNOME/vala/-/commits/0.56/?ref_type=heads">https://gitlab.gnome.org/GNOME/vala/-/commits/0.56/?ref_type=heads</a></div></div>
--=-O9f9gN3XstlEslfIgUud--


