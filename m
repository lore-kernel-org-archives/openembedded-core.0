Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9328C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:07:52 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.207081.1672330066582010397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout12.t-online.de (Postfix) with SMTP id 5A9F9424E;
	Thu, 29 Dec 2022 17:07:36 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.205]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pAvRP-1LNfSS0; Thu, 29 Dec 2022 17:07:35 +0100
Date: Thu, 29 Dec 2022 17:07:29 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH 06/10] libportal: add from
 meta-openembedded/meta-gnome
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	<alex@linutronix.de>
Message-Id: <H4UNNR.OSLU872EYWJ01@t-online.de>
In-Reply-To: <20221229160110.255775-6-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
	<20221229160110.255775-6-alex@linutronix.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-2Z8DTs2cuKCDFubktUR8"
X-TOI-EXPURGATEID: 150726::1672330055-2FFFE535-374E2B64/0/0 CLEAN NORMAL
X-TOI-MSGID: a4b16502-ac90-44e4-ad8a-71bc693e42d6
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175117

--=-2Z8DTs2cuKCDFubktUR8
Content-Type: text/plain; charset=us-ascii; format=flowed

I have recently sent a patch for libportal to includes libportal-gtk4. 
It is under testing in meta-openembedded master-next.

Without gtk4 support 'nautilus' will fail to compile and i guess others 
will follow.


Am Do, 29. Dez 2022 um 17:01:06 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> This used to be required by epiphany, then it became
> optional and was moved to meta-oe, now it is again required.
> 
> The recipe was originally provided by... actually me :-)
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de 
> <mailto:alex@linutronix.de>>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  meta/recipes-gnome/libportal/libportal_0.6.bb | 19 
> +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta/recipes-gnome/libportal/libportal_0.6.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc 
> b/meta/conf/distro/include/maintainers.inc
> index be96123ce6..0affa1bded 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -371,6 +371,7 @@ RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao 
> <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-libpcre2 = "Unassigned 
> <unassigned@yoctoproject.org <mailto:unassigned@yoctoproject.org>>"
>  RECIPE_MAINTAINER:pn-libpipeline = "Wang Mingyu <wangmy@fujitsu.com 
> <mailto:wangmy@fujitsu.com>>"
>  RECIPE_MAINTAINER:pn-libpng = "Anuj Mittal <anuj.mittal@intel.com 
> <mailto:anuj.mittal@intel.com>>"
> +RECIPE_MAINTAINER:pn-libportal = "Alexander Kanavin 
> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
>  RECIPE_MAINTAINER:pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com 
> <mailto:anuj.mittal@intel.com>>"
>  RECIPE_MAINTAINER:pn-libpthread-stubs = "Alexander Kanavin 
> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
>  RECIPE_MAINTAINER:pn-libptytty = "Alexander Kanavin 
> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
> diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb 
> b/meta/recipes-gnome/libportal/libportal_0.6.bb
> new file mode 100644
> index 0000000000..9784f04818
> --- /dev/null
> +++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "libportal provides GIO-style async APIs for most Flatpak 
> portals."
> +DESCRIPTION = "It provides simple asynchronous wrappers for most 
> Flatpak portals \
> +with a familiar GObject API along side the D-Bus API"
> +HOMEPAGE = "<https://github.com/flatpak/libportal>"
> +BUGTRACKER = "<https://github.com/flatpak/libportal/issues>"
> +LICENSE = "LGPL-3.0-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404" 
> <file://copying;md5=3000208d539ec061b899bce1d9ce9404/>
> +
> +SRC_URI = 
> "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main 
> <git://github.com/flatpak/$%7BBPN%7D.git;protocol=https;branch=main>"
> +SRCREV = "13df0b887a7eb7b0f9b14069561a41f62e813155"
> +S = "${WORKDIR}/git"
> +
> +inherit meson gtk-doc gobject-introspection features_check
> +
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +
> +DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
> +
> +EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
> --
> 2.30.2




--=-2Z8DTs2cuKCDFubktUR8
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>I have recently sent a patch for libportal to includes libportal-gtk4. It is under testing in meta-openembedded master-next.</div><div><br></div><div>Without gtk4 support 'nautilus' will fail to compile and i guess others will follow.</div></div><div><br></div><div><br></div>Am Do, 29. Dez 2022 um 17:01:06 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This used to be required by epiphany, then it became
optional and was moved to meta-oe, now it is again required.

The recipe was originally provided by... actually me :-)

Signed-off-by: Alexander Kanavin &lt;<a href="mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-gnome/libportal/libportal_0.6.bb | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-gnome/libportal/libportal_0.6.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index be96123ce6..0affa1bded 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -371,6 +371,7 @@ RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao &lt;yi.zhao@windriver.com&gt;"
 RECIPE_MAINTAINER:pn-libpcre2 = "Unassigned &lt;<a href="mailto:unassigned@yoctoproject.org">unassigned@yoctoproject.org</a>&gt;"
 RECIPE_MAINTAINER:pn-libpipeline = "Wang Mingyu &lt;<a href="mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt;"
 RECIPE_MAINTAINER:pn-libpng = "Anuj Mittal &lt;<a href="mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt;"
+RECIPE_MAINTAINER:pn-libportal = "Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;"
 RECIPE_MAINTAINER:pn-libproxy = "Anuj Mittal &lt;<a href="mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt;"
 RECIPE_MAINTAINER:pn-libpthread-stubs = "Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;"
 RECIPE_MAINTAINER:pn-libptytty = "Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;"
diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb b/meta/recipes-gnome/libportal/libportal_0.6.bb
new file mode 100644
index 0000000000..9784f04818
--- /dev/null
+++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
@@ -0,0 +1,19 @@
+SUMMARY = "libportal provides GIO-style async APIs for most Flatpak portals."
+DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals \
+with a familiar GObject API along side the D-Bus API"
+HOMEPAGE = "<a href="https://github.com/flatpak/libportal">https://github.com/flatpak/libportal</a>"
+BUGTRACKER = "<a href="https://github.com/flatpak/libportal/issues">https://github.com/flatpak/libportal/issues</a>"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=3000208d539ec061b899bce1d9ce9404" "="">file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"</a>
+
+SRC_URI = "<a href="git://github.com/flatpak/${BPN}.git;protocol=https;branch=main">git://github.com/flatpak/${BPN}.git;protocol=https;branch=main</a>"
+SRCREV = "13df0b887a7eb7b0f9b14069561a41f62e813155"
+S = "${WORKDIR}/git"
+
+inherit meson gtk-doc gobject-introspection features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
+
+EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
<div class="geary-signature"><div>-- 
</div>2.30.2</div></div></blockquote><div><br></div><div><br></div></div>
--=-2Z8DTs2cuKCDFubktUR8--


