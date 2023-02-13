Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3220DC636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 10:40:57 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.11693.1676284852049714762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 02:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout02.t-online.de (Postfix) with SMTP id 1CB3525357
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 11:40:50 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.111]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRWGN-4J7MXo0; Mon, 13 Feb 2023 11:40:47 +0100
Date: Mon, 13 Feb 2023 11:40:41 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] graphene: add a PACKAGECONFIG for arm_neon
To: openembedded-core@lists.openembedded.org
Message-Id: <TNL0QR.8TQGS2RNIWUZ@t-online.de>
In-Reply-To: <20230213103939.1066831-1-f_l_k@t-online.de>
References: <20230213103939.1066831-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-hVK4ETMrkMpqwhcJhJu1"
X-TOI-EXPURGATEID: 150726::1676284847-E8D5737F-DFDB2F8E/0/0 CLEAN NORMAL
X-TOI-MSGID: a782c367-7d1a-486e-959f-81302b90cfcc
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 10:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177092

--=-hVK4ETMrkMpqwhcJhJu1
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 enables neon for aarch64 by default

Am Mo, 13. Feb 2023 um 11:39:39 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> Not all arm platforms support neon and runtime detection for this 
> feature is
> currently not reliable. Add a PACKAGECONFIG that disables neon 
> support for arm
> but can be manually enabled.
> 
> Enable neon for aarch64 by default
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-graphics/graphene/graphene_1.10.8.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb 
> b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> index 813ff74adf..f32112118f 100644
> --- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> +++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> @@ -11,7 +11,9 @@ SRC_URI[archive.sha256sum] = 
> "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da3
> 
>  # gtk4 & mutter 41.0 requires graphene build with introspection
>  PACKAGECONFIG ?= "introspection"
> +#PACKAGECONFIG:aarch64 += "neon"
>  PACKAGECONFIG[introspection] = 
> "-Dintrospection=enabled,-Dintrospection=disabled,"
> +PACKAGECONFIG[neon] = "-Darm_neon=true,-Darm_neon=false,"
> 
>  GTKDOC_MESON_OPTION = "gtk_doc"
> 
> --
> 2.34.1
> 


--=-hVK4ETMrkMpqwhcJhJu1
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 enables neon for aarch64 by default</div></div><div id="geary-quote" dir="auto"><br>Am Mo, 13. Feb 2023 um 11:39:39 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Not all arm platforms support neon and runtime detection for this feature is
currently not reliable. Add a PACKAGECONFIG that disables neon support for arm
but can be manually enabled.

Enable neon for aarch64 by default

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index 813ff74adf..f32112118f 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -11,7 +11,9 @@ SRC_URI[archive.sha256sum] = "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da3
 
 # gtk4 &amp; mutter 41.0 requires graphene build with introspection
 PACKAGECONFIG ?= "introspection"
+#PACKAGECONFIG:aarch64 += "neon"
 PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,"
+PACKAGECONFIG[neon] = "-Darm_neon=true,-Darm_neon=false,"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-hVK4ETMrkMpqwhcJhJu1--


