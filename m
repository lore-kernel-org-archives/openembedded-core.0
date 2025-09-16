Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C081CAC592
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 17:07:06 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.1104.1758042415775992608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 10:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout10.t-online.de (Postfix) with SMTP id D895E37FE0;
	Tue, 16 Sep 2025 19:06:53 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.44.62]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uyZ8l-3HzoUi0; Tue, 16 Sep 2025 19:06:51 +0200
Date: Tue, 16 Sep 2025 19:06:45 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/2] introduce virtual/ffmpeg
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <97YO2T.IKZQF19TC8BH1@t-online.de>
In-Reply-To: <1865D16D5AB1B07F.13540@lists.openembedded.org>
References: <20250916155800.3860178-1-f_l_k@t-online.de>
	<CANNYZj964ZPDbN7HjhCCkxS5a9dPR7-uVewK9pcrpcZp9ZVGLw@mail.gmail.com>
	<1865D16D5AB1B07F.13540@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-fdHobDTrIvpyLW8Z/c9N"
X-TOI-EXPURGATEID: 150726::1758042411-29FF89FF-7C37F6B6/0/0 CLEAN NORMAL
X-TOI-MSGID: 76752a28-98cf-473e-a901-e0b0b7e1fe1a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 17:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223579

--=-fdHobDTrIvpyLW8Z/c9N
Content-Type: text/plain; charset=us-ascii; format=flowed

I think that was because I had to build Kodi and mpv with different 
ffmpeg versions at the time, because mpv was updated to ffmpeg 7 but 
Kodi wasn't ready yet.
Similar situation like today with ffmpeg 8. There exists a patch to add 
ffmpeg 8 support in kodi but to me it feels like its a bit to early for 
this step.

 couldn't find a way to use two different system versions of ffmpeg as 
long as they only differed in the version number.

> I only remember that I had issues with using it but not exactly what 
> it was.


--=-fdHobDTrIvpyLW8Z/c9N
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I think that was because I had to build Kodi and mpv with different ffmpeg versions at the time, because mpv was updated to ffmpeg 7 but Kodi wasn't ready yet.</div><div>Similar situation like today with ffmpeg 8. There exists a patch to add ffmpeg 8 support in kodi but to me it feels like its a bit to early for this step.&nbsp;</div><div><br></div><div>&nbsp;couldn't find a way to use two different system versions of ffmpeg as long as they only differed in the version number. &nbsp;</div></div><div id="geary-quote" dir="auto"><br><blockquote type="cite"><div id="geary-body" dir="auto"><div><div>I only remember that I had issues with using it but not exactly what it was.&nbsp;</div></div></div>
</blockquote></div>
--=-fdHobDTrIvpyLW8Z/c9N--


