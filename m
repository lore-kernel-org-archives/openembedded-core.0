Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 03D1271D97;
	Tue, 20 Dec 2016 12:30:18 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id he10so27503172wjc.2;
	Tue, 20 Dec 2016 04:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=3l3l7EHNZeTRTvU8S61i+I7DxSLAjwkIsq6QwFHKmP8=;
	b=XgjS23yoSHD0ZVAVlsVD1ZwYeYIaBWqZw59rYV83pdtX6ic5ttMnT4LInvAnmIL0DT
	cQrCzCYJ4cilCCIfU6Y61WfTm76+E0WkfAp5aiViJqk4CPBtbKkWR9Py2vRGNlX9Wz5q
	UTC+QsXUdgOEOlmgsRirV+LA1HTHdw7Rj5bLy3MEHpeJI300SAvnFJZTVhL/OKbtOxO4
	EHiOJy3Aewu5DALy6A+FuyY7gOuIQ0sboAqIBbIuKUoCqWQv83iBBN2dsmiKsmmKePBT
	pql6FygCUFv2dF2dLynFrRAFtKv8iZ8V0uKM5ChSSgxOhjHjx8nIAhC28JMtXNlqm+sz
	KmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=3l3l7EHNZeTRTvU8S61i+I7DxSLAjwkIsq6QwFHKmP8=;
	b=mq0KtSIK2LubVFi+tcgJB5c0rNg3I96GvLbGG8aHjjFLPqPJ+ir75nsOsIQkh42s4o
	WHI7Fzkyv2TboAvgOWeiRRzOJb7X+irXZ3OFo8IfQLXnlyJ+I+lB4VhsxQiXA87bBs/A
	Se0ZtVq0e1q0V7giggNUV4y8iBKLElyJXsEE8AgwCe5AOrmKcMjas49EhMOSQNrSjaAV
	2gUuxxvsGoymjYVmlmetx5mh5R7whVB9QqOsEIC0HOHMvqCtQBnp8rQ739RQ2vOnJSZH
	WRb3xC4nYTdUvFFi/fDd7p3R2ah5CxMzSMp11isQUyRLt5vyujN9MO108yTYo9xrl45Z
	zwxg==
X-Gm-Message-State: AKaTC007+wHVFv27a2NhwSWNlp5JMX7pXPEY49EnGts04FBez7MMT8So7tEmG+Nzx/dn1w==
X-Received: by 10.194.103.100 with SMTP id fv4mr18042107wjb.102.1482237019393; 
	Tue, 20 Dec 2016 04:30:19 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g17sm25379589wjs.38.2016.12.20.04.30.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Dec 2016 04:30:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Dec 2016 13:30:18 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20161220123018.GB3275@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2016-12-18
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
X-List-Received-Date: Tue, 20 Dec 2016 12:30:19 -0000
X-Groupsio-MsgNum: 91039
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !!|Signatures		  !!colspan=3D'12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||=09
|-
||2016-12-18	||0	||0	||0	||33	||8	||8	||45	||11	||11	||0	||0		||0		||2		||8=
		||4		||0		||1		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-12-18 =3D=3D

INFO: jenkins-job.sh-1.8.12 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20161220_022924.log

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (0) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20161217_135213.log/ ||=20
|-
|| qemux86 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20161217_135113.log/ ||=20
|-
|| qemux86_64 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20161218_150814.log/ ||=20
|}

=3D=3D=3D PNBLACKLISTs (115) =3D=3D=3D

=3D=3D=3D QA issues (15) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||1	||host-user-contaminated
|-
||2	||textrel
|-
||4	||file-rdeps
|-
||8	||build-deps
|}



=3D=3D=3D Failed dependencies for qemuarm (33) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161218_140914.log/
Found differences:=20
Found errors:=20
    * ERROR: 33 issues were found in these recipes: firefox hplip kodi php =
