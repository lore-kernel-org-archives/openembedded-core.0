Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id DDBAE6E660
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 04:02:32 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id hl6so12589678pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 21:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=7jMNdWsyMYIEXvprulzZOWQcmY0LKlLXO9bNnbzVRrk=;
	b=PFnQHePITuOD/IQSW/UPsNQ0otcS2sbt4zG+BmtkmrhjTl5Fmed+fIrrkyzpFVZd12
	N6yotUMNJVudLbf/YQuE1kpcNy57WiyokGxgVThdkKEz+bu5IaVTcUNcIDlAgxtaM0MR
	MMfRIjU1zUGBr5l+XvA/nVZg0czJ6+yVc7+MrNjx/eVo4eSAM2XYdXvs/ubxSK3KfLRf
	WikCq+Tven5hEI6Jyv3a5BArT5W8R3mE4UltoWBDYju9JJ9f+EMBkii76JTBPOggJfMR
	kUl6VNeDWCXEcNqmcrIU0npKN8YC33Zwr0p0EdLzCC1cKZmKhBXakqR7WxcIUYahjhDj
	E/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=7jMNdWsyMYIEXvprulzZOWQcmY0LKlLXO9bNnbzVRrk=;
	b=CE5HvwF8mu8GwH8cXZx1SuVRMISHLfvwzo8cF8PDZ6L1t05HvCLAyO0F8kRt9IOIwd
	kZ33FM85di65W2A//uG+3YPZ3gw/YLYnVDB9LJXAxfpK0e2UBj2suzD0P5pCEZOIh9xa
	g7HFQNNXr2XzPltUGqw4z4yeqYhkirM/cf0GA8n5fQqL6ltiaZCvbaEpJ3OUZNhH7Wgy
	HSmk/plex4LPFBEIOqzVGOQhVM2oHoflDJS8OjD4grwxKqOIJ1cAEgv37FU9u0/PuMJs
	JzkxnnFzzuh4fedcASsW8JGMPxcJTlqwK5i4LCfBuM/qInaSxhtX9a9JjFLR4Bk6G5A2
	Yl3w==
X-Gm-Message-State: ALyK8tJQ3jKSzcn7ChNmP1TC5PM440C/pdfXxzGu6U/wafDy1TDCZ7y2TnTIOXCekU1J0g==
X-Received: by 10.66.139.230 with SMTP id rb6mr32402900pab.101.1466568151945; 
	Tue, 21 Jun 2016 21:02:31 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:509e:4be1:bb63:3d6f?
	([2601:202:4001:9ea0:509e:4be1:bb63:3d6f])
	by smtp.googlemail.com with ESMTPSA id
	7sm69942990pfa.28.2016.06.21.21.02.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2016 21:02:30 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20160621184229.GB14456@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <576A0DCD.6000200@gmail.com>
Date: Tue, 21 Jun 2016 21:02:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160621184229.GB14456@jama>
Subject: Re: State of bitbake world 2016-06-20
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2016 04:02:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 06/21/2016 11:42 AM, Martin Jansa wrote:
> xfce4-terminal and toscoterm are broken since vte upgrade in oe-core,
> there is some discussion about re-introducing older version, but no
> patches for meta-oe yet.
> 
> poco is pending review which I'll drop from master-next
> 
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date		     !!colspan='3'|Failed tasks			    !!colspan='6'|Failed depencencies			 !!|Signatures		  !!colspan='12'|QA !!Comment
> |-
> ||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||min	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||	
> |-
> ||2016-06-20	||5	||6	||6	||27	||9	||8	||27	||9	||8	||0	||0		||0		||1		||5		||23		||0		||1		||1		||0		||0		||0		||0		||	
> |}
> 
> http://www.openembedded.org/wiki/Bitbake_World_Status
> 
> == Failed tasks 2016-06-20 ==
> 
> INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20160621_083300.log
> 
> === common (4) ===
>     * meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-support/poco/poco_1.7.3.bb:do_fetch
>     * meta-openembedded/meta-oe/recipes-support/toscoterm/toscoterm_git.bb:do_compile
>     * meta-openembedded/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb:do_configure
> 
> === common-x86 (1) ===
>     * openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_compile
> 
> === qemuarm (1) ===
>     * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_compile
> 
> === qemux86 (1) ===
>     * meta-openembedded/meta-networking/recipes-kernel/netmap/netmap_git.bb:do_configure

