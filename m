Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5757CC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 17:32:09 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50818.1782927124766471812
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 10:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=rp8Pl5ZM;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id C8FA5383CE
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 19:32:02 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.163.76]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1weyn4-1gMst60; Wed, 1 Jul 2026 19:32:02 +0200
Date: Wed, 01 Jul 2026 19:31:56 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][Patch 1/3] webkitgtk: add PACKAGECONFIG for lcms
To: openembedded-core@lists.openembedded.org
Message-Id: <8DBIHT.5NA7JJCX86WJ2@t-online.de>
In-Reply-To: <18BE3A93D8A71A88.1336494@lists.openembedded.org>
References: <18BE3A93D8A71A88.1336494@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-8XzoTgPowVXNj34CtAeE"
X-TOI-EXPURGATEID: 150726::1782927122-817F9B4F-9C415986/0/0 CLEAN NORMAL
X-TOI-MSGID: 837d6e6f-5cd1-4a24-80f1-59423b064e9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782927122; i=f_l_k@t-online.de;
	bh=O4dlrqQr2SoySz1lGIY528HxFRZZdlM+xUsem7j/JJg=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=rp8Pl5ZMWE78u/1u0ke/o8S9Y+4MnyXPzyGaeLcuo/Y99DAQcd5gUBi6Ov3j4Ui+7
	 gdB/ShLtUyyFYt2nZlC9+a8JliZx9V8kATNxpquyGYTCjryNjBjg4knye7J7BUw8R4
	 mlAuu+b+1dAzcIDDx9yQbacd82pNLV1TuEjzMWxBIFlbR73MRlOtVLBS8ICNGa6byn
	 VNpWGVsaw3IWlu5XHmQD5pGPnv+97g809CJHeQjmMHwicBpDGaeMyJvRH4RJi8EpBe
	 zJAPYpxvZGQTHwcqcKRy+SxrsO/gCHoX2ZiYvnQ/s/PBGYhdCkK+AkzQAEC8978Hh5
	 qdvz7xO32SB0Q==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 17:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240007

--=-8XzoTgPowVXNj34CtAeE
Content-Type: text/plain; charset=us-ascii; format=flowed

This patch needs to be ignored. There is already a PACKAGECONFIG for 
lcms available in the recipe. Sorry

Am Mi, 1. Jul 2026 um 19:28:12 +02:00:00 schrieb Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>:
> disabled by default
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.52.4.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb 
> b/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
> index e81cdfa301..a2683638dd 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
> @@ -81,6 +81,7 @@ PACKAGECONFIG[gamepad] = 
> "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
>  PACKAGECONFIG[sysprof-capture] = 
> "-DUSE_SYSTEM_SYSPROF_CAPTURE=YES,-DUSE_SYSTEM_SYSPROF_CAPTURE=NO,sysprof"
>  PACKAGECONFIG[speech] = 
> "-DENABLE_SPEECH_SYNTHESIS=ON,-DENABLE_SPEECH_SYNTHESIS=OFF,flite"
>  PACKAGECONFIG[librice] = "-DUSE_LIBRICE=ON,-DUSE_LIBRICE=OFF,librice"
> +PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
> 
>  EXTRA_OECMAKE = " \
>                   -DPORT=GTK \
> --
> 2.54.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240004): 
> <https://lists.openembedded.org/g/openembedded-core/message/240004>
> Mute This Topic: <https://lists.openembedded.org/mt/120069871/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-8XzoTgPowVXNj34CtAeE
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This patch needs to be ignored. There is already a PACKAGECONFIG for lcms available in the recipe. Sorry</div></div><div id="geary-quote" dir="auto"><br>Am Mi, 1. Jul 2026 um 19:28:12 +02:00:00 schrieb Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">disabled by default

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-sato/webkit/webkitgtk_2.52.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
index e81cdfa301..a2683638dd 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
@@ -81,6 +81,7 @@ PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
 PACKAGECONFIG[sysprof-capture] = "-DUSE_SYSTEM_SYSPROF_CAPTURE=YES,-DUSE_SYSTEM_SYSPROF_CAPTURE=NO,sysprof"
 PACKAGECONFIG[speech] = "-DENABLE_SPEECH_SYNTHESIS=ON,-DENABLE_SPEECH_SYNTHESIS=OFF,flite"
 PACKAGECONFIG[librice] = "-DUSE_LIBRICE=ON,-DUSE_LIBRICE=OFF,librice"
+PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
 
 EXTRA_OECMAKE = " \
                  -DPORT=GTK \
<div>-- 
</div>2.54.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#240004): <a href="https://lists.openembedded.org/g/openembedded-core/message/240004">https://lists.openembedded.org/g/openembedded-core/message/240004</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/120069871/3618223">https://lists.openembedded.org/mt/120069871/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-8XzoTgPowVXNj34CtAeE--