qtwayland usrsctp webkitgtk xf86-video-glamo

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (8) =3D=3D=
=3D
    * firefox -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161218_140914.log//2_max/failed/firefox.log
    * hplip -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemuarm.20161218_140914.log//2_max/failed/hplip.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161218_140914.log//2_max/failed/kodi.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemuarm.20161218_140914.log//2_max/failed/php.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161218_140914.log//2_max/failed/qtwayland.log
    * usrsctp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161218_140914.log//2_max/failed/usrsctp.log
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161218_140914.log//2_max/failed/webkitgtk.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20161218_140914.log//2_max/failed/xf86-video-gl=
amo.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (8) =3D=3D=
=3D
    * firefox -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161218_140914.log//3_min/failed/firefox.log
    * hplip -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemuarm.20161218_140914.log//3_min/failed/hplip.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161218_140914.log//3_min/failed/kodi.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemuarm.20161218_140914.log//3_min/failed/php.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161218_140914.log//3_min/failed/qtwayland.log
    * usrsctp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161218_140914.log//3_min/failed/usrsctp.log
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161218_140914.log//3_min/failed/webkitgtk.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20161218_140914.log//3_min/failed/xf86-video-gl=
amo.log

=3D=3D=3D Failed dependencies for qemux86 (45) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161219_145746.log/
Found differences:=20
Found errors:=20
    * ERROR: 45 issues were found in these recipes: chromium firefox hplip =
kodi php qtwayland qtwebengine usrsctp xf86-video-ati xf86-video-glamo xf86=
-video-nouveau

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (11) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161219_145746.log//2_max/failed/chromium.log
    * firefox -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161219_145746.log//2_max/failed/firefox.log
    * hplip -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemux86.20161219_145746.log//2_max/failed/hplip.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161219_145746.log//2_max/failed/kodi.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemux86.20161219_145746.log//2_max/failed/php.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161219_145746.log//2_max/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20161219_145746.log//2_max/failed/qtwebengine.log
    * usrsctp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161219_145746.log//2_max/failed/usrsctp.log
    * xf86-video-ati -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20161219_145746.log//2_max/failed/xf86-video-ati.=
log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20161219_145746.log//2_max/failed/xf86-video-gl=
amo.log
    * xf86-video-nouveau -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemux86.20161219_145746.log//2_max/failed/xf86-video-=
nouveau.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (11) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161219_145746.log//3_min/failed/chromium.log
    * firefox -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161219_145746.log//3_min/failed/firefox.log
    * hplip -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemux86.20161219_145746.log//3_min/failed/hplip.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161219_145746.log//3_min/failed/kodi.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemux86.20161219_145746.log//3_min/failed/php.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161219_145746.log//3_min/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20161219_145746.log//3_min/failed/qtwebengine.log
    * usrsctp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161219_145746.log//3_min/failed/usrsctp.log
    * xf86-video-ati -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20161219_145746.log//3_min/failed/xf86-video-ati.=
log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20161219_145746.log//3_min/failed/xf86-video-gl=
amo.log
    * xf86-video-nouveau -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemux86.20161219_145746.log//3_min/failed/xf86-video-=
nouveau.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20161218_200958.log/


    * ERROR: Execution of event handler 'buildhistory_eventhandler' failed
    * ERROR: Running idle function
    * ERROR: Execution of event handler 'buildhistory_eventhandler' failed
    * ERROR: Running idle function
    * ERROR: Execution of event handler 'buildhistory_eventhandler' failed
    * ERROR: Running idle function


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?=3D "Depends on b=
lacklisted webkit-efl"
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "OL=
D and depends on broken azy"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you w=
ant to use these modules with E18, then you need to update it to git recipe=
 fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from http://git.enlightenment.org/enlightenment/modules/n=
