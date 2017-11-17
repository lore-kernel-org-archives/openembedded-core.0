Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA5D719B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 00:58:17 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id 207so653743pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 16:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:message-id:date:user-agent:mime-version
	:content-language;
	bh=RGHLicOMMgtPRhl+f6eqs4OGvptkxoyKYUUkxKsd+Dc=;
	b=jkbalBkVQi0x8dnAuIKyBF73g1fsn9/N4DDu7u0REl+42zCPmELtKaf+dNZGcBta33
	3J14WflPOLPa3CfaU339dobkMHPB0rLL7DsrDXvWuQZ6ohB0uMDgXkymQdZdzU/nQxeu
	hBr7dY3hqYu1mgEnCieMr18I+0scLVxoYrtb4nC3ET0gWaClIIAa3ITGv4o2DqCPM4wb
	h5IMJZo2pRHSpZqjzgQpJYtwRD5FEs+7qFuAK7jdOirwgbH04veFrUgu/20h0ngAGMzG
	H2o86RKm+xnWtWWt0LiigTqz2WHD24wDLqeHsuUS0OOBoqU6eICg6pc7bq3LHC585UHH
	sm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:message-id:date:user-agent
	:mime-version:content-language;
	bh=RGHLicOMMgtPRhl+f6eqs4OGvptkxoyKYUUkxKsd+Dc=;
	b=N/rhi2X2cJjt5YRZ0frhEienKwP/QsqKNozUo82QAxS9cXiilQScfboi6gSxn7ZuBI
	ZeM/gh7SJpX5mXH4P7yV/Cm94ubrw6aSsd7zbzezENC2bj08WdGsR/BfJ9F2i2nxEzNg
	WVY4BjJ0g5PRTlzl+DJVt0H18wnq40yciAwMCNHs64DsaULnZaYa4LFgpYRnu44mNXrM
	f60s1bdSu/zj9eaa1i7snbjen8YtSimPAyAsJghSv0ntYwvg8ndjmoDymRwPqr6/Ky07
	s6lJl97mXnSLkKUmTHWqiy2aBt7ciugUcfURecRUdCzbaf81MpZ73SkSbTL48nF5iwBY
	H3IQ==
X-Gm-Message-State: AJaThX6KWz4ogF7pE32dm2KU7TtiJ7bdQJazQE9DXZbjoejFiH0ZrMqq
	KJpItVrzoFRocUq5v6Ldw5lf9w==
X-Google-Smtp-Source: AGs4zMZiPHa98zQsg090NSuIqXhu6BG/H/bBVfW4DOhtUIrdyCOmcmrYvF0xRnZbygEzaWwB3PZM0w==
X-Received: by 10.101.66.197 with SMTP id l5mr3465078pgp.240.1510880298413;
	Thu, 16 Nov 2017 16:58:18 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:7cd0:e230:c7af:b628?
	([2601:202:4001:9ea0:7cd0:e230:c7af:b628])
	by smtp.gmail.com with ESMTPSA id
	q16sm4017844pgq.79.2017.11.16.16.58.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Nov 2017 16:58:17 -0800 (PST)
From: akuster808 <akuster808@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <76bd64e7-a8d2-6534-4103-b05c0e4a01e7@gmail.com>
Date: Thu, 16 Nov 2017 16:58:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
Subject: State of bitbake world, Failed tasks 2017-11-
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
X-List-Received-Date: Fri, 17 Nov 2017 00:58:18 -0000
Content-Type: multipart/alternative;
	boundary="------------9E3A690004EB11785FFD2CFA"
Content-Language: en-US

--------------9E3A690004EB11785FFD2CFA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Version 2 of patches came in between builds so lots of
"version-going-backwards"


=3D=3D Failed tasks 2017-11-15 =3D=3D

INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/sumo/log.report.20171116_060616.log

=3D=3D=3D common (3) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-daemons/ddclient/ddclient=
_3.8.3.bb:do_install
    * meta-openembedded/meta-networking/recipes-daemons/postfix/postfix_3=
