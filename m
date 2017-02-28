Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0A72A72F6E;
	Tue, 28 Feb 2017 09:19:43 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id v77so6452244wmv.0;
	Tue, 28 Feb 2017 01:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=TvzLB7ng4P4nwO2t1GkIUZdXgC9QG74W9aFrG9SH1A0=;
	b=KsbXW6DhomRjEi7VQbkqNEBQ2rBSXbP7VgMsE+wSwIKNf+PNcBWd1oMWlknsT1hp1v
	0rWGiYv9ihIvO78TD/UJEISCxvm6z5tGLTNO5a9ebANkU+CYnxTfXriIKqpYS0ld0QMc
	nLgharNqwWHq76JNo2a2rKK7azOd8jict9WCuUsze4N+39SPoqNAI76EtITVDEWayrvv
	+4yD+dE9VcvpX0OHmed9M4IhXfvjqcxsLtifTSc6EZT4E+fD2+2aGoGIJSDVjeIENNHf
	dYQ9gd7sK8PczeOj9QANBVzUCG8s6Nd1DnX4ONLFvQa+cqLN01nSRvIMKn7vVIKlF9kT
	d9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=TvzLB7ng4P4nwO2t1GkIUZdXgC9QG74W9aFrG9SH1A0=;
	b=CuEagGaDiNkz7szvw12TuhDdHNpUBDIUb5kgNH53btjS7lrJAZEpsVShKhlXPoCH91
	8CjP/xEnpDR4Hpq2xKaIqiMmYa7/IAl3C93zGfSdE29jyZMuxrji6qeqwULlWVwR6n6c
	cU1keI2arOSMtJCoX9HoXcr+0T1OjCeUKcDts2/cTQDqSsscAosqzi+AInsezDuYSvtz
	p6D5wC2Mcj+G8dxi5ev2rPExJOpopNSjx/gorLmpTPCpsRq6xHDUeNHPUTpL7wQjA8n2
	RJfqTVBVwJoeekj9tyB2xpxnr06leVz0hxr7OROi+kuGWqFRsn8WA4B3goW8U8YEahh7
	NMmw==
X-Gm-Message-State: AMke39l9lm/1tTx6wGN55qz2bXXwKf2nRZ0qMS43OsKSn0G83xx7brQRcECUkqqFZUmCRULPlGMCu8l8Ma0+3w==
X-Received: by 10.28.211.80 with SMTP id k77mr15799477wmg.124.1488273584118;
	Tue, 28 Feb 2017 01:19:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Tue, 28 Feb 2017 01:19:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Feb 2017 10:19:43 +0100
Message-ID: <CA+chaQcrhN=45kcVnR0Z4Y3whS5POQwBXzm+epUpx0sksxoBtg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-02-27
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
X-List-Received-Date: Tue, 28 Feb 2017 09:19:45 -0000
Content-Type: multipart/alternative; boundary=001a1146d9b64f7e74054993b288

--001a1146d9b64f7e74054993b288
Content-Type: text/plain; charset=UTF-8

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!colspan='6'|Failed
depencencies			 !!|Signatures		  !!colspan='12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||min	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||
|-
||2017-02-27	||6	||6	||6	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		||2		||0		||0		||200		||0		||0		||0		||0		||0		||0		||
|}
http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2017-02-27 ==

INFO: jenkins-job.sh-1.8.18 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170227_231549.log

=== common (6) ===
    * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb:do_compile
    * meta-openembedded/meta-ruby/recipes-devtools/ruby/bundler_git.bb:do_compile
    * openembedded-core/meta/recipes-extended/parted/parted_3.2.bb:do_compile_ptest_base
    * openembedded-core/meta/recipes-support/apr/apr_1.5.2.bb:do_compile_ptest_base
    * virtual:native:meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.24.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (0) ===

=== qemux86 (0) ===

=== qemux86_64 (0) ===

