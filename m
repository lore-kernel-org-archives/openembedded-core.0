Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3CCC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 12:21:10 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.10202.1668774066176876981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 04:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout05.t-online.de (Postfix) with SMTP id 82F1A24AE5;
	Fri, 18 Nov 2022 13:21:03 +0100 (CET)
Received: from [192.168.178.83] ([79.219.225.179]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ow0Mh-3FdWTY0; Fri, 18 Nov 2022 13:21:03 +0100
Date: Fri, 18 Nov 2022 13:20:57 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH] blktrace: ask for python3 specifically
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Sajal, Sakib" <Sakib.Sajal@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <XAMJLR.696EYFVTYA7M3@t-online.de>
In-Reply-To: 
	<CANNYZj_akT9iove+LmqnrY4zA1ghct93t4P7hc5UtuSf8s5eHQ@mail.gmail.com>
References: <20221103183356.40685-1-sakib.sajal@windriver.com>
	<CANNYZj9R5=X_=yK8hsq_RJJ0ieSrGbCqd4jpzBN5Uv_U59n2ZQ@mail.gmail.com>
	<DM6PR11MB25388B935A115A1398CD8EAAF2079@DM6PR11MB2538.namprd11.prod.outlook.com>
	<CANNYZj-mNkCgk=XHWBvqpqr=x4R9AMyktBTj49p-QK=Ui2whxg@mail.gmail.com>
	<4JYHLR.TSDICAGWLD7L@t-online.de>
	<CANNYZj_akT9iove+LmqnrY4zA1ghct93t4P7hc5UtuSf8s5eHQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-82RGuZOm/CXkTwAnesRT"
X-TOI-EXPURGATEID: 150726::1668774063-EEFF2A26-EB8D5B87/0/0 CLEAN NORMAL
X-TOI-MSGID: 44f448b6-ba50-405f-9075-447e7050306b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 12:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173454

--=-82RGuZOm/CXkTwAnesRT
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 17. Nov 2022 um 16:49:01 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> I am tempted to turn this into a patch :-) But imagine all the
> complaints this is going to receive.

Maybe it would be possible to use a DISTRO_FEATURE 'python2' and make 
the creation of the python3 symlink dependent on it? This way users who 
need python2 could restore the previous behavior and you still wouldn't 
have to patch the scripts, which somehow feels wrong and would add a 
lot of oe-specific patches.


--=-82RGuZOm/CXkTwAnesRT
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 17. Nov 2022 um 16:49:01 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I am tempted to turn this into a patch :-) But imagine all the
complaints this is going to receive.</div></blockquote><div><br></div><div>Maybe it would be possible to use a DISTRO_FEATURE 'python2' and make the creation of the python3 symlink dependent on it? This way users who need python2 could restore the previous behavior and you still wouldn't have to patch the scripts, which somehow feels wrong and would add a lot of oe-specific patches.</div></div>
--=-82RGuZOm/CXkTwAnesRT--