=2E2.2.bb:do_install
    * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3=
=2Ebb:do_configure

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_p=
ackage_qa

=3D=3D=3D qemuarm64 (3) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-kli=
bc_1.5.2.bb:do_install
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-k=
libc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:d=
o_compile

=3D=3D=3D qemux86 (27) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_62.0.3202.94.bb:do_c=
ompile
    * meta-browser/recipes-browser/firefox/firefox_45.9.0esr.bb:do_compil=
e
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_=
6.1.5.bb:do_package
    * meta-openembedded/meta-networking/recipes-connectivity/samba/samba_=
4.7.0.bb:do_patch
    * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5=
=2E17.07.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0=
=2E3.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-=
rsh_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netk=
it-rusers_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netk=
it-telnet_0.17.bb:do_configure
    * meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.5=
0.9.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1=
=2E8beta5.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/open-isns/open-is=
ns_0.97.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlb=
fs_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_=
compile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredum=
per_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.b=
b:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-syste=
md_234.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-system=
d_234.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-b=
ootchart_231.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_=
compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.12.3.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_packa=
ge_qa

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (45) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/=
log.world.qemuarm.20171115_170535.log/ || http://errors.yoctoproject.org/=
Errors/Build/48458/
|-
|| qemuarm64 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sum=
o/log.world.qemuarm64.20171115_214729.log/ || http://errors.yoctoproject.=
org/Errors/Build/48464/
|-
|| qemux86 	|| 30	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo=
/log.world.qemux86.20171115_170555.log/ || http://errors.yoctoproject.org=
/Errors/Build/48457/
|-
|| qemux86_64 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/su=
mo/log.world.qemux86-64.20171115_213129.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/48463/
|}

=3D=3D=3D PNBLACKLISTs (0) =3D=3D=3D

=3D=3D=3D QA issues (6949) =3D=3D=3D
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
||1	||installed-vs-shipped
|-
||2	||host-user-contaminated
|-
||2	||textrel
|-
||36	||qa_pseudo
|-
||6908	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.sig=
natures.20171116_023835.log/


    * ERROR: Nothing RPROVIDES 'glibc-gconv-euc-jp' (but /home/jenkins/oe=
/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.b=
b RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /=
home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPE=
NDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home=
/jenkins/oe/world/shr-core/tmpfs/stamps


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-qt5:
PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation=
 which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be te=
sted so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be tes=
ted so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be te=
sted so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads =
directory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' h=
as relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x2=
64/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.=
148' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 6908	issue: version-going-backwards

abiword-3.0.2: Package version for package abiword-clipart went backwards=
 which would break package feeds from (0:3.0.2-r0.15 to 0:3.0.2-r0.0) [ve=
rsion-going-backwards]
abiword-3.0.2: Package version for package abiword-dbg went backwards whi=
ch would break package feeds from (0:3.0.2-r0.15 to 0:3.0.2-r0.0) [versio=
n-going-backwards]
abiword-3.0.2: Package version for package abiword-dev went backwards whi=
ch would break package feeds from (0:3.0.2-r0.15 to 0:3.0.2-r0.0) [versio=
n-going-backwards]
abiword-3.0.2: Package version for package abiword-doc went backwards whi=
ch would break package feeds from (0:3.0.2-r0.15 to 0:3.0.2-r0.0) [versio=
n-going-backwards]
=2E...
xfwm4-4.12.4: Package version for package xfwm4-locale-zh-hk went backwar=
ds which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0)=
 [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-locale-zh-tw went backwar=
ds which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0)=
 [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-staticdev went backwards =
which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [v=
ersion-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-daloa went backward=
s which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) =
[version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-default-hdpi went b=
ackwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4=
-r0.0) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-default went backwa=
rds which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0=
) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-default-xhdpi went =
backwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.=
4-r0.0) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-kokodi went backwar=
ds which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0)=
 [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-moheli went backwar=
ds which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0)=
 [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4 went backwards which woul=
d break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [version-goi=
ng-backwards]

count: 2	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-es-ni/usr/lib/l=
ocale/es_NI/LC_COLLATE is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-conta=
minated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-fr-be/usr/lib/l=
ocale/fr_BE/LC_COLLATE is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-conta=
minated]


