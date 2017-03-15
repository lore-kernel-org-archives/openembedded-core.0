Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53F6B6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 09:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 11C271829F;
	Wed, 15 Mar 2017 10:29:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id r2H+RbCN41dy; Wed, 15 Mar 2017 10:29:41 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 52DD5183E2;
	Wed, 15 Mar 2017 10:29:40 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECDDE1E091;
	Wed, 15 Mar 2017 10:29:39 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1A341E08F;
	Wed, 15 Mar 2017 10:29:39 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 15 Mar 2017 10:29:39 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id D5B49330;
	Wed, 15 Mar 2017 10:29:39 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 15 Mar 2017 10:29:39 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Wed, 15 Mar 2017 10:29:39 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Richard Purdie (richard.purdie@linuxfoundation.org)"
	<richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Thread-Topic: RSS-related problem after update to OE-Core with dnf
Thread-Index: AdKdbPC3P9UVogT3TgGRAisco/qkjw==
Date: Wed, 15 Mar 2017 09:29:39 +0000
Message-ID: <373dcecc935f454eb93d1fa97a7f9e36@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RSS-related problem after update to OE-Core with dnf
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
X-List-Received-Date: Wed, 15 Mar 2017 09:29:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I update my Poky to the latest on master yesterday (i.e., I went from=20
a version using smart to one using dnf) and when I rebuilt my image I=20
got the following error:

| cd ${WORKDIR}/build/ext && ${WORKDIR}/recipe-sysroot-native/usr/bin/cmake=
 -E cmake_link_script CMakeFiles/libsolvext.dir/link.txt --verbose=3D1
| ${WORKDIR}/recipe-sysroot-native/usr/bin/mipsel-poky-linux/mipsel-poky-li=
nux-gcc  -fPIC -mel -mabi=3D32 -msoft-float -march=3D34kc -msynci  --sysroo=
t=3D${WORKDIR}/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/libsolv/0.6.26-r0 -fdebug-=
prefix-map=3D${WORKDIR}/recipe-sysroot-native=3D -fdebug-prefix-map=3D${WOR=
KDIR}/recipe-sysroot=3D  -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wf=
ormat -Wformat-security -Werror=3Dformat-security -mel -mabi=3D32 -msoft-fl=
oat -march=3D34kc -msynci  --sysroot=3D${WORKDIR}/recipe-sysroot -Wall -fPI=
C -Wl,-O1  -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now  -W=
l,--version-script=3D${WORKDIR}/git/ext/libsolvext.ver -shared -Wl,-soname,=
libsolvext.so.0 -o libsolvext.so.0 CMakeFiles/libsolvext.dir/solv_xfopen.o =
CMakeFiles/libsolvext.dir/testcase.o CMakeFiles/libsolvext.dir/pool_filecon=
flicts.o CMakeFiles/libsolvext.dir/repo_rpmdb.o CMakeFiles/libsolvext.dir/r=
epo_repomdxml.o CMakeFiles/libsolvext.dir/repo_rpmmd.o CMakeFiles/libsolvex=
t.dir/repo_deltainfoxml.o CMakeFiles/libsolvext.dir/repo_updateinfoxml.o -W=
l,-rpath,${WORKDIR}/build/src:${WORKDIR}/recipe-sysroot-native/usr/lib: ../=
src/libsolv.so.0 -Wl,--as-needed -ldb -lrpmio ${WORKDIR}/recipe-sysroot-nat=
ive/usr/lib/librpmdb.so -lexpat -lz
| ${WORKDIR}/recipe-sysroot-native/usr/lib/librpmdb.so: error adding symbol=
s: File in wrong format

When I ran file on librpmdb.so it showed:

$ file ${WORKDIR}/recipe-sysroot-native/usr/lib/librpmdb-5.4.so
${WORKDIR}/recipe-sysroot-native/usr/lib/librpmdb-5.4.so: ELF 64-bit LSB sh=
ared object, x86-64, version 1 (SYSV), dynamically linked, BuildID[sha1]=3D=
0xb49c3f89085d16c65bb443622e68cbbfdae605cb, stripped

I.e., it is trying to link a MIPS library with an x86_64 one...

After I did a "bitbake libsolv -c cleansstate", the problem went away,=20
and checking the log.do_compile afterwards it seems it is not even=20
trying to link with librpmdb.so at all any more.

My guess is that the librpmdb.so (which was a link to librpmdb-5.4.so)=20
was a leftover from before the switch from smart to dnf. However, the=20
fact that it remained in ${WORKDIR}/recipe-sysroot-native AND that it=20
was picked up by the build indicates both a problem with the=20
determinism of RSS, and the with the build of libsolv itself.

//Peter


