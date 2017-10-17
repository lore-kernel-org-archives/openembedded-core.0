Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0E06F7828D;
	Tue, 17 Oct 2017 11:43:41 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id y39so1333494wrd.4;
	Tue, 17 Oct 2017 04:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=AldPGOwg6fSApppvMSrrl1ir62oTuHyn0kjZvm/PNt8=;
	b=gBkZ+q4ZaJSlqKXO6yhAsqm4sl2GcKB9j0QWNMdTN4ar/WtEzihxkF1X/KAV8dFCPU
	ner/Nv4Q+r5hAPsVYt6HIWjlpTmLmyMOyGiCaCxqdkAOPCLkpQPv8ndDEID/WWtm/Zss
	Wx0BzinZAKEptZhHPLXeHOUCVolHu9IJkkzhVH5MZda23FY/yFsKMV3J1yyKMIICKSYs
	4eqodHunR5tq8RPbpT2L81O/bmc1NcZAU4iazMSOr9XqNfLE30NFxBmRnkFS427j+HR3
	34yllnpl6cyv0gjhQ+Vb5dH9avq7gG0gZt3qRJdHQd8vgTCpmLHPYCM9zbD4GveUNyET
	deUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=AldPGOwg6fSApppvMSrrl1ir62oTuHyn0kjZvm/PNt8=;
	b=FL0mX6inBmEjJCn0GFgEBuAZq870E4uakx3cA3iNwS0v3WNvJbJUtzLc4lWYzOXEKt
	4FUvrSk5SS+HcAw5H/FJAyba0wx8l1JPT84eWBuhhNq+KgjM2s89yOWuRPqn4VZfFhVI
	IXx5Qbmq3cWzG+L9VYl21+0qJsr34PWDBiUi2Wb0XxNGMrCMDLhvvqpNJ1vZs5rv1nYm
	7lise/mG9aNg53J5lSl52BPQfeQTSTIw+O96gKY9fz1RdsltwnhHPpUlggn3+8nRwpUA
	FpUKbqQE/rIHudY3oQhGYtzGr7ecSCgHE0J+iUXZA+MLnMgssaUDBNr6++p7OZyvod+6
	ZM/A==
X-Gm-Message-State: AMCzsaVBgmp3Xk+yhzVFQzDDcFC493NvdKXOB9CUvJeI7/rbfhLQE+FJ
	ImnbF8Y4VpAzNwTBRkdb1nRgbxXoum16zSx1W5xO5A==
X-Google-Smtp-Source: ABhQp+RUgcvAbjflFBW0NHeggQT1NyBVxPDk90n88fxBat84cZlsgmv8fe/9Qk9kKRkbzfw/6GRDGljuFXnzVAoSIDs=
X-Received: by 10.223.134.68 with SMTP id 4mr3679136wrw.67.1508240622199; Tue,
	17 Oct 2017 04:43:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 17 Oct 2017 04:43:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Oct 2017 13:43:41 +0200
Message-ID: <CA+chaQf5dHq8DPmAyidJ9+pjSyX9QS-PUgAAuKGXG03gGds0mw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-10-16
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
X-List-Received-Date: Tue, 17 Oct 2017 11:43:42 -0000
Content-Type: multipart/alternative; boundary="001a1149243a85b140055bbca280"

--001a1149243a85b140055bbca280
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!|Signatures	=09
!!colspan=3D'15'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-=
going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-c=
onfigure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflag=
s	||compile-host-path	||qa_pseudo	||
|-
||2017-10-16	||3	||4	||4	||0	||0		||0		||3		||0		||0		||0		||4		||1		||0		|=
|0		||0		||0		||0		||0		||9		||
|}

=3D=3D Failed tasks 2017-10-16 =3D=3D

INFO: jenkins-job.sh-1.8.35 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171017_00=
2302.log

=3D=3D=3D common (2) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtnetworkauth_git.bb:do_fetch
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_pac=
kage_qa

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtcharts_git.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package=
_qa

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/fluidsynth/fluid=
synth_1.1.8.bb:do_package
    * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_=
