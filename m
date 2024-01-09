Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595FAC4707B
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 19:10:42 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.25960.1704827434795032439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 11:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout05.t-online.de (Postfix) with SMTP id 0564E12227;
	Tue,  9 Jan 2024 20:10:32 +0100 (CET)
Received: from [192.168.178.67] ([84.154.162.27]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rNHUc-1Pd6JM0; Tue, 9 Jan 2024 20:10:30 +0100
Date: Tue, 09 Jan 2024 20:07:09 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] webp: switch recipe to cmake buildsystem
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <X3D07S.A0X5NA8SN0Y53@t-online.de>
In-Reply-To: <CAMKF1soVHRa7Ksw5jtkedFQuJzM08tEzK-810p0RtGmKe_YRMQ@mail.gmail.com>
References: <17A8B0DD7AD4D31C.21327@lists.openembedded.org>
	<PLXZ6S.UNFZMOJ43CYT3@t-online.de>
	<CAMKF1soVHRa7Ksw5jtkedFQuJzM08tEzK-810p0RtGmKe_YRMQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-2Nbx0oNGj0AwMf61hTYZ"
X-TOI-EXPURGATEID: 150726::1704827430-3E7FB877-5A4D9B29/0/0 CLEAN NORMAL
X-TOI-MSGID: b6e45bab-9e6c-427d-9e30-432cad65b0f7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 19:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193479

--=-2Nbx0oNGj0AwMf61hTYZ
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Jan 9 2024 at 08:38:32 AM -08:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Is upstream also switching to use cmake as primary build system ?

If you are speaking of chromeOS, I bet they use cmake

I had a look at what linux distributions do. Archlinux and Fedora use 
the cmake build system and also Debian provides the cmake config files 
in sid
<https://packages.debian.org/sid/alpha/libwebp-dev/filelist>


--=-2Nbx0oNGj0AwMf61hTYZ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Jan 9 2024 at 08:38:32 AM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">Is upstream also switching to use cmake as primary build system ?</blockquote><div><br></div><div>If you are speaking of chromeOS, I bet they use cmake</div><div><br></div><div>I had a look at what linux distributions do. Archlinux and Fedora use the cmake build system and also Debian provides the cmake config files in sid</div><div><a href="https://packages.debian.org/sid/alpha/libwebp-dev/filelist">https://packages.debian.org/sid/alpha/libwebp-dev/filelist</a></div></div>
--=-2Nbx0oNGj0AwMf61hTYZ--


