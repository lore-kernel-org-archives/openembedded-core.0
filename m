Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC68DC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 21:40:59 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.552.1745530852168729906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 14:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout07.t-online.de (Postfix) with SMTP id 7B6BA1C3D
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 23:40:50 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.166.69]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u84JN-292v7g0; Thu, 24 Apr 2025 23:40:49 +0200
Date: Thu, 24 Apr 2025 23:40:44 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] default-providers.inc: add entries for
 virtual/libsdl2
To: openembedded-core@lists.openembedded.org
Message-Id: <W7S8VS.FQ12W4BJV1TZ1@t-online.de>
In-Reply-To: <18395F03D66275F9.31387@lists.openembedded.org>
References: <18395F03D66275F9.31387@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-m68EWh0+F99UD2eweU32"
X-TOI-EXPURGATEID: 150726::1745530850-DD7F994A-481A2982/0/0 CLEAN NORMAL
X-TOI-MSGID: 6bc50e41-549c-4721-b454-0598310cda6f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 21:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215407

--=-m68EWh0+F99UD2eweU32
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: add missing -native

On Thu, Apr 24 2025 at 23:39:51 +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> virtual/libsdl2 can be provided by 'libsdl2' and 'libsdl2-compat' 
> where the latter
> is a replacement for libsdl2 that uses libsdl3 behind the scenes and 
> should
> be favored if applicable.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/conf/distro/include/default-providers.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/conf/distro/include/default-providers.inc 
> b/meta/conf/distro/include/default-providers.inc
> index cebd0400f4..ee91af8796 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -4,6 +4,8 @@
>  BB_RECIPE_VIRTUAL_PROVIDERS = "virtual/cross-cc virtual/cross-c++ 
> virtual/cross-binutils virtual/nativesdk-cross-cc 
> virtual/nativesdk-cross-c++ virtual/nativesdk-cross-binutils"
>  PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
>  PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/libsdl2 ?= "libsdl2"
> +PREFERRED_PROVIDER_virtual/libsdl2-native ?= "libsdl2-native"
>  PREFERRED_PROVIDER_virtual/egl ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libglx ?= "mesa"
> @@ -32,6 +34,7 @@ VIRTUAL-RUNTIME_base-utils-hwclock ?= 
> "busybox-hwclock"
>  VIRTUAL-RUNTIME_base-utils-syslog ?= "busybox-syslog"
>  VIRTUAL-RUNTIME_keymaps ?= "keymaps"
>  VIRTUAL-RUNTIME_dbus ?= "dbus"
> +VIRTUAL-RUNTIME_libsdl2 ?= "libsdl2"
> 
>  #
>  # Default recipe providers
> @@ -62,5 +65,6 @@ PREFERRED_PROVIDER_pkgconfig-native ?= 
> "pkgconfig-native"
>  PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
> 
>  PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
> +PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?= "nativesdk-libsdl2"
> 
>  PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?= "rxvt-unicode"
> --
> 2.49.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215406): 
> <https://lists.openembedded.org/g/openembedded-core/message/215406>
> Mute This Topic: <https://lists.openembedded.org/mt/112441574/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-m68EWh0+F99UD2eweU32
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: add missing -native</div></div><div id="geary-quote" dir="auto"><br>On Thu, Apr 24 2025 at 23:39:51 +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">virtual/libsdl2 can be provided by 'libsdl2' and 'libsdl2-compat' where the latter
is a replacement for libsdl2 that uses libsdl3 behind the scenes and should
be favored if applicable.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/conf/distro/include/default-providers.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index cebd0400f4..ee91af8796 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -4,6 +4,8 @@
 BB_RECIPE_VIRTUAL_PROVIDERS = "virtual/cross-cc virtual/cross-c++ virtual/cross-binutils virtual/nativesdk-cross-cc virtual/nativesdk-cross-c++ virtual/nativesdk-cross-binutils"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/libsdl2 ?= "libsdl2"
+PREFERRED_PROVIDER_virtual/libsdl2-native ?= "libsdl2-native"
 PREFERRED_PROVIDER_virtual/egl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libglx ?= "mesa"
@@ -32,6 +34,7 @@ VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
 VIRTUAL-RUNTIME_base-utils-syslog ?= "busybox-syslog"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 VIRTUAL-RUNTIME_dbus ?= "dbus"
+VIRTUAL-RUNTIME_libsdl2 ?= "libsdl2"
 
 #
 # Default recipe providers
@@ -62,5 +65,6 @@ PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
 PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
 
 PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
+PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?= "nativesdk-libsdl2"
 
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?= "rxvt-unicode"
<div>-- 
</div>2.49.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#215406): <a href="https://lists.openembedded.org/g/openembedded-core/message/215406">https://lists.openembedded.org/g/openembedded-core/message/215406</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/112441574/3618223">https://lists.openembedded.org/mt/112441574/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-m68EWh0+F99UD2eweU32--


