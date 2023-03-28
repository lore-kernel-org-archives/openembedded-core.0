Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CABC76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 09:18:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.61729.1679995119753622548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 02:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VQTsq9lR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4BF2B1C0005;
	Tue, 28 Mar 2023 09:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679995117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6wUPtzEwX/I4ftuVBylPa3rjnclpYKpwmPVvSmNCLE=;
	b=VQTsq9lRUIRtHBMF/vkthTcee9Hh/NjoidhGzgybXraLg/Tms3gtLxeSEXL5Ao5HFfNqtL
	x4YcnSI08LvlaKSIwheVegD+Tdz9zOy7aGrs0yHxuzzK4jMag4pww2SmOkB03TN1nhMKEr
	eEfwGbx9fwhGW9LNaee+y/AuViidIS2jRABsX+sELwtkNL2cWkq1lO05jAhsDWfpm5jUg7
	EWbmX9YKqBmweTDmwj0OhzoDVtMvhXl2Rgk13iajGw3tTmSkkP1Jca4KFWAR0t5p4SCQGE
	9HGNBYaBE/T6vVShvhFAttagyG5duDVFc4DPZpml3jco4si2RmWVL5tOaTN9xw==
Date: Tue, 28 Mar 2023 11:18:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] import libadwaita from meta-gnome
Message-ID: <2023032809183607448ce9@mail.local>
References: <20230328080156.854975-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328080156.854975-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 09:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179216

Please take the time to send proper series that are versioned. The
changelog then goes in the cover letter when adding or removing patches.
For individual patches, the changelog goes after the --- marker and
before the diffstat.

You can't expect maintainers to cherry pick patches from different
series. As you underlined, a build takes 5 to 10 hours, every build
failure is also delaying work from others.

On 28/03/2023 10:01:56+0200, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../libadwaita/libadwaita_1.3.1.bb            | 24 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 meta/recipes-gnome/libadwaita/libadwaita_1.3.1.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 1fec9bc6f4..62272cd1bd 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -303,6 +303,7 @@ RECIPE_MAINTAINER:pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-less = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-liba52 = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libacpi = "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libadwaita = "Markus Volk <f_l_k@t-online.de>"
>  RECIPE_MAINTAINER:pn-libaio = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-libarchive = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
>  RECIPE_MAINTAINER:pn-libassuan = "Unassigned <unassigned@yoctoproject.org>"
> diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.3.1.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.3.1.bb
> new file mode 100644
> index 0000000000..8f927e3f7e
> --- /dev/null
> +++ b/meta/recipes-gnome/libadwaita/libadwaita_1.3.1.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Building blocks for modern GNOME applications"
> +LICENSE="LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +
> +DEPENDS = " \
> +    gtk4 \
> +"
> +
> +inherit gnomebase gobject-introspection gtk-doc vala features_check
> +
> +SRC_URI[archive.sha256sum] = "6b8bbf413c501b46c8616a0e5b836d7a34091140941412520bbd9ddda6df8cbd"
> +
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +
> +GIR_MESON_ENABLE_FLAG = 'enabled'
> +GIR_MESON_DISABLE_FLAG = 'disabled'
> +GTKDOC_MESON_OPTION = 'gtk_doc'
> +
> +PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
> +
> +FILES:${PN} += "${datadir}/metainfo"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179208): https://lists.openembedded.org/g/openembedded-core/message/179208
> Mute This Topic: https://lists.openembedded.org/mt/97900769/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