ews.git/"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from  http://git.enlightenment.org/apps/rage.git/"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "de=
pends on blacklisted emprint"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn't =
build with gcc-5"
meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=3D "BROKEN: =
fails to build with latest oe-core"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first."
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D "Ol=
d and unmaintaned fork with many security issues"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi] ?=
=3D "Depends on broken xfsprogs"
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump=
] ?=3D "Depends on broken xfsprogs"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: size o=
f array '_GStaticAssertCompileTimeAssertion_2' is negative"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends o=
n broken gnome-panel"
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.b=
b:PNBLACKLIST[gnome-control-center] ?=3D "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnom=
e-menus] ?=3D "BROKEN: fails to build because of python + conflicts with gn=
ome-menu3"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[gnom=
e-panel] ?=3D "Depends on broken libgweather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with current =
libnotify"
meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:PNBLACKLIST[=
gnome-session] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-t=
erminal] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecu=
ps] ?=3D "Depends on broken libgnomeui"
meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnome=
print] ?=3D "Depends on broken libgnomecups"
meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric] =
?=3D "Depends on broken libgnomeprint"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgwea=
ther] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=3D "Fai=
ls to build with gcc-6"
meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=3D "Fail=
s to build with gcc-6"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker] ?=
=3D "BROKEN: fails to build with new binutils-2.27"
meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoo=
lnix] ?=3D "BROKEN: Failx to build with gcc-5"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config w=
as removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS (t=
rying to install rendererconsole.py from ${B} instead of ${S})"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNB=
LACKLIST[gst-ffmpeg] ?=3D "Not compatible with currently used ffmpeg 3"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:PNBLACKLIST[net=
map-modules] ?=3D "BROKEN: not compatible with default kernel version 4.8"
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] ?=
=3D "BROKEN: Tries to build kernel module and fails, either it should be di=
sabled or there should be dependency on kernel like in netmap-modules"
meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[ac=
cel-ppp] ?=3D "BROKEN: fails to build with new binutils-2.27"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]=
 ?=3D "BROKEN: Depends on broken yp-tools"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 con=
flicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'blue=
z5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURE=
S', '', d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?=3D=
 "Depends on broken wvstreams"
meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstream=
s] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=3D=
 "BROKEN: QA Issue: -dev package contains non-symlink .so"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?=3D=
 "BROKEN: fails since last autotools.bbclass changes"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does no=
