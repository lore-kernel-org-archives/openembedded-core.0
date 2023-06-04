Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B94C77B73
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 19:53:34 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.24032.1685908411574493285
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 12:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout11.t-online.de (Postfix) with SMTP id 82DBF253F;
	Sun,  4 Jun 2023 21:53:29 +0200 (CEST)
Received: from [192.168.178.156] ([79.219.228.74]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q5tn4-0ttbNY0; Sun, 4 Jun 2023 21:53:26 +0200
Date: Sun, 04 Jun 2023 21:53:20 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <W8VQVR.DSGQ4TYA8TYJ3@t-online.de>
In-Reply-To: 
	<CANNYZj_UKMM6P4tk0eXjGFiN74tYqM0XZCUUJwK82LD0St-hRw@mail.gmail.com>
References: <20230527133252.284132-1-f_l_k@t-online.de>
	<20230527133252.284132-2-f_l_k@t-online.de>
	<17635252DFD4EDDE.6918@lists.openembedded.org>
	<CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
	<VDGDVR.YBUKQ953M2TP3@t-online.de>
	<CANNYZj_0ASF5ERsCgrB3W3qYgGJFwJzXn35cgc6ojQf0fi1Yxg@mail.gmail.com>
	<POIDVR.URDIMNIKV0SE3@t-online.de>
	<CANNYZj-megU_4p_eR84XiSt7YvwWu57tWBEZDKoBFkjRj8ZKVQ@mail.gmail.com>
	<MEJDVR.WDZW7MFB3W9N1@t-online.de>
	<CANNYZj_-ptiJqvmf+cU0qV7VkKG0ds=guN9aTU1VirjcG8WjQA@mail.gmail.com>
	<7bb5f101af77af3a051a1b049206800aec542ccd.camel@linuxfoundation.org>
	<ZG5FVR.L4YKBKAES08S3@googlemail.com>
	<0718565165c8175882355d0674588f71c36b8bb7.camel@linuxfoundation.org>
	<NYUOVR.OW8C8JU503CT2@t-online.de>
	<CANNYZj_UKMM6P4tk0eXjGFiN74tYqM0XZCUUJwK82LD0St-hRw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/ai5wYAfD9T+Dxi+helz"
X-TOI-EXPURGATEID: 150726::1685908406-0FFFBC77-01758025/0/0 CLEAN NORMAL
X-TOI-MSGID: 7656a260-525a-4b91-8ef5-00abef152c80
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 19:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182367

--=-/ai5wYAfD9T+Dxi+helz
Content-Type: text/plain; charset=us-ascii; format=flowed

Thanks for the link

Am Sa, 3. Jun 2023 um 20:20:48 +0200 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> On Sat, 3 Jun 2023 at 19:52, Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>>  I had some time to look at this problem. virtual/crypt-native is 
>> not installed into recipe-sysroot-native because of this entry in 
>> bitbake.conf:
>>  ASSUME_PROVIDED = "virtual/crypt-native"
>> 
>>  Removing the entry solved the issue for me. I could successfully 
>> build core-image-minimal for musl and glibc without crypt.h from 
>> host machine.
>> 
>>  But I don't know the reason why this is ASSUME_PROVIDED, so I'm 
>> unsure if this should even be touched.
>> 
>>  In a second step I created a musl-native recipe to be able to 
>> install musl crypt.h into recipe-sysroot-native, but I'm not sure if 
>> this is necessary either.
>> 
>>  
>> <https://github.com/MarkusVolk/openembedded-core/commits/virtual/crypt-native>
> 
> I took a look; I believe this is by design, and for native recipes
> crypt.h does indeed need to be provided by the host distro, and not
> any of the recipes. This is where it was added:
> <https://git.yoctoproject.org/poky/commit/?id=29f65bda6d2c>
> 
> Alex


--=-/ai5wYAfD9T+Dxi+helz
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Thanks for the link</div></div><div id="geary-quote" dir="auto"><br>Am Sa, 3. Jun 2023 um 20:20:48 +0200 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Sat, 3 Jun 2023 at 19:52, Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote> I had some time to look at this problem. virtual/crypt-native is not installed into recipe-sysroot-native because of this entry in bitbake.conf:
 ASSUME_PROVIDED = "virtual/crypt-native"

 Removing the entry solved the issue for me. I could successfully build core-image-minimal for musl and glibc without crypt.h from host machine.

 But I don't know the reason why this is ASSUME_PROVIDED, so I'm unsure if this should even be touched.

 In a second step I created a musl-native recipe to be able to install musl crypt.h into recipe-sysroot-native, but I'm not sure if this is necessary either.

 <a href="https://github.com/MarkusVolk/openembedded-core/commits/virtual/crypt-native">https://github.com/MarkusVolk/openembedded-core/commits/virtual/crypt-native</a>
</blockquote>
I took a look; I believe this is by design, and for native recipes
crypt.h does indeed need to be provided by the host distro, and not
any of the recipes. This is where it was added:
<a href="https://git.yoctoproject.org/poky/commit/?id=29f65bda6d2c">https://git.yoctoproject.org/poky/commit/?id=29f65bda6d2c</a>

Alex
</div></blockquote></div>
--=-/ai5wYAfD9T+Dxi+helz--