=== Number of failed tasks (18) ===
{| class=wikitable
|-
|| qemuarm 	|| 6	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20170227_040837.log/
|| http://errors.yoctoproject.org/Errors/Build/32950/
|-
|| qemux86 	|| 6	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86.20170227_004257.log/
|| http://errors.yoctoproject.org/Errors/Build/32951/
|-
|| qemux86_64 	|| 6	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170227_132712.log/
|| http://errors.yoctoproject.org/Errors/Build/32973/
|}

=== PNBLACKLISTs (350) ===

=== QA issues (202) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
|-
||0	||host-user-contaminated
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
||200	||version-going-backwards
|-
||2	||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signatures.20170227_070558.log/

No issues detected


== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
5b364b0 fetch2/svn: change 'rsh' parameter to 'ssh'
not included in master yet:
ee30425 world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==

latest upstream commit:
65cfc8a libva: Find the correct wayland-scanner
not included in master yet:
e391f58 qemux86: Add identical qemux86copy variant for tests
6d33fc3 sstate-sysroot-cruft.sh: Extend the whitelist
0de471f recipes: Replace "cp -a" with "cp -R --no-dereference
--preserve=mode,links"
f0f6112 buildhistory.bbclass: metadata-revs show repo parent
ade2954 metadata-revs: provide more information
c5e658a report-error: Allow to upload reports automatically
63e44e5 flex: upgrade to 2.6.3
edfb18a Revert "flex: upgrade to 2.6.3"
3d6b996 Revert "flex: upgrade to 2.6.2"
ce5cb55 qemu: fix build with glibc-2.25
ea1f3b4 e2fsprogs: Fix build with glibc-2.25
7f249b3 parted: fix build with glibc-2.25
830df85 syslinux: fix build with glibc-2.25

== Tested changes (not included in master yet) - meta-openembedded ==

latest upstream commit:
05aefd1 openct: Replace /lib/udev with ${nonarch_base_libdir}/udev.
not included in master yet:
710ff64 netcat-openbsd: fix implicit dependency on pkg-config
b113645 inetutils: Move files only when src != dst.
d2f2522 ebtables: Move files only when src != dst.
4381e64 netcf_git: Check if src != dst while moving files.
aaf09a6 Revert "Samba: use built-in libtevent"
4010fd9 python3-cassandra-driver: update to version 3.8.0
9af7bac python-bcrypt: update to version 3.1.3
0c36959 abiword: fix build and unblacklist
18e54c0 python-ldap: remove obsolete recipe
6798e4b python-ldap: update to version 2.4.32
131fcc2 python-slip-dbus: update to version 0.6.1
60efb4b python-django: update to version 1.10.5
f8d852e python-pyalsaaudio: update to version 0.8.3
e123e01 python-gdata: update to version 2.0.18
4816c64 Update UPSTREAM_CHECK variables to allow for version checking
cecf1dc collect: fix to build with glibc 2.25
b3e385c multipath-tools: Replace 'lib' with ${nonarch_base_libdir} for
placing udev rules.
e989b9a apache-websocket: add depend on pbzip2-native
0c46505 bundler: resolve build issues with RSS
df2b829 netdata: update DEPENDS to fix RSS build error
e16c3f6 usb-modeswitch: update inherit to work correctly with RSS
0dbe078 syslog-ng: update inherit to work correctly with RSS
5e1f391 xfsprogs: update depends to work correctly with RSS
3b988b0 ipmiutil: fix depends to work correctly with RSS
9114707 efivar: unblacklist package and those that depend on it
fa3cd65 mosh: update inherit to work correctly with RSS
8e73142 font-adobe-100dpi: update depends to fix builds with RSS
b2f14ff font-adobe-utopia-100dpi: update depends to fix builds with RSS
42d19a4 font-misc-misc: update depends to fix builds with RSS
78c0dde font-bh-lucidatypewriter-100dpi: update depends to fix builds with RSS
b89e109 font-bh-100dpi: update depends to fix builds with RSS
7019a1f system-config-keyboard: fix depends to work correctly with RSS
14ca28a nginx: update to version 1.11.10

== Tested changes (not included in master yet) - meta-qt5 ==