count: 1	issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 36	issue: qa_pseudo
cherokee-1.2.104+gitAUTOINC+75f041e225: This /work/core2-64-oe-linux/cher=
okee/1.2.104+gitAUTOINC+75f041e225-r0/pseudo/pseudo.log indicates 18 erro=
rs [qa_pseudo]
cherokee-1.2.104+gitAUTOINC+75f041e225: This /work/i586-oe-linux-musl/che=
rokee/1.2.104+gitAUTOINC+75f041e225-r0/pseudo/pseudo.log indicates 18 err=
ors [qa_pseudo]
ctdb-2.5.6: This /work/aarch64-oe-linux/ctdb/2.5.6-r0/pseudo/pseudo.log i=
ndicates 6 errors [qa_pseudo]
ctdb-2.5.6: This /work/armv5te-oe-linux-gnueabi/ctdb/2.5.6-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
ctdb-2.5.6: This /work/core2-64-oe-linux/ctdb/2.5.6-r0/pseudo/pseudo.log =
indicates 6 errors [qa_pseudo]
cyrus-sasl-2.1.26: This /work/i586-oe-linux-musl/cyrus-sasl/2.1.26-r0/pse=
udo/pseudo.log indicates 18 errors [qa_pseudo]
geany-plugins-1.31: This /work/core2-64-oe-linux/geany-plugins/1.31-r0/ps=
eudo/pseudo.log indicates 22 errors [qa_pseudo]
gvfs-1.32.1: This /work/i586-oe-linux-musl/gvfs/1.32.1-r0/pseudo/pseudo.l=
og indicates 18 errors [qa_pseudo]
libgnomeui-2.24.5: This /work/aarch64-oe-linux/libgnomeui/2.24.5-r0/pseud=
o/pseudo.log indicates 18 errors [qa_pseudo]
libgsf-1.14.29: This /work/aarch64-oe-linux/libgsf/1.14.29-r0/pseudo/pseu=
do.log indicates 16 errors [qa_pseudo]
libgsf-1.14.29: This /work/core2-64-oe-linux/libgsf/1.14.29-r0/pseudo/pse=
udo.log indicates 18 errors [qa_pseudo]
libtimezonemap-0.4.5: This /work/aarch64-oe-linux/libtimezonemap/0.4.5-r0=
/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
libvorbis-1.3.5: This /work/aarch64-oe-linux/libvorbis/1.3.5-r0/pseudo/ps=
eudo.log indicates 8 errors [qa_pseudo]
mariadb-5.5.57: This /work/core2-64-oe-linux/mariadb/5.5.57-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
modemmanager-1.6.4: This /work/aarch64-oe-linux/modemmanager/1.6.4-r0/pse=
udo/pseudo.log indicates 10 errors [qa_pseudo]
open-isns-0.97: This /work/core2-64-oe-linux/open-isns/0.97-r0/pseudo/pse=
udo.log indicates 6 errors [qa_pseudo]
php-7.1.9: This /work/aarch64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log ind=
icates 14 errors [qa_pseudo]
php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.=
log indicates 11 errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log in=
dicates 14 errors [qa_pseudo]
php-7.1.9: This /work/i586-oe-linux-musl/php/7.1.9-r0/pseudo/pseudo.log i=
ndicates 11 errors [qa_pseudo]
postgresql-9.4.15: This /work/aarch64-oe-linux/postgresql/9.4.15-r0/pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
postgresql-9.4.15: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.15-r=
0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
postgresql-9.4.15: This /work/core2-64-oe-linux/postgresql/9.4.15-r0/pseu=
do/pseudo.log indicates 14 errors [qa_pseudo]
postgresql-9.4.15: This /work/i586-oe-linux-musl/postgresql/9.4.15-r0/pse=
udo/pseudo.log indicates 14 errors [qa_pseudo]
python3-cython-0.27.3: This /work/aarch64-oe-linux/python3-cython/0.27.3-=
r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-ndg-httpsclient-0.4.3: This /work/aarch64-oe-linux/python3-ndg-ht=
tpsclient/0.4.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-ndg-httpsclient-0.4.3: This /work/aarch64-oe-linux/python-ndg-http=
sclient/0.4.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-simplejson-3.12.0: This /work/aarch64-oe-linux/python-simplejson/3=
=2E12.0-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
python-snimpy-0.8.12: This /work/armv5te-oe-linux-gnueabi/python-snimpy/0=
=2E8.12-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-snimpy-0.8.12: This /work/core2-64-oe-linux/python-snimpy/0.8.12-r=
0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
samba-4.7.0: This /work/aarch64-oe-linux/samba/4.7.0-r0/pseudo/pseudo.log=
 indicates 11 errors [qa_pseudo]
