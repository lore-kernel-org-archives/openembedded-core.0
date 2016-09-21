Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 671D86093E;
	Wed, 21 Sep 2016 21:43:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l132so10799967wmf.1;
	Wed, 21 Sep 2016 14:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HbJry/XOjKMI1qJIh5hbZ8r7hQI7Cevh9iPcZ3kmPro=;
	b=x2P5TtYhfezXSAX1Hj6Gl3IBT7czNVvrJJDyVaFV+JwtUvHfkkeJQz3i2R5ybce2V7
	IboIFh6NtdqDZAjJd11TsvjpjdAbywoxPNP/alfY6ig3hNKq6KAzr9YgzQ/kLUYJdUAR
	ZVIGZ9Eu/VyvckAtliuvZ5YdsWg/GIodhiFpjHwmrhh1oUPda5Lb8qLY20sCM1g2oNZK
	0T4Zfa+fT1HUZ6zgKo25Q8nBf9Xb+BFZSY6KO8u3XN42gHPXeFLrHqK1p966cabR+JP4
	hqeUGGbkp2fDn2V67cjpwfmcEPkclZXsE+egW5ztd8jqucpMq8tnO9ZC+KBHftIk0BCW
	f9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HbJry/XOjKMI1qJIh5hbZ8r7hQI7Cevh9iPcZ3kmPro=;
	b=WEWMvhBjFND9F6L1Q2H6MJIMLbXQyBGtJwbw3MzZt7ypWk20SHbn0vkAfK5CwvLCc+
	NuFeIjUA20M5N2yjjIski1xz/bCQBV14/qTpsFUfxNdyUYxctWAR0AeUI09dRQtLsIz9
	DWni0Yu5YJG5dYz4dtLaV+xD0E8urS0aHoMgtzGrbzBlMXabQUULMUUxMpvirVeZVEEx
	sEticp/j123ZSVynsIMh2Vy9Sobh6Vl1NeSfObm2hKu5ZAh0xhINJCdozObGZm39ky68
	UjMP8lQSiNIaPoJZTqWqvZudWHf2vU0+s5bCsT19aU0/DAk6NJBq261akO0tenzFoSWY
	8qAw==
X-Gm-Message-State: AE9vXwMIMpx0CmswTunPbaLDSJVoohKLg4af2wtagLtlGqmwmeBN71MUH3Am9AljcKO1icQ3JAYCRqBOQQtCWg==
X-Received: by 10.28.58.79 with SMTP id h76mr4750310wma.45.1474494227964; Wed,
	21 Sep 2016 14:43:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.140.2 with HTTP; Wed, 21 Sep 2016 14:43:47 -0700 (PDT)
In-Reply-To: <CAAQYJAsNk1uzCdKXeV9GdNOq4yNhZ3FA+HeD+5_MRTD-fU-LWw@mail.gmail.com>
References: <20160921201900.GA8206@jama>
	<CAAQYJAsNk1uzCdKXeV9GdNOq4yNhZ3FA+HeD+5_MRTD-fU-LWw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 21 Sep 2016 23:43:47 +0200
