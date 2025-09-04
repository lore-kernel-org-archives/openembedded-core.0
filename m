Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5007CCA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 06:54:58 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.33389.1756968893419627069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 23:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout12.t-online.de (Postfix) with SMTP id 95C62DFF4
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Sep 2025 08:54:51 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.163.17]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uu3rv-3S26Ai0; Thu, 4 Sep 2025 08:54:51 +0200
Date: Thu, 04 Sep 2025 08:54:45 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gtk4: update 4.18.6 -> 4.20.0
To: openembedded-core@lists.openembedded.org
Message-Id: <9VX12T.KTJU8G56WM8B1@t-online.de>
In-Reply-To: <186200794C3D97EA.28859@lists.openembedded.org>
References: <186200794C3D97EA.28859@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-cxj/HTUmhz+haONUhhi6"
X-TOI-EXPURGATEID: 150726::1756968891-E37FD90B-258E7F37/0/0 CLEAN NORMAL
X-TOI-MSGID: 9976c1c2-9941-4abf-8cbb-1432066aa02d
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 06:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222905

--=-cxj/HTUmhz+haONUhhi6
Content-Type: text/plain; charset=us-ascii; format=flowed

This should have been marked as RFC. It is only applicable once glib 
has been updated to the upcoming version.
gtk4 itself compiles without any problems, but gtkmm in meta-oe 
requires an update for glibmm, which needs at least 2.85.2.
| Dependency glib-2.0 found: NO. Found 2.84.4 but need: '>= 2.85.2'

