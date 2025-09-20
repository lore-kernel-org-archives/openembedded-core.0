Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAE3CAC5A0
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 11:03:02 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.7480.1758366175861943196
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Sep 2025 04:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout08.t-online.de (Postfix) with SMTP id 2A408E3E8;
	Sat, 20 Sep 2025 13:02:41 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.169.67]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uzvMP-3aV2XI0; Sat, 20 Sep 2025 13:02:33 +0200
Date: Sat, 20 Sep 2025 13:02:28 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/2] introduce virtual/ffmpeg
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <40WV2T.MJDR58EBBGYO@t-online.de>
In-Reply-To: <1866F8043523DE78.12551@lists.openembedded.org>
References: <20250916155800.3860178-1-f_l_k@t-online.de>
	<CANNYZj964ZPDbN7HjhCCkxS5a9dPR7-uVewK9pcrpcZp9ZVGLw@mail.gmail.com>
	<1866F8043523DE78.12551@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-U2FG9ckseFJFtXQZf0hb"
X-TOI-EXPURGATEID: 150726::1758366153-F4FF6977-C2C80AB2/0/0 CLEAN NORMAL
X-TOI-MSGID: 1e7315f3-f930-4417-ab84-5863fdcdffde
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 11:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223780

--=-U2FG9ckseFJFtXQZf0hb
Content-Type: text/plain; charset=us-ascii; format=flowed

But that's only because I had to think about it again. I totally 
understand your point.

On Sat, Sep 20 2025 at 12:49:50 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> On Tue, Sep 16 2025 at 18:26:32 +02:00:00, Alexander Kanavin 
> <alex.kanavin@gmail.com> wrote:
>> This needs more detail. What else would be providing virtual/ffmpeg,
>> other than ffmpeg itself? Why the justification is talking about
>> 'different versions', and not different providers?
> 
> 
> Because it's been a while, I found it surprisingly difficult to get 
> to the point ;)
> 
> I think I tried it as you recommended, and I also think that I only 
> needed virtual/kodi at the time.
> The 'idea' of virtual/ffmpeg is introduced in meta-raspberrypi 
> because it provides rpidistro-ffmpeg,
> and the build system therefore expects me to set a PREFERRED_PROVIDER 
> for it.


--=-U2FG9ckseFJFtXQZf0hb
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>But that's only because I had to think about it again. I totally understand your point.</div></div><div id="geary-quote" dir="auto"><br>On Sat, Sep 20 2025 at 12:49:50 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div id="geary-body" dir="auto">On Tue, Sep 16 2025 at 18:26:32 +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This needs more detail. What else would be providing virtual/ffmpeg,
other than ffmpeg itself? Why the justification is talking about
'different versions', and not different providers?</div></blockquote><div><br></div><div><br></div><div><div>Because it's been a while, I found it surprisingly difficult to get to the point ;)</div><div><br></div><div>I think I tried it as you recommended, and I also think that I only needed virtual/kodi at the time.</div><div>The 'idea' of virtual/ffmpeg is introduced in meta-raspberrypi because it provides rpidistro-ffmpeg,</div><div>and the build system therefore expects me to set a PREFERRED_PROVIDER for it.</div></div></div>
</blockquote></div>
--=-U2FG9ckseFJFtXQZf0hb--


