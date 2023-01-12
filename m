Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573F6C61DB3
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 19:54:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.66557.1673553243496476537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 11:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R4fvKSqv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3BDDCFF805;
	Thu, 12 Jan 2023 19:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673553241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kkl/K6YeTAgTWmZhGLHWLQd1nJDxBZYmKsghcc69GuQ=;
	b=R4fvKSqvZXEoHjbG8t/GUhlzfb9LYaMWKss2aQQ9vd9RWuly2Q9Uk6zlNqOoxwL04oGPwF
	eclYLzbBBBt3Hgvf7fwqKek9s57yzoLt9yF6b9oa5mPY/NUCxxBw5JzXTDVIs52Yr7ecRi
	+Jsqko7anptLBIfX7TIuCK/upjBRBA8xpFWitaWEgk3wmGmmCljbBBtGc1jPBo/A0cBCuG
	DXkGtbZ/CmE49090MWGN8BwLsdUhUlYg+xQMoQ/N8P1310PcUcZnJAiixR7PltamBUmMRP
	MSL35sAJRIt5PgpurMm+DSQCaqIVLkORm0F6Q1l03pMNmy4fzTOh+FG6xR7fPw==
Date: Thu, 12 Jan 2023 20:54:00 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] recipes, classes: Avoid adding extra
 whitespace to PACKAGESPLITFUNCS
Message-ID: <Y8BlWNDwloIpjRNH@mail.local>
References: <173785AB93CB2417.1583@lists.openembedded.org>
 <5cbe7b87dc2345daad1cc4cdd5bcece8@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cbe7b87dc2345daad1cc4cdd5bcece8@axis.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 19:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175805

This was under testing for a while and I couldn't get a successful
build until today. I've now sent it to Richard.