squid-3.5.26: This /work/aarch64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
squid-3.5.26: This /work/core2-64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
thunar-media-tags-plugin-0.2.1: This /work/core2-64-oe-linux/thunar-media=
-tags-plugin/0.2.1-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
xfce4-mpc-plugin-0.5.0: This /work/i586-oe-linux-musl/xfce4-mpc-plugin/0.=
5.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xfce4-settings-4.12.1+gitAUTOINC+0766cf81da: This /work/armv5te-oe-linux-=
gnueabi/xfce4-settings/4.12.1+gitAUTOINC+0766cf81da-r0/pseudo/pseudo.log =
indicates 16 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
af7d63b tinfoil: Ensure we clean up loggers
not included in master yet:=20
ab1c49a world-image: add extra target
d8f0984 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
a17f3ec dhcp: fix build issue with libxml2 support
not included in master yet:=20
f8d9e9e report-error: Allow to upload reports automatically
56c8e31 buildhistory.bbclass: metadata-revs show repo parent
c08cc8b metadata-revs: provide more information
5f62d0b qemux86: Add identical qemux86copy variant for tests
214f24c reproducible_build.bbclass: initial support for binary reproducib=
ility
2d1a50b cpio: provide cpio-replacement-native
11d5244 image_types.bbclass: improve cpio image reproducibility
ea95ca0 rootfs-postcommands.bbclass: support binary reproducibility
582a655 sstate.bbclass: Do not cause build failures due to setscene error=
s
ed6a4cf insane.bbclass: Add do_qa_pseudo function to check for common err=
ors listed in pseudo.log
0798b47 insane.bbclass: use package_qa_handle_error for do_qa_pseudo

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
54f6f64 python-pysmi: update recipe to use pypi
not included in master yet:=20
4e91641 bridge-utils: modify the AR to cross toolchain
e634871 ssmtp: misc recipe updates + add Debian "partial loss of message =
body" fix
a00e467 dovecot: Fix parallel build
7063684 dnsmasq: update SRC_URI for versions 2.69 and earlier
8457c32 postfix: fix send mail failure and eliminate warning
01fd711 openvpn: Upgrade 2.4.3 -> 2.4.4
7cc4bb9 arptables: Fix do_install task
4b47db1 ddclient: new package
32107b5 lksctp-tools: update and remove from blacklist
feae271 freediameter: add new recipe
14028ae net-snmp: support openssl without 3des
9225e26 stunnel: fix compile error when openssl disable des support
4a6bf5e bridge-utils: update to v1.6
016f3b4 corosync: 2.4.2 -> 2.4.3
b6b1fe5 gparted: update 0.28.1 -> 0.30.0
04fb27f libgphoto2: update 2.5.8 -> 2.5.14
82ac6ca gphoto2: update 2.5.8 -> 2.5.14
90d1d78 xfce4-settings: update to 4.12.1
946432c xfce4-pulseaudio-plugin: update 0.2.4 -> 0.3.2
429e17e xfce4-weather-plugin: update 0.8.9 -> 0.8.10
b637885 xfce4-xkb-plugin: update 0.8.0 -> 0.8.1
2d7cb65 xfce4-appfinder: update 4.12.0 -> 4.13.0
8ca6172 xfdesktop: update 4.12.3 -> 4.12.4
85f5b95 tumbler: update 0.1.31 to 0.2.0
742caec xfce4-notifyd: update 0.3.6 -> 0.4.0
6c4506e xfce4-notifyd: avoid trouble starting daemon for images with mult=
iple desktops
268bac4 python3-certifi: update to version 2017.11.5
546dd76 python-cython: update to version 0.27.3
bd04830 python-lxml: update to version 4.1.1
d779835 python-pexpect: update to version 4.3.0
666b3af python-psutil: update to version 5.4.1
c68c8f4 python3-multidict: update to version 3.3.2
a5b84ba python-pymisp: update to version 2.4.82
b82e0b1 python-jsonpointer: update to version 1.14
629beff python-attrs: update to version 17.3.0
4684d03 python-pytz: update to version 2017.3
a81e282 python-snimpy: update to version 0.8.12
325e514 python-cmd2: update to version 0.7.8
620c28f python-simplejson: update to version 3.12.0
e7141e9 python-sqlalchemy: update to version 1.1.15
f31e434 python-monotonic: update to version 1.4
8b9da3c python-cryptography: update to version 2.1.3
459d58d python-cryptography-vectors: update to version 2.1.3
2dfc8c1 python-pandas: update to version 0.21.0
f6e34fe usb-modeswitch: add usb-modeswitch@.service
da9116d opencv: Update ICV variable names
2446317 opencv: Use OE built Protobuf
cf9239a opencv: Download tinydnn manually
b457c01 opencv: Fix java wrapper generation
ce09dde postgresql: Update to 9.4.15
0745bf0 mariadb: Added missing installation of mysqld_safe_helper to FILE=
S_${PN}-server
bfdfade libc-bench: add recipe
cb83d98 freerdp: Update to 2.0.0
25c3d3f gpsd: fix /etc/default/gpsd ALTERNATIVES logic
d0a9ac3 cyrus-sasl: virtual/db isn't used by core, change to db
2139f3e postfix: virtual/db isn't used by core, change to db
390338b polkit: add consolekit only when x11 is enabled
c448e17 networkmanager: add consolekit only when x11 is enabled
473eca0 iscsi-initiator-utils: check file existence before moving
68dc6aa iscsi-initiator-utils: remove the distro_features_check
d06e2ec open-isns: add sysvinit support
dc299ea libtalloc: update to version 2.1.10
ded11e7 libtevent: update to version 0.99.33
5a2632c libtdb: update to version 1.3.15
e012b09 libldb: update to version 1.2.2
2735312 Revert "samba: add missing RDEPENDS"
e30572c samba: move to version 4.7.0

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
06d1c47 qtwebengine: make test suite succeed
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
a8bb1e7 Merge pull request #75 from rakuco/chromium-62.0.3202.94
not included in master yet:=20


