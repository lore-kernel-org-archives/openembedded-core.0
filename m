Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7A689605FE;
	Thu, 20 Apr 2017 17:51:53 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id o81so109682296wmb.1;
	Thu, 20 Apr 2017 10:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=NI7hmdauX+iBFXVABeUC3KwPsLJ43QVe90oVVesFoWo=;
	b=aMHoSVBDkJzyxFvIPnGe8TfCmBkfa6C4u7ytsdb7bxyjiGlE/86Gla1EmxgbStWOH7
	ePioKVgdtUNxQdDjNET3Xmbs9fokc85LW+1d6ZJAd9V+nB7E6404cKmaLgmM5tc+t6Zx
	1ySiRkZu3VihrQroVKDCvi5MjWIt1EL1NetkJH/XWFDk5ocvDj3sN3KvMrJfyOmC9Wr/
	98avFfDgd89BLrLMFuXD3WBkGtNdwC/P6ZXrjfYatj/BYXugA8PwDmJKWoSgofFgGhmh
	fdt0C0m0pK2tJgAoVhmU26UVx9VH1IHIWkaIYRuFhmrl8KE+vdGB8J+NeXBZsNv0Zd11
	YY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=NI7hmdauX+iBFXVABeUC3KwPsLJ43QVe90oVVesFoWo=;
	b=qyHMYvKf0TSruqd0zZ1mrPH9Y1oa1+nBhPFDpQajtRlTYdEFzuzP3d5/S5uwZ1bmBC
	LrlIP+FHBjYzDuzbLqMhHgs2myvcUqFUuQuEuaVK0y6mlfNY7qzVjAO0h0BOGSSXQcy0
	FBJVI7rlbVGUXeQY0fv+etaipqeUaMo59oHE2IwP4MVbs7pSS6LMcse81Xm3zjQ+QwNw
	+az9MlFi19eF36xxxoS+coe0Do9i2+j5dcl5GweviiKsuLZbwYoGYEyHO39PrmiOlRZ2
	BXPDfhNH5vDlcOSYloOiT7zhraI7EBVKDOXy7aXg/hd7+a/neqAxHY0vy8T44xoF/kYo
	AAYw==
X-Gm-Message-State: AN3rC/6VXx7jSZlvCbm1JZVbovmyi3MezKc1NSkMk+5YXDHOoK56ABaS
	rMwtlkRZhu5XK5EJ
X-Received: by 10.28.197.135 with SMTP id v129mr4617438wmf.55.1492710713667;
	Thu, 20 Apr 2017 10:51:53 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g81sm2904425wmd.11.2017.04.20.10.51.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Apr 2017 10:51:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Apr 2017 19:52:00 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170420175200.GD3059@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.1 (2017-04-11)
Subject: State of bitbake world, Failed tasks 2017-04-19
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
X-List-Received-Date: Thu, 20 Apr 2017 17:51:53 -0000
X-Groupsio-MsgNum: 96496
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline

--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !!|Signatures		  !!colspan=3D'14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||ldflags	||compile-host-path	||=09
|-
||2017-04-19	||2	||2	||2	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||4		||0		||0		||52		||1		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-04-19 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170420_075010.log

=3D=3D=3D common (2) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/tinyproxy/tinyproxy=
_1.8.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/multipath-tools/multipath-t=
ools_git.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (6) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170418_023643.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36192/
|-
|| qemux86 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170418_023647.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36194/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170419_043639.log/ || http://errors.yoctoproject.or=
g/Errors/Build/36199/
|}

=3D=3D=3D PNBLACKLISTs (434) =3D=3D=3D

=3D=3D=3D QA issues (57) =3D=3D=3D
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
||0	||installed-vs-shipped
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
||1	||host-user-contaminated
|-
||4	||textrel
|-
||52	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170419_005341.log/

No issues detected

QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 4	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 52	issue: version-going-backwards
florence-0.5.4: Package version for package florence-dbg went backwards whi=
ch would break package feeds from (0:0.5.4-r1.39 to 0:0.5.4-r1.0) [version-=
going-backwards]
florence-0.5.4: Package version for package florence-dbg went backwards whi=
ch would break package feeds from (0:0.5.4-r1.43 to 0:0.5.4-r1.0) [version-=
going-backwards]
florence-0.5.4: Package version for package florence-dbg went backwards whi=
ch would break package feeds from (0:0.5.4-r1.44 to 0:0.5.4-r1.0) [version-=
going-backwards]
florence-0.5.4: Package version for package florence-dev went backwards whi=
ch would break package feeds from (0:0.5.4-r1.39 to 0:0.5.4-r1.0) [version-=
going-backwards]
florence-0.5.4: Package version for package florence-dev went backwards whi=
ch would break package feeds from (0:0.5.4-r1.43 to 0:0.5.4-r1.0) [version-=
going-backwards]
florence-0.5.4: Package version for package florence-dev went backwards whi=
ch would break package feeds from (0:0.5.4-r1.44 to 0:0.5.4-r1.0) [version-=
going-backwards]
florence-0.5.4: Package version for package florence-doc went backwards whi=
ch would break package feeds from (0:0.5.4-r1.39 to 0:0.5.4-r1.0) [version-=
going-backwards]
florence-0.5.4: Package version for package florence-doc went backwards whi=
ch would break package feeds from (0:0.5.4-r1.43 to 0:0.5.4-r1.0) [version-=
going-backwards]
florence-0.5.4: Package version for package florence-doc went backwards whi=
ch would break package feeds from (0:0.5.4-r1.44 to 0:0.5.4-r1.0) [version-=
going-backwards]
florence-0.5.4: Package version for package florence-locale-fr went backwar=
ds which would break package feeds from (0:0.5.4-r1.39 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence-locale-fr went backwar=
ds which would break package feeds from (0:0.5.4-r1.43 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence-locale-fr went backwar=
ds which would break package feeds from (0:0.5.4-r1.44 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence-locale-it went backwar=
ds which would break package feeds from (0:0.5.4-r1.39 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence-locale-it went backwar=
ds which would break package feeds from (0:0.5.4-r1.43 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence-locale-it went backwar=
ds which would break package feeds from (0:0.5.4-r1.44 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence-locale-ru went backwar=
ds which would break package feeds from (0:0.5.4-r1.39 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence-locale-ru went backwar=
ds which would break package feeds from (0:0.5.4-r1.43 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence-locale-ru went backwar=
ds which would break package feeds from (0:0.5.4-r1.44 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence-staticdev went backwar=
ds which would break package feeds from (0:0.5.4-r1.39 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence-staticdev went backwar=
ds which would break package feeds from (0:0.5.4-r1.43 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence-staticdev went backwar=
ds which would break package feeds from (0:0.5.4-r1.44 to 0:0.5.4-r1.0) [ve=
rsion-going-backwards]
florence-0.5.4: Package version for package florence went backwards which w=
ould break package feeds from (0:0.5.4-r1.39 to 0:0.5.4-r1.0) [version-goin=
g-backwards]
florence-0.5.4: Package version for package florence went backwards which w=
ould break package feeds from (0:0.5.4-r1.43 to 0:0.5.4-r1.0) [version-goin=
g-backwards]
florence-0.5.4: Package version for package florence went backwards which w=
ould break package feeds from (0:0.5.4-r1.44 to 0:0.5.4-r1.0) [version-goin=
g-backwards]
openzone-1.2.3: Package version for package openzone-black-slim went backwa=
rds which would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [v=
ersion-going-backwards]
openzone-1.2.3: Package version for package openzone-black-slim went backwa=
rds which would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [v=
ersion-going-backwards]
openzone-1.2.3: Package version for package openzone-black went backwards w=
hich would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [versio=
n-going-backwards]
openzone-1.2.3: Package version for package openzone-black went backwards w=
hich would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [versio=
n-going-backwards]
openzone-1.2.3: Package version for package openzone-dbg went backwards whi=
ch would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [version-=
going-backwards]
openzone-1.2.3: Package version for package openzone-dbg went backwards whi=
ch would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [version-=
going-backwards]
openzone-1.2.3: Package version for package openzone-dev went backwards whi=
ch would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [version-=
going-backwards]
openzone-1.2.3: Package version for package openzone-dev went backwards whi=
ch would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [version-=
going-backwards]
openzone-1.2.3: Package version for package openzone-doc went backwards whi=
ch would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [version-=
going-backwards]
openzone-1.2.3: Package version for package openzone-doc went backwards whi=
ch would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [version-=
going-backwards]
openzone-1.2.3: Package version for package openzone-fire-slim went backwar=
ds which would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [ve=
rsion-going-backwards]
openzone-1.2.3: Package version for package openzone-fire-slim went backwar=
ds which would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [ve=
rsion-going-backwards]
openzone-1.2.3: Package version for package openzone-fire went backwards wh=
ich would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [version=
-going-backwards]
openzone-1.2.3: Package version for package openzone-fire went backwards wh=
ich would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [version=
-going-backwards]
openzone-1.2.3: Package version for package openzone-ice-slim went backward=
s which would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [ver=
sion-going-backwards]
openzone-1.2.3: Package version for package openzone-ice-slim went backward=
s which would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [ver=
sion-going-backwards]
openzone-1.2.3: Package version for package openzone-ice went backwards whi=
ch would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [version-=
going-backwards]
openzone-1.2.3: Package version for package openzone-ice went backwards whi=
ch would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [version-=
going-backwards]
openzone-1.2.3: Package version for package openzone-locale went backwards =
which would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [versi=
on-going-backwards]
openzone-1.2.3: Package version for package openzone-locale went backwards =
which would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [versi=
on-going-backwards]
openzone-1.2.3: Package version for package openzone-staticdev went backwar=
ds which would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [ve=
rsion-going-backwards]
openzone-1.2.3: Package version for package openzone-staticdev went backwar=
ds which would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [ve=
rsion-going-backwards]
openzone-1.2.3: Package version for package openzone went backwards which w=
ould break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [version-goin=
g-backwards]
openzone-1.2.3: Package version for package openzone went backwards which w=
ould break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [version-goin=
g-backwards]
openzone-1.2.3: Package version for package openzone-white-slim went backwa=
rds which would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [v=
ersion-going-backwards]
openzone-1.2.3: Package version for package openzone-white-slim went backwa=
rds which would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [v=
ersion-going-backwards]
openzone-1.2.3: Package version for package openzone-white went backwards w=
hich would break package feeds from (0:1.2.3-r0.52 to 0:1.2.3-r0.0) [versio=
n-going-backwards]
openzone-1.2.3: Package version for package openzone-white went backwards w=
hich would break package feeds from (0:1.2.3-r0.57 to 0:1.2.3-r0.0) [versio=
n-going-backwards]


count: 1	issue: host-user-contaminated
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-sr-rs/usr/lib/loc=
ale/sr_RS/LC_MEASUREMENT is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
4fca9a0 bitbake-layers: add signal hander to avoid exception
not included in master yet:=20
801b638 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
ba2884f oe-run-native: print more error messages
not included in master yet:=20
9b6bb7b qemux86: Add identical qemux86copy variant for tests
6ed5be3 sstate-sysroot-cruft.sh: Extend the whitelist
9d6afd3 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
d389abe buildhistory.bbclass: metadata-revs show repo parent
5aa7ccb metadata-revs: provide more information
02c69f7 report-error: Allow to upload reports automatically
6326d3e Revert "mesa: Contain configure search for llvm"
a6c0d37 sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
444e1fb php: remove PNBLACKLIST
not included in master yet:=20
67886f8 dnsmasq: disable the service by default
9e26576 ctdb: Fix build with musl
77d199b libdnet: update SRC_URI
56fee45 wireless-regdb: fix crda failing from missing pubkey
3e017c8 ntp: update to 4.2.8.p10
a9841c0 netcat-openbsd: Fix build and whitelist
f20a1f5 squid: Update to 3.5.23
ee92739 libnfnetlink: Backport patches to fix musl build
7b808ee ebtables: Fix build with musl
1c968cc lowpan-tools: Fix build with musl
e26761f openl2tp: Fix build with musl
a1065c8 rp-pppoe: Fix build with musl
3c277f7 vsftpd: Fix build with musl
657bc99 dibbler: Upgrade to 1.0.2RC1
71531fb vpnc: Update to build from github SRC_URI
1b497d1 daq: Fix build with musl
10f5521 arptables: Upgrade to 0.0.4
35a5bb6 libnetfilter-log: Switch to git URI
1f8fc0f libnetfilter-queue: Update to git for SRC_URI
4be38ae snort: Fix build with musl
f52b5cb autofs: Patch to build on musl
731ad41 ntimed: Use adjtimex on musl
ebde31d uftp: Add recipe
e1b7d3e nfacct: fixed SRC_URI and dropped workdir statement
4eae490 postfix: do NOT create directory /var/spool/mail
3c646c8 waf-samba.bbclass: redefine WAF_CROSS_ANSWERS_PATH
444988a quagga: set ac_cv_path_PERL to '/usr/bin/env perl'
62f2aaf wireguard: add WireGuard kernel module and tools
3a919df openvpn: ensure ${sysconfdir}/tmpfiles.d is packaged
9daceb0 openvpn: remove duplicate attempt to create dir in ${localstatedir}
572b186 openvpn: openvpn-volatile.conf: avoid hardcoded localstatedir
cbabc23 openvpn: avoid packaging /run
f5c07b9 openvpn: avoid hardcoded path
de41bbe tinyproxy: Add recipe
a5a101f openzone: make build and unblacklist
a7fcb97 libsodium: Extend recipe for native and nativesdk usage
0ca0450 wireshark: update to 2.2.6
e0da1e7 gevent: update 0.13.8 -> 1.2.1
ee93ff5 python-systemd, python3-systemd: add a new recipes
c1f24b1 florence: unblacklist - gstreamer is fine
921112b devilspie2: add gettext to inherit and unblacklist
706be56 devilspie2: update 0.33 -> 0.42
ad0c362 mcelog: upgrade to 1.49 to support Denverton SoC
aac4a41 python-can: add initial recipe for version 1.5.2
d0ad5c4 klibc: disable PARALLEL_MAKE
1b084d6 hunspell: update 1.3.3 -> 1.6.1
5492675 gimp: update 2.8.18 -> 2.8.20
57e3c99 samba: fix conflict between samba and sudo packages
fc6ceec lvm2: separate libdevmapper to avoid circular dependency
46e894f cryptsetup: DEPENDS on libdevmapper instead of lvm2
cc367cb python-gsocketpool: add new recipe
1475d7e python-mprpc: add new recipe

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
5f837b4 qttools: add ptest
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
7c08bb1 Merge pull request #28 from twoerner/contrib/twoerner/chromium_54_p=
ush
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
4d4ffcb packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
d150b0a meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency
not included in master yet:=20


--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWPj1PwAKCRA3VSO3ZXaA
HFBzAKCbl95x62N2TDglosqj429WYm305ACgpI81BPEwL9GCLsUiHD7MCXwZzMc=
=4CKu
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
