Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id A6D6F6007B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 18:24:43 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp2so2220632pbb.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2013 11:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=p1hwlFd3IvSuWzgFSKEiK1muSYjPmBLdHRSX2FjYGlA=;
	b=ldgywotcdYQwelVGqiceOt83UaWLcnCYnBw++pYuTrm7tEcmefOtjnHQgzLVxQ5kyY
	Z1AV+/P0AD9imwGMN2fmIrCtrtzpTexaPWTHc8BmLi4SEYCKuA3G2T95d5xU1nO1/mY6
	Fv4kBa61/ZlHZxPK9OO9LgRb3565u8mF5hztuAgixcwNmMK0rvcZBFVGtCTp5ccojj++
	6wRrfeNyfsle8Qd2RlaqXMNzvk0rx69coJu3EXNwjOtFKLo2E8q7U0iGtLRCnbnkFnw+
	P23ioXUCu8wcDKSYTsZh+9KUGS4R5irF79GADZ6QpU55wpwZpIJlaF5D9nAcSPBBCM5u
	PPSg==
X-Received: by 10.68.253.227 with SMTP id ad3mr2064978pbd.63.1375899884452;
	Wed, 07 Aug 2013 11:24:44 -0700 (PDT)
Received: from gourish-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id il4sm9553453pbb.36.2013.08.07.11.24.42
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Aug 2013 11:24:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5201EA90.2010600@windriver.com>
Date: Wed, 7 Aug 2013 11:24:40 -0700
Message-Id: <BAF1EA2B-D644-41E2-9546-3479D45C74D4@gmail.com>
References: <5201EA90.2010600@windriver.com>
To: wenzong fan <wenzong.fan@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: nss-native fails to build with older binutils on host
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
X-List-Received-Date: Wed, 07 Aug 2013 18:24:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 6, 2013, at 11:34 PM, wenzong fan <wenzong.fan@windriver.com> =
wrote:

> Hi folks,
>=20
> I'm looking for a proper solution to fix this build failure:
>=20
> Package name: nss-native
> Host binutils version: 2.17.50.0.6-20.el5_8.3
> Host type: CentOS 5.9
>=20
> Error message:
> --------------
> gcc -o =
Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/Linux_SINGLE_SHLIB/intel-gcm.o -O2 =
-D_POSIX_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE -fPIC -DLINUX2_1  -Wall =
-Werror-implicit-function-declaration -Wno-switch -pipe -DLINUX -Dlinux =
-DHAVE_STRERROR -DXP_UNIX -DSHLIB_SUFFIX=3D\"so\" -DSHLIB_PREFIX=3D\"lib\"=
 -DSHLIB_VERSION=3D\"3\" -DSOFTOKEN_SHLIB_VERSION=3D\"3\" =
-DRIJNDAEL_INCLUDE_TABLES -UDEBUG -DNDEBUG -D_REENTRANT -DNSS_ENABLE_ECC =
-DUSE_UTIL_DIRECTLY -DNO_NSPR_10_SUPPORT -DNSS_USE_64 -DFREEBL_NO_DEPEND =
-DNSS_X86_OR_X64 -DNSS_X64 -DNSS_BEVAND_ARCFOUR -DMPI_AMD64 =
-DMP_ASSEMBLY_MULTIPLY -DNSS_USE_COMBA -DMP_CHAR_STORE_SLOW =
-DMP_IS_LITTLE_ENDIAN -DUSE_HW_AES -DMP_API_COMPATIBLE =
-I/home/nxadm/nx/yow-blade14.1/builds-2013-08-07-005810/qemumips_world_oe/=
bitbake_build/tmp/sysroots/x86_64-linux/usr/include =
-I../../../dist/Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/include =
-I../../../dist/public/nss -I../../../dist/private/nss -Impi -Iecl  -m64 =
-fPIC -Wa,--noexecstack -c intel-gcm.s
> intel-gcm.s: Assembler messages:
> intel-gcm.s:39: Error: no such instruction: `vmovdqu (Tp),T'
> intel-gcm.s:40: Error: no such instruction: `vpshufb =
.Lbswap_mask(%rip),T,T'
> intel-gcm.s:41: Error: no such instruction: `vpxor TMP0,TMP0,TMP0'
> intel-gcm.s:44: Error: no such instruction: `vpinsrq =
$0,Mlen,TMP0,TMP0'
> intel-gcm.s:45: Error: no such instruction: `vpinsrq =
$1,Alen,TMP0,TMP0'
> ......
>=20
> A similar bug at:
>=20
> https://bugzilla.mozilla.org/show_bug.cgi?id=3D838401
>=20
> That shows it caused by older host binutils (as|objdump).
>=20
> I think this could be fixed by getting nss-native depends on =
binutils-native, but binutils-native somehow only install some libraries =
and remove all the binaries.


Its unnecessary dependency and will penalize users with newer hosts, =
There is binutils220 package available for centos
5.x you should install that on your build machine and be done with it.


>=20
> Could I just override the do_install_class-native() for binutils? Or =
provide a second recipe like 'binutils-tools-native' to produce the full =
binutils?


No, we should be very careful about adding more packages to build to =
appease one old distribution. It gets harder and harder to keep =
supporting old distributions forever for building latest OE core. At one =
point you have to make a call
and stop using them.

>=20
> Any advices/suggestions will be welcome.
>=20
>=20
> Thanks
> Wenzong
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


