Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E49FC00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 17:22:32 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.51661.1674148942763716361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 09:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 00F68275D7;
	Thu, 19 Jan 2023 18:22:21 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.208]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pIYcG-0c1QHY0; Thu, 19 Jan 2023 18:22:20 +0100
Date: Thu, 19 Jan 2023 18:22:14 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gptfdisk: add follow-up patch to fix with
 current popt
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <2LTQOR.QLNMTZ06LFDD3@t-online.de>
In-Reply-To: 
	<CANNYZj8DpFxQfTJtWoyGyUkLRjZgKRoLKKJu4KXB77r755hEQw@mail.gmail.com>
References: <20230119131853.27372-1-f_l_k@t-online.de>
	<CANNYZj-ihaDgJ1Nar=h6oxq0GcA_J4-jouWfTacdoViNmRZuTQ@mail.gmail.com>
	<G9OQOR.29KQBNHWF95M@t-online.de>
	<CANNYZj8DpFxQfTJtWoyGyUkLRjZgKRoLKKJu4KXB77r755hEQw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-FRt7u0dxCrKMSXYYhi46"
X-TOI-EXPURGATEID: 150726::1674148940-E55752C2-827DC06C/0/0 CLEAN NORMAL
X-TOI-MSGID: edad5c25-2a1f-4cf4-ba88-2b4eb4aecbd3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176154

--=-FRt7u0dxCrKMSXYYhi46
Content-Type: text/plain; charset=us-ascii; format=flowed

I don't want to push this work to you. Just wanted to give a reason, 
why I'd rather dont like to do myself, at least for the next days. Have 
still plenty of work lying here and in fact I do this only for fun and 
thats what it still needs to be to give me reason. I'm not related to 
technical things for a living. It's just, that I had an issue with 
gnome-disks and as a side effect I realized that sgdisk has an issue as 
well and found a fix for it.
But if thats not appropriate like this, just drop that commit for now. 
Will send a v2 when I've been digging into it enough, to have the 
feeling that I am halfway knowing what I talk about, if sending a merge 
request for a patch I didn't create.


Am Do, 19. Jan 2023 um 18:10:05 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> On Thu, 19 Jan 2023 at 16:27, Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>>  But its neither my patch nor am I familiar with sourceforge or the 
>> actual issue with popt ... and I'm not keen on changing that. I 
>> think if the gptfdisk maintainer wants to release a new version, he 
>> will be able to find the patch on the net like I was.
>> 
>>  And if he wants to get more help from the community it would be a 
>> good idea to have a git repo available somewhere. Or am I missing 
>> something and just wasn't able to find it?
> 
> The git repo is in fact on sourceforge:
> <https://sourceforge.net/p/gptfdisk/code/ci/master/tree/>
> and you can open a merge request there. There's one from Khem for 
> example.
> 
> Please do not come up with reasons to push this work (submitting
> patches upstream) on me; I do not appreciate that.
> 
> Alex


--=-FRt7u0dxCrKMSXYYhi46
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>I don't want to push this wor=
k to you. Just wanted to give a reason, why I'd rather dont like to do myse=
lf, at least for the next days. Have still plenty of work lying here and in=
 fact I do this only for fun and thats what it still needs to be to give me=
 reason. I'm not related to technical things for a living. It's just, that =
I had an issue with gnome-disks and as a side effect I realized that sgdisk=
 has an issue as well and found a fix for it.&nbsp;</div><div>But if thats =
not appropriate like this, just drop that commit for now. Will send a v2 wh=
en I've been digging into it enough, to have the feeling that I am halfway =
knowing what I talk about, if sending a merge request for a patch I didn't =
create.</div></div><div><br></div></div><div id=3D"geary-quote" dir=3D"auto=
"><br>Am Do, 19. Jan 2023 um 18:10:05 +0100 schrieb Alexander Kanavin &lt;a=
lex.kanavin@gmail.com&gt;:<br><blockquote type=3D"cite"><div class=3D"plain=
text" style=3D"white-space: break-spaces;">On Thu, 19 Jan 2023 at 16:27, Ma=
rkus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt=
; wrote:
<blockquote> But its neither my patch nor am I familiar with sourceforge or=
 the actual issue with popt ... and I'm not keen on changing that. I think =
if the gptfdisk maintainer wants to release a new version, he will be able =
to find the patch on the net like I was.

 And if he wants to get more help from the community it would be a good ide=
a to have a git repo available somewhere. Or am I missing something and jus=
t wasn't able to find it?
</blockquote>
The git repo is in fact on sourceforge:
<a href=3D"https://sourceforge.net/p/gptfdisk/code/ci/master/tree/">https:/=
/sourceforge.net/p/gptfdisk/code/ci/master/tree/</a>
and you can open a merge request there. There's one from Khem for example.

Please do not come up with reasons to push this work (submitting
patches upstream) on me; I do not appreciate that.

Alex
</div></blockquote></div>
--=-FRt7u0dxCrKMSXYYhi46--