--------------9E3A690004EB11785FFD2CFA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <p>Version 2 of patches came in between builds so lots of
      "version-going-backwards"<br>
    </p>
    <p><br>
    </p>
    <pre class="console-output">== Failed tasks 2017-11-15 ==

INFO: jenkins-job.sh-1.8.43 Complete log available at <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20171116_060616.log">http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20171116_060616.log</a>

=== common (3) ===
    * meta-openembedded/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb:do_install
    * meta-openembedded/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb:do_install
    * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:do_configure

=== common-x86 (0) ===

=== qemuarm (2) ===
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_package_qa

=== qemuarm64 (3) ===
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb:do_install
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_compile

=== qemux86 (27) ===
    * meta-browser/recipes-browser/chromium/chromium_62.0.3202.94.bb:do_compile
    * meta-browser/recipes-browser/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package
    * meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb:do_patch
    * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.17.07.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
    * meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/open-isns/open-isns_0.97.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-systemd_234.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-systemd_234.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa

=== qemux86_64 (0) ===

=== Number of failed tasks (45) ===
{| class=wikitable
|-
|| qemuarm 	|| 5	 || <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm.20171115_170535.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm.20171115_170535.log/</a> || <a href="http://errors.yoctoproject.org/Errors/Build/48458/">http://errors.yoctoproject.org/Errors/Build/48458/</a>
|-
|| qemuarm64 	|| 6	 || <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm64.20171115_214729.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm64.20171115_214729.log/</a> || <a href="http://errors.yoctoproject.org/Errors/Build/48464/">http://errors.yoctoproject.org/Errors/Build/48464/</a>
|-
|| qemux86 	|| 30	 || <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86.20171115_170555.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86.20171115_170555.log/</a> || <a href="http://errors.yoctoproject.org/Errors/Build/48457/">http://errors.yoctoproject.org/Errors/Build/48457/</a>
|-
|| qemux86_64 	|| 4	 || <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86-64.20171115_213129.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86-64.20171115_213129.log/</a> || <a href="http://errors.yoctoproject.org/Errors/Build/48463/">http://errors.yoctoproject.org/Errors/Build/48463/</a>
|}

