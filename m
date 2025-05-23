Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E46C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 10:11:39 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.44704.1747995090729460685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 03:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout02.t-online.de (Postfix) with SMTP id C4C642B27;
	Fri, 23 May 2025 12:11:28 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.172.17]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uIPN9-23twOG0; Fri, 23 May 2025 12:11:27 +0200
Date: Fri, 23 May 2025 12:11:22 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] mesa: make asahi dependent on opencl
To: Koen Kooi <koen.kooi@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <YMLPWS.2DZCYVSK3TF52@t-online.de>
In-Reply-To: <85BA3D73-961B-4C26-B3EE-8E0B82567F47@oss.qualcomm.com>
References: <20250523085103.654849-1-f_l_k@t-online.de>
	<85BA3D73-961B-4C26-B3EE-8E0B82567F47@oss.qualcomm.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-XMF4ve/xkHhjxNFNzn/0"
X-TOI-EXPURGATEID: 150726::1747995087-8D7F857E-3E9A0B81/0/0 CLEAN NORMAL
X-TOI-MSGID: f4d530bc-7d9f-4ab5-ab4b-4ddff745507f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 10:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217205

--=-XMF4ve/xkHhjxNFNzn/0
Content-Type: text/plain; charset=us-ascii; format=flowed

Like this?

# 'iris' and 'radeonsi' require LLVM, 'asahi' needs LLVM and 
additionally requires opencl (rust)

Personally I would vote for removal, because that seems 
self-explanatory enough to me. There is
no corresponding comment for vulkandrivers and the comment would also 
be outdated quite soon,
because mesa main branch has added a (by default) rusticl dependency to 
radeonsi as well

On Fri, May 23 2025 at 11:39:30 +02:00:00, Koen Kooi 
<koen.kooi@oss.qualcomm.com> wrote:
> 
> 
>>  Op 23 mei 2025, om 10:51 heeft Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>> het volgende geschreven:
>> 
>>  [...]
>>  # radeonsi requires LLVM
>>  -GALLIUMDRIVERS_ASAHI = "${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'asahi libclc', 
>> ',asahi', '', d)}"
>>  +GALLIUMDRIVERS_ASAHI = "${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'asahi libclc 
>> opencl', ',asahi', '', d)}"
>>  GALLIUMDRIVERS_IRIS = "${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'intel libclc', 
>> ',iris', '', d)}"
>>  GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'amd', ',radeonsi', 
>> '', d)}"
>>  GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
> 
> Very pedantic nit-pick: the comment for these 4 lines only talks 
> about radeon-si, I think we should either remove that comment or 
> properly mention asahi, iris and radeonsi and their dependencies.
> 
> regards,
> 
> Koen


--=-XMF4ve/xkHhjxNFNzn/0
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Like this?</div><div><br></div><div># 'iris' and 'radeonsi' require LLVM, 'asahi' needs LLVM and additionally requires opencl (rust)</div><div><br></div><div>Personally I would vote for removal, because that seems self-explanatory enough to me. There is</div><div>no corresponding&nbsp;comment for vulkandrivers and the comment would also be outdated quite soon,</div><div>because mesa main branch has added a (by default) rusticl dependency to radeonsi as well &nbsp; &nbsp;</div></div><div id="geary-quote" dir="auto"><br>On Fri, May 23 2025 at 11:39:30 +02:00:00, Koen Kooi &lt;koen.kooi@oss.qualcomm.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">

<blockquote> Op 23 mei 2025, om 10:51 heeft Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; het volgende geschreven:
 
 [...]
 # radeonsi requires LLVM
 -GALLIUMDRIVERS_ASAHI = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'asahi libclc', ',asahi', '', d)}"
 +GALLIUMDRIVERS_ASAHI = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'asahi libclc opencl', ',asahi', '', d)}"
 GALLIUMDRIVERS_IRIS = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'intel libclc', ',iris', '', d)}"
 GALLIUMDRIVERS_RADEONSI = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'amd', ',radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
</blockquote>
Very pedantic nit-pick: the comment for these 4 lines only talks about radeon-si, I think we should either remove that comment or properly mention asahi, iris and radeonsi and their dependencies.

regards,

Koen</div></blockquote></div>
--=-XMF4ve/xkHhjxNFNzn/0--


