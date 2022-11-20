Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3180C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 18:03:21 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.18490.1668967400811343023
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 10:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout01.t-online.de (Postfix) with SMTP id AD1438501;
	Sun, 20 Nov 2022 19:03:15 +0100 (CET)
Received: from [192.168.178.83] ([79.219.233.127]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1owoex-1dMzpI0; Sun, 20 Nov 2022 19:03:15 +0100
Date: Sun, 20 Nov 2022 19:03:09 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <9HRNLR.0DY4ZHTXLE82@t-online.de>
In-Reply-To: 
	<CANNYZj_QqqH5FzZHke2W2yKbP+YHhfHkf4kT7ahtBpkOv2OV9w@mail.gmail.com>
References: <20221120175237.194899-1-f_l_k@t-online.de>
	<CANNYZj_QqqH5FzZHke2W2yKbP+YHhfHkf4kT7ahtBpkOv2OV9w@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-0/o7DFXEtpcc49a8o+Rl"
X-TOI-EXPURGATEID: 150726::1668967395-6B7FA9DD-C9BBDB18/0/0 CLEAN NORMAL
X-TOI-MSGID: b17ee0f2-615d-46de-8241-0392889bb25a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 18:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173640

--=-0/o7DFXEtpcc49a8o+Rl
Content-Type: text/plain; charset=us-ascii; format=flowed

Am So, 20. Nov 2022 um 19:00:39 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> I have to ask you to resend and drop the DISTRO_FEATURE idea. We do
> not want to make the impression that python2 is supported in any way,
> and as explained earlier this implies that all scripts that ask for
> python would work with both 2 and 3. No, this is a clean break, and
> anyone who still has 2.x stuff has to adjust it to ask for
> #!/usr/bin/python2.

I fully agree


--=-0/o7DFXEtpcc49a8o+Rl
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am So, 20. Nov 2022 um 19:00:39 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I have to ask you to resend and drop the DISTRO_FEATURE idea. We do
not want to make the impression that python2 is supported in any way,
and as explained earlier this implies that all scripts that ask for
python would work with both 2 and 3. No, this is a clean break, and
anyone who still has 2.x stuff has to adjust it to ask for
#!/usr/bin/python2.
</div></blockquote><div><br></div><div>I fully agree&nbsp;</div></div>
--=-0/o7DFXEtpcc49a8o+Rl--


