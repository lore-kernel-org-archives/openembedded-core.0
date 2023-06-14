Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63668EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 17:55:34 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.84.1686765328598998179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 10:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id 762EEE965
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 19:55:26 +0200 (CEST)
Received: from [192.168.178.156] ([84.163.47.212]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q9UiL-2m3OGO0; Wed, 14 Jun 2023 19:55:25 +0200
Date: Wed, 14 Jun 2023 19:55:19 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gstreamer1.0-plugins-bad: use oneVPL instead
 of intel-mediasdk for msdk
To: openembedded-core@lists.openembedded.org
Message-Id: <7G89WR.8F2XBKAMWSIU@t-online.de>
In-Reply-To: <17689800C1D2AC88.27401@lists.openembedded.org>
References: <17689800C1D2AC88.27401@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-JP9LzfV5JWxG2Fltwa6C"
X-TOI-EXPURGATEID: 150726::1686765325-18DBAE62-0B34B8C0/0/0 CLEAN NORMAL
X-TOI-MSGID: e205ed08-d9ab-4147-bae1-cbcad1ba3342
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 17:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182825

--=-JP9LzfV5JWxG2Fltwa6C
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 tries to improve dependencies


Am Mi, 14. Jun 2023 um 19:52:57 +0200 schrieb Markus Volk 
<f_l_k@t-online.de>:
> According to intel, mediasdk is obsolete and should be replaced by 
> oneVPL
> 
> <https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html#gs.0kgkse>
> 
> This also adds video processing support for intel alchemist (in 
> combination with dev-kernel)
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb                | 2 
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git 
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb 
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
> index 6260f9586b..bda083d0a8 100644
> --- 
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
> +++ 
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
> @@ -60,7 +60,7 @@ PACKAGECONFIG[libde265]        = 
> "-Dlibde265=enabled,-Dlibde265=disabled,libde26
>  PACKAGECONFIG[libssh2]         = 
> "-Dcurl-ssh2=enabled,-Dcurl-ssh2=disabled,libssh2"
>  PACKAGECONFIG[lcms2]           = 
> "-Dcolormanagement=enabled,-Dcolormanagement=disabled,lcms"
>  PACKAGECONFIG[modplug]         = 
> "-Dmodplug=enabled,-Dmodplug=disabled,libmodplug"
> -PACKAGECONFIG[msdk]            = 
> "-Dmsdk=enabled,-Dmsdk=disabled,intel-mediasdk"
> +PACKAGECONFIG[msdk]            = "-Dmsdk=enabled 
> -Dmfx_api=oneVPL,-Dmsdk=disabled,onevpl,onevpl-intel-gpu"
>  PACKAGECONFIG[neon]            = 
> "-Dneon=enabled,-Dneon=disabled,neon"
>  PACKAGECONFIG[openal]          = 
> "-Dopenal=enabled,-Dopenal=disabled,openal-soft"
>  PACKAGECONFIG[opencv]          = 
> "-Dopencv=enabled,-Dopencv=disabled,opencv"
> --
> 2.34.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182824): 
> <https://lists.openembedded.org/g/openembedded-core/message/182824>
> Mute This Topic: <https://lists.openembedded.org/mt/99533031/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-JP9LzfV5JWxG2Fltwa6C
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 tries to improve dependencies</div><div><br></div></div><div id="geary-quote" dir="auto"><br>Am Mi, 14. Jun 2023 um 19:52:57 +0200 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">According to intel, mediasdk is obsolete and should be replaced by oneVPL

<a href="https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html#gs.0kgkse">https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html#gs.0kgkse</a>

This also adds video processing support for intel alchemist (in combination with dev-kernel)

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
index 6260f9586b..bda083d0a8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
@@ -60,7 +60,7 @@ PACKAGECONFIG[libde265]        = "-Dlibde265=enabled,-Dlibde265=disabled,libde26
 PACKAGECONFIG[libssh2]         = "-Dcurl-ssh2=enabled,-Dcurl-ssh2=disabled,libssh2"
 PACKAGECONFIG[lcms2]           = "-Dcolormanagement=enabled,-Dcolormanagement=disabled,lcms"
 PACKAGECONFIG[modplug]         = "-Dmodplug=enabled,-Dmodplug=disabled,libmodplug"
-PACKAGECONFIG[msdk]            = "-Dmsdk=enabled,-Dmsdk=disabled,intel-mediasdk"
+PACKAGECONFIG[msdk]            = "-Dmsdk=enabled -Dmfx_api=oneVPL,-Dmsdk=disabled,onevpl,onevpl-intel-gpu"
 PACKAGECONFIG[neon]            = "-Dneon=enabled,-Dneon=disabled,neon"
 PACKAGECONFIG[openal]          = "-Dopenal=enabled,-Dopenal=disabled,openal-soft"
 PACKAGECONFIG[opencv]          = "-Dopencv=enabled,-Dopencv=disabled,opencv"
<div>-- 
</div>2.34.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#182824): <a href="https://lists.openembedded.org/g/openembedded-core/message/182824">https://lists.openembedded.org/g/openembedded-core/message/182824</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/99533031/3618223">https://lists.openembedded.org/mt/99533031/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-JP9LzfV5JWxG2Fltwa6C--


