Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FD0C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 12:51:33 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.11173.1737723086842717386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 04:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout12.t-online.de (Postfix) with SMTP id AFDC316B0;
	Fri, 24 Jan 2025 13:51:23 +0100 (CET)
Received: from [192.168.178.67] ([84.154.163.122]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tbJ9d-1JAj6O0; Fri, 24 Jan 2025 13:51:21 +0100
Date: Fri, 24 Jan 2025 13:51:42 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v3 8/8] image.bbclass: enable systemd user
 services
To: arturkow2000@gmail.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <6QFLQS.3B9MTODL3DXT1@t-online.de>
In-Reply-To: <20250120124605.263817-10-arturkow2000@gmail.com>
References: <20250120124605.263817-2-arturkow2000@gmail.com>
	<20250120124605.263817-10-arturkow2000@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-8aK6WvlMAsrsjJjWpKZO"
X-TOI-EXPURGATEID: 150726::1737723081-59FF89CD-976FA614/0/0 CLEAN NORMAL
X-TOI-MSGID: 850db482-7038-4681-8348-9d9546df5f6f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 12:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210221

--=-8aK6WvlMAsrsjJjWpKZO
Content-Type: text/plain; charset=us-ascii; format=flowed

With this patch applied I see an error in image creation after 
do_rootfs if gnome-shell is installed:

| Error: Systemctl preset_all issue in org.gnome.Shell@wayland.service
| WARNING: 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/temp/run.systemd_preset_all.2011511:158 
exit 1 from 'systemctl 
--root="/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs" 
--global --preset-mode=enable-only preset-all'



On Mon, Jan 20 2025 at 13:46:06 +01:00:00, Artur Kowalski via 
lists.openembedded.org <arturkow2000=gmail.com@lists.openembedded.org> 
wrote:
> Run systemctl preset-all with --global flag so user unit's are enabled
> the same way system units are.
> 
> Signed-off-by: Artur Kowalski <arturkow2000@gmail.com 
> <mailto:arturkow2000@gmail.com>>
> ---
>  meta/classes-recipe/image.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes-recipe/image.bbclass 
> b/meta/classes-recipe/image.bbclass
> index 84a2017eb5..f08818db03 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -702,6 +702,7 @@ reproducible_final_image_task () {
>  systemd_preset_all () {
>      if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
>  	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only 
> preset-all
> +	systemctl --root="${IMAGE_ROOTFS}" --global 
> --preset-mode=enable-only preset-all
>      fi
>  }
> 
> --
> 2.47.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210039): 
> <https://lists.openembedded.org/g/openembedded-core/message/210039>
> Mute This Topic: <https://lists.openembedded.org/mt/110714552/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-8aK6WvlMAsrsjJjWpKZO
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>With this patch applied I see an error in image creation after do_rootfs if gnome-shell is installed:</div><div><br></div><div><div>| Error: Systemctl preset_all issue in org.gnome.Shell@wayland.service</div><div>| WARNING: /home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/temp/run.systemd_preset_all.2011511:158 exit 1 from 'systemctl --root="/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs" --global --preset-mode=enable-only preset-all'</div></div><div><br></div><div><br></div></div><div id="geary-quote" dir="auto"><br>On Mon, Jan 20 2025 at 13:46:06 +01:00:00, Artur Kowalski via lists.openembedded.org &lt;arturkow2000=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Run systemctl preset-all with --global flag so user unit's are enabled
the same way system units are.

Signed-off-by: Artur Kowalski &lt;<a href="mailto:arturkow2000@gmail.com">arturkow2000@gmail.com</a>&gt;
---
 meta/classes-recipe/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 84a2017eb5..f08818db03 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -702,6 +702,7 @@ reproducible_final_image_task () {
 systemd_preset_all () {
     if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
 	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
+	systemctl --root="${IMAGE_ROOTFS}" --global --preset-mode=enable-only preset-all
     fi
 }
 
<div>-- 
</div>2.47.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#210039): <a href="https://lists.openembedded.org/g/openembedded-core/message/210039">https://lists.openembedded.org/g/openembedded-core/message/210039</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/110714552/3618223">https://lists.openembedded.org/mt/110714552/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-8aK6WvlMAsrsjJjWpKZO--


