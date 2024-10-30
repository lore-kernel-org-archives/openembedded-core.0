Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F5FD7496B
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 05:21:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.7916.1730265696420039373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 22:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout01.t-online.de (Postfix) with SMTP id 60CA8961;
	Wed, 30 Oct 2024 06:21:34 +0100 (CET)
Received: from [192.168.178.67] ([84.154.173.244]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t619B-3f5vCi0; Wed, 30 Oct 2024 06:21:33 +0100
Date: Wed, 30 Oct 2024 06:23:43 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] python3-dtc: fix language specific AppendOutput
 functions with swig 4.3.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <JNL5MS.NY8JYUASLOS5@t-online.de>
In-Reply-To: <ZyDZb3_9BfJZFddm@bootlin-mathieu>
References: <20241028173602.1652935-1-f_l_k@t-online.de>
	<ZyDZb3_9BfJZFddm@bootlin-mathieu>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/LAWWclTSpx8S2aeyg9u"
X-TOI-EXPURGATEID: 150726::1730265693-967FA5D1-A50B3FD4/0/0 CLEAN NORMAL
X-TOI-MSGID: 8a30bec6-fc35-43bb-9a9a-82578e0b04d0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 05:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206544

--=-/LAWWclTSpx8S2aeyg9u
Content-Type: text/plain; charset=us-ascii; format=flowed


Hi Mathieu,

It took a while. I first had to investigate another problem I was 
having with swig and kodi. But that may have been related to the python 
3.13 update.

I have sent a patch to the u-boot mailing list. I had to register there 
and the confirmation is still pending. Unfortunately no patches are 
accepted via github. That's why I don't have a link, but I set the 
patch status to submitted anyway, because at least I got this 
confirmation:

Your mail to 'U-Boot' with the subject

    [PATCH] scripts/dtc/pylibfdt/libfdt.i_shipped: Use SWIG_AppendOutput

Is being held until the list moderator can review it for approval.

The reason it is being held:

    Post by non-member to a members-only list

Either the message will get posted to the list, or you will receive
notification of the moderator's decision.


--=-/LAWWclTSpx8S2aeyg9u
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><br></div><div><div>Hi Mathieu,</d=
iv><div><br></div><div>It took a while. I first had to investigate another =
problem I was having with swig and kodi. But that may have been related to =
the python 3.13 update.&nbsp;</div><div><br></div><div>I have sent a patch =
to the u-boot mailing list. I had to register there and the confirmation is=
 still pending. Unfortunately no patches are accepted via github. That's wh=
y I don't have a link, but I set the patch status to submitted anyway, beca=
use at least I got this confirmation:</div><div><br></div><div>Your mail to=
 'U-Boot' with the subject</div><div><br></div><div>&nbsp; &nbsp; [PATCH] s=
cripts/dtc/pylibfdt/libfdt.i_shipped: Use SWIG_AppendOutput</div><div><br><=
/div><div>Is being held until the list moderator can review it for approval=
.</div><div><br></div><div>The reason it is being held:</div><div><br></div=
><div>&nbsp; &nbsp; Post by non-member to a members-only list</div><div><br=
></div><div>Either the message will get posted to the list, or you will rec=
eive</div><div>notification of the moderator's decision.</div></div></div>
--=-/LAWWclTSpx8S2aeyg9u--