2.4.2.bb:do_package_qa

=3D=3D=3D Number of failed tasks (11) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.2017=
1016_112708.log/
|| http://errors.yoctoproject.org/Errors/Build/47548/
|-
|| qemux86 	|| 4	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.2017=
1016_124745.log/
|| http://errors.yoctoproject.org/Errors/Build/47549/
|-
|| qemux86_64 	|| 4	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.2=
0171016_153545.log/
|| http://errors.yoctoproject.org/Errors/Build/47553/
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (17) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
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
||1	||installed-vs-shipped
|-
||3	||textrel
|-
||4	||host-user-contaminated
|-
||9	||qa_pseudo
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20171016_140936.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools]
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)}"
meta-qt5:
PNBLACKLIST[android-system] =3D "depends on lxc from
meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be
tested so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be
tested so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads
directory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 3	issue: textrel
corosync-2.4.2: ELF binary
'/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin=
/corosync'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x26=
4-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x26=
4/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 4	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-aa-er+saaho/usr/lib/locale/aa_ER@saaho/LC_PAPER
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ar-dz/usr/lib/locale/ar_DZ/LC_PAPER is owned
by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ar-kw.iso-8859-6/usr/lib/locale/ar_KW.ISO-8859-6/L=
C_PAPER
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-sq-al.iso-8859-1/usr/lib/locale/sq_AL.ISO-8859-1/L=
C_MEASUREMENT
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
fluidsynth: 5 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 9	issue: qa_pseudo
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/armv5te-oe-linux-gnueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r=
0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/i586-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/ps=
eudo.log
indicates 8 errors [qa_pseudo]
python-ndg-httpsclient-0.4.3: This
/work/armv5te-oe-linux-gnueabi/python-ndg-httpsclient/0.4.3-r0/pseudo/pseud=
o.log
indicates 4 errors [qa_pseudo]
python-snimpy-0.8.11: This
/work/armv5te-oe-linux-gnueabi/python-snimpy/0.8.11-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/armv5te-oe-linux-gnueabi/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseu=
do/pseudo.log
indicates 11 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/i586-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.l=
og
indicates 12 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This
/work/armv5te-oe-linux-gnueabi/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/p=
seudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This
/work/core2-64-oe-linux/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/p=
seudo.log
indicates 7 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This
/work/i586-oe-linux/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseud=
o.log
indicates 6 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:
be393f2 toaster/highlight.pack.js: Fix corrupted file
not included in master yet:
3fba1ad world-image: add extra target
c7c01bf fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D

latest upstream commit:
8ca61a5 bitbake.conf: add tools required by testimage to HOSTTOOLS conditio=
nally
not included in master yet:
d28c0cb report-error: Allow to upload reports automatically
ebe6522 buildhistory.bbclass: metadata-revs show repo parent
78735b9 metadata-revs: provide more information
a48bb4c qemux86: Add identical qemux86copy variant for tests
582876d reproducible_build.bbclass: initial support for binary reproducibil=
ity
8cde606 cpio: provide cpio-replacement-native
fa4e167 image_types.bbclass: improve cpio image reproducibility
bd99eff rootfs-postcommands.bbclass: support binary reproducibility
446dffa sstate.bbclass: Do not cause build failures due to setscene errors
caba1c2 insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
633940b libsdl2: allow to build native and nativesdk
d2a2d29 libdrm: allow to build native and nativesdk
e407568 nativesdk-mesa,mesa-native: add new recipe to build small part of m=
esa
aa6ce39 libepoxy: add support for native(sdk)
11acf2e libjpeg-turbo: provide nativesdk version
b58f07d virglrenderer: add new recipe
f00aa03 virglrenderer: fix target build
b19c402 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
fbb4feb insane.bbclass: use package_qa_handle_error for do_qa_pseudo

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D