On 12/01/2023 14:57:48+0000, Peter Kjellerstedt wrote:
> *ping*
> 
> //Peter
> 
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 5 januari 2023 22:06
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] recipes, classes: Avoid adding extra whitespace
> > to PACKAGESPLITFUNCS
> > 
> > This is a follow-up to commit 846ff49465 to remove the extra whitespace
> > that is no longer needed after converting :append and :prepend to += and
> > =+.
> > 
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/classes-recipe/kernel-module-split.bbclass               | 2 +-
> >  meta/classes-recipe/kernel.bbclass                            | 2 +-
> >  meta/classes-recipe/systemd.bbclass                           | 2 +-
> >  meta/classes-recipe/update-alternatives.bbclass               | 2 +-
> >  meta/classes-recipe/update-rc.d.bbclass                       | 4 ++--
> >  .../wpa-supplicant/wpa-supplicant_2.10.bb                     | 2 +-
> >  meta/recipes-devtools/perl/perl_5.36.0.bb                     | 2 +-
> >  meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
> >  .../gstreamer/gstreamer1.0-plugins-license.inc                | 2 +-
> >  .../gstreamer/gstreamer1.0-plugins-packaging.inc              | 4 ++--
> >  meta/recipes-support/libevent/libevent_2.1.12.bb              | 2 +-
> >  11 files changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> > b/meta/classes-recipe/kernel-module-split.bbclass
> > index 4943717487..50882c31a7 100644
> > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > @@ -35,7 +35,7 @@ do_install:append() {
> >  }
> > 
> >  KERNEL_SPLIT_MODULES ?= "1"
> > -PACKAGESPLITFUNCS =+ "split_kernel_module_packages "
> > +PACKAGESPLITFUNCS =+ "split_kernel_module_packages"
> > 
> >  KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or
> > "kernel" }-modules"
> > 
> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-
> > recipe/kernel.bbclass
> > index c36632b0a7..bd3b6471c6 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -705,7 +705,7 @@ pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> >  	fi
> >  }
> > 
> > -PACKAGESPLITFUNCS =+ "split_kernel_packages "
> > +PACKAGESPLITFUNCS =+ "split_kernel_packages"
> > 
> >  python split_kernel_packages () {
> >      do_split_packages(d, root='${nonarch_base_libdir}/firmware',
> > file_regex=r'^(.*)\.(bin|fw|cis|csp|dsp)$',
> > output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware
> > for %s', recursive=True, extra_depends='')
> > diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-
> > recipe/systemd.bbclass
> > index ae98043d29..f9c92e6c2a 100644
> > --- a/meta/classes-recipe/systemd.bbclass
> > +++ b/meta/classes-recipe/systemd.bbclass
> > @@ -205,7 +205,7 @@ python systemd_populate_packages() {
> >          systemd_check_services()
> >  }
> > 
> > -PACKAGESPLITFUNCS =+ "systemd_populate_packages "
> > +PACKAGESPLITFUNCS =+ "systemd_populate_packages"
> > 
> >  python rm_systemd_unitdir (){
> >      import shutil
> > diff --git a/meta/classes-recipe/update-alternatives.bbclass
> > b/meta/classes-recipe/update-alternatives.bbclass
> > index ec81763c89..55e0b954d6 100644
> > --- a/meta/classes-recipe/update-alternatives.bbclass
> > +++ b/meta/classes-recipe/update-alternatives.bbclass
> > @@ -265,7 +265,7 @@ def update_alternatives_alt_targets(d, pkg):
> > 
> >      return updates
> > 
> > -PACKAGESPLITFUNCS =+ "populate_packages_updatealternatives "
> > +PACKAGESPLITFUNCS =+ "populate_packages_updatealternatives"
> > 
> >  python populate_packages_updatealternatives () {
> >      if not update_alternatives_enabled(d):
> > diff --git a/meta/classes-recipe/update-rc.d.bbclass b/meta/classes-
> > recipe/update-rc.d.bbclass
> > index a61d2c62ab..a19e704741 100644
> > --- a/meta/classes-recipe/update-rc.d.bbclass
> > +++ b/meta/classes-recipe/update-rc.d.bbclass
> > @@ -68,8 +68,8 @@ python __anonymous() {
> >      update_rc_after_parse(d)
> >  }
> > 
> > -PACKAGESPLITFUNCS =+ "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit',
> > 'populate_packages_updatercd ', '', d)}"
> > -PACKAGESPLITFUNCS:remove:class-nativesdk = "populate_packages_updatercd "
> > +PACKAGESPLITFUNCS =+ "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit',
> > 'populate_packages_updatercd', '', d)}"
> > +PACKAGESPLITFUNCS:remove:class-nativesdk = "populate_packages_updatercd"
> > 
> >  populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm
> > updatercd_postinst"
> >  populate_packages_updatercd[vardepsexclude] += "OVERRIDES"
> > diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-
> > supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-
> > supplicant_2.10.bb
> > index 254cfd3f0c..46604045da 100644
> > --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> > +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> > @@ -134,4 +134,4 @@ python split_wpa_supplicant_libs () {
> >          d.setVar('RRECOMMENDS:' + pn + '-plugins', '
> > '.join(split_packages))
> >          d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + '
> > '.join(split_dbg_packages))
> >  }
> > -PACKAGESPLITFUNCS += "split_wpa_supplicant_libs "
> > +PACKAGESPLITFUNCS += "split_wpa_supplicant_libs"
> > diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-
> > devtools/perl/perl_5.36.0.bb
> > index 3458e6a5b0..4d8a919d1e 100644
> > --- a/meta/recipes-devtools/perl/perl_5.36.0.bb
> > +++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
> > @@ -302,7 +302,7 @@ ALTERNATIVE_LINK_NAME[Thread.3] =
> > "${mandir}/man3/Thread.3"
> >  ALLOW_EMPTY:${PN}-modules = "1"
> >  PACKAGES += "${PN}-modules "
> > 
> > -PACKAGESPLITFUNCS =+ "split_perl_packages "
> > +PACKAGESPLITFUNCS =+ "split_perl_packages"
> > 
> >  python split_perl_packages () {
> >      libdir = d.expand('${libdir}/perl5/${PV}')
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> > graphics/mesa/mesa.inc
> > index 2535dd403d..77aa97069a 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -291,7 +291,7 @@ python mesa_populate_packages() {
> >      do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-
> > driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
> >  }
> > 
> > -PACKAGESPLITFUNCS =+ "mesa_populate_packages "
> > +PACKAGESPLITFUNCS =+ "mesa_populate_packages"
> > 
> >  PACKAGES_DYNAMIC += "^mesa-driver-.*"
> >  PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > license.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > license.inc
> > index 03595e7d32..8b1c001111 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
> > @@ -1,7 +1,7 @@
> >  # This .inc file contains functionality for automatically setting
> >  # the the license of all plugins according to the GSTREAMER_GPL.
> > 
> > -PACKAGESPLITFUNCS += " set_gstreamer_license "
> > +PACKAGESPLITFUNCS += "set_gstreamer_license"
> > 
> >  python set_gstreamer_license () {
> >      import oe.utils
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > packaging.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > packaging.inc
> > index 837d5a1a62..d77aeed8a2 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
> > @@ -9,8 +9,8 @@
> >  # Dynamically generate packages for all enabled plugins
> >  PACKAGES_DYNAMIC = "^${PN}-.* ^libgst.*"
> > 
> > -PACKAGESPLITFUNCS =+ " split_gstreamer10_packages "
> > -PACKAGESPLITFUNCS += " set_gstreamer10_metapkg_rdepends "
> > +PACKAGESPLITFUNCS =+ "split_gstreamer10_packages"
> > +PACKAGESPLITFUNCS += "set_gstreamer10_metapkg_rdepends"
> > 
> >  python split_gstreamer10_packages () {
> >      gst_libdir = d.expand('${libdir}/gstreamer-1.0')
> > diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb
> > b/meta/recipes-support/libevent/libevent_2.1.12.bb
> > index 88b81fd56e..25388fb4d7 100644
> > --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
> > +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
> > @@ -41,7 +41,7 @@ PACKAGES_DYNAMIC = "^${PN}-.*$"
> >  python split_libevent_libs () {
> >      do_split_packages(d, '${libdir}', r'^libevent_([a-z]*)-.*\.so\..*',
> > '${PN}-%s', '${SUMMARY} (%s)', prepend=True, allow_links=True)
> >  }
> > -PACKAGESPLITFUNCS =+ "split_libevent_libs "
> > +PACKAGESPLITFUNCS =+ "split_libevent_libs"
> > 
> >  BBCLASSEXTEND = "native nativesdk"
> > 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175798): https://lists.openembedded.org/g/openembedded-core/message/175798
> Mute This Topic: https://lists.openembedded.org/mt/96081294/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

