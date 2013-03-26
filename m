Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UKVO4-0002Rf-RP
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 16:02:10 +0100
Received: from mail165-co1-R.bigfish.com (10.243.78.249) by
	CO1EHSOBE040.bigfish.com (10.243.66.105) with Microsoft SMTP Server id
	14.1.225.23; Tue, 26 Mar 2013 14:30:02 +0000
Received: from mail165-co1 (localhost [127.0.0.1])	by
	mail165-co1-R.bigfish.com (Postfix) with ESMTP id 2A46798012D	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 14:30:02 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zz936eIzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail165-co1 (localhost.localdomain [127.0.0.1]) by mail165-co1
	(MessageSwitch) id 1364308200190418_20886;
	Tue, 26 Mar 2013 14:30:00 +0000 (UTC)
Received: from CO1EHSMHS032.bigfish.com (unknown [10.243.78.225])	by
	mail165-co1.bigfish.com (Postfix) with ESMTP id 2269C380076	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 14:30:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS032.bigfish.com
	(10.243.66.42) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 26 Mar 2013 14:29:59 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.152]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Tue, 26 Mar 2013 14:29:58 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Build issue of nativesdk toolchain
Thread-Index: Ac4qLmNha/4WXqRpTjqKPSeDHxVfDQ==
Date: Tue, 26 Mar 2013 14:29:58 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A01488D34@039-SN2MPN1-022.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.185.102]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Build issue of nativesdk toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 15:02:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

When I build nativesdk toolchain with recent poky + meta-fsl-ppc + FSL SDK =
specific layers, build issue similar to error-1 happens. This issue might a=
ppear for different gcc related package during different trial, e.g. libgcc=
, gcc, gcc-cross-initial, gcc-crosssdk, etc.=20

When I revert http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D9=
bfd92243eced921f166d84b5a72d6f774e13413, error-1 build issue goes away, err=
or-2 appears, error-2 also can't be reproduced every time. Does anyone ever=
 meet the similar build issue and any comment on the build error?

[Error-1 logs]:=20
OSError: [Errno 39] Directory not empty: '/local/cache-build-32bit/poky/bui=
ld_p1022ds_release_master/tmp/work-shared/gcc-4.7.2+fsl-r19/gcc-4.7.2+fsl/g=
cc/cp'

ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "base_do_unpack", line 19, in <module>
ERROR:=20
ERROR:   File "base_do_unpack", line 14, in base_do_unpack
ERROR:=20
ERROR:   File "/local/cache-build-32bit/poky/bitbake/lib/bb/fetch2/__init__=
.py", line 1466, in unpack
ERROR:     ud.method.unpack(ud, root, self.d)
ERROR:=20
ERROR:   File "/local/cache-build-32bit/poky/bitbake/lib/bb/fetch2/git.py",=
 line 239, in unpack
ERROR:     bb.utils.prunedir(destdir)
ERROR:=20
ERROR:   File "/local/cache-build-32bit/poky/bitbake/lib/bb/utils.py", line=
 561, in prunedir
ERROR:     os.rmdir(os.path.join(root, name))
ERROR:=20
ERROR: The code that was being executed was:
ERROR:      0015:    except bb.fetch2.BBFetchException, e:
ERROR:      0016:        raise bb.build.FuncFailed(e)
ERROR:      0017:
ERROR:      0018:
ERROR:  *** 0019:base_do_unpack(d)
ERROR:      0020:
ERROR: [From file: 'base_do_unpack', lineno: 19, function: <module>]
ERROR:      0010:    rootdir =3D localdata.getVar('WORKDIR', True)
ERROR:      0011:
ERROR:      0012:    try:
ERROR:      0013:        fetcher =3D bb.fetch2.Fetch(src_uri, localdata)
ERROR:  *** 0014:        fetcher.unpack(rootdir)
ERROR:      0015:    except bb.fetch2.BBFetchException, e:
ERROR:      0016:        raise bb.build.FuncFailed(e)
ERROR:      0017:
ERROR:      0018:
ERROR: [From file: 'base_do_unpack', lineno: 14, function: base_do_unpack]
ERROR: Function failed: base_do_unpack
ERROR: Logfile of failure stored in: /local/cache-build-32bit/poky/build_p1=
022ds_release_master/tmp/work-shared/gcc-4.7.2+fsl-r19/temp/log.do_unpack.1=
3886
[...snip...]
ERROR: Command Error: exit status: 1  Output:
Applying patch optional_libstdc.patch
patching file gcc/cp/g++spec.c
can't find file to patch at input line 30
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: gcc-4_7-branch/gcc/doc/invoke.texi
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
|--- gcc-4_7-branch.orig/gcc/doc/invoke.texi	2012-04-10 10:37:09.343387385 =
-0700
|+++ gcc-4_7-branch/gcc/doc/invoke.texi	2012-04-10 10:37:49.483389340 -0700
--------------------------
No file to patch.  Skipping patch.
3 out of 3 hunks ignored
can't find file to patch at input line 64
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: gcc-4_7-branch/gcc/c-family/c.opt
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
|--- gcc-4_7-branch.orig/gcc/c-family/c.opt	2012-04-10 10:17:24.667330076 -=
0700
|+++ gcc-4_7-branch/gcc/c-family/c.opt	2012-04-10 10:37:49.483389340 -0700
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
patching file gcc/gcc.c
Hunk #1 succeeded at 679 (offset -2 lines).
Patch optional_libstdc.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: /local/cache-build-32bit/poky/build_p1=
022ds_release_master/tmp/work-shared/gcc-4.7.2+fsl-r19/temp/log.do_patch.13=
815

[Error-2 logs]:
[...snip...]
| log_check: Using /local/cache-build-32bit/poky/build_p5020ds-64b_release_=
master/tmp/work/ppc64e5500-fsl_networking-linux/fsl-toolchain/1.0-r7/temp/l=
og.do_populate_sdk.26285 as logfile
| Logfile is clean
| DEBUG: Shell function populate_sdk_image finished
| DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common', 'common-linu=
x', 'common-glibc', 'powerpc-linux', 'powerpc64-linux', 'common']
| DEBUG: Executing shell function create_sdk_files
| DEBUG: Shell function create_sdk_files finished
| DEBUG: SITE files ['endian-big', 'bit-32', 'powerpc-common', 'common-linu=
x', 'common-glibc', 'powerpc32-linux', 'powerpc-linux', 'common']
| DEBUG: Executing shell function create_sdk_files
| DEBUG: Shell function create_sdk_files finished
| DEBUG: Executing shell function tar_sdk
| tar: ./sysroots/ppc64e5500-fsl_networking-linux/var/lib/rpm/__db.002: fil=
e changed as we read it
| DEBUG: Python function do_populate_sdk finished
| ERROR: Function failed: tar_sdk (see /local/cache-build-32bit/poky/build_=
p5020ds-64b_release_master/tmp/work/ppc64e5500-fsl_networking-linux/fsl-too=
lchain/1.0-r7/temp/log.do_populate_sdk.26285 for further information)
NOTE: recipe fsl-toolchain-1.0-r7: task do_populate_sdk: Failed


Best Regards,

Zhenhua



