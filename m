Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5BFC4167B
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 07:51:47 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.8033.1670572297537263559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 23:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H9U4YPwV;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 07F1F240002;
	Fri,  9 Dec 2022 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670572295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zdo3BuZEF6mvpSqhYq9Zlipt0iubHKbC+/1PbAp79+8=;
	b=H9U4YPwVNl8YptbWsTzarbPmLK4G66yWgsZbe4Sw0PZPXSbzxTKoZjCGQr7BkeGkJAuNcN
	4AaQXDHR1TOVz9vv7A2mnvBvZIHC0DeRrZHWEHtqdXErd1eEEPrtA9/DcTf2sK3LpUMG7Q
	+FHwre+BOGcIwdqOvgjwsxfNmW4BeCPVGlKNbinBPSf+efb4ESkmc70RCBJCu280qP0mg1
	XCKpAsTt0htIzW9Wh+eFAO6F0lFiYg+zE8pNUalvOBbn5HO14gTBVmCzxUYzvLnF7vasKa
	ZYo8KHprn+X8LrpSq940gVj85ME0DE/CdKxriJF2LoFH+s/gU+8WH6rD+0fCVw==
Date: Fri, 9 Dec 2022 08:51:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH 1/2] gcr: rename gcr -> gcr3
Message-ID: <Y5LpBmK0bkVJMrkh@mail.local>
References: <20221209065733.1113310-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209065733.1113310-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 07:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174436

Hello Markus,

Please send a proper series with all the patches that are necessary for
a successful build. It has been 4 days that I'm trying various
combinations of your different series and I never had a build success.

You also need to update maintainers.inc with the patch adding the
recipe.

My latest build is still failing:
| Program gi-docgen found: NO
| 
| ../gcr-4.0.0/docs/meson.build:1:0: ERROR: Program 'gi-docgen' not found or not executable
| 
| A full log can be found at /home/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32-gcr/4.0.0-r0/build/meson-logs/meson-log.txt
| WARNING: Running the setup command as `meson [options]` instead of `meson setup [options]` is ambiguous and deprecated.
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.
NOTE: recipe lib32-gcr-4.0.0-r0: task do_configure: Failed

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3851/steps/11/logs/stdio

On 09/12/2022 07:57:32+0100, Markus Volk wrote:
> gcr-3 recipe is still needed for gnome projects that stick to gtk+3, rename to gcr3.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...1-gcr-meson.build-fix-one-parallel-build-failure.patch | 0
>  .../b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch        | 0
>  meta/recipes-gnome/gcr/{gcr_3.40.0.bb => gcr3_3.40.0.bb}  | 8 ++++++--
>  3 files changed, 6 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/gcr/{gcr => gcr3}/0001-gcr-meson.build-fix-one-parallel-build-failure.patch (100%)
>  rename meta/recipes-gnome/gcr/{gcr => gcr3}/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch (100%)
>  rename meta/recipes-gnome/gcr/{gcr_3.40.0.bb => gcr3_3.40.0.bb} (87%)
> 
> diff --git a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> similarity index 100%
> rename from meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> rename to meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> diff --git a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> similarity index 100%
> rename from meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> rename to meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> similarity index 87%
> rename from meta/recipes-gnome/gcr/gcr_3.40.0.bb
> rename to meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> index 917be5938b..5318768db6 100644
> --- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> @@ -20,11 +20,15 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>  inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
>  UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
>  
> -SRC_URI += "file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \ 
> -            file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
> +SRC_URI = " \
> +	https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive \
> +	file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \
> +	file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
>  
>  SRC_URI[archive.sha256sum] = "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
>  
> +S = "${WORKDIR}/gcr-${PV}"
> +
>  PACKAGECONFIG ??= " \
>  	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
>  	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174431): https://lists.openembedded.org/g/openembedded-core/message/174431
> Mute This Topic: https://lists.openembedded.org/mt/95556149/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