Message-ID: <CAAQYJAs=1=YRTjmk9cCs-FCmd6ObfwG_Fk3cinE5E_Gu3rw5PA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world 2016-09-20
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
X-List-Received-Date: Wed, 21 Sep 2016 21:43:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 10:38 PM, Andrea Adami <andrea.adami@gmail.com> wro=
te:
> On Wed, Sep 21, 2016 at 10:19 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>>
>> =3D=3D Number of issues - stats =3D=3D
>> {| class=3D'wikitable'
>> !|Date               !!colspan=3D'3'|Failed tasks                     !!=
colspan=3D'6'|Failed depencencies                    !!|Signatures         =
   !!colspan=3D'12'|QA !!Comment
>> |-
>> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||qemuar=
m||max||min     ||qemux86||max||min     ||all   ||already-stripped      ||l=
ibdir        ||textrel       ||build-deps    ||file-rdeps    ||version-goin=
g-backwards       ||host-user-contaminated        ||installed-vs-shipped  |=
|unknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig =
    ||pkgname       ||
>> |-
>> ||2016-09-20    ||2     ||5     ||2     ||5     ||2     ||2     ||7     =
||3     ||3     ||0     ||0             ||0             ||3             ||7=
             ||11            ||0             ||2             ||0           =
  ||0             ||0             ||0             ||0             ||
>> |}
>>
>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>
>> =3D=3D Failed tasks 2016-09-20 =3D=3D
>>
>> INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-=
linux.org/buildlogs/oe/world/log.report.20160921_101445.log
>>
>> =3D=3D=3D common (2) =3D=3D=3D
>>     * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs=
_4.7.0.bb:do_compile
>>     * openembedded-core/meta/recipes-support/libunwind/libunwind_git.bb:=
do_compile
>>
>> =3D=3D=3D common-x86 (0) =3D=3D=3D
>>
>> =3D=3D=3D qemuarm (0) =3D=3D=3D
>>
>> =3D=3D=3D qemux86 (3) =3D=3D=3D
>>     * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_=
compile
>>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.=
4.bb:do_compile
>
> Now this is the second time klibc appears racing.
> The error is fishy:
>
> usr/klibc/sigsuspend.c:8:31: fatal error: klibc/havesyscall.h: No such
> file or directory
>  #include <klibc/havesyscall.h>
>
> And indeed googling about it seems to be a race originated by an old Knui=
ld.
> http://thr3ads.net/klibc/2013/05/2361452-Klibc-2.0.2-build-vs-j-30-ish
>
> I'm trying a build from scratch but I only have 8 cores here...

As expected the build from scratch, pull of today, ended just fine on my sy=
stem.
I'm sorry but I cannot test the hack/band-aid proposed in the link above.

andrea@ThinkPad-T520:/oe/oe-core/build$ bitbake klibc
Parsing recipes: 100% |##########################################| Time: 0:=
01:01
Parsing of 1564 .bb files complete (0 cached, 1564 parsed). 2120
targets, 130 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.31.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-16.04"
TARGET_SYS        =3D "i586-oe-linux"
MACHINE           =3D "qemux86"
DISTRO            =3D "nodistro"
DISTRO_VERSION    =3D "nodistro.0"
TUNE_FEATURES     =3D "m32 i586"
TARGET_FPU        =3D ""
meta              =3D "master:2a9603759fe87d6326c145f6213ffffeb6afc6ae"
meta-handheld     =3D "master:a24680e7606f61dfd57c7ca6cf67a00805aa7df2"
meta-initramfs
meta-oe           =3D "master:24e387aaf78bc0f68a46abb1fab3a76364804bd1"

Initialising tasks: 100% |#######################################| Time: 0:=
00:01
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 578 tasks of which 0 didn't need to be
rerun and all succeeded.
andrea@ThinkPad-T520:/oe/oe-core/build$


