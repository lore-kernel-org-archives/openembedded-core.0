Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E47C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 08:31:53 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.5871.1676104309427189505
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 00:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout09.t-online.de (Postfix) with SMTP id CE86812657;
	Sat, 11 Feb 2023 09:31:03 +0100 (CET)
Received: from [192.168.178.83] ([84.163.42.158]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pQlHi-1mPPV20; Sat, 11 Feb 2023 09:31:02 +0100
Date: Sat, 11 Feb 2023 09:30:56 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] graphene: disable neon support on arm 32bits
To: openembedded-core@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>, Khem Raj <raj.khem@gmail.com>
Message-Id: <KBQWPR.TDI5PVXQ0KI8@t-online.de>
In-Reply-To: <1742B7B2647E3F63.29566@lists.openembedded.org>
References: <1742B7B2647E3F63.29566@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-D3CZiEicvWFs7MMTOWMU"
X-TOI-EXPURGATEID: 150726::1676104262-DA6182C4-34E11C02/0/0 CLEAN NORMAL
X-TOI-MSGID: cc85c5d3-ad6a-4dd4-a802-9721acfa352b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 08:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177001

--=-D3CZiEicvWFs7MMTOWMU
Content-Type: text/plain; charset=us-ascii; format=flowed

This fix was recently added to meta-oe. Move the patch to oe-core, 
because graphene is needed here to build gtk4.
I also sent a patch to remove graphene from meta-oe.

Am Sa, 11. Feb 2023 um 09:26:09 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> From: Pablo Saavedra <psaavedra@igalia.com 
> <mailto:psaavedra@igalia.com>>
> 
> This disables neon support on arm devices only because it crashes 
> otherwise.
> 
> Upstream-status: Reported 
> [<https://github.com/ebassi/graphene/issues/215>]
> Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ---
>  meta/recipes-graphics/graphene/graphene_1.10.8.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb 
> b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> index 813ff74adf..1bbe7ecca1 100644
> --- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> +++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> @@ -17,6 +17,9 @@ GTKDOC_MESON_OPTION = "gtk_doc"
> 
>  EXTRA_OEMESON = "-Dinstalled_tests=false"
> 
> +# Disable ARM NEON support
> +EXTRA_OEMESON:append:arm = " -Darm_neon=false"
> +
>  FILES:${PN} += "${libdir}/graphene-1.0"
> 
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.34.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177000): 
> <https://lists.openembedded.org/g/openembedded-core/message/177000>
> Mute This Topic: <https://lists.openembedded.org/mt/96893757/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-D3CZiEicvWFs7MMTOWMU
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">This fix was recently added to meta-oe. Move the patch to oe-core, because graphene is needed here to build gtk4.<div>I also sent a patch to remove graphene from meta-oe.</div></div><div id="geary-quote" dir="auto"><br>Am Sa, 11. Feb 2023 um 09:26:09 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">From: Pablo Saavedra &lt;<a href="mailto:psaavedra@igalia.com">psaavedra@igalia.com</a>&gt;

This disables neon support on arm devices only because it crashes otherwise.

Upstream-status: Reported [<a href="https://github.com/ebassi/graphene/issues/215">https://github.com/ebassi/graphene/issues/215</a>]
Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index 813ff74adf..1bbe7ecca1 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -17,6 +17,9 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 EXTRA_OEMESON = "-Dinstalled_tests=false"
 
+# Disable ARM NEON support
+EXTRA_OEMESON:append:arm = " -Darm_neon=false"
+
 FILES:${PN} += "${libdir}/graphene-1.0"
 
 BBCLASSEXTEND = "native nativesdk"
<div>-- 
</div>2.34.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#177000): <a href="https://lists.openembedded.org/g/openembedded-core/message/177000">https://lists.openembedded.org/g/openembedded-core/message/177000</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/96893757/3618223">https://lists.openembedded.org/mt/96893757/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-D3CZiEicvWFs7MMTOWMU--