latest upstream commit:
ed6b5da hostapd: fix WPA2 key replay security bug
not included in master yet:
a64b2eb squid: upgrade to 3.5.27
bd0aef9 toybox: Switch building from git src_uri
6440fa0 nodejs: Add npx to nodejs-npm package
444c92e rocksdb: add version 5.8
e76721e stress-ng: Add recipe
d9c1b30 oprofile: move from oe-core, as it's being deprecated there
e0cbcbb imagemagick: 7.0.7-1 -> 7.0.7-7
a6d78e6 fluidsynth: update 1.1.6 -> 1.1.8
52396aa python-lxml: update to version 4.1.0
7e2dcd9 python-cffi: update to version 1.11.2

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:
2c3ef00 qt5: add missing commercial license
not included in master yet:
a3df6a7 meta-qt5: Update to 5.9.2 release
5ed1295 Revert "meta-qt5: Update to 5.9.2 release"
5c3949e meta-qt5: Update to 5.9.2 release

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D

latest upstream commit:
26d5066 firefox: fix build failures
not included in master yet:
6773bf9 meta: drop ${COREBASE}/LICENSE references

--001a1149243a85b140055bbca280
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre id=3D"gmail-out" class=3D"gmail-console-output" style=
=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-=
top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><pre style=3D=
"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top=
:0px;margin-bottom:0px"><a href=3D"http://www.openembedded.org/wiki/Bitbake=
_World_Status" style=3D"box-sizing:border-box;word-wrap:break-word;color:rg=
b(92,53,102)">http://www.openembedded.org/wiki/Bitbake_World_Status</a>

=3D=3D Number of issues - stats =3D=3D
{| class=3D&#39;wikitable&#39;
!|Date		     !!colspan=3D&#39;3&#39;|Failed tasks			    !!|Signatures		  !!=
colspan=3D&#39;15&#39;|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||t=
extrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-cont=
aminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sys=
root	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||qa_pseud=
o	||=09
|-
||2017-10-16	||3	||4	||4	||0	||0		||0		||3		||0		||0		||0		||4		||1		||0		|=
|0		||0		||0		||0		||0		||9		||=09
|}

=3D=3D Failed tasks 2017-10-16 =3D=3D

INFO: jenkins-job.sh-1.8.35 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171017_002302.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171017_002=
302.log</a>

=3D=3D=3D common (2) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtnetworkauth_git.bb:do_fetch
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_pac=
kage_qa

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtcharts_git.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package=
_qa

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/fluidsynth/fluid=
synth_1.1.8.bb:do_package
    * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_=
2.4.2.bb:do_package_qa