>
> Cheers
> Andrea
>
>
>>     * meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.=
bb:do_compile
>>
>> =3D=3D=3D qemux86_64 (0) =3D=3D=3D
>>
>> =3D=3D=3D Number of failed tasks (9) =3D=3D=3D
>> {| class=3Dwikitable
>> |-
>> || qemuarm      || 2     || http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/log.world.qemuarm.20160919_050339.log/ || http://errors.yoctoproject.org=
/Errors/Build/21909/
>> |-
>> || qemux86      || 5     || http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/log.world.qemux86.20160919_050337.log/ || http://errors.yoctoproject.org=
/Errors/Build/21910/
>> |-
>> || qemux86_64   || 2     || http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/log.world.qemux86-64.20160920_054228.log/ || http://errors.yoctoproject.=
org/Errors/Build/21963/
>> |}
>> =3D=3D=3D PNBLACKLISTs (118) =3D=3D=3D
>> =3D=3D=3D QA issues (23) =3D=3D=3D
>> {| class=3Dwikitable
>> !| Count                ||Issue
>> |-
>> ||0     ||already-stripped
>> |-
>> ||0     ||installed-vs-shipped
>> |-
>> ||0     ||invalid-pkgconfig
>> |-
>> ||0     ||libdir
>> |-
>> ||0     ||pkgname
>> |-
>> ||0     ||symlink-to-sysroot
>> |-
>> ||0     ||unknown-configure-option
>> |-
>> ||0     ||version-going-backwards
>> |-
>> ||11    ||file-rdeps
>> |-
>> ||2     ||host-user-contaminated
>> |-
>> ||3     ||textrel
>> |-
>> ||7     ||build-deps
>> |}
>>
>>
>>
>> =3D=3D=3D Failed dependencies for qemuarm (5) =3D=3D=3D
>>
>> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160920_041851.log/
>> Found differences:
>> Found errors:
>>     * ERROR: 5 issues were found in these recipes: libunwind xfsprogs
>>
>> =3D=3D=3D Recipes failing with maximal dependencies for qemuarm (2) =3D=
=3D=3D
>>     * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160920_041851.log//2_max/failed/libunwind.log
>>     * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160920_041851.log//2_max/failed/xfsprogs.log
>>
>> =3D=3D=3D Recipes failing with minimal dependencies for qemuarm (2) =3D=
=3D=3D
>>     * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160920_041851.log//3_min/failed/libunwind.log
>>     * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160920_041851.log//3_min/failed/xfsprogs.log
>>
>> =3D=3D=3D Failed dependencies for qemux86 (7) =3D=3D=3D
>>
>> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160921_043213.log/
>> Found differences:
>> Found errors:
>>     * ERROR: 7 issues were found in these recipes: chromium klibc-utils =
libunwind xfsprogs
>>
>> =3D=3D=3D Recipes failing with maximal dependencies for qemux86 (3) =3D=
=3D=3D
>>     * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160921_043213.log//2_max/failed/chromium.log
>>     * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemux86.20160921_043213.log//2_max/failed/libunwind.log
>>     * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160921_043213.log//2_max/failed/xfsprogs.log
>>
>> =3D=3D=3D Recipes failing with minimal dependencies for qemux86 (3) =3D=
=3D=3D
>>     * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160921_043213.log//3_min/failed/chromium.log
>>     * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemux86.20160921_043213.log//3_min/failed/libunwind.log
>>     * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160921_043213.log//3_min/failed/xfsprogs.log
>>
>> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>>
>> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatu=
res.20160920_093416.log/
>>
>> No issues detected
>>
>>
>> PNBLACKLISTs:
>> openembedded-core/:
>> meta-browser:
>> recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: =
fails to build with gcc-6"
>> meta-openembedded:
>> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken:=
 switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ =
and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58.=
 invalid state name: 'off'. "default" state must always be first."
>> meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?=3D "Depends o=
n blacklisted webkit-efl"
>> meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D =
"OLD and depends on broken azy"
>> meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if yo=
u want to use these modules with E18, then you need to update it to git rec=
ipe fetching newer sources from http://git.enlightenment.org/apps/emprint.g=
it/"
>> meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want=
 to use these modules with E18, then you need to update it to git recipe fe=
tching newer sources from http://git.enlightenment.org/enlightenment/module=
s/news.git/"
>> meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want=
 to use these modules with E18, then you need to update it to git recipe fe=
tching newer sources from  http://git.enlightenment.org/apps/rage.git/"
>> meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D =
"depends on blacklisted emprint"
>> meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn=
't build with gcc-5"
>> meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=3D "BROKE=
N: fails to build with latest oe-core"
>> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "bro=
ken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.=
4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name=
: 'defaault'. "default" state must always be first."
>> meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D =
"Old and unmaintaned fork with many security issues"
>> meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=
=3D "BROKEN: latest version 0.3.4 is 3 years old and now broken with more s=
trict ejde_cc from efl-1.13"
>> meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview]=
 ?=3D "BROKEN: images are not displayed anymore"
>> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST=
[gnome-mplayer] ?=3D "rdepends on blacklisted mplayer"
>> meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb=
:PNBLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: siz=
e of array '_GStaticAssertCompileTimeAssertion_2' is negative"
>> meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalc=
tool] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gma=
ne.comp.handhelds.openembedded/57920 and nobody complained, it's also repla=
ced by gnome calculator"
>> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depend=
s on broken gnome-panel"
>> meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.=
1.bb:PNBLACKLIST[gnome-control-center] ?=3D "Depends on broken gnome-menus"
>> meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLI=
ST[gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
>> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[=
gnome-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
>> meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[g=
nome-menus] ?=3D "BROKEN: fails to build because of python"
>> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[g=
nome-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with l=
ibgweather"
>> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[g=
nome-panel3] ?=3D "Depends on broken gnome-menus"
>> meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[g=
nome-panel] ?=3D "Depends on broken libgweather"
>> meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.=
bb:PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with curre=
nt libnotify"
>> meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:PNBLACKLI=
ST[gnome-session] ?=3D "BROKEN: fails to build with gcc-6"
>> meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnom=
e-terminal] ?=3D "BROKEN: fails to build with gcc-6"
>> meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnom=
ecups] ?=3D "Depends on broken libgnomeui"
>> meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgn=
omeprint] ?=3D "Depends on broken libgnomecups"
>> meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeri=
c] ?=3D "Depends on broken libgnomeprint"
>> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libg=
weather3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
>> meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libg=
weather] ?=3D "BROKEN: fails to build with gcc-6"
>> meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilu=
s3] ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop=
-utils.h provider"
>> meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=3D "=
Fails to build with gcc-6"
>> meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=3D "F=
ails to build with gcc-6"
>> meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PN=
BLACKLIST[system-tools-backends] ?=3D "does not build with distroless qemua=
rm as reported in 'State of bitbake world' thread, nobody volunteered to fi=
x them"
>> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=
=3D "BROKEN: doesn't build with B!=3DS"
>> meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice=
] ?=3D "BROKEN: fails to build with gcc-6"
>> meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker=
] ?=3D "BROKEN: fails to build with new binutils-2.27"
>> meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader] =
?=3D "BROKEN: fails to build with gcc-6"
>> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=
=3D "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
>> meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkv=
toolnix] ?=3D "BROKEN: Failx to build with gcc-5"
>> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKL=
IST[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-confi=
g was removed, error: unknown type name 'SDL_Overlay'"
>> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb=
:PNBLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS=
 (trying to install rendererconsole.py from ${B} instead of ${S})"
>> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:=
PNBLACKLIST[gst-ffmpeg] ?=3D "Not compatible with currently used ffmpeg 3"
>> meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST=
[gst123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
>> meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=
=3D "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories w=
ere installed but not shipped in any package:"
>> meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502=
.bb:PNBLACKLIST[iscsitarget] ?=3D "BROKEN: not compatible with default kern=
el version 4.8"
>> meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:PNBLACKLIST[=
netmap-modules] ?=3D "BROKEN: not compatible with default kernel version 4.=
8"
>> meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] =
?=3D "BROKEN: Tries to build kernel module and fails, either it should be d=
isabled or there should be dependency on kernel like in netmap-modules"
>> meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST=
[accel-ppp] ?=3D "BROKEN: fails to build with new binutils-2.27"
>> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBL=
ACKLIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-=
gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
>> meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-=
mt] ?=3D "BROKEN: Depends on broken yp-tools"
>> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[blue=
z-hcidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 =
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=
=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts wi=
th bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACK=
LIST[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'b=
luez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEAT=
URES', '', d)}"
>> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
=3D "BROKEN: depends on broken libftdi"
>> meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?=
=3D "Depends on broken wvstreams"
>> meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstr=
eams] ?=3D "BROKEN: fails to build with gcc-6"
>> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[ze=
roc-ice] ?=3D "BROKEN: not compatible with default db version"
>> meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=
=3D "BROKEN: QA Issue: -dev package contains non-symlink .so"
>> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "=
Not comatible with current nodejs 0.12, but upstream is working on it for v=
3"
>> meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?=
=3D "BROKEN: fails since last autotools.bbclass changes"
>> meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb:PNBLACKLIST[mpich] ?=3D "B=
ROKEN: QA Issue: libmpi.la failed sanity test (workdir), QA Issue: mpich.pc=
 failed sanity test (tmpdir)"
>> meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[pack=
agekit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently =
disabled and will be removed soon"
>> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsur=
face] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer=
"
>> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=
=3D "BROKEN: Fails to build with gcc-5"
>> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutte=
r-box2d] ?=3D "BROKEN: doesn't build with B!=3DS"
>> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKE=
N: doesn't build with B!=3DS (flex: can't open lex.lex)"
>> meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does=
 not build with distroless qemuarm as reported in 'State of bitbake world' =
