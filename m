Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D7ECAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 16:51:46 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.653.1758041496759823095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 09:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id AFCD1DEB5;
	Tue, 16 Sep 2025 18:51:34 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.44.62]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uyYty-06knU80; Tue, 16 Sep 2025 18:51:34 +0200
Date: Tue, 16 Sep 2025 18:51:29 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/2] introduce virtual/ffmpeg
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <THXO2T.ZRRK3LJE5VX61@t-online.de>
In-Reply-To: <CANNYZj964ZPDbN7HjhCCkxS5a9dPR7-uVewK9pcrpcZp9ZVGLw@mail.gmail.com>
References: <20250916155800.3860178-1-f_l_k@t-online.de>
	<CANNYZj964ZPDbN7HjhCCkxS5a9dPR7-uVewK9pcrpcZp9ZVGLw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-c5kcftGqpIK1RK3lbQAK"
X-TOI-EXPURGATEID: 150726::1758041494-7B7FD9B4-77D650D7/0/0 CLEAN NORMAL
X-TOI-MSGID: 12955782-9080-4489-8df9-eddfc0ba1187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 16:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223578

--=-c5kcftGqpIK1RK3lbQAK
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Sep 16 2025 at 18:26:32 +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> This needs more detail. What else would be providing virtual/ffmpeg,
> other than ffmpeg itself? Why the justification is talking about
> 'different versions', and not different providers?

I was talking about versions, because thats what I use it for. A 
different provider would be e.g libav,but in meta-kodi I have older 
versions of ffmpeg
called ffmpeg-6 and ffmpeg-7 and let them provide virtual/ffmpeg. Dont 
ask me why I didn't stick with
preferred_version. I only remember that I had issues with using it but 
not exactly what it was. But if you think this
is the way it should be, I can give it another try


--=-c5kcftGqpIK1RK3lbQAK
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Sep 16 2025 at 18:26:32 +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This needs more detail. What else would be providing virtual/ffmpeg,
other than ffmpeg itself? Why the justification is talking about
'different versions', and not different providers?
</div></blockquote><div><br></div><div><div>I was talking about versions, because thats what I use it for. A different provider would be e.g libav,but in meta-kodi I have older versions of ffmpeg</div><div>called ffmpeg-6 and ffmpeg-7 and let them provide virtual/ffmpeg. Dont ask me why I didn't stick with</div><div>preferred_version. I only remember that I had issues with using it but not exactly what it was. But if you think this</div><div>is the way it should be, I can give it another try&nbsp;</div></div></div>
--=-c5kcftGqpIK1RK3lbQAK--