=== PNBLACKLISTs (0) ===

=== QA issues (6949) ===
{| class=wikitable
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
||1	||installed-vs-shipped
|-
||2	||host-user-contaminated
|-
||2	||textrel
|-
||36	||qa_pseudo
|-
||6908	||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.signatures.20171116_023835.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.signatures.20171116_023835.log/</a>


    * ERROR: Nothing RPROVIDES 'glibc-gconv-euc-jp' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/jenkins/oe/world/shr-core/tmpfs/stamps


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-qt5:
PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads directory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 6908	issue: version-going-backwards</pre>
    <pre class="console-output">abiword-3.0.2: Package version for package abiword-clipart went backwards which would break package feeds from (0:3.0.2-r0.15 to 0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-dbg went backwards which would break package feeds from (0:3.0.2-r0.15 to 0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-dev went backwards which would break package feeds from (0:3.0.2-r0.15 to 0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-doc went backwards which would break package feeds from (0:3.0.2-r0.15 to 0:3.0.2-r0.0) [version-going-backwards]
....
xfwm4-4.12.4: Package version for package xfwm4-locale-zh-hk went backwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-locale-zh-tw went backwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-staticdev went backwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-daloa went backwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-default-hdpi went backwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-default went backwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-default-xhdpi went backwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-kokodi went backwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4-theme-moheli went backwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [version-going-backwards]
xfwm4-4.12.4: Package version for package xfwm4 went backwards which would break package feeds from (0:4.12.4-r0.15 to 0:4.12.4-r0.0) [version-going-backwards]
</pre>
    <pre class="console-output">count: 2	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-es-ni/usr/lib/locale/es_NI/LC_COLLATE is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-fr-be/usr/lib/locale/fr_BE/LC_COLLATE is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 36	issue: qa_pseudo
cherokee-1.2.104+gitAUTOINC+75f041e225: This /work/core2-64-oe-linux/cherokee/1.2.104+gitAUTOINC+75f041e225-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
cherokee-1.2.104+gitAUTOINC+75f041e225: This /work/i586-oe-linux-musl/cherokee/1.2.104+gitAUTOINC+75f041e225-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
ctdb-2.5.6: This /work/aarch64-oe-linux/ctdb/2.5.6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
ctdb-2.5.6: This /work/armv5te-oe-linux-gnueabi/ctdb/2.5.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
ctdb-2.5.6: This /work/core2-64-oe-linux/ctdb/2.5.6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
cyrus-sasl-2.1.26: This /work/i586-oe-linux-musl/cyrus-sasl/2.1.26-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
geany-plugins-1.31: This /work/core2-64-oe-linux/geany-plugins/1.31-r0/pseudo/pseudo.log indicates 22 errors [qa_pseudo]
gvfs-1.32.1: This /work/i586-oe-linux-musl/gvfs/1.32.1-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
libgnomeui-2.24.5: This /work/aarch64-oe-linux/libgnomeui/2.24.5-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
libgsf-1.14.29: This /work/aarch64-oe-linux/libgsf/1.14.29-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
libgsf-1.14.29: This /work/core2-64-oe-linux/libgsf/1.14.29-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
libtimezonemap-0.4.5: This /work/aarch64-oe-linux/libtimezonemap/0.4.5-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
libvorbis-1.3.5: This /work/aarch64-oe-linux/libvorbis/1.3.5-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
mariadb-5.5.57: This /work/core2-64-oe-linux/mariadb/5.5.57-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
modemmanager-1.6.4: This /work/aarch64-oe-linux/modemmanager/1.6.4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
open-isns-0.97: This /work/core2-64-oe-linux/open-isns/0.97-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
php-7.1.9: This /work/aarch64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
php-7.1.9: This /work/i586-oe-linux-musl/php/7.1.9-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
postgresql-9.4.15: This /work/aarch64-oe-linux/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postgresql-9.4.15: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
postgresql-9.4.15: This /work/core2-64-oe-linux/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
postgresql-9.4.15: This /work/i586-oe-linux-musl/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
python3-cython-0.27.3: This /work/aarch64-oe-linux/python3-cython/0.27.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-ndg-httpsclient-0.4.3: This /work/aarch64-oe-linux/python3-ndg-httpsclient/0.4.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-ndg-httpsclient-0.4.3: This /work/aarch64-oe-linux/python-ndg-httpsclient/0.4.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-simplejson-3.12.0: This /work/aarch64-oe-linux/python-simplejson/3.12.0-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
python-snimpy-0.8.12: This /work/armv5te-oe-linux-gnueabi/python-snimpy/0.8.12-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-snimpy-0.8.12: This /work/core2-64-oe-linux/python-snimpy/0.8.12-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
samba-4.7.0: This /work/aarch64-oe-linux/samba/4.7.0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
squid-3.5.26: This /work/aarch64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
squid-3.5.26: This /work/core2-64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
thunar-media-tags-plugin-0.2.1: This /work/core2-64-oe-linux/thunar-media-tags-plugin/0.2.1-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
xfce4-mpc-plugin-0.5.0: This /work/i586-oe-linux-musl/xfce4-mpc-plugin/0.5.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xfce4-settings-4.12.1+gitAUTOINC+0766cf81da: This /work/armv5te-oe-linux-gnueabi/xfce4-settings/4.12.1+gitAUTOINC+0766cf81da-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit: 
af7d63b tinfoil: Ensure we clean up loggers
not included in master yet: 
ab1c49a world-image: add extra target
d8f0984 fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit: 
a17f3ec dhcp: fix build issue with libxml2 support
not included in master yet: 
f8d9e9e report-error: Allow to upload reports automatically
56c8e31 buildhistory.bbclass: metadata-revs show repo parent
c08cc8b metadata-revs: provide more information
5f62d0b qemux86: Add identical qemux86copy variant for tests
214f24c reproducible_build.bbclass: initial support for binary reproducibility
2d1a50b cpio: provide cpio-replacement-native
11d5244 image_types.bbclass: improve cpio image reproducibility
ea95ca0 rootfs-postcommands.bbclass: support binary reproducibility
582a655 sstate.bbclass: Do not cause build failures due to setscene errors
ed6a4cf insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
0798b47 insane.bbclass: use package_qa_handle_error for do_qa_pseudo

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit: 
54f6f64 python-pysmi: update recipe to use pypi
not included in master yet: 
4e91641 bridge-utils: modify the AR to cross toolchain
e634871 ssmtp: misc recipe updates + add Debian "partial loss of message body" fix
a00e467 dovecot: Fix parallel build
7063684 dnsmasq: update SRC_URI for versions 2.69 and earlier
8457c32 postfix: fix send mail failure and eliminate warning
01fd711 openvpn: Upgrade 2.4.3 -&gt; 2.4.4
7cc4bb9 arptables: Fix do_install task
4b47db1 ddclient: new package
32107b5 lksctp-tools: update and remove from blacklist
feae271 freediameter: add new recipe
14028ae net-snmp: support openssl without 3des
9225e26 stunnel: fix compile error when openssl disable des support
4a6bf5e bridge-utils: update to v1.6
016f3b4 corosync: 2.4.2 -&gt; 2.4.3
b6b1fe5 gparted: update 0.28.1 -&gt; 0.30.0
04fb27f libgphoto2: update 2.5.8 -&gt; 2.5.14
82ac6ca gphoto2: update 2.5.8 -&gt; 2.5.14
90d1d78 xfce4-settings: update to 4.12.1
946432c xfce4-pulseaudio-plugin: update 0.2.4 -&gt; 0.3.2
429e17e xfce4-weather-plugin: update 0.8.9 -&gt; 0.8.10
b637885 xfce4-xkb-plugin: update 0.8.0 -&gt; 0.8.1
2d7cb65 xfce4-appfinder: update 4.12.0 -&gt; 4.13.0
8ca6172 xfdesktop: update 4.12.3 -&gt; 4.12.4
85f5b95 tumbler: update 0.1.31 to 0.2.0
742caec xfce4-notifyd: update 0.3.6 -&gt; 0.4.0
6c4506e xfce4-notifyd: avoid trouble starting daemon for images with multiple desktops
268bac4 python3-certifi: update to version 2017.11.5
546dd76 python-cython: update to version 0.27.3
bd04830 python-lxml: update to version 4.1.1
d779835 python-pexpect: update to version 4.3.0
666b3af python-psutil: update to version 5.4.1
c68c8f4 python3-multidict: update to version 3.3.2
a5b84ba python-pymisp: update to version 2.4.82
b82e0b1 python-jsonpointer: update to version 1.14
629beff python-attrs: update to version 17.3.0
4684d03 python-pytz: update to version 2017.3
a81e282 python-snimpy: update to version 0.8.12
325e514 python-cmd2: update to version 0.7.8
620c28f python-simplejson: update to version 3.12.0
e7141e9 python-sqlalchemy: update to version 1.1.15
f31e434 python-monotonic: update to version 1.4
8b9da3c python-cryptography: update to version 2.1.3
459d58d python-cryptography-vectors: update to version 2.1.3
2dfc8c1 python-pandas: update to version 0.21.0
f6e34fe usb-modeswitch: add <a class="moz-txt-link-abbreviated" href="mailto:usb-modeswitch@.service">usb-modeswitch@.service</a>
da9116d opencv: Update ICV variable names
2446317 opencv: Use OE built Protobuf
cf9239a opencv: Download tinydnn manually
b457c01 opencv: Fix java wrapper generation
ce09dde postgresql: Update to 9.4.15
0745bf0 mariadb: Added missing installation of mysqld_safe_helper to FILES_${PN}-server
bfdfade libc-bench: add recipe
cb83d98 freerdp: Update to 2.0.0
25c3d3f gpsd: fix /etc/default/gpsd ALTERNATIVES logic
d0a9ac3 cyrus-sasl: virtual/db isn't used by core, change to db
2139f3e postfix: virtual/db isn't used by core, change to db
390338b polkit: add consolekit only when x11 is enabled
c448e17 networkmanager: add consolekit only when x11 is enabled
473eca0 iscsi-initiator-utils: check file existence before moving
68dc6aa iscsi-initiator-utils: remove the distro_features_check
d06e2ec open-isns: add sysvinit support
dc299ea libtalloc: update to version 2.1.10
ded11e7 libtevent: update to version 0.99.33
5a2632c libtdb: update to version 1.3.15
e012b09 libldb: update to version 1.2.2
2735312 Revert "samba: add missing RDEPENDS"
e30572c samba: move to version 4.7.0

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit: 
06d1c47 qtwebengine: make test suite succeed
not included in master yet: 

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit: 
a8bb1e7 Merge pull request #75 from rakuco/chromium-62.0.3202.94
not included in master yet: 
</pre>
  </body>
</html>

--------------9E3A690004EB11785FFD2CFA--