thread, nobody volunteered to fix them"
>> meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb:PNBLACKLIST[tess=
eract] ?=3D "BROKEN: QA Issue: tesseract.pc failed sanity test (tmpdir)"
>> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[=
xf86-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without =
${S} in sed call)"
>> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACK=
LIST[xf86-video-geode] ?=3D "BROKEN, fails to build"
>> meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] =
?=3D "Not compatible with 3.19 kernel"
>> meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends =
on blacklisted kernel-module-ktapvm"
>> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2]=
 ?=3D "Not compatible with currently used ffmpeg 3"
>> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[fo=
xtrotgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 c=
onflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "B=
ROKEN: fails to build with gcc-5"
>> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@b=
b.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4=
 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@b=
b.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4=
 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-ma=
il] ?=3D "depends on blacklisted libetpan"
>> meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNB=
LACKLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted claws-m=
ail"
>> meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIS=
T[claws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail"
>> meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[c=
laws-plugin-rssyl] ?=3D "depends on blacklisted claws-mail"
>> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] =
?=3D "BROKEN: doesn't build with B!=3DS"
>> meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qem=
u: uncaught target signal 11 (Segmentation fault) - core dumped"
>> meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D =
"does not build with distroless qemuarm as reported in 'State of bitbake wo=
rld' thread, nobody volunteered to fix them"
>> meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D=
 "Not compatible with gnutls version 3.4 currently in oe-core"
>> meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[lib=
dbi-drivers] ?=3D "BROKEN: fails to build with gcc-5"
>> meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] =
?=3D "Not compatible with gnutls version 3.4 currently in oe-core"
>> meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[ope=
n-vcdiff] ?=3D "BROKEN: fails to build with gcc-6"
>> meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-=
samples] ?=3D "Depends on blacklisted opencv"
>> meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "N=
ot compatible with currently used ffmpeg 3"
>> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmot=
if] ?=3D "BROKEN: doesn't build with B!=3DS"
>> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncm=
l] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflict=
s with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb:PNBLACKLIST[openwbem]=
 ?=3D "BROKEN: fails to build with gcc-6"
>> meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-ot=
r] ?=3D "depends on blacklisted pidgin"
>> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[v=
ala-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `=
src/.stamp': No such file or directory"
>> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBL=
ACKLIST[vboxguestdrivers] ?=3D "BROKEN: not compatible with default kernel =
version 4.8"
>> meta-qt5:
>> meta-smartphone:
>> meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb=
:PNBLACKLIST[libframeworkd-glib] ?=3D "BROKEN: many errors when building wi=
th gcc-6"
>> meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[=
zhone] ?=3D "rdepends on python-pycairo which was removed"
>> meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advance=
dcaching] ?=3D "RDEPENDS on python-pygtk was removed from oe-core"
>> meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D =
"Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=
=3D "broken: depends on blacklisted fltk"
>> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn=
't build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rde=
pends on blacklisted mplayer2"
>> meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D "=
depends on blacklisted iksemel"
>> meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-g=
ps] ?=3D "RDEPENDS on python-pygtk which was removed from oe-core"
>> meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "RDEP=
ENDS on python-pygtk which was removed from oe-core"
>> meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${=
@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with blue=
z4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "D=
oesn't build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass=
] =3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
>> meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguin=
s] ?=3D "BROKEN: fails to build with new binutils-2.27"
>> meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer]=
 ?=3D "Depends on blacklisted packagekit"
>> meta-webos-ports:
>> meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBL=
ACKLIST[luna-webappmanager] ?=3D "BROKEN: needs to be adapted to new qt-5.7=
"
>> meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next]=
 ?=3D "BROKEN: needs to be adapted to new qtwayland-5.7"
>> PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazatio=
n which isn't included in my world builds"
>> PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be t=
ested so much"
>> PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be te=
sted so much"
>> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be te=
sted so much"
>> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be te=
sted so much"
>> PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be t=
ested so much"
>> PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads=
 directory in /home/builder/poky :/"
>> PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weird sh!t breaking ot=
her kernels and modules - broken for years"
>> PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t breaking other kernel=
s and modules - broken for years"
>>
>>
>> QA issues by type:
>> count: 0        issue: already-stripped
>>
>>
>> count: 0        issue: libdir
>>
>>
>> count: 3        issue: textrel
>> chromium-wayland-48.0.2548.0: ELF binary '/tmp/work/i586-oe-linux/chromi=
um-wayland/48.0.2548.0-r0/packages-split/chromium-wayland/usr/bin/chromium/=
chrome' has relocations in .text [textrel]
>> corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r=
0/packages-split/corosync/usr/sbin/corosync' has relocations in .text [text=
rel]
>> gnutls-3.5.3: ELF binary '/tmp/work/i586-oe-linux/gnutls/3.5.3-r0/packag=
es-split/gnutls/usr/lib/libgnutls.so.30.9.0' has relocations in .text [text=
rel]
>>
>>
>> count: 7        issue: build-deps
>> chromium-wayland-48.0.2548.0: chromium-wayland rdepends on atk, but it i=
sn't a build dependency, missing atk in DEPENDS or PACKAGECONFIG? [build-de=
ps]
>> chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gdk-pixbuf, b=
ut it isn't a build dependency, missing gdk-pixbuf in DEPENDS or PACKAGECON=
FIG? [build-deps]
>> chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gtk+, but it =
isn't a build dependency, missing gtk+ in DEPENDS or PACKAGECONFIG? [build-=
deps]
>> chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcomposite=
, but it isn't a build dependency, missing libxcomposite in DEPENDS or PACK=
AGECONFIG? [build-deps]
>> chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcursor, b=
ut it isn't a build dependency, missing libxcursor in DEPENDS or PACKAGECON=
FIG? [build-deps]
>> chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxscrnsaver=
, but it isn't a build dependency, missing libxscrnsaver in DEPENDS or PACK=
AGECONFIG? [build-deps]
>> wireshark-2.2.0: wireshark rdepends on libssh, but it isn't a build depe=
ndency, missing libssh in DEPENDS or PACKAGECONFIG? [build-deps]
>>
>>
>> count: 11       issue: file-rdeps
>> chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requir=
es libnewt.so()(64bit), but no providers found in RDEPENDS_chkconfig? [file=
-rdeps]
>> chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requir=
es libnewt.so, but no providers found in RDEPENDS_chkconfig? [file-rdeps]
>> libmodule-build-perl-0.31: /usr/bin/config_data contained in package lib=
module-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/p=
erl.real, but no providers found in RDEPENDS_libmodule-build-perl? [file-us=
r/bin/memory-map.sh contained in package ubx-utils requires /bin/bash, but =
no providers found in RDEPENDS_ubx-utils? [file-rdeps]
>>
>>
>> count: 0        issue: version-going-backwards
>>
>>
>> count: 2        issue: host-user-contaminated
>> glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-raj-in/usr/lib=
/locale/raj_IN/LC_COLLATE is owned by uid 3004, which is the same as the us=
er running bitbake. This may be due to host contamination [host-user-contam=
inated]
>> opensaf-5.0.0: opensaf: /opensaf/etc/init.d/opensafd is owned by uid 300=
4, which is the same as the user running bitbake. This may be due to host c=
ontamination [host-user-contaminated]
>>
>>
>> count: 0        issue: installed-vs-shipped
>>
>>
>> count: 0        issue: unknown-configure-option
>>
>>
>> count: 0        issue: symlink-to-sysroot
>>
>>
>> count: 0        issue: invalid-pkgconfig
>>
>>
>> count: 0        issue: pkgname
>>
>>
>>
>> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
>> latest upstream commit:
>> b7faf1a cooker: check if target contains task
>> not included in master yet:
>> 440ff20 world-image: add extra target
>>
>> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
>> latest upstream commit:
>> 5ac0604 build-appliance-image: Create image in correct location
>> not included in master yet:
>> ba9b8c5 qemux86: Add identical qemux86copy variant for tests
>> 5bdadaf sstate-sysroot-cruft.sh: Extend the whitelist
>> fca1684 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=
=3Dmode,links"
>> 13a5b2f buildhistory.bbclass: metadata-revs show repo parent
>> a7809c9 metadata-revs: provide more information
>> 8192f75 report-error: Allow to upload reports automatically
>> 0c0d51b icecc.bbclass: replace os.popen with subprocess.check_output
>> 3acdc9c test-dependencies.sh: Strip also '\.bb: .*' before adding failed=
 recipe to list of failed
>> 5a6f1cc enchant: add PACKAGECONFIG for *spell
>>
>> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
>> latest upstream commit:
>> 24e387a openldap: fix CVE-2015-3276
>> not included in master yet:
>> c677bf0 xfsprogs: 3.2.3 -> 4.7.0
>> 8db7b58 xfsdump: 3.1.4 -> 3.1.6
>> 1223ce6 lksctp-tools: 1.0.16 -> 1.0.17
>> dcf89c9 drbd-utils: 8.9.3 -> 8.9.6
>> 8004394 mbedtls: upgrade to 1.3.17
>> 66ae590 jasper: add PACKAGECONFIG for opengl
>> a1ccbb0 gammu: add dependency on unixodbc
>> 8ee7fd1 libgit2: add dependency on libssh2
>> a646e1b mpv: include PACKAGECONFIG_CONFARGS in EXTRA_OECONF
>> bcfae78 chrony: add PACKAGECONFIG for nss, libcap
>> db5ef68 poco: update to 1.7.5
>> 1278de8 samba: un-blacklist
>> 5120403 portaudio: upgrade to latest release
>> 5ef13ca pointercal: move recipe from oe-core
>> e92f733 meta-gpe: add pointercal to layer.conf
>> f42a748 xtscal: move recipe from oe-core
>> c0151c7 tslib: move recipe from oe-core
>> 5cfa139 jack: update to 0.125.0rc1
>> 78d8216 upower: don't start on boot by default - dbus does that on deman=
d
>> 6e85cf8 gimp: update to 2.8.18
>> fb056ea gvfs: update to 1.28.3
>> 25d23ea ristretto: have tumbler back - it builds fine and is an importan=
t feature
>> 145d008 samba: replace pam packageconfig by hard dependency
>> 871ba2f fftw: build all configurations by one recipe
>> 8a0ec10 imagemagick: depend on fftw not virtual/fftw
>> 4480b1b grubby: add bash to RDEPENDS_grubby-ptest
>> f92658a crash: Enforce use of LDFLAGS during make
>> 5f0af70 openl2tp: Obey LDFLAGS in Makefile
>> 0fffda2 pidgin-sipe purple-skypeweb whatsapp-purple freeimage: add more =
pidgin plugins
>> dfed78c Revert "pidgin-sipe purple-skypeweb whatsapp-purple freeimage: a=
dd more pidgin plugins"
>> 0184e0f p7zip, mce-inject: update LIC_FILES_CHKSUM
>> f13e069 vboxguestdrivers: upgrade to 5.1.6 to fix build with default ker=
nel from oe-core 4.8
>>
>> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
>> latest upstream commit:
>> 9aa870e qtbase: avoid qmake errors due to missing oe-device-extra.pri
>> not included in master yet:
>>
>> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
>> latest upstream commit:
>> ec4459a Merge pull request #14 from raymanfx/master
>> not included in master yet:
>> ad9b1ce firefox: Fix build using gcc 6
>> 338b100 chromium: install all pak files plus resources and blob.bin file=
s.
>> f36a731 chromium-wayland: include 0006-Remove-GBM-support-from-wayland.g=
yp.patch only with CHROMIUM_ENABLE_WAYLAND
>>
>> =3D=3D Tested changes (not included in master yet) - meta-webos-ports =
=3D=3D
>> latest upstream commit:
>> b0ca23f freeimage: bump SRCREV to fix build with gcc6
>> not included in master yet:
>>
>> =3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=
=3D
>> latest upstream commit:
>> 8e828d1 linux-hp-tenderloin: Fix incorrect checksums
>> not included in master yet:
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