latest upstream commit:
61c0250 qtbase-native: nativesdk-qtbase: remove patch that breaks
mkspec setting for SDK
not included in master yet:
595e9cf qtbase: remove absolute binary paths from mkspec files

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
021a954 chromium-browser: add missing dependency on gperf-native
not included in master yet:
a9dd704 chromium: disable generate_character_data for x86

== Tested changes (not included in master yet) - meta-webos-ports ==

latest upstream commit:
7c4309b packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:

== Tested changes (not included in master yet) - meta-smartphone ==
latest upstream commit:
df77c54 linux-hp-tenderloin: don't use get_kernelversion_modules
function and adapt to multiple kernel image types changes
not included in master yet:

--001a1146d9b64f7e74054993b288
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre style=3D"box-sizing:border-box;white-space:pre-wrap;w=
ord-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);fo=
nt-size:14px">=3D=3D Number of issues - stats =3D=3D
{| class=3D&#39;wikitable&#39;
!|Date		     !!colspan=3D&#39;3&#39;|Failed tasks			    !!colspan=3D&#39;6&=
#39;|Failed depencencies			 !!|Signatures		  !!colspan=3D&#39;12&#39;|QA !!=
Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||=09
|-
||2017-02-27	||6	||6	||6	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||2		||0		||0		||200		||0		||0		||0		||0		||0		||0		||=09
|}

<a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" style=3D"=
box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://www=
.openembedded.org/wiki/Bitbake_World_Status</a>

=3D=3D Failed tasks 2017-02-27 =3D=3D

INFO: jenkins-job.sh-1.8.18 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170227_231549.log" s=
tyle=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">ht=
tp://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170227_23154=
9.log</a>

=3D=3D=3D common (6) =3D=3D=3D
    * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.=
8.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.b=
b:do_compile
    * meta-openembedded/meta-ruby/recipes-devtools/ruby/bundler_git.bb:do_c=
ompile
    * openembedded-core/meta/recipes-extended/parted/parted_3.2.bb:do_compi=
le_ptest_base
    * openembedded-core/meta/recipes-support/apr/apr_1.5.2.bb:do_compile_pt=
est_base
    * virtual:native:meta-openembedded/meta-oe/recipes-extended/efivar/efiv=
ar_0.24.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (18) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 6	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.world.qemuarm.20170227_040837.log/" style=3D"box-sizing:border=
-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org=
/buildlogs/oe/world/pyro/log.world.qemuarm.20170227_040837.log/</a> || <a h=
ref=3D"http://errors.yoctoproject.org/Errors/Build/32950/" style=3D"box-siz=
ing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.yoc=
toproject.org/Errors/Build/32950/</a>
|-
|| qemux86 	|| 6	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/pyro/log.world.qemux86.20170227_004257.log/" style=3D"box-sizing:border=
-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org=
/buildlogs/oe/world/pyro/log.world.qemux86.20170227_004257.log/</a> || <a h=
ref=3D"http://errors.yoctoproject.org/Errors/Build/32951/" style=3D"box-siz=
ing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.yoc=
toproject.org/Errors/Build/32951/</a>
|-
|| qemux86_64 	|| 6	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/pyro/log.world.qemux86-64.20170227_132712.log/" style=3D"box-sizing:=
border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170227_132712.log/</a=
> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/32973/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/32973/</a>
|}

=3D=3D=3D PNBLACKLISTs (350) =3D=3D=3D

=3D=3D=3D QA issues (202) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
|-
||0	||host-user-contaminated
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
||200	||version-going-backwards
|-
||2	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.signatures.20170227_070558.log/" style=3D"box-sizing:border-box;word-=
wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlogs=
/oe/world/pyro/log.signatures.20170227_070558.log/</a>

No issues detected
</pre><div><br></div><div><pre id=3D"gmail-out" class=3D"gmail-console-outp=
ut" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-wor=
d;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><pre=
 style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;m=