=3D=3D=3D Number of failed tasks (11) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20171016_112708.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20171016_112708.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/47548/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/47548/</a>
|-
|| qemux86 	|| 4	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20171016_124745.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20171016_124745.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/47549/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/47549/</a>
|-
|| qemux86_64 	|| 4	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20171016_153545.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171016_153545.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/47553/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/47553/</a>
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (17) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
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
||1	||installed-vs-shipped
|-
||3	||textrel
|-
||4	||host-user-contaminated
|-
||9	||qa_pseudo
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20171016_140936.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20171016_140936.log/</a>

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx =
symbol&quot;, &#39;&#39;, d)}&quot;
meta-qt5:
PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-virtualiazat=
ion which isn&#39;t included in my world builds&quot;
PNBLACKLIST[bigbuckbunny-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[tearsofsteel-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[build-appliance-image] =3D &quot;tries to include whole downloa=
ds directory in /home/builder/poky :/&quot;


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 3	issue: textrel
corosync-2.4.2: ELF binary &#39;/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync&#39; has relocations in .text [tex=
trel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264&#39; ha=
s relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148&#=
39; has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 4	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-aa-er+saaho/usr/l=
ib/locale/aa_ER@saaho/LC_PAPER is owned by uid 3004, which is the same as t=
he user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-dz/usr/lib/loc=
ale/ar_DZ/LC_PAPER is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-kw.iso-8859-6/=
usr/lib/locale/ar_KW.ISO-8859-6/LC_PAPER is owned by uid 3004, which is the=
 same as the user running bitbake. This may be due to host contamination [h=
ost-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-sq-al.iso-8859-1/=
usr/lib/locale/sq_AL.ISO-8859-1/LC_MEASUREMENT is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]


count: 1	issue: installed-vs-shipped
fluidsynth: 5 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 9	issue: qa_pseudo
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linux-gnu=
eabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indica=
tes 5 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/i586-oe-linux/libcon=
nman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 8 error=
s [qa_pseudo]
python-ndg-httpsclient-0.4.3: This /work/armv5te-oe-linux-gnueabi/python-nd=
g-httpsclient/0.4.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-snimpy-0.8.11: This /work/armv5te-oe-linux-gnueabi/python-snimpy/0.8=
.11-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/armv5te-oe-linux-gnueabi/q=
tquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/i586-oe-linux/qtquick1/5.9=
.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 12 errors [qa_pseud=
o]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/armv5te-oe-linux-gnueab=
i/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 5 =
errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/core2-64-oe-linux/qtx11=
extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 7 errors =
[qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/i586-oe-linux/qtx11extr=
as/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 6 errors [qa_=
pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
be393f2 toaster/highlight.pack.js: Fix corrupted file
not included in master yet:=20
3fba1ad world-image: add extra target
c7c01bf fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
8ca61a5 bitbake.conf: add tools required by testimage to HOSTTOOLS conditio=
nally
not included in master yet:=20
d28c0cb report-error: Allow to upload reports automatically
ebe6522 buildhistory.bbclass: metadata-revs show repo parent
78735b9 metadata-revs: provide more information
a48bb4c qemux86: Add identical qemux86copy variant for tests
582876d reproducible_build.bbclass: initial support for binary reproducibil=
ity
8cde606 cpio: provide cpio-replacement-native
fa4e167 image_types.bbclass: improve cpio image reproducibility
bd99eff rootfs-postcommands.bbclass: support binary reproducibility
446dffa sstate.bbclass: Do not cause build failures due to setscene errors
caba1c2 insane.bbclass: Add do_qa_pseudo function to check for common error=
s listed in pseudo.log
633940b libsdl2: allow to build native and nativesdk
d2a2d29 libdrm: allow to build native and nativesdk
e407568 nativesdk-mesa,mesa-native: add new recipe to build small part of m=
esa
aa6ce39 libepoxy: add support for native(sdk)
11acf2e libjpeg-turbo: provide nativesdk version
b58f07d virglrenderer: add new recipe
f00aa03 virglrenderer: fix target build
b19c402 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
fbb4feb insane.bbclass: use package_qa_handle_error for do_qa_pseudo

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
ed6b5da hostapd: fix WPA2 key replay security bug
not included in master yet:=20
a64b2eb squid: upgrade to 3.5.27
bd0aef9 toybox: Switch building from git src_uri
6440fa0 nodejs: Add npx to nodejs-npm package
444c92e rocksdb: add version 5.8
e76721e stress-ng: Add recipe
d9c1b30 oprofile: move from oe-core, as it&#39;s being deprecated there
e0cbcbb imagemagick: 7.0.7-1 -&gt; 7.0.7-7
a6d78e6 fluidsynth: update 1.1.6 -&gt; 1.1.8
52396aa python-lxml: update to version 4.1.0
7e2dcd9 python-cffi: update to version 1.11.2

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
2c3ef00 qt5: add missing commercial license
not included in master yet:=20
a3df6a7 meta-qt5: Update to 5.9.2 release
5ed1295 Revert &quot;meta-qt5: Update to 5.9.2 release&quot;
5c3949e meta-qt5: Update to 5.9.2 release

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
26d5066 firefox: fix build failures
not included in master yet:=20
6773bf9 meta: drop ${COREBASE}/LICENSE references</pre></pre></div>

--001a1149243a85b140055bbca280--
