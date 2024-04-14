Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAAFC4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 14:08:55 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.32925.1713103733186318775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 07:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout09.t-online.de (Postfix) with SMTP id D6CD3A21B
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 16:08:50 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.46.194]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rw0XI-3ys4HY0; Sun, 14 Apr 2024 16:08:48 +0200
Date: Sun, 14 Apr 2024 16:09:08 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] xwayland: update 23.2.5 -> 23.2.6
To: openembedded-core@lists.openembedded.org
Message-Id: <8BRXBS.D9N3NVEBQKWZ@t-online.de>
In-Reply-To: <17C62AA529E16CB6.8361@lists.openembedded.org>
References: <17C62AA529E16CB6.8361@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ypycXcgtpHTg2Dz143pv"
X-TOI-EXPURGATEID: 150726::1713103728-27FFCC65-999FFA01/0/0 CLEAN NORMAL
X-TOI-MSGID: c2cadd8d-0ab6-49e1-9320-15ae1d28e8bf
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 14:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198210

--=-ypycXcgtpHTg2Dz143pv
Content-Type: text/plain; charset=us-ascii; format=flowed

This requires libei which is currently in meta-oe

On Sun, Apr 14 2024 at 04:06:52 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - add a PACKAGECONFIG for libdecor
> 
> ! This will require to move libei from meta-oe to oe-core !
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../xwayland/{xwayland_23.2.5.bb => xwayland_23.2.6.bb}      | 5 
> +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/xwayland/{xwayland_23.2.5.bb => 
> xwayland_23.2.6.bb} (89%)
> 
> diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb 
> b/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
> similarity index 89%
> rename from meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
> rename to meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
> index b934a873d1..62241a1258 100644
> --- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
> +++ b/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
> @@ -10,20 +10,21 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=5df87950af51ac2c5822094553ea1880" 
> <file://copying;md5=5df87950af51ac2c5822094553ea1880/>
> 
>  SRC_URI = 
> "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz 
> <https://www.x.org/archive/individual/xserver/xwayland-$%7BPV%7D.tar.xz>"
> -SRC_URI[sha256sum] = 
> "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
> +SRC_URI[sha256sum] = 
> "1c9a366b4e7ccadba0f9bd313c59eae12d23bd72543b22a26eaf8b20835cfc6d"
> 
>  UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
> 
>  inherit meson features_check pkgconfig
>  REQUIRED_DISTRO_FEATURES = "x11 opengl"
> 
> -DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland 
> wayland-native wayland-protocols libdrm libepoxy libxcvt"
> +DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland 
> wayland-native wayland-protocols libdrm libei libepoxy libxcvt"
> 
>  OPENGL_PKGCONFIGS = "glx glamor dri3"
>  PACKAGECONFIG ??= "${XORG_CRYPTO} \
>                     ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'opengl', 
> '${OPENGL_PKGCONFIGS}', '', d)} \
>  "
>  PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false,libxshmfence"
> +PACKAGECONFIG[libdecor] = "-Dlibdecor=true,-Dlibdecor=false,libdecor"
>  PACKAGECONFIG[glx] = "-Dglx=true,-Dglx=false,virtual/libgl 
> virtual/libx11"
>  PACKAGECONFIG[glamor] = "-Dglamor=true,-Dglamor=false,libepoxy 
> virtual/libgbm,libegl"
>  PACKAGECONFIG[unwind] = 
> "-Dlibunwind=true,-Dlibunwind=false,libunwind"
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198209): 
> <https://lists.openembedded.org/g/openembedded-core/message/198209>
> Mute This Topic: <https://lists.openembedded.org/mt/105517140/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-ypycXcgtpHTg2Dz143pv
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This requires libei which is currently in meta-oe</div></div><div id="geary-quote" dir="auto"><br>On Sun, Apr 14 2024 at 04:06:52 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add a PACKAGECONFIG for libdecor

! This will require to move libei from meta-oe to oe-core !

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../xwayland/{xwayland_23.2.5.bb =&gt; xwayland_23.2.6.bb}      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.5.bb =&gt; xwayland_23.2.6.bb} (89%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
similarity index 89%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
index b934a873d1..62241a1258 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
@@ -10,20 +10,21 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=5df87950af51ac2c5822094553ea1880" "="">file://COPYING;md5=5df87950af51ac2c5822094553ea1880"</a>
 
 SRC_URI = "<a href="https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz">https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz</a>"
-SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
+SRC_URI[sha256sum] = "1c9a366b4e7ccadba0f9bd313c59eae12d23bd72543b22a26eaf8b20835cfc6d"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P&lt;pver&gt;\d+(\.(?!90\d)\d+)+)\.tar"
 
 inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy libxcvt"
+DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libei libepoxy libxcvt"
 
 OPENGL_PKGCONFIGS = "glx glamor dri3"
 PACKAGECONFIG ??= "${XORG_CRYPTO} \
                    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
 "
 PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false,libxshmfence"
+PACKAGECONFIG[libdecor] = "-Dlibdecor=true,-Dlibdecor=false,libdecor"
 PACKAGECONFIG[glx] = "-Dglx=true,-Dglx=false,virtual/libgl virtual/libx11"
 PACKAGECONFIG[glamor] = "-Dglamor=true,-Dglamor=false,libepoxy virtual/libgbm,libegl"
 PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#198209): <a href="https://lists.openembedded.org/g/openembedded-core/message/198209">https://lists.openembedded.org/g/openembedded-core/message/198209</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105517140/3618223">https://lists.openembedded.org/mt/105517140/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-ypycXcgtpHTg2Dz143pv--