t build with distroless qemuarm as reported in 'State of bitbake world' thr=
ead, nobody volunteered to fix them"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S=
} in sed call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends on =
blacklisted kernel-module-ktapvm"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D "Not compatible with currently used ffmpeg 3"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BROK=
EN: fails to build with gcc-5"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]=
 ?=3D "depends on blacklisted libetpan"
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLAC=
KLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[c=
laws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claw=
s-plugin-rssyl] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-v=
cdiff] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D "Depends on blacklisted opencv"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb:PNBLACKLIST[openwbem] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACK=
LIST[vboxguestdrivers] ?=3D "BROKEN: not compatible with default kernel ver=
sion 4.8"
meta-qt5:
meta-smartphone:
meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:PN=
BLACKLIST[libframeworkd-glib] ?=3D "BROKEN: many errors when building with =
gcc-6"
meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zho=
ne] ?=3D "rdepends on python-pycairo which was removed"
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedca=
ching] ?=3D "RDEPENDS on python-pygtk was removed from oe-core"
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D "$=
{@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with blu=
ez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=3D =
"broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn't =
build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdepen=
ds on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:', d)}"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguins] =
?=3D "BROKEN: fails to build with new binutils-2.27"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit"
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACK=
LIST[luna-webappmanager] ?=3D "BROKEN: needs to be adapted to new qt-5.7"
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?=
=3D "BROKEN: needs to be adapted to new qtwayland-5.7"
PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation w=
hich isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads di=
rectory in /home/builder/poky :/"
PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weird sh!t breaking other=
 kernels and modules - broken for years"
PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t breaking other kernels a=
nd modules - broken for years"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel
corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2491+gitAUTOINC+86b71982e1: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2491+gitAUTOINC+86b71982e1-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 8	issue: build-deps
directfb-1.7.7: directfb rdepends on libvdpau, but it isn't a build depende=
ncy, missing libvdpau in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libx11, but it isn't a build dependenc=
y, missing libx11 in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxau, but it isn't a build dependenc=
y, missing libxau in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxcb, but it isn't a build dependenc=
y, missing libxcb in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxdmcp, but it isn't a build depende=
ncy, missing libxdmcp in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxext, but it isn't a build dependen=
cy, missing libxext in DEPENDS or PACKAGECONFIG? [build-deps]
gst-plugins-bad-0.10.23: gst-plugins-bad-zbar rdepends on zbar, but it isn'=
t a build dependency, missing zbar in DEPENDS or PACKAGECONFIG? [build-deps]
mpd-0.19.15: mpd rdepends on audiofile, but it isn't a build dependency, mi=
ssing audiofile in DEPENDS or PACKAGECONFIG? [build-deps]


count: 4	issue: file-rdeps
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl=
=2Ereal, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphoing-backwards


count: 1	issue: host-user-contaminated
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-anp-in/usr/lib/lo=
cale/anp_IN/LC_COLLATE is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
5063301 BBHandler: use with instead of open/close
not included in master yet:=20
aadcd35 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
f3e7533 utils: Always use datastore's PATH for host_gcc_version
not included in master yet:=20
87cf364 qemux86: Add identical qemux86copy variant for tests
f3a1c1a sstate-sysroot-cruft.sh: Extend the whitelist
1ddf2ae recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
c3c9bec buildhistory.bbclass: metadata-revs show repo parent
d96db92 metadata-revs: provide more information
2e8ea89 report-error: Allow to upload reports automatically

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
1c8720a ifenslave: make option '-h' work
not included in master yet:=20
3c464a2 syslog-ng: don't use update-alternatives to manage init script
43eead5 rsyslog: don't use update-alternatives to manage init script
2099d5c kodi: Add krypton/17.x Jarvis/16.x recipes
f51f13b kodi: Fix build with pic on x86_64
96b7e37 kodi-17: Add packageconfig for lcms support
c971a7c kodi-17: Fix build with musl
dab9304 kodi-17: Update to latest
eb83119 kodi-17: Fix build for qemuarm and update to latest
93afe70 makedumpfile: add ARM into COMPATIBLE_HOST
f5ee5c1 libupnp: Fix out-of-bound access in create_url_list() (CVE-2016-886=
3)
ed37053 protobuf: switch from mips16 to mips32 due to in-line assembler
ac437b6 php: add 7.1.0
a1f5340 opencv: Update repository location
35042c3 opencv: Metapkg should not rdepend on -staticdev
492c8ca opencv: Add missing depends
4177714 opencv: Add support for OpenJDK
e207612 opencv: Add support for python3
e356909 opencv: Add missing DEPEND for opencl PKGCFG
b994608 opencv: Add new PACKAGECONFIG dnn
80e9562 opencv: Merge dbg packages and Fix QA Issues
dd651a7 tinymembench: fix QA warning for GNU_HASH
1fc294e libmng: Add recipe
62d1908 zbar: Add recipe
d6f98d5 avro: Add recipe
928996e liboop: Add recipe
d3f5211 gimp: Enable libmng plugins
1d515cd gtest, gmock: update 1.7.0 -> 1.8.0
f4460c8 dibbler: add initial recipe, dibbler 1.0.1
ae67be3 zlog: Add recipe
aee6b7d usrsctp: Add recipe
527ee9b popplet: Disable PIE, it does not compile
23e7ba2 audiofile: update to 0.3.6
59ff316 esound: fix build after update of audiofile
80c4c42 hplip: Fix build with clang
f7d7c71 samba: rename initscript from 'samba.sh' to more common 'samba'
82e7e5a samba: install systemd units and initscripts unconditionally
5008770 samba: add smbclient package
8803596 samba: install manpages
d62a496 samba: simplify files list for samba-python
dfe5cd4 samba: split libraries into their own packages
b8f1ee3 samba: move /etc/sysconfig to more common /etc/default, package tmp=
files.d in samba-common
efdcafc samba: add packages samba-dsdb-modules, samba-testsuite and registr=
y-tools
65ac31d samba: start on boot with systemd
af547b7 samba: simplify LSB handling

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
c0ba8ab: use pkg-config to find nspr
3d896d5 firefox: do not link against crmf library - it is not there

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
9b7b58b libqofono: use the recipe from meta-qt5
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
176f337  linux-hp-tenderloin: Update kernel
not included in master yet:=20
0ad046f meta-fso: replace deprecated bb.data.getVar('PV',d,1) with d.getVar=
('PV', True)

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFkkWQAKCRA3VSO3ZXaA
HH/7AJ4oH/BBTDAlT72gMB7dzaf66/q8WgCfSoHXyJnZ33xZ4uCeVqYUk1njdRg=
=vUUQ
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