argin-top:0px;margin-bottom:0px">=3D=3D Tested changes (not included in mas=
ter yet) - bitbake =3D=3D
latest upstream commit:=20
5b364b0 fetch2/svn: change &#39;rsh&#39; parameter to &#39;ssh&#39;
not included in master yet:=20
ee30425 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
65cfc8a libva: Find the correct wayland-scanner
not included in master yet:=20
e391f58 qemux86: Add identical qemux86copy variant for tests
6d33fc3 sstate-sysroot-cruft.sh: Extend the whitelist
0de471f recipes: Replace &quot;cp -a&quot; with &quot;cp -R --no-dereferenc=
e --preserve=3Dmode,links&quot;
f0f6112 buildhistory.bbclass: metadata-revs show repo parent
ade2954 metadata-revs: provide more information
c5e658a report-error: Allow to upload reports automatically
63e44e5 flex: upgrade to 2.6.3
edfb18a Revert &quot;flex: upgrade to 2.6.3&quot;
3d6b996 Revert &quot;flex: upgrade to 2.6.2&quot;
ce5cb55 qemu: fix build with glibc-2.25
ea1f3b4 e2fsprogs: Fix build with glibc-2.25
7f249b3 parted: fix build with glibc-2.25
830df85 syslinux: fix build with glibc-2.25

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
05aefd1 openct: Replace /lib/udev with ${nonarch_base_libdir}/udev.
not included in master yet:=20
710ff64 netcat-openbsd: fix implicit dependency on pkg-config
b113645 inetutils: Move files only when src !=3D dst.
d2f2522 ebtables: Move files only when src !=3D dst.
4381e64 netcf_git: Check if src !=3D dst while moving files.
aaf09a6 Revert &quot;Samba: use built-in libtevent&quot;
4010fd9 python3-cassandra-driver: update to version 3.8.0
9af7bac python-bcrypt: update to version 3.1.3
0c36959 abiword: fix build and unblacklist
18e54c0 python-ldap: remove obsolete recipe
6798e4b python-ldap: update to version 2.4.32
131fcc2 python-slip-dbus: update to version 0.6.1
60efb4b python-django: update to version 1.10.5
f8d852e python-pyalsaaudio: update to version 0.8.3
e123e01 python-gdata: update to version 2.0.18
4816c64 Update UPSTREAM_CHECK variables to allow for version checking
cecf1dc collect: fix to build with glibc 2.25
b3e385c multipath-tools: Replace &#39;lib&#39; with ${nonarch_base_libdir} =
for placing udev rules.
e989b9a apache-websocket: add depend on pbzip2-native
0c46505 bundler: resolve build issues with RSS
df2b829 netdata: update DEPENDS to fix RSS build error
e16c3f6 usb-modeswitch: update inherit to work correctly with RSS
0dbe078 syslog-ng: update inherit to work correctly with RSS
5e1f391 xfsprogs: update depends to work correctly with RSS
3b988b0 ipmiutil: fix depends to work correctly with RSS
9114707 efivar: unblacklist package and those that depend on it
fa3cd65 mosh: update inherit to work correctly with RSS
8e73142 font-adobe-100dpi: update depends to fix builds with RSS
b2f14ff font-adobe-utopia-100dpi: update depends to fix builds with RSS
42d19a4 font-misc-misc: update depends to fix builds with RSS
78c0dde font-bh-lucidatypewriter-100dpi: update depends to fix builds with =
RSS
b89e109 font-bh-100dpi: update depends to fix builds with RSS
7019a1f system-config-keyboard: fix depends to work correctly with RSS
14ca28a nginx: update to version 1.11.10

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
61c0250 qtbase-native: nativesdk-qtbase: remove patch that breaks mkspec se=
tting for SDK
not included in master yet:=20
595e9cf qtbase: remove absolute binary paths from mkspec files

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
021a954 chromium-browser: add missing dependency on gperf-native
not included in master yet:=20
a9dd704 chromium: disable generate_character_data for x86

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
7c4309b packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
df77c54 linux-hp-tenderloin: don&#39;t use get_kernelversion_modules functi=
on and adapt to multiple kernel image types changes
not included in master yet:=20
</pre><div><br></div></pre></div></div>

--001a1146d9b64f7e74054993b288--
