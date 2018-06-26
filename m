Return-Path: <prvs=071592a99f=mike.looijmans@topicproducts.com>
Received: from mx36-out25.antispamcloud.com (mx36-out25.antispamcloud.com
	[209.126.121.73])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1CB74751
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 12:49:33 +0000 (UTC)
Received: from [37.74.225.131] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx61.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1fXkJE-000AWP-Ud for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2018 11:30:49 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 26 Jun 2018 11:30:45 +0200
To: <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <10893b8e-97a3-f307-6c2e-b6678f163aed@topic.nl>
Date: Tue, 26 Jun 2018 11:30:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.131
X-AntiSpamCloud-Domain: topic.nl
X-AntiSpamCloud-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-AntiSpamCloud-Outgoing-Class: ham
X-AntiSpamCloud-Outgoing-Evidence: Combined (0.05)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5q5+LjZ193lZM58fnDiF2OZ602E9L7XzfQH6nu9C/Fh9KJzpNe6xgvOx
	q3u0UDjvOxznj/1iaw5TjLSMy5CpQtFmraJGWVbN0zdCh+St1How4o1YeYC8LHFWCIFgyeyJQefH
	zJ6mVE7ewsipSVIfs4ZFPQeAEulUpSfVIKL6r4oz4JjiDSrbcmJ1QXhuh4fWdt/Aj79cZapdKACo
	xXTB236Z3JKVmi72ocgY5kMQSjs7AS5g9nL+yeFiOR30+l159X3F2AuNuamkoUiKgQQWvzglYYyi
	NZr+/4JfE7i26Y6ctPZUPzYlTOTdwc0UsK6fWIrhylS5qWRAI3z2YWviHNUM5PgtoxLiSpsrL6hV
	WLdEFdlTez4Ep6JVGftOsEfid+kwN34980yjfCV4sX61ZxdX/LGc1HGkyge+OH1WexgDa2mBsvp2
	2+B2cECTpdAX092/BpLY2oaU3DFtoijWuhrNcgXXMYaGQeGKWD2ycTNwj/KcGIu4SeJtbJdr4/oj
	P8UWpjnmAwSMAa8SFs/lvHopOMQJvQ/Ck3iiU+4DQAj307MdygbYAwP95HY9TPHMrX3J+urMxBa8
	rTN5PXEtA+TC/4IqMDd3R3OoYwhxnciCnUHjxrqldMEOG1fKAW5mZ+jb5NA413zESMJef949r2it
	k/3XLTmRwzitRAMwkvBlTWlICWA/jpoCaLd/2BFWJOMRZOqWznTWYsnDz/791NupYrr9/aF/s0iU
	PFspTh2au/7X7mAAad3nGapXzYW6MGcBPKY/Dbm52ACmZVT7jHUFBPG7fCFpv7jLxTCvx+CSbmI4
	udPHYXlUomKSI+ZfkuuO5TcDeKjrEmYPn2IVWRv3ELcsjTwVHlACUiCFmrbWxvQXcOyqIIgFHPwW
	X+7nurSvXNfMHiSd1NTB4ie6vtrwBTL1+6vDOMemz/4I88NDnUGe2ZB+yd/uaRCBKOKbS2wB1oCZ
	0xvT8GNaAyQKhz3CJ2dmBcMfeMs+o1d/es7A
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Weird license_create_manifest failures in sumo
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
X-List-Received-Date: Tue, 26 Jun 2018 12:49:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI'm migrating to "sumo" from rocko, and when building for multiple=
 machines on=20
the build server, I get failures like the one below.

I'm suspecting this is a resurrection of the MACHINE/allarch problems that=
=20
i've seen in the past, but this time I cannot work around them since they=20
concern "base" packages.

I did not see this in the rocko branch with the same configuration.

I already tried cleaning out the "tmp" folder and restarting.




Build Configuration:
BB_VERSION           =3D "1.38.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "ubuntu-14.04"
TARGET_SYS           =3D "arm-oe-linux-gnueabi"
MACHINE              =3D "topic-miami-florida-gen-xc7z015"
DISTRO               =3D "tiny"
DISTRO_VERSION       =3D "nodistro.0"
TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard cor=
texa9"
TARGET_FPU           =3D "hard"
meta                 =3D "HEAD:dceca6d34071b4cbef9e28bbf19dc12f5d925525"
meta-oe
meta-multimedia
meta-python          =3D "HEAD:a19aa29f7fa336cd075b72c496fe1102e6e5422b"
meta-qt4             =3D "HEAD:8e791c40140460825956430ba86b6266fdec0a93"
meta-xilinx-bsp      =3D "HEAD:b2f74cc7fe5c4881589d5e440a17cb51fc66a7ab"
meta-topic           =3D "HEAD:6a3e86cb565c782dd4c3467ca820f08dde5f8472"
meta-dyplo           =3D "HEAD:0e8d4d9dedb7f2b12fd9a1822ecfa4635ff72227"
meta-topic-internal  =3D "HEAD:0d4f93fda7c2d2022cb6a535b9a96010be0ff0c7"

...

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
      0001:
  *** 0002:license_create_manifest(d)
      0003:
File: '/.../oe-core/meta/classes/license.bbclass', lineno: 48, function:=20
license_create_manifest
      0044:    pkg_dic =3D {}
      0045:    for pkg in sorted(image_list_installed_packages(d)):
      0046:        pkg_info =3D os.path.join(d.getVar('PKGDATA_DIR'),
      0047:                                'runtime-reverse', pkg)
  *** 0048:        pkg_name =3D os.path.basename(os.readlink(pkg_info))
      0049:
      0050:        pkg_dic[pkg_name] =3D oe.packagedata.read_pkgdatafile(pk=
g_info)
      0051:        if not "LICENSE" in pkg_dic[pkg_name].keys():
      0052:            pkg_lic_name =3D "LICENSE_" + pkg_name
Exception: FileNotFoundError: [Errno 2] No such file or directory:=20
'/.../build/tmp-glibc/pkgdata/topic-miami-florida-gen-xc7z030/runtime-rever=
se/base-passwd'





Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail




