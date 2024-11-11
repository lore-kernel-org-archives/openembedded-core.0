Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3ACD3ABE5
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:14:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.66464.1731348832175963382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FCE31480
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:14:21 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B6BC3F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:13:51 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] systemd: don't use deprecated meson option values
Date: Mon, 11 Nov 2024 18:13:41 +0000
Message-Id: <20241111181341.3296523-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111181341.3296523-1-ross.burton@arm.com>
References: <20241111181341.3296523-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206975

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_256.7.bb | 74 +++++++++++-----------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-co=
re/systemd/systemd_256.7.bb
index af810c0fcd9..f3af4ac44dc 100644
--- a/meta/recipes-core/systemd/systemd_256.7.bb
+++ b/meta/recipes-core/systemd/systemd_256.7.bb
@@ -130,68 +130,68 @@ TARGET_CC_ARCH:append:libc-musl =3D " -D__UAPI_DEF_=
ETHHDR=3D0 -D_LARGEFILE64_SOURCE"
 # systemd-serialgetty.bb - not enabled by default.
 PACKAGECONFIG[serial-getty-generator] =3D ""
=20
-PACKAGECONFIG[acl] =3D "-Dacl=3Dtrue,-Dacl=3Dfalse,acl"
-PACKAGECONFIG[audit] =3D "-Daudit=3Dtrue,-Daudit=3Dfalse,audit"
+PACKAGECONFIG[acl] =3D "-Dacl=3Denabled,-Dacl=3Ddisabled,acl"
+PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit"
 PACKAGECONFIG[backlight] =3D "-Dbacklight=3Dtrue,-Dbacklight=3Dfalse"
 PACKAGECONFIG[binfmt] =3D "-Dbinfmt=3Dtrue,-Dbinfmt=3Dfalse"
-PACKAGECONFIG[bpf-framework] =3D "-Dbpf-framework=3Dtrue,-Dbpf-framework=
=3Dfalse,clang-native bpftool-native libbpf,libbpf"
-PACKAGECONFIG[bzip2] =3D "-Dbzip2=3Dtrue,-Dbzip2=3Dfalse,bzip2"
+PACKAGECONFIG[bpf-framework] =3D "-Dbpf-framework=3Denabled,-Dbpf-framew=
ork=3Ddisabled,clang-native bpftool-native libbpf,libbpf"
+PACKAGECONFIG[bzip2] =3D "-Dbzip2=3Denabled,-Dbzip2=3Ddisabled,bzip2"
 PACKAGECONFIG[coredump] =3D "-Dcoredump=3Dtrue,-Dcoredump=3Dfalse"
-PACKAGECONFIG[cryptsetup] =3D "-Dlibcryptsetup=3Dtrue,-Dlibcryptsetup=3D=
false,cryptsetup,,cryptsetup"
-PACKAGECONFIG[cryptsetup-plugins] =3D "-Dlibcryptsetup-plugins=3Dtrue,-D=
libcryptsetup-plugins=3Dfalse,cryptsetup,,cryptsetup"
-PACKAGECONFIG[tpm2] =3D "-Dtpm2=3Dtrue,-Dtpm2=3Dfalse,tpm2-tss,tpm2-tss =
libtss2 libtss2-tcti-device"
+PACKAGECONFIG[cryptsetup] =3D "-Dlibcryptsetup=3Denabled,-Dlibcryptsetup=
=3Ddisabled,cryptsetup,,cryptsetup"
+PACKAGECONFIG[cryptsetup-plugins] =3D "-Dlibcryptsetup-plugins=3Denabled=
,-Dlibcryptsetup-plugins=3Ddisabled,cryptsetup,,cryptsetup"
+PACKAGECONFIG[tpm2] =3D "-Dtpm2=3Denabled,-Dtpm2=3Ddisabled,tpm2-tss,tpm=
2-tss libtss2 libtss2-tcti-device"
 # If multiple compression libraries are enabled, the format to use for c=
ompression is chosen implicitly,
 # so if you want to compress with e.g. lz4 you cannot enable zstd, so yo=
u cannot read zstd-compressed journal files.
 # This option allows to enable all compression formats for reading, but =
choosing a specific one for writing.
 PACKAGECONFIG[default-compression-lz4] =3D "-Dlz4=3Dtrue -Ddefault-compr=
ession=3Dlz4,,lz4"
 PACKAGECONFIG[default-compression-xz] =3D "-Dxz=3Dtrue -Ddefault-compres=
sion=3Dxz,,xz"
 PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3Dtrue -Ddefault-com=
pression=3Dzstd,,zstd"
-PACKAGECONFIG[dbus] =3D "-Ddbus=3Dtrue,-Ddbus=3Dfalse,dbus"
-PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Dtrue,-Defi=3Dfalse -=
Dbootloader=3Dfalse,python3-pyelftools-native"
-PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,elfuti=
ls,,libelf libdw"
+PACKAGECONFIG[dbus] =3D "-Ddbus=3Denabled,-Ddbus=3Ddisabled,dbus"
+PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Denabled,-Defi=3Dfals=
e -Dbootloader=3Ddisabled,python3-pyelftools-native"
+PACKAGECONFIG[elfutils] =3D "-Delfutils=3Denabled,-Delfutils=3Ddisabled,=
elfutils,,libelf libdw"
 PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse"
-PACKAGECONFIG[repart] =3D "-Drepart=3Dtrue,-Drepart=3Dfalse"
-PACKAGECONFIG[homed] =3D "-Dhomed=3Dtrue,-Dhomed=3Dfalse"
+PACKAGECONFIG[repart] =3D "-Drepart=3Denabled,-Drepart=3Ddisabled"
+PACKAGECONFIG[homed] =3D "-Dhomed=3Denabled,-Dhomed=3Ddisabled"
 # Sign the journal for anti-tampering
-PACKAGECONFIG[gcrypt] =3D "-Dgcrypt=3Dtrue,-Dgcrypt=3Dfalse,libgcrypt"
-PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
+PACKAGECONFIG[gcrypt] =3D "-Dgcrypt=3Denabled,-Dgcrypt=3Ddisabled,libgcr=
ypt"
+PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Denabled,-Dgnutls=3Ddisabled,gnutls=
"
 PACKAGECONFIG[gshadow] =3D "-Dgshadow=3Dtrue,-Dgshadow=3Dfalse"
 PACKAGECONFIG[hibernate] =3D "-Dhibernate=3Dtrue,-Dhibernate=3Dfalse"
 PACKAGECONFIG[hostnamed] =3D "-Dhostnamed=3Dtrue,-Dhostnamed=3Dfalse"
 PACKAGECONFIG[idn] =3D "-Didn=3Dtrue,-Didn=3Dfalse"
 PACKAGECONFIG[ima] =3D "-Dima=3Dtrue,-Dima=3Dfalse"
 # importd requires journal-upload/xz/zlib/bzip2/gcrypt
-PACKAGECONFIG[importd] =3D "-Dimportd=3Dtrue,-Dimportd=3Dfalse,glib-2.0"
+PACKAGECONFIG[importd] =3D "-Dimportd=3Denabled,-Dimportd=3Ddisabled,gli=
b-2.0"
 # Update NAT firewall rules
-PACKAGECONFIG[iptc] =3D "-Dlibiptc=3Dtrue,-Dlibiptc=3Dfalse,iptables"
+PACKAGECONFIG[iptc] =3D "-Dlibiptc=3Denabled,-Dlibiptc=3Ddisabled,iptabl=
es"
 PACKAGECONFIG[journal-color] =3D ",,,less"
-PACKAGECONFIG[journal-upload] =3D "-Dlibcurl=3Dtrue,-Dlibcurl=3Dfalse,cu=
rl"
-PACKAGECONFIG[kmod] =3D "-Dkmod=3Dtrue,-Dkmod=3Dfalse,kmod,libkmod"
+PACKAGECONFIG[journal-upload] =3D "-Dlibcurl=3Denabled,-Dlibcurl=3Ddisab=
led,curl"
+PACKAGECONFIG[kmod] =3D "-Dkmod=3Denabled,-Dkmod=3Ddisabled,kmod,libkmod=
"
 PACKAGECONFIG[ldconfig] =3D "-Dldconfig=3Dtrue,-Dldconfig=3Dfalse,,ldcon=
fig"
-PACKAGECONFIG[libidn] =3D "-Dlibidn=3Dtrue,-Dlibidn=3Dfalse,libidn,,libi=
dn"
-PACKAGECONFIG[libidn2] =3D "-Dlibidn2=3Dtrue,-Dlibidn2=3Dfalse,libidn2,,=
libidn2"
+PACKAGECONFIG[libidn] =3D "-Dlibidn=3Denabled,-Dlibidn=3Ddisabled,libidn=
,,libidn"
+PACKAGECONFIG[libidn2] =3D "-Dlibidn2=3Denabled,-Dlibidn2=3Ddisabled,lib=
idn2,,libidn2"
 # Link udev shared with systemd helper library.
 # If enabled the udev package depends on the systemd package (which has =
the needed shared library).
 PACKAGECONFIG[link-udev-shared] =3D "-Dlink-udev-shared=3Dtrue,-Dlink-ud=
ev-shared=3Dfalse"
 PACKAGECONFIG[localed] =3D "-Dlocaled=3Dtrue,-Dlocaled=3Dfalse"
 PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue,-Dlogind=3Dfalse"
-PACKAGECONFIG[lz4] =3D "-Dlz4=3Dtrue,-Dlz4=3Dfalse,lz4"
+PACKAGECONFIG[lz4] =3D "-Dlz4=3Denabled,-Dlz4=3Ddisabled,lz4"
 PACKAGECONFIG[machined] =3D "-Dmachined=3Dtrue,-Dmachined=3Dfalse"
-PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native x=
mlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-PACKAGECONFIG[microhttpd] =3D "-Dmicrohttpd=3Dtrue,-Dmicrohttpd=3Dfalse,=
libmicrohttpd"
+PACKAGECONFIG[manpages] =3D "-Dman=3Denabled,-Dman=3Ddisabled,libxslt-na=
tive xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[microhttpd] =3D "-Dmicrohttpd=3Denabled,-Dmicrohttpd=3Ddis=
abled,libmicrohttpd"
 PACKAGECONFIG[myhostname] =3D "-Dnss-myhostname=3Dtrue,-Dnss-myhostname=3D=
false,,libnss-myhostname"
 PACKAGECONFIG[networkd] =3D "-Dnetworkd=3Dtrue,-Dnetworkd=3Dfalse"
 PACKAGECONFIG[no-dns-fallback] =3D "-Ddns-servers=3D"
 PACKAGECONFIG[no-ntp-fallback] =3D "-Dntp-servers=3D"
 PACKAGECONFIG[nss] =3D "-Dnss-systemd=3Dtrue,-Dnss-systemd=3Dfalse,,libn=
ss-systemd"
-PACKAGECONFIG[nss-mymachines] =3D "-Dnss-mymachines=3Dtrue,-Dnss-mymachi=
nes=3Dfalse"
-PACKAGECONFIG[nss-resolve] =3D "-Dnss-resolve=3Dtrue,-Dnss-resolve=3Dfal=
se"
+PACKAGECONFIG[nss-mymachines] =3D "-Dnss-mymachines=3Denabled,-Dnss-myma=
chines=3Ddisabled"
+PACKAGECONFIG[nss-resolve] =3D "-Dnss-resolve=3Denabled,-Dnss-resolve=3D=
disabled"
 PACKAGECONFIG[oomd] =3D "-Doomd=3Dtrue,-Doomd=3Dfalse"
-PACKAGECONFIG[openssl] =3D "-Dopenssl=3Dtrue,-Dopenssl=3Dfalse,openssl"
-PACKAGECONFIG[p11kit] =3D "-Dp11kit=3Dtrue,-Dp11kit=3Dfalse,p11-kit"
-PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam,${PAM_PLUGINS}=
"
-PACKAGECONFIG[pcre2] =3D "-Dpcre2=3Dtrue,-Dpcre2=3Dfalse,libpcre2"
-PACKAGECONFIG[polkit] =3D "-Dpolkit=3Dtrue,-Dpolkit=3Dfalse"
+PACKAGECONFIG[openssl] =3D "-Dopenssl=3Denabled,-Dopenssl=3Ddisabled,ope=
nssl"
+PACKAGECONFIG[p11kit] =3D "-Dp11kit=3Denabled,-Dp11kit=3Ddisabled,p11-ki=
t"
+PACKAGECONFIG[pam] =3D "-Dpam=3Denabled,-Dpam=3Ddisabled,libpam,${PAM_PL=
UGINS}"
+PACKAGECONFIG[pcre2] =3D "-Dpcre2=3Denabled,-Dpcre2=3Ddisabled,libpcre2"
+PACKAGECONFIG[polkit] =3D "-Dpolkit=3Denabled,-Dpolkit=3Ddisabled"
 # If polkit is disabled and networkd+hostnamed are in use, enabling this=
 option and
 # using dbus-broker will allow networkd to be authorized to change the
 # hostname without acquiring additional privileges
@@ -199,13 +199,13 @@ PACKAGECONFIG[polkit_hostnamed_fallback] =3D ",,,,d=
bus-broker,polkit"
 PACKAGECONFIG[portabled] =3D "-Dportabled=3Dtrue,-Dportabled=3Dfalse"
 PACKAGECONFIG[pstore] =3D "-Dpstore=3Dtrue,-Dpstore=3Dfalse"
 PACKAGECONFIG[pni-names] =3D ",,,"
-PACKAGECONFIG[qrencode] =3D "-Dqrencode=3Dtrue,-Dqrencode=3Dfalse,qrenco=
de,,qrencode"
+PACKAGECONFIG[qrencode] =3D "-Dqrencode=3Denabled,-Dqrencode=3Ddisabled,=
qrencode,,qrencode"
 PACKAGECONFIG[quotacheck] =3D "-Dquotacheck=3Dtrue,-Dquotacheck=3Dfalse"
 PACKAGECONFIG[randomseed] =3D "-Drandomseed=3Dtrue,-Drandomseed=3Dfalse"
 PACKAGECONFIG[resolved] =3D "-Dresolve=3Dtrue,-Dresolve=3Dfalse"
 PACKAGECONFIG[rfkill] =3D "-Drfkill=3Dtrue,-Drfkill=3Dfalse"
-PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Dtrue,-Dseccomp=3Dfalse,libseccom=
p"
-PACKAGECONFIG[selinux] =3D "-Dselinux=3Dtrue,-Dselinux=3Dfalse,libselinu=
x,initscripts-sushell"
+PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Denabled,-Dseccomp=3Ddisabled,lib=
seccomp"
+PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,lib=
selinux,initscripts-sushell"
 PACKAGECONFIG[smack] =3D "-Dsmack=3Dtrue,-Dsmack=3Dfalse"
 PACKAGECONFIG[sysext] =3D "-Dsysext=3Dtrue, -Dsysext=3Dfalse"
 PACKAGECONFIG[sysusers] =3D "-Dsysusers=3Dtrue,-Dsysusers=3Dfalse"
@@ -227,10 +227,10 @@ PACKAGECONFIG[vconsole] =3D "-Dvconsole=3Dtrue,-Dvc=
onsole=3Dfalse,,${PN}-vconsole-setu
 PACKAGECONFIG[wheel-group] =3D "-Dwheel-group=3Dtrue, -Dwheel-group=3Dfa=
lse"
 PACKAGECONFIG[xdg-autostart] =3D "-Dxdg-autostart=3Dtrue,-Dxdg-autostart=
=3Dfalse"
 # Verify keymaps on locale change
-PACKAGECONFIG[xkbcommon] =3D "-Dxkbcommon=3Dtrue,-Dxkbcommon=3Dfalse,lib=
xkbcommon"
-PACKAGECONFIG[xz] =3D "-Dxz=3Dtrue,-Dxz=3Dfalse,xz"
-PACKAGECONFIG[zlib] =3D "-Dzlib=3Dtrue,-Dzlib=3Dfalse,zlib"
-PACKAGECONFIG[zstd] =3D "-Dzstd=3Dtrue,-Dzstd=3Dfalse,zstd"
+PACKAGECONFIG[xkbcommon] =3D "-Dxkbcommon=3Denabled,-Dxkbcommon=3Ddisabl=
ed,libxkbcommon"
+PACKAGECONFIG[xz] =3D "-Dxz=3Denabled,-Dxz=3Ddisabled,xz"
+PACKAGECONFIG[zlib] =3D "-Dzlib=3Denabled,-Dzlib=3Ddisabled,zlib"
+PACKAGECONFIG[zstd] =3D "-Dzstd=3Denabled,-Dzstd=3Ddisabled,zstd"
=20
 RESOLV_CONF ??=3D ""
=20
--=20
2.34.1