i'll look into this one.

- armin
> 
> === qemux86_64 (1) ===
>     * openembedded-core/meta/recipes-core/meta/meta-ide-support.bb:do_package_write_ipk
> 
> === Number of failed tasks (17) ===
> {| class=wikitable
> |-
> || qemuarm 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.qemuarm.20160620_000642.log/ || http://errors.yoctoproject.org/Errors/Build/17481/
> |-
> || qemux86 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.qemux86.20160620_000431.log/ || http://errors.yoctoproject.org/Errors/Build/17475/
> |-
> || qemux86_64 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.qemux86-64.20160620_035805.log/ || http://errors.yoctoproject.org/Errors/Build/17495/
> |}
> 
> === PNBLACKLISTs (142) ===
> === QA issues (31) ===
> {| class=wikitable
> !| Count		||Issue
> |-
> ||0	||already-stripped
> |-
> ||0	||invalid-pkgconfig
> |-
> ||0	||libdir
> |-
> ||0	||pkgname
> |-
> ||0	||symlink-to-sysroot
> |-
> ||0	||unknown-configure-option
> |-
> ||0	||version-going-backwards
> |-
> ||1	||host-user-contaminated
> |-
> ||1	||installed-vs-shipped
> |-
> ||1	||textrel
> |-
> ||23	||file-rdeps
> |-
> ||5	||build-deps
> |}
> 
> 
> 
> === Failed dependencies for qemuarm (27) ===
> 
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log/
> Found differences: 
>     * WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
>     * WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependency?
>     * WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build dependency?
>     * WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a build dependency?
>     * WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build dependency?
>     * WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependency?
>     * WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependency?
> Found errors: 
>     * ERROR: 27 issues were found in these recipes: chkconfig-alternatives-native enchant gnome-disk-utility gtkmathview jasper libdrm meta-world-pkgdata netmap poco proxy-libintl samba tiptop toscoterm xfce4-terminal
> 
> === Recipes failing with maximal dependencies for qemuarm (9) ===
>     * chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//2_max/failed/chkconfig-alternatives-native.log
>     * gnome-disk-utility -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//2_max/failed/gnome-disk-utility.log
>     * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//2_max/failed/gtkmathview.log
>     * meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//2_max/failed/meta-world-pkgdata.log
>     * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//2_max/failed/netmap.log
>     * poco -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//2_max/failed/poco.log
>     * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//2_max/failed/proxy-libintl.log
>     * toscoterm -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//2_max/failed/toscoterm.log
>     * xfce4-terminal -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//2_max/failed/xfce4-terminal.log
> 
> === Recipes failing with minimal dependencies for qemuarm (8) ===
>     * gnome-disk-utility -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//3_min/failed/gnome-disk-utility.log
>     * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//3_min/failed/gtkmathview.log
>     * meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//3_min/failed/meta-world-pkgdata.log
>     * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//3_min/failed/netmap.log
>     * poco -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//3_min/failed/poco.log
>     * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//3_min/failed/proxy-libintl.log
>     * toscoterm -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//3_min/failed/toscoterm.log
>     * xfce4-terminal -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemuarm.20160620_203348.log//3_min/failed/xfce4-terminal.log
> 
> === Failed dependencies for qemux86 (27) ===
> 
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log/
> Found differences: 
>     * WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a build dependency?
>     * WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build dependency?
>     * WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependency?
>     * WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
>     * WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependency?
>     * WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build dependency?
>     * WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependency?
> Found errors: 
>     * ERROR: 27 issues were found in these recipes: chkconfig-alternatives-native enchant gnome-disk-utility gtkmathview jasper libdrm netmap piglit poco proxy-libintl samba toscoterm xfce4-terminal
> 
> === Recipes failing with maximal dependencies for qemux86 (9) ===
>     * chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//2_max/failed/chkconfig-alternatives-native.log
>     * gnome-disk-utility -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//2_max/failed/gnome-disk-utility.log
>     * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//2_max/failed/gtkmathview.log
>     * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//2_max/failed/netmap.log
>     * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//2_max/failed/piglit.log
>     * poco -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//2_max/failed/poco.log
>     * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//2_max/failed/proxy-libintl.log
>     * toscoterm -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//2_max/failed/toscoterm.log
>     * xfce4-terminal -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//2_max/failed/xfce4-terminal.log
> 
> === Recipes failing with minimal dependencies for qemux86 (8) ===
>     * gnome-disk-utility -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//3_min/failed/gnome-disk-utility.log
>     * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//3_min/failed/gtkmathview.log
>     * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//3_min/failed/netmap.log
>     * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//3_min/failed/piglit.log
>     * poco -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//3_min/failed/poco.log
>     * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//3_min/failed/proxy-libintl.log
>     * toscoterm -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//3_min/failed/toscoterm.log
>     * xfce4-terminal -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.20160621_001611.log//3_min/failed/xfce4-terminal.log
> 
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> 
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20160621_021735.log/
> 
> No issues detected
> 
> 
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?= "BROKEN: fails to build with gcc-6"
> recipes-browser/chromium/chromium_48.0.2548.0.bb:PNBLACKLIST[chromium] ?= "BROKEN: fails to build with gcc-6"
> recipes-mozilla/firefox/firefox_38.7.1esr.bb:PNBLACKLIST[firefox] ?= "BROKEN: fails to build with gcc-6"
> meta-openembedded:
> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken: switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. invalid state name: 'off'. "default" state must always be first."
> meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?= "Depends on blacklisted webkit-efl"
> meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?= "OLD and depends on broken azy"
> meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
> meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/enlightenment/modules/news.git/"
> meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from  http://git.enlightenment.org/apps/rage.git/"
> meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?= "depends on blacklisted emprint"
> meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?= "OLD and doesn't build with gcc-5"
> meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?= "BROKEN: fails to build with latest oe-core"
> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?= "broken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: 'defaault'. "default" state must always be first."
> meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?= "Depends on broken poppler"
> meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?= "Old and unmaintaned fork with many security issues"
> meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with more strict ejde_cc from efl-1.13"
> meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?= "BROKEN: images are not displayed anymore"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer"
> meta-gnome/recipes-devtools/glade/glade3_%.bbappend:PNBLACKLIST[glade3] ?= "Depends on broken libgnomeui"
> meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PNBLACKLIST[gtk-theme-torturer] ?= "BROKEN: gmacros.h:182:53: error: size of array '_GStaticAssertCompileTimeAssertion_2' is negative"
> meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb:PNBLACKLIST[abiword] ?= "Depends on broken gtkmathview"
> meta-gnome/recipes-gnome/evince/evince_3.18.2.bb:PNBLACKLIST[evince] ?= "Depends on broken poppler"
> meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctool] ?= "broken at least since April 2013 http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and nobody complained, it's also replaced by gnome calculator"
> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?= "Depends on broken gnome-panel"
> meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb:PNBLACKLIST[gedit] ?= "Depends on broken gtksourceview2"
> meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from oe-core"
> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gnome-menus3] ?= "CONFLICT: 24 files are conflicting with gnome-menus"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3] ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[gnome-panel] ?= "Depends on broken libgweather"
> meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:PNBLACKLIST[gnome-power-manager] ?= "BROKEN: not compatible with current libnotify"
> meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:PNBLACKLIST[gnome-session] ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-terminal] ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecups] ?= "Depends on broken libgnomeui"
> meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnomeprint] ?= "Depends on broken libgnomecups"
> meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric] ?= "Depends on broken libgnomeprint"
> meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb:PNBLACKLIST[gtksourceview2] ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3] ?= "CONFLICT: 876 files are conflicting with libgweather"
> meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgweather] ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb:PNBLACKLIST[libgnomeui] ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3] ?= "BROKEN: fails to build, maybe missing dependency on gnome-desktop-utils.h provider"
> meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?= "Fails to build with gcc-6"
> meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?= "Fails to build with gcc-6"
> meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLACKLIST[system-tools-backends] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S"
> meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice] ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker] ?= "Depends on broken poppler"
> meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader] ?= "BROKEN: fails to build with gcc-6"
> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?= "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
> meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoolnix] ?= "BROKEN: Failx to build with gcc-5"
> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S})"
> meta-multimedia/recipes-multimedia/faac/faac_1.28.bb:PNBLACKLIST[faac] ?= "BROKEN: fails to build with gcc-6"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNBLACKLIST[gst-ffmpeg] ?= "Not compatible with currently used ffmpeg 3"
> meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gst123] ?= "gst123 is still "sometimes" using wrong sysroot"
> meta-networking/recipes-connectivity/crda/crda_3.18.bb:PNBLACKLIST[crda] ?= "BROKEN: fails to build with gcc-6"
> meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb:PNBLACKLIST[lftp] ?= "BROKEN: fails to build with gcc-6"
> meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb:PNBLACKLIST[snort] ?= "BROKEN: QA Issue: snort_preproc.pc, snort_output.pc, snort.pc"
> meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?= "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were installed but not shipped in any package:"
> meta-networking/recipes-daemons/squid/squid_3.5.7.bb:PNBLACKLIST[squid] ?= "BROKEN: sysroots/qemuarm/usr/include/linux/in.h:28:16: error: redeclaration of 'IPPROTO_IP'"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACKLIST[lksctp-tools] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools] ?= "BROKEN: fails to build for qemuarm."
> meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools"
> meta-oe/recipes-benchmark/glmark2/glmark2_git.bb:PNBLACKLIST[glmark2] ?= "BROKEN: fails to build with gcc-6"
> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb:PNBLACKLIST[libqmi] ?= "BROKEN: fails to build with gcc-6"
> meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb:PNBLACKLIST[modemmanager] ?= "Depends on broken libqmi"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb:PNBLACKLIST[thrift] ?= "BROKEN: fails to build with gcc-6"
> meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?= "Depends on broken wvstreams"
> meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstreams] ?= "BROKEN: fails to build with gcc-6"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
> meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?= "BROKEN: QA Issue: -dev package contains non-symlink .so"
> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?= "Not comatible with current nodejs 0.12, but upstream is working on it for v3"
> meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?= "BROKEN: fails since last autotools.bbclass changes"
> meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb:PNBLACKLIST[mpich] ?= "BROKEN: QA Issue: libmpi.la failed sanity test (workdir), QA Issue: mpich.pc failed sanity test (tmpdir)"
> meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[packagekit] ?= "BROKEN: depends on old deprecated libopkg which is currently disabled and will be removed soon"
> meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb:PNBLACKLIST[python-pygobject] ?= "BROKEN: fails to build since it was moved to meta-oe"
> meta-oe/recipes-extended/collectd/collectd_5.5.0.bb:PNBLACKLIST[collectd] ?= "BROKEN: fails to build with glibc-2.24"
> meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb:PNBLACKLIST[gtkmathview] ?= "BROKEN: fails to build with gcc-6"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?= "BROKEN: Fails to build with gcc-5"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb:PNBLACKLIST[gimp] ?= "Depends on broken poppler"
> meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb:PNBLACKLIST[glcompbench] ?= "BROKEN: fails to build with gcc-6"
> meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them"
> meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb:PNBLACKLIST[tesseract] ?= "BROKEN: QA Issue: tesseract.pc failed sanity test (tmpdir)"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode] ?= "BROKEN, fails to build"
> meta-oe/recipes-kernel/crash/crash_7.1.3.bb:PNBLACKLIST[crash] ?= "BROKEN: fails to build with gcc-6"
> meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?= "Not compatible with 3.19 kernel"
> meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?= "Depends on blacklisted kernel-module-ktapvm"
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?= "Not compatible with currently used ffmpeg 3"
> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?= "BROKEN: fails to build with gcc-5"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail] ?= "depends on ?= "Depends on broken tcl"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
> meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb:PNBLACKLIST[python-cloudeebus] ?= "Rdepends on broken python-pygobject"
> meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb:PNBLACKLIST[python-dbusmock] ?= "Depends on broken python-pygobject"
> meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb:PNBLACKLIST[mousepad] ?= "Depends on broken gtksourceview2"
> meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb:PNBLACKLIST[tumbler] ?= "Depends on broken poppler"
> meta-qt5:
> meta-smartphone:
> meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:PNBLACKLIST[libframeworkd-glib] ?= "BROKEN: many errors when building with gcc-6"
> meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zhone] ?= "rdepends on python-pycairo which was removed"
> meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedcaching] ?= "RDEPENDS on python-pygtk was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?= "broken: depends on blacklisted fltk"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] = "rdepends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?= "depends on blacklisted iksemel"
> meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps] ?= "RDEPENDS on python-pygtk which was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?= "RDEPENDS on python-pygtk which was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?= "Depends on blacklisted packagekit"
> meta-webos-ports:
> meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACKLIST[luna-webappmanager] ?= "BROKEN: needs to be adapted to new qt-5.7"
> meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?= "BROKEN: needs to be adapted to new qtwayland-5.7"
> PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested so much"
> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
> PNBLACKLIST[build-appliaGECONFIG? [build-deps]
> sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof rdepends on polkit, but it isn't a build dependency, missing polkit in DEPENDS or PACKAGECONFIG? [build-deps]
> 
> 
> count: 23	issue: file-rdeps
> chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires libnewt.so()(64bit), but no providers found in RDEPENDS_chkconfig? [file-rdeps]
> chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires libnewt.so, but no providers found in RDEPENDS_chkconfig? [file-rdeps]
> enchant-1.6.0: /usr/lib/enchant/libenchant_myspell.so contained in package enchant requires libhunspell-1.3.so.0()(64bit), but no providers found in RDEPENDS_enchant? [file-rdeps]
> enchant-1.6.0: /usr/lib/enchant/libenchant_myspell.so contained in package enchant requires libhunspell-1.3.so.0, but no providers found in RDEPENDS_enchant? [file-rdeps]
> libdrm-2.4.68: /usr/bin/amdgpu_test contained in package libdrm-tests requires libcunit.so.1()(64bit), but no providers found in RDEPENDS_libdrm-tests? [file-rdeps]
> libdrm-2.4.68: /usr/bin/amdgpu_test contained in package libdrm-tests requires libcunit.so.1, but no providers found in RDEPENDS_libdrm-tests? [file-rdeps]
> libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmodule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl.real, but no providers found in RDEPENDS_libmodule-build-perl? [file-rdeps]
> libnewt-0.52.19: /usr/bin/whiptail contained in package whiptail requires libnewt.so()(64bit), but no providers found in RDEPENDS_whiptail? [file-rdeps]
> libnewt-0.52.19: /usr/bin/whiptail contained in package whiptail requires libnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]
> libnewt-python-0.52.19: /usr/lib/python3.5/site-packages/_snack.so contained in package libnewt-python requires libnewt.so()(64bit), but no providers found in RDEPENDS_libnewt-python? [file-rdeps]
> libnewt-python-0.52.19: /usr/lib/python3.5/site-packages/_snack.so contained in package libnewt-python requires libnewt.so, but no providers found in RDEPENDS_libnewt-python? [file-rdeps]
> networkmanager-1.0.10: /usr/bin/nmtui-edit contained in package networkmanager-nmtui requires libnewt.so, but no providers found in RDEPENDS_networkmanager-nmtui? [file-rdeps]
> networkmanager-1.0.10: /usr/bin/nmtui-hostname contained in package networkmanager-nmtui requires libnewt.so()(64bit), but no providers found in RDEPENDS_networkmanager-nmtui? [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained in package numptyphysics requires /usr/bin/perl, but no providers found in RDEPENDS_numptyphysics? [file-rdeps]
> qt3d-5.6.99+5.7.0-beta+gitAUTOINC+be29a39ede: /usr/lib/qt5/plugins/sceneparsers/libassimpsceneparser.so contained in package qt3d-plugins requires libassimp.so.3()(64bit), but no providers found in RDEPENDS_qt3d-plugins? [file-rdeps]
> qt3d-5.6.99+5.7.0-beta+gitAUTOINC+be29a39ede: /usr/lib/qt5/plugins/sceneparsers/libassimpsceneparser.so contained in package qt3d-plugins requires libassimp.so.3, but no providers found in RDEPENDS_qt3d-plugins? [file-rdeps]
> qtvirtualkeyboard-5.6.99+5.7.0-beta+gitAUTOINC+42344a4b21: /usr/lib/qt5/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so contained in package qtvirtualkeyboard-plugins requires libhunspell-1.3.so.0()(64bit), but no providers found in RDEPENDS_qtvirtualkeyboard-plugins? [file-rdeps]
> qtvirtualkeyboard-5.6.99+5.7.0-beta+gitAUTOINC+42344a4b21: /usr/lib/qt5/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so contained in package qtvirtualkeyboard-plugins requires li ==
> latest upstream commit: 
> 2d63606 rootfs_rpm: Increase rootfs size
> not included in master yet: 
> 8ee8676 tcl: Only set BINCONFIG_GLOB for target builds
> a05c4fa qemux86: Add identical qemux86copy variant for tests
> 816ea84 sstate-sysroot-cruft.sh: Extend the whitelist
> a4a2612 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode,links"
> b859827 buildhistory.bbclass: metadata-revs show repo parent
> 31015c6 metadata-revs: provide more information
> 4fe4fc9 report-error: Allow to upload reports automatically
> 6e4b4e2 report-error.bbclass: use urllib2 instead of httplib, urllib
> fc6c133 icecc.bbclass: replace os.popen with subprocess.check_output
> 1517f8f report-error
> 
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit: 
> 9cd117a chrony: Versatile implementation of NTP
> not included in master yet: 
> 539de56 openconnect: add dependency to fix Makefile.am
> bf5805a openconnect: fix do_compile failure
> 01442db gtk-engines: Move from oe-core
> 79120dd python-pyephem_3.7.6.0.bb: Add new recipe.
> b8d8198 libgphoto2: correct compatibility issues with libjpeg-turbo-1.5.0
> e3717e0 v4lutils: Update to latest upstream
> 4112352 iperf: resolve issues with gcc6
> e3291a9 poco: update to 1.7.3
> 
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit: 
> 15a4f86 qtwayland: add dependency on libxcomposite
> not included in master yet: 
> 9b98004 qtbase: add PACKAGECONFIG for journald logging
> 
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit: 
> 825ea93 chromium: Add workarounds for compiler errors
> not included in master yet: 
> 93fb0a3 firefox, cef3, chromium: blacklist, fails to build with gcc-6
> 
> == Tested changes (not included in master yet) - meta-webos-ports ==
> latest upstream commit: 
> dc07b66 mmsd, packagegroup-webos-test: drop python-pygobject
> not included in master yet: 
> 
> == Tested changes (not included in master yet) - meta-smartphone ==
> latest upstream commit: 
> d6d9f42 tenderloin-bluetooth-utilities: Bump SRCREV
> not included in master yet: 
> cd39921 zhone: blacklist because of python-pycairo runtime dependency
> 35029f2 libframeworkd-glib: blacklist, fails with gcc-6
> b1ee9cc packagegroup-shr-feed: Remove firefox and fbreader
> c560043 frameworkd, mdbus, gta04-gps-handler, pisi: Remove runtime dependency on broken python-pygobject
> bea9494 packagegroup-shr-feed: drop oh-puzzles
> 105303b u-boot-mkimage: Backport fix from upstream to fix build with gcc-5
> af5cc06 linux-gta04: bump SRCREV to get fixes for build with gcc-5
> 5b2261a linux-gta04: enable SGX530
> 46ce288 defaulttunes.inc: switch to hf, because SGX SDK for SGX530 is available only for hf
> 66a7873 om-gta04: drop u-boot from EXTRA_IMAGEDEPENDS
> 9cfbb34 linux-gta04: upgrade to 4.4
> f412709 shr: add wayland to DISTRO_FEATURES
> 2d86ad1 linux-gta04: include linux-dtb
> 823d562 packagegroup-shr-feed: drop leafpad
> 
> 
> 

