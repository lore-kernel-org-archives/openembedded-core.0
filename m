Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927CDC0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 16:34:02 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.23535.1738341237251055310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 08:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout04.t-online.de (Postfix) with SMTP id 38745A4;
	Fri, 31 Jan 2025 17:33:53 +0100 (CET)
Received: from [192.168.178.67] ([84.154.170.38]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tdtxo-253zCi0; Fri, 31 Jan 2025 17:33:52 +0100
Date: Fri, 31 Jan 2025 17:34:25 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH] mesa: upgrade 24.0.7 -> 24.3.4
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: alex.kanavin@gmail.com, dbaryshkov@gmail.com,
	openembedded-core@lists.openembedded.org
Message-Id: <DPOYQS.TMRNZEFBYE473@t-online.de>
In-Reply-To: <dfcadcaf-64d0-4a4b-a0c7-cdcd5243175a@cherry.de>
References: <20250131123519.461671-1-dmitry.baryshkov@linaro.org>
	<CANNYZj_9dkovbXGmvEx4RC1aUKsNOGiqOq7WcM7eP_59QwH9eg@mail.gmail.com>
	<dfcadcaf-64d0-4a4b-a0c7-cdcd5243175a@cherry.de>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dN1rwWXyZ4/HPLPh5rYr"
X-TOI-EXPURGATEID: 150726::1738341232-317F9A89-132ECB1E/10/3626336762 SUSPECT URL
X-TOI-MSGID: 0fae457d-1897-4d79-9429-f3a5c6693284
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 16:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210491

--=-dN1rwWXyZ4/HPLPh5rYr
Content-Type: text/plain; charset=us-ascii; format=flowed

<https://codeberg.org/flk/meta-image/src/branch/master/meta/recipes-graphics/mesa>

This is the recipe that I currently use to build mesa 23.3.4 (with 
meta-clang). One needs to revert
this commit in meta-clang as it would break mesa
<https://github.com/kraj/meta-clang/commit/768c60a4f805e49a0a29b81c99fe29b4d26fe1b2>

On Fri, Jan 31 2025 at 14:17:50 +01:00:00, Quentin Schulz 
<quentin.schulz@cherry.de> wrote:
> Hi Dmitry,
> 
> On 1/31/25 1:59 PM, Alexander Kanavin via lists.openembedded.org 
> wrote:
>> On Fri, 31 Jan 2025 at 13:35, Dmitry Baryshkov via
>> lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org 
>> <mailto:dbaryshkov=gmail.com@lists.openembedded.org>>
>> wrote:
>>> 
>>> Upgrade the Mesa package, dropping applied and refreshing 
>>> outstanding
>>> patches. The dri3 config option is now gone, dependencies are merged
>>> into X11 deps. The swrast gallium driver has been split into 
>>> softpipe
>>> and llvmpipe drivers.
>> 
>> How was this tested? For me it fails immediately with the same error
>> as the previous update attempts:
>> 
>> | Run-time dependency libclc found: NO (tried pkgconfig)
>> 
>> Basically, mesa updates are blocked until clang lands in core. If you
>> want new mesa, please do help out.
>> 
> 
> For reference:
> 
> <https://lore.kernel.org/openembedded-core/20240531-panthor-v1-2-1a76fd752c1b@cherry.de/>
> and
> <https://lore.kernel.org/openembedded-core/aa532133-c872-4bde-8479-dba12de225c7@bootlin.com/>
> and
> <https://lore.kernel.org/openembedded-core/20240908165102.3699657-1-f_l_k@t-online.de/>
> and
> <https://lore.kernel.org/openembedded-core/20240908172311.3773048-1-f_l_k@t-online.de/>
> 
> Adding Markus in Cc.
> 
> Cheers,
> Quentin


--=-dN1rwWXyZ4/HPLPh5rYr
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><a href="https://codeberg.org/flk/meta-image/src/branch/master/meta/recipes-graphics/mesa">https://codeberg.org/flk/meta-image/src/branch/master/meta/recipes-graphics/mesa</a></div><div><br></div><div>This is the recipe that I currently use to build mesa 23.3.4 (with meta-clang). One needs to revert</div><div>this commit in meta-clang as it would break mesa&nbsp;</div><div><a href="https://github.com/kraj/meta-clang/commit/768c60a4f805e49a0a29b81c99fe29b4d26fe1b2">https://github.com/kraj/meta-clang/commit/768c60a4f805e49a0a29b81c99fe29b4d26fe1b2</a></div></div><div id="geary-quote" dir="auto"><br>On Fri, Jan 31 2025 at 14:17:50 +01:00:00, Quentin Schulz &lt;quentin.schulz@cherry.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Hi Dmitry,

On 1/31/25 1:59 PM, Alexander Kanavin via lists.openembedded.org wrote:
<blockquote>On Fri, 31 Jan 2025 at 13:35, Dmitry Baryshkov via
lists.openembedded.org &lt;<a href="mailto:dbaryshkov=gmail.com@lists.openembedded.org">dbaryshkov=gmail.com@lists.openembedded.org</a>&gt;
wrote:
<blockquote>
Upgrade the Mesa package, dropping applied and refreshing outstanding
patches. The dri3 config option is now gone, dependencies are merged
into X11 deps. The swrast gallium driver has been split into softpipe
and llvmpipe drivers.
</blockquote>
How was this tested? For me it fails immediately with the same error
as the previous update attempts:

| Run-time dependency libclc found: NO (tried pkgconfig)

Basically, mesa updates are blocked until clang lands in core. If you
want new mesa, please do help out.

</blockquote>
For reference:

<a href="https://lore.kernel.org/openembedded-core/20240531-panthor-v1-2-1a76fd752c1b@cherry.de/">https://lore.kernel.org/openembedded-core/20240531-panthor-v1-2-1a76fd752c1b@cherry.de/</a>
and
<a href="https://lore.kernel.org/openembedded-core/aa532133-c872-4bde-8479-dba12de225c7@bootlin.com/">https://lore.kernel.org/openembedded-core/aa532133-c872-4bde-8479-dba12de225c7@bootlin.com/</a>
and
<a href="https://lore.kernel.org/openembedded-core/20240908165102.3699657-1-f_l_k@t-online.de/">https://lore.kernel.org/openembedded-core/20240908165102.3699657-1-f_l_k@t-online.de/</a>
and
<a href="https://lore.kernel.org/openembedded-core/20240908172311.3773048-1-f_l_k@t-online.de/">https://lore.kernel.org/openembedded-core/20240908172311.3773048-1-f_l_k@t-online.de/</a>

Adding Markus in Cc.

Cheers,
Quentin
</div></blockquote></div>
--=-dN1rwWXyZ4/HPLPh5rYr--


