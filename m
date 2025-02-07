Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08186C02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 19:05:33 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.680.1738955122678800037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 11:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id 94C0E2DA0;
	Fri,  7 Feb 2025 20:05:20 +0100 (CET)
Received: from [192.168.178.67] ([84.163.33.65]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tgTfD-1dm1HE0; Fri, 7 Feb 2025 20:05:19 +0100
Date: Fri, 07 Feb 2025 20:05:57 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH] mesa: upgrade 24.0.7 -> 24.3.4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: =?iso-8859-1?b?QvZzevZybelueWkgWm9sdOFu?= <zboszor@gmail.com>,
	dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
Message-Id: <XDUBRS.A5RURY8HF9891@t-online.de>
In-Reply-To: <CANNYZj_qtrfy7ub++BfswurTtFT7HrsnsdwqJCPxG-W5fXf6Mw@mail.gmail.com>
References: <20250131123519.461671-1-dmitry.baryshkov@linaro.org>
	<CANNYZj_9dkovbXGmvEx4RC1aUKsNOGiqOq7WcM7eP_59QwH9eg@mail.gmail.com>
	<q7yoiccmj2xx32xel7ufh46xzfwnadzhjvsmmxcbsyylqeae6k@mhi4yyd24n66>
	<048f3048-f9bd-4299-a92c-1696eaa7bb3f@gmail.com>
	<CANNYZj_qtrfy7ub++BfswurTtFT7HrsnsdwqJCPxG-W5fXf6Mw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-t+hYn6EML+UYbn2wPg/n"
X-TOI-EXPURGATEID: 150726::1738955119-73FFC99D-57ABB1AD/0/0 CLEAN NORMAL
X-TOI-MSGID: 70d54b25-53c9-42f7-b0dc-16f94a66dada
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 19:05:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210996

--=-t+hYn6EML+UYbn2wPg/n
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Feb 3 2025 at 12:17:26 +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> So you or Dmitry or Markus can play with that and report, we'd be all
> very interested in a confirmation.

I tried to build the intel drivers with mesa-25.0.0-rc2 and without 
libclc. So far without success.
For both intel iris and intel vulkan it still seems to be needed to at 
least select one of opencl-clover or opencl-rusticl,
where both would require libclc at least on the native side.

<https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads#L322>




--=-t+hYn6EML+UYbn2wPg/n
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Feb 3 2025 at 12:17:26 +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">So you or Dmitry or Markus can play with that and report, we'd be all
very interested in a confirmation.
</div></blockquote><div><br></div><div>I tried to build the intel drivers with mesa-25.0.0-rc2 and without libclc. So far without success.</div><div>For both intel iris and intel vulkan it still seems to be needed to at least select one of opencl-clover or opencl-rusticl,</div><div>where both would require libclc at least on the native side.</div><div><br></div><div><font face="monospace"><a href="https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads#L322">https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads#L322</a></font></div><div><br></div><div><br></div></div>
--=-t+hYn6EML+UYbn2wPg/n--


