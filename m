Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E04C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 17:37:09 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.34586.1704217025584367326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 09:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id 84C0812AC;
	Tue,  2 Jan 2024 18:37:03 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.12]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rKihJ-0XQXc80; Tue, 2 Jan 2024 18:37:02 +0100
Date: Tue, 02 Jan 2024 18:36:56 +0100
From: f_l_k@t-online.de
Subject: Re: [RFC][oe-core][PATCH] utfcpp: add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <K9AN6S.UGINW8B1ETV41@t-online.de>
In-Reply-To: <CANNYZj9Lfxtbh+Uc05xbNyC5PuHX5S51tvVBPV7H50eMUSuKug@mail.gmail.com>
References: <17A68917D46BD8C6.19767@lists.openembedded.org>
	<QIXM6S.ZGI08VQ09CW21@t-online.de>
	<CANNYZj9Lfxtbh+Uc05xbNyC5PuHX5S51tvVBPV7H50eMUSuKug@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-bDu7MBPBQEty1AsOdT+6"
X-TOI-EXPURGATEID: 150726::1704217022-2E7FBC95-FA4ABBD8/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c92b9e1-ebae-4381-b554-f89693554207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 17:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193250

--=-bDu7MBPBQEty1AsOdT+6
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Jan 2 2024 at 05:43:31 PM +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> I wonder if we even need a separate recipe at all. Perhaps just list
> this in SRC_URI for taglib and copy the needed file out of its tree
> into where taglib can pick it up?

<https://github.com/taglib/taglib/blob/ef013b76dbfa8a5d8e5027d6c285bc9699f71208/CMakeLists.txt#L153>

taglib currently only supports cmake for finding utfcpp. It would be  
possible to use gitsm fetcher to get the utfcpp code, if the recipe 
gets converted to git but also for that case it will utilize 
3rdparty/utfcpp/CMakeLists.txt to install it.


--=-bDu7MBPBQEty1AsOdT+6
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Jan 2 2024 at 05:43:31 PM +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I wonder if we even need a separate recipe at all. Perhaps just list
this in SRC_URI for taglib and copy the needed file out of its tree
into where taglib can pick it up?</div></blockquote><div><br></div><div><a href="https://github.com/taglib/taglib/blob/ef013b76dbfa8a5d8e5027d6c285bc9699f71208/CMakeLists.txt#L153">https://github.com/taglib/taglib/blob/ef013b76dbfa8a5d8e5027d6c285bc9699f71208/CMakeLists.txt#L153</a></div><div><br></div><div>taglib currently only supports cmake for finding utfcpp. It would be &nbsp;possible to use gitsm fetcher to get the utfcpp code, if the recipe gets converted to git but also for that case it will utilize 3rdparty/utfcpp/CMakeLists.txt to install it.</div></div>
--=-bDu7MBPBQEty1AsOdT+6--