On Thu, Sep 4 2025 at 08:28:28 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Changelog: 
> [<https://gitlab.gnome.org/GNOME/gtk/-/blob/71926a295583bc44c1c52c4d7b74f375381d68b2/NEWS>]
> 
> - add bash-completion to FILES to avoid an installed-vs-shipped issue
> - make gtk4-printbackend-cups rrecommend instead of rdepend to avoid 
> a situation where gtk4 depends
>   on itself:
>   ERROR: gtk4-4.20.0-r0 do_package_qa: QA Issue: gtk4 rdepends on 
> gtk4-printbackend-cups, but it isn't a build dependency? [build-deps]
>   ERROR: gtk4-4.20.0-r0 do_package_qa: Fatal QA errors were found, 
> failing task.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb => gtk4_4.20.0.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb => gtk4_4.20.0.bb} 
> (96%)
> 
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb 
> b/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
> similarity index 96%
> rename from meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
> rename to meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
> index 2d24468dcc..f99789a9e9 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
> @@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  UPSTREAM_CHECK_REGEX = 
> "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
> 
>  SRC_URI = 
> "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz 
> <http://ftp.gnome.org/pub/gnome/sources/gtk/$%7BMAJ_VER%7D/gtk-$%7BPV%7D.tar.xz>"
> -SRC_URI[sha256sum] = 
> "e1817c650ddc3261f9a8345b3b22a26a5d80af154630dedc03cc7becefffd0fa"
> +SRC_URI[sha256sum] = 
> "79e51e62f7f0cff32904569b0cebc96297d0ebfafa6de8172073c69ce0391a98"
> 
>  S = "${UNPACKDIR}/gtk-${PV}"
> 
> @@ -69,7 +69,7 @@ PACKAGECONFIG:class-nativesdk = 
> "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)
>  PACKAGECONFIG[x11] = 
> "-Dx11-backend=true,-Dx11-backend=false,at-spi2-atk fontconfig libx11 
> libxext libxcursor libxi libxdamage libxrandr libxrender 
> libxcomposite libxfixes xinerama"
>  PACKAGECONFIG[wayland] = 
> "-Dwayland-backend=true,-Dwayland-backend=false,wayland 
> wayland-protocols virtual/egl virtual/libgles2 wayland-native"
>  PACKAGECONFIG[cloudproviders] = 
> "-Dcloudproviders=enabled,-Dcloudproviders=disabled,libcloudproviders"
> -PACKAGECONFIG[cups] = 
> "-Dprint-cups=enabled,-Dprint-cups=disabled,cups,cups 
> gtk4-printbackend-cups"
> +PACKAGECONFIG[cups] = 
> "-Dprint-cups=enabled,-Dprint-cups=disabled,cups,cups,gtk4-printbackend-cups"
>  PACKAGECONFIG[colord] = "-Dcolord=enabled,-Dcolord=disabled,colord"
>  PACKAGECONFIG[iso-codes] = ",,iso-codes,iso-codes"
>  # gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
> @@ -84,6 +84,7 @@ CFLAGS += "-Wno-error=int-conversion"
>  LIBV = "4.0.0"
> 
>  FILES:${PN}:append = " \
> +    ${datadir}/bash-completion \
>      ${datadir}/glib-2.0/schemas/ \
>      ${datadir}/gtk-4.0/emoji/ \
>      ${datadir}/metainfo/ \
> --
> 2.50.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222904): 
> <https://lists.openembedded.org/g/openembedded-core/message/222904>
> Mute This Topic: <https://lists.openembedded.org/mt/115059592/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-cxj/HTUmhz+haONUhhi6
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>This should have been marked as RFC. It is only applicable once glib has been updated to the upcoming version.</div><div>gtk4 itself compiles without any problems, but gtkmm in meta-oe requires an update for glibmm, which needs at least 2.85.2.</div></div><div>| Dependency glib-2.0 found: NO. Found 2.84.4 but need: '&gt;= 2.85.2'</div></div><div id="geary-quote" dir="auto"><br>On Thu, Sep 4 2025 at 08:28:28 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Changelog: [<a href="https://gitlab.gnome.org/GNOME/gtk/-/blob/71926a295583bc44c1c52c4d7b74f375381d68b2/NEWS">https://gitlab.gnome.org/GNOME/gtk/-/blob/71926a295583bc44c1c52c4d7b74f375381d68b2/NEWS</a>]

- add bash-completion to FILES to avoid an installed-vs-shipped issue
- make gtk4-printbackend-cups rrecommend instead of rdepend to avoid a situation where gtk4 depends
  on itself:
  ERROR: gtk4-4.20.0-r0 do_package_qa: QA Issue: gtk4 rdepends on gtk4-printbackend-cups, but it isn't a build dependency? [build-deps]
  ERROR: gtk4-4.20.0-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =&gt; gtk4_4.20.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =&gt; gtk4_4.20.0.bb} (96%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
similarity index 96%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
index 2d24468dcc..f99789a9e9 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
@@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P&lt;pver&gt;\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "<a href="http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz">http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz</a>"
-SRC_URI[sha256sum] = "e1817c650ddc3261f9a8345b3b22a26a5d80af154630dedc03cc7becefffd0fa"
+SRC_URI[sha256sum] = "79e51e62f7f0cff32904569b0cebc96297d0ebfafa6de8172073c69ce0391a98"
 
 S = "${UNPACKDIR}/gtk-${PV}"
 
@@ -69,7 +69,7 @@ PACKAGECONFIG:class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)
 PACKAGECONFIG[x11] = "-Dx11-backend=true,-Dx11-backend=false,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes xinerama"
 PACKAGECONFIG[wayland] = "-Dwayland-backend=true,-Dwayland-backend=false,wayland wayland-protocols virtual/egl virtual/libgles2 wayland-native"
 PACKAGECONFIG[cloudproviders] = "-Dcloudproviders=enabled,-Dcloudproviders=disabled,libcloudproviders"
-PACKAGECONFIG[cups] = "-Dprint-cups=enabled,-Dprint-cups=disabled,cups,cups gtk4-printbackend-cups"
+PACKAGECONFIG[cups] = "-Dprint-cups=enabled,-Dprint-cups=disabled,cups,cups,gtk4-printbackend-cups"
 PACKAGECONFIG[colord] = "-Dcolord=enabled,-Dcolord=disabled,colord"
 PACKAGECONFIG[iso-codes] = ",,iso-codes,iso-codes"
 # gtk4 wants gstreamer-player-1.0 -&gt; gstreamer1.0-plugins-bad
@@ -84,6 +84,7 @@ CFLAGS += "-Wno-error=int-conversion"
 LIBV = "4.0.0"
 
 FILES:${PN}:append = " \
+    ${datadir}/bash-completion \
     ${datadir}/glib-2.0/schemas/ \
     ${datadir}/gtk-4.0/emoji/ \
     ${datadir}/metainfo/ \
<div>-- 
</div>2.50.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#222904): <a href="https://lists.openembedded.org/g/openembedded-core/message/222904">https://lists.openembedded.org/g/openembedded-core/message/222904</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/115059592/3618223">https://lists.openembedded.org/mt/115059592/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-cxj/HTUmhz+haONUhhi6--


