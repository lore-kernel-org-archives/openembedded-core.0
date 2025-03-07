Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB497C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:19:50 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.15212.1741364383877463876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout11.t-online.de (Postfix) with SMTP id AB39B67E;
	Fri,  7 Mar 2025 17:19:41 +0100 (CET)
Received: from [192.168.178.20] ([84.154.160.145]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tqaQF-4OP8qG0; Fri, 7 Mar 2025 17:19:39 +0100
Date: Fri, 07 Mar 2025 17:20:16 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.82.4 -> 2.84.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <SDHRSS.W4LS3ITNHVRU1@t-online.de>
In-Reply-To: <182A8F15FD14C8CF.13616@lists.openembedded.org>
References: <20250307132900.456962-1-f_l_k@t-online.de>
	<CANNYZj_Y9kM=uq0pKWduZt4LQ9zVwLXnOzu+HAhWJBApAfwduA@mail.gmail.com>
	<182A8AC2C61D2C82.9571@lists.openembedded.org>
	<OFCRSS.DMAMQS5P3JTF@t-online.de>
	<CANNYZj_uNe90wTLJkJhnL17JSbWi6xA1x+_YXHZ_ccWCHOhKrg@mail.gmail.com>
	<182A8DD37F985901.9571@lists.openembedded.org>
	<182A8F15FD14C8CF.13616@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-+g9l2SkjdnA7IGxB3Baz"
X-TOI-EXPURGATEID: 150726::1741364379-C9FF8999-B91B1318/0/0 CLEAN NORMAL
X-TOI-MSGID: 6bb05ef6-493c-4485-8907-72ac8e65d7f9
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 16:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212454

--=-+g9l2SkjdnA7IGxB3Baz
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Mar 7 2025 at 16:32:45 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> 
> Looks good at first glance. Using ptest in DISTRO_FEATURES installs 
> the files into the ptest package, so this patch seems to fix the 
> problem. I'll send it to upstream in the next few days and see what I 
> hear there

After thinking a little bit more about this, I'd say the proper fix 
would be to build tests only, if ptest is enabled:

PACKAGECONFIG[tests] = "-Dtests=true 
-Dinstalled_tests=true,-Dtests=false -Dinstalled_tests=false,"

The option 'tests' is enabled by default so we at least need to add 
'-Dtests=false' to make the PACKAGECONFIG work properly


--=-+g9l2SkjdnA7IGxB3Baz
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Mar 7 2025 at 16:32:45 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div><br></div><div>Looks good at first glance. Using ptest in DISTRO_FEATURES installs the files into the ptest package, so this patch seems to fix the problem. I'll send it to upstream in the next few days and see what I hear there</div></blockquote><div><br></div><div>After thinking a little bit more about this, I'd say the proper fix would be to build tests only, if ptest is enabled:</div><div><br></div><div>PACKAGECONFIG[tests] = "-Dtests=true -Dinstalled_tests=true,-Dtests=false -Dinstalled_tests=false,"</div><div><br></div><div>The option 'tests' is enabled by default so we at least need to add '-Dtests=false' to make the PACKAGECONFIG work properly</div></div>
--=-+g9l2SkjdnA7IGxB3Baz--


