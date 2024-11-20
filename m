Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDE5D711DC
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 18:35:26 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.22265.1732127725727694743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 10:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id 30E64BB9
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 19:35:24 +0100 (CET)
Received: from [192.168.178.67] ([84.154.160.173]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tDpXs-29Noq80; Wed, 20 Nov 2024 19:35:20 +0100
Date: Wed, 20 Nov 2024 19:37:47 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [meta-gnome][PATCH] gdm: allow to unlock keyring when
 logging in
To: openembedded-core@lists.openembedded.org
Message-Id: <ZEI9NS.O1ZH0B2X7ML22@t-online.de>
In-Reply-To: <1809C058D39356BC.32520@lists.openembedded.org>
References: <1809C058D39356BC.32520@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-gf2uv2BBNz0Dv0FvzYmI"
X-TOI-EXPURGATEID: 150726::1732127720-1EFEB712-0BB0B16D/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ee22541-697a-495a-b53e-18bc3de4a797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 18:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207473

--=-gf2uv2BBNz0Dv0FvzYmI
Content-Type: text/plain; charset=us-ascii; format=flowed

sorry, wrong list. Resent to meta-oe

On Wed, Nov 20 2024 at 07:25:52 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-gnome/recipes-gnome/gdm/gdm_47.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb 
> b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
> index aede4b071..45f23b49b 100644
> --- a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
> +++ b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
> @@ -40,6 +40,8 @@ do_install:prepend() {
> 
>  do_install:append() {
>      rm -rf ${D}/run ${D}${localstatedir}/run
> +    echo "auth       optional     pam_gnome_keyring.so" >> 
> ${D}${sysconfdir}/pam.d/gdm-password
> +    echo "session    optional     pam_gnome_keyring.so auto_start" 
> >> ${D}${sysconfdir}/pam.d/gdm-password
>  }
> 
>  USERADD_PACKAGES = "${PN}"
> --
> 2.47.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207470): 
> <https://lists.openembedded.org/g/openembedded-core/message/207470>
> Mute This Topic: <https://lists.openembedded.org/mt/109689546/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-gf2uv2BBNz0Dv0FvzYmI
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>sorry, wrong list. Resent to meta-oe</div></div><div id="geary-quote" dir="auto"><br>On Wed, Nov 20 2024 at 07:25:52 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-gnome/recipes-gnome/gdm/gdm_47.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
index aede4b071..45f23b49b 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
@@ -40,6 +40,8 @@ do_install:prepend() {
 
 do_install:append() {
     rm -rf ${D}/run ${D}${localstatedir}/run
+    echo "auth       optional     pam_gnome_keyring.so" &gt;&gt; ${D}${sysconfdir}/pam.d/gdm-password
+    echo "session    optional     pam_gnome_keyring.so auto_start" &gt;&gt; ${D}${sysconfdir}/pam.d/gdm-password
 }
 
 USERADD_PACKAGES = "${PN}"
<div>-- 
</div>2.47.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#207470): <a href="https://lists.openembedded.org/g/openembedded-core/message/207470">https://lists.openembedded.org/g/openembedded-core/message/207470</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/109689546/3618223">https://lists.openembedded.org/mt/109689546/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-gf2uv2BBNz0Dv0FvzYmI--


