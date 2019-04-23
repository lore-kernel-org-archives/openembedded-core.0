Return-Path: <chadg@videx.com>
Received: from mail.videx.com (unknown [65.122.251.43])
	by mail.openembedded.org (Postfix) with ESMTP id 909667D10D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:35:14 +0000 (UTC)
X-Footer: dmlkZXguY29t
Received: from [65.122.251.41] ([65.122.251.41])
	(authenticated user chadg@videx.com) by mail.videx.com with ESMTPSA
	for liezhi.yang@windriver.com; Tue, 23 Apr 2019 09:35:13 -0700
Date: Tue, 23 Apr 2019 09:35:13 -0700
X-User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101
	Firefox/66.0
Message-ID: <1259152679-17617@mail.videx.com>
From: Chad Gibeaut <chadg@videx.com>
To: Robert Yang <liezhi.yang@windriver.com>, oe-core
	<openembedded-core@lists.openembedded.org>
Reply-To: Chad Gibeaut <chadg@videx.com>
X-Priority: 3
Importance: Normal
In-Reply-To: <03f1c4a6-7d01-394c-0e31-3b2d93783092@windriver.com>
MIME-Version: 1.0
Subject: Re: [bitbake-devel] QA Error for DB
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
X-List-Received-Date: Tue, 23 Apr 2019 16:35:14 -0000
Content-Type: multipart/alternative; boundary="=-TVEEy/b2y5HMo3gCMGx8"

--=-TVEEy/b2y5HMo3gCMGx8
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable


Resending this now that i am on the correct mailing list=2E=20



Thank you for pointing this to the right location=2C=20



If i read your suggestion correctly=2C it was to replace


 FILES=5F=24=7BPN=7D-cxx =3D =22=24=7Blibdir=7D/*cxx*so=22


with


FILES=5F=24=7BPN=7D-dev +=3D =22=24=7Blibdir=7D/*cxx*so=22=20



which I did and it did not change the error=2E



Thanks=2CChad


Thanks=2C
Chad




 From=3A   Robert Yang =3Cliezhi=2Eyang=40windriver=2Ecom=3E=20
 To=3A   Chad Gibeaut =3Cchadg=40videx=2Ecom=3E=2C oe-core =3Copenembedded-=
core=40lists=2Eopenembedded=2Eorg=3E=20
 Sent=3A   4/23/2019 12=3A51 AM=20
 Subject=3A   Re=3A =5Bbitbake-devel=5D QA Error for DB=20

Hi Chad=2C=20
=20
This emails should go into oe-core mailing list =28Please see the To list=
=29=2E=20
And I think that something is wrong with=3A=20
=20
=3E =23 The executables go in a separate package - typically there=20
=3E =23 is no need to install these unless doing real database=20
=3E =23 management on the system=2E=20
=3E inherit lib=5Fpackage=20
=3E =20
=3E PACKAGES =3D+ =22=24=7BPN=7D-cxx=22=20
=3E FILES=5F=24=7BPN=7D-cxx =3D =22=24=7Blibdir=7D/*cxx*so=22=20
=20
Only -dev/-dbg/nativesdk- packages can contain =2Eso =28endswith =2Eso=29 f=
ile=2C=20
so you can try=3A=20
=20
FILES=5F=24=7BPN=7D-dev +=3D =22=24=7Blibdir=7D/*cxx*so=22=20
=20
This is just a rough suggestion=2C I didn=27t try it=2C you need test it=20=

carefully before really use it=2E=20
=20
=3E =20
=3E =20
=3E =23 The dev package has the =2Eso link =28as in db3=29 and the =2Ea=27s=
 -=20
=3E =23 it is therefore incompatible =28cannot be installed at the=20
=3E =23 same time=29 as the db3 package=20
=3E =23 sort out the =2Eso since they do version prior to the =2Eso=20
=3E SOLIBS =3D =22-6*=2Eso=22=20
=3E FILES=5FSOLIBSDEV =3D =22=24=7Blibdir=7D/libdb=2Eso =24=7Blibdir=7D/lib=
db=5Fcxx=2Eso=22=20
=20
=20
// Robert=20
=20
=20
On 4/20/19 1=3A43 AM=2C Chad Gibeaut wrote=3A=20
=3E I am building images=28yocto=2Cbitbake=2Cbusybox=29 for two differnt ka=
ro SOM=27s=2E Both of =20
=3E the configuration files are the same =28including my own software=29=20=

=3E =20
=3E One build fails during the QA portion of the build process on the recip=
e for the =20
=3E Berkeley DB from Oracle=2E I am not even sure what is requiring this=2C=
 but =20
=3E something does=2E=20
=3E =20
=3E =7CERROR=3A db-6=2E0=2E30-r0 do=5Fpackage=5Fqa=3A QA Issue=3A non -dev/=
-dbg/nativesdk- package =20
=3E contains symlink =2Eso=3A db path =20
=3E =27work/cortexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-sp=
lit/db/usr/lib/libdb-6=2Eso=27 =20
=3E =5Bdev-so=5D ERROR=3A db-6=2E0=2E30-r0 do=5Fpackage=5Fqa=3A QA run foun=
d fatal errors=2E Please =20
=3E consider fixing them=2E ERROR=3A db-6=2E0=2E30-r0 do=5Fpackage=5Fqa=3A=
 Function failed=3A =20
=3E do=5Fpackage=5Fqa ERROR=3A Logfile of failure stored in=3A =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/temp/log=2Edo=5Fpackage=5Fqa=2E1270=20=
=20
=3E ERROR=3A Task 2138 =20
=3E =28/home/test/karo/fsl-community-bsp=5F5011/sources/poky/meta/recipes-s=
upport/db/db=5F6=2E0=2E30=2Ebb=2C =20
=3E do=5Fpackage=5Fqa=29 failed with exit code =271=27 =7C=20
=3E =20
=3E In the folder the error mentions is the =2Eso file along with a link ba=
ck to that =20
=3E same so file minus the minor version=2E=20
=3E =20
=3E =7C-rwxr-xr-x 2 test test 1=2E1M Apr 9 12=3A23 libdb-6=2E0=2Eso lrwxrwx=
rwx 1 test test 12 =20
=3E Apr 9 12=3A24 libdb-6=2Eso -=3E libdb-6=2E0=2Eso =7C=20
=3E =20
=3E This linked file is being created during the build at some point =28rem=
oving the =20
=3E linked file or even the whole build directory and rerunning results in=
 the same =20
=3E issue=29=20
=3E =20
=3E I think I could probably find a way to disable the QA check=2C but that=
s not ideal =20
=3E since something requires this and I dont like having to disable checks=
 for =20
=3E production code=2E=20
=3E =20
=3E The Error log file mentioned in the error is here=3A=20
=3E =20
=3E -----------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------ERROR =20
=3E Log--------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------=20
=3E =20
=3E =7CDEBUG=3A Executing python function sstate=5Ftask=5Fprefunc DEBUG=3A=
 Python function =20
=3E sstate=5Ftask=5Fprefunc finished DEBUG=3A Executing python function do=
=5Fpackage=5Fqa =20
=3E NOTE=3A DO PACKAGE QA DEBUG=3A Executing python function read=5Fsubpack=
age=5Fmetadata =20
=3E DEBUG=3A Python function read=5Fsubpackage=5Fmetadata finished NOTE=3A=
 Package db =20
=3E skipping QA tests=3A =5B=27dev-soalready-stripped=27=5D NOTE=3A Checkin=
g Package=3A db NOTE=3A =20
=3E arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db/usr/lib/libdb-6=2E0=
=2Eso =20
=3E ERROR=3A QA Issue=3A non -dev/-dbg/nativesdk- package contains symlink=
 =2Eso=3A db path =20
=3E =27work/cortexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-sp=
lit/db/usr/lib/libdb-6=2Eso=27 =20
=3E =5Bdev-so=5D NOTE=3A Checking Package=3A db-bin NOTE=3A arm-poky-linux-=
gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Fsta=
t =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Fdea=
dlock =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Frep=
licate =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Flog=
=5Fverify =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Fver=
ify =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Fupg=
rade =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Fpri=
ntlog =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Farc=
hive =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Fhot=
backup =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Fdum=
p =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Floa=
d =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Fche=
ckpoint =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Frec=
over =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr/bin/db=5Ftun=
er =20
=3E NOTE=3A Checking Package=3A db-staticdev NOTE=3A Checking Package=3A db=
-dev NOTE=3A =20
=3E Package db-cxx skipping QA tests=3A =5B=27dev-so=27=5D NOTE=3A Checking=
 Package=3A db-cxx =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-cxx/usr/lib/libdb=5F=
cxx-6=2E0=2Eso =20
=3E NOTE=3A Checking Package=3A db-doc NOTE=3A Checking Package=3A db-dbg N=
OTE=3A =20
=3E arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Fstat =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Fdeadlock =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Freplicate =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Flog=5Fverify =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Fverify =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Fupgrade =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Fprintlog =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Farchive =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Fhotbackup =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Fdump =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Fload =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Fcheckpoint =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Frecover =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/bin/=2Edebug=
/db=5Ftuner =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/lib/=2Edebug=
/libdb=5Fcxx-6=2E0=2Eso =20
=3E NOTE=3A arm-poky-linux-gnueabi-objdump -p =20
=3E /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/cortexa7hf-neon=
-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr/lib/=2Edebug=
/libdb-6=2E0=2Eso =20
=3E NOTE=3A Checking Package=3A db-locale ERROR=3A QA run found fatal error=
s=2E Please =20
=3E consider fixing them=2E DEBUG=3A Python function do=5Fpackage=5Fqa fini=
shed ERROR=3A =20
=3E Function failed=3A do=5Fpackage=5Fqa =7C=20
=3E =20
=3E -----------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------ERROR =20
=3E Log--------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------=20
=3E =20
=3E And the busy box recipe is below=28from the repo somewhere=29=2E There=
 is some mention =20
=3E in there about dev so files=2C but Im not sure if that might be the iss=
ue or even =20
=3E what changes might need to be made then=2E=20
=3E =20
=3E =20
=3E =20
=3E =20
=3E -----------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------BB =20
=3E File-------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
----------------------------=20
=3E =20
=3E =7C=20
=3E =20
=3E =20
=3E =20
=3E =23 Version 6 of the Berkeley DB from Oracle =28formerly Sleepycat=29=
 =23 =23 At present =20
=3E this package only installs the DB code =23 itself =28shared libraries=
=2C =2Ea in the dev =20
=3E package=29=2C =23 documentation and headers=2E =23 =23 The headers have=
 the same names as =20
=3E those as v3 =23 of the DB=2C only one version can be used *for dev*=20=
=23 at once - DB3 =20
=3E and DB6 can both be installed on the =23 same system at the same time i=
f really =20
=3E necessary=2E SECTION =3D =22libs=22 SUMMARY =3D =22Berkeley Database v6=
=22 HOMEPAGE =3D =20
=3E =22http=3A//www=2Eoracle=2Ecom/technetwork/database/database-technologi=
es/berkeleydb/overview/index=2Ehtml=22 =20
=3E LICENSE =3D =22AGPL-3=2E0=22 VIRTUAL=5FNAME =3F=3D =22virtual/db=22 RCO=
NFLICTS=5F=24=7BPN=7D =3D =22db3=22 =23 =20
=3E Note=2C when upgraded to 6=2E1=2Ex=2C a patch in RPM will need to be re=
moved to activate =20
=3E db 6=2E1 support=2E SRC=5FURI =3D =20
=3E =22http=3A//download=2Eoracle=2Ecom/berkeley-db/db-=24=7BPV=7D=2Etar=2E=
gz=22 SRC=5FURI +=3D =20
=3E =22file=3A//arm-thumb-mutex=5Fdb5=2Epatch=3Bpatchdir=3D=2E=2E =5C file=
=3A//fix-parallel-build=2Epatch =20
=3E =5C file=3A//Makefile-let-libso=5Ftarget-depend-on-bt=5Frec=2Epatch=20=
=5C =20
=3E file=3A//Makefile-let-libdb-6=2E0=2Ela-depend-os=5Fmap=2El=2Epatch=3Bpa=
tchdir=3D=2E=2E =5C =22 =20
=3E SRC=5FURI=5Bmd5sum=5D =3D =22ad28eb86ad3203b5422844db179c585b=22 SRC=5F=
URI=5Bsha256sum=5D =3D =20
=3E =22608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6a20fd2=22=
 =23 Exclude NC =20
=3E versions which lack AES encryption UPSTREAM=5FCHECK=5FREGEX =3D =20
=3E =22db-=28=3FP=3Cpver=3E=5Cd+=5C=2E=5Cd+=28=5C=2E=5Cd+=29=3F=29=2Etar=22=
 UPSTREAM=5FCHECK=5FURI =3D =20
=3E =22http=3A//www=2Eoracle=2Ecom/technetwork/products/berkeleydb/download=
s/index-082944=2Ehtml=22 =20
=3E LIC=5FFILES=5FCHKSUM =3D =22file=3A//=2E=2E/LICENSE=3Bmd5=3D1ec8b0b17cc=
31513fe35ab10716f8490=22 =20
=3E inherit autotools =23 Put virtual/db in any appropriate provider of a=
 =23 relational =20
=3E database=2C use it as a dependency in =23 place of a specific db and us=
e=3A =23 =23 =20
=3E PREFERRED=5FPROVIDER=5Fvirtual/db =23 =23 to select the correct db in t=
he build =28distro=29 =20
=3E =2Econf PROVIDES +=3D =22=24=7BVIRTUAL=5FNAME=7D=22 =23 bitbake isn=27t=
 quite clever enough to deal =20
=3E with sleepycat=2C =23 the distribution sits in the expected directory=
=2C but all =23 the =20
=3E builds must occur from a sub-directory=2E The following =23 persuades b=
itbake to go =20
=3E to the right place S =3D =22=24=7BWORKDIR=7D/db-=24=7BPV=7D/dist=22 B=
 =3D =20
=3E =22=24=7BWORKDIR=7D/db-=24=7BPV=7D/build=5Funix=22 SPDX=5FS =3D =22=24=
=7BWORKDIR=7D/db-=24=7BPV=7D=22 =23 The =20
=3E executables go in a separate package - typically there =23 is no need t=
o install =20
=3E these unless doing real database =23 management on the system=2E inheri=
t lib=5Fpackage =20
=3E PACKAGES =3D+ =22=24=7BPN=7D-cxx=22 FILES=5F=24=7BPN=7D-cxx =3D =22=24=
=7Blibdir=7D/*cxx*so=22 =23 The dev package =20
=3E has the =2Eso link =28as in db3=29 and the =2Ea=27s - =23 it is therefo=
re incompatible =20
=3E =28cannot be installed at the =23 same time=29 as the db3 package =23 s=
ort out the =2Eso =20
=3E since they do version prior to the =2Eso SOLIBS =3D =22-6*=2Eso=22 FILE=
S=5FSOLIBSDEV =3D =20
=3E =22=24=7Blibdir=7D/libdb=2Eso =24=7Blibdir=7D/libdb=5Fcxx=2Eso=22 =23co=
nfiguration - set in local=2Econf =20
=3E to override =23 All the --disable-* options replace --enable-smallbuild=
=2C which =20
=3E breaks a bunch of stuff =28eg=2E postfix=29 DB6=5FCONFIG =3F=3D =22--en=
able-o=5Fdirect =20
=3E --disable-cryptography --disable-queue --disable-replication --disable-=
verify =20
=3E --disable-compat185 --disable-sql=22 EXTRA=5FOECONF =3D =22=24=7BDB6=5F=
CONFIG=7D --enable-shared =20
=3E --enable-cxx --with-sysroot=22 =23 Override the MUTEX setting here=2C t=
he POSIX =20
=3E library is =23 the default - =22POSIX/pthreads/library=22=2E =23 Don=27=
t ignore the nice SWP =20
=3E instruction on the ARM=3A =23 These enable the ARM assembler mutex code=
 ARM=5FMUTEX =3D =20
=3E =22--with-mutex=3DARM/gcc-assembly=22 MUTEX =3D =22=22 MUTEX=5Farm =3D=
 =22=24=7BARM=5FMUTEX=7D=22 =20
=3E MUTEX=5Farmeb =3D =22=24=7BARM=5FMUTEX=7D=22 EXTRA=5FOECONF +=3D =22=24=
=7BMUTEX=7D=22 =20
=3E EXTRA=5FOEMAKE=5Fclass-target =3D =20
=3E =22LIBTOOL=3D=24=7BSTAGING=5FBINDIR=5FCROSS=7D/=24=7BHOST=5FSYS=7D-libt=
ool=22 =23 Cancel the site stuff - =20
=3E it=27s set for db3 and destroys the =23 configure=2E CONFIG=5FSITE =3D=
 =22=22 do=5Fconfigure=28=29 =7B =20
=3E gnu-configize --force =24=7BS=7D export STRIP=3D=22true=22 oe=5Frunconf=
 =7D do=5Fcompile=5Fprepend=28=29 =20
=3E =7B sed -i -e =27s=7Chardcode=5Finto=5Flibs=3Dyes=7Chardcode=5Finto=5Fl=
ibs=3Dno=7C=27 =5C =24=7BB=7D/libtool =7D =20
=3E do=5Finstall=5Fappend=28=29 =7B mkdir -p =24=7BD=7D/=24=7Bincludedir=7D=
/db60 mv =20
=3E =24=7BD=7D/=24=7Bincludedir=7D/db=2Eh =24=7BD=7D/=24=7Bincludedir=7D/db=
60/=2E mv =24=7BD=7D/=24=7Bincludedir=7D/db=5Fcxx=2Eh =20
=3E =24=7BD=7D/=24=7Bincludedir=7D/db60/=2E ln -s db60/db=2Eh =24=7BD=7D/=
=24=7Bincludedir=7D/db=2Eh ln -s =20
=3E db60/db=5Fcxx=2Eh =24=7BD=7D/=24=7Bincludedir=7D/db=5Fcxx=2Eh =23 The d=
ocs end up in /usr/docs - not =20
=3E right=2E if test -d =22=24=7BD=7D/=24=7Bprefix=7D/docs=22 then mkdir -p=
 =22=24=7BD=7D/=24=7Bdatadir=7D=22 test ! =20
=3E -d =22=24=7BD=7D/=24=7Bdocdir=7D=22 =7C=7C rm -rf =22=24=7BD=7D/=24=7Bd=
ocdir=7D=22 mv =22=24=7BD=7D/=24=7Bprefix=7D/docs=22 =20
=3E =22=24=7BD=7D/=24=7Bdocdir=7D=22 fi chown -R root=3Aroot =24=7BD=7D=20=
=7D INSANE=5FSKIP=5F=24=7BPN=7D =3D =22dev-so=22 =20
=3E INSANE=5FSKIP=5F=24=7BPN=7D-cxx =3D =22dev-so=22 BBCLASSEXTEND =3D =22n=
ative nativesdk=22 =7C=20
=3E =20
=3E =20
=3E =20
=3E Thanks=2C=20
=3E Chad=20
=3E =20
=3E =20
=3E Cyberlock=2C Inc=2E =7C Videx=2C Inc=2E =7C 1105 NE Circle Blvd=2E =7C=
 Corvallis=2C OR 97330 =7C =20
=3E =28541=29 738-5500=20
=3E This email is intended only for the addressee=28s=29 and may include ma=
terial that =20
=3E is privileged=2C confidential=2C and protected from disclosure=2E No co=
ntract is =20
=3E intended=2E =C2=A92019 Videx=2C Inc=2E=20
=3E =20


Cyberlock=2C Inc=2E =7C Videx=2C Inc=2E =7C 1105 NE Circle Blvd=2E =7C Corv=
allis=2C OR 97330 =7C =28541=29 738-5500
This email is intended only for the addressee=28s=29 and may include materi=
al that is privileged=2C confidential=2C and protected from disclosure=2E N=
o contract is intended=2E =C2=A92019 Videx=2C Inc=2E

--=-TVEEy/b2y5HMo3gCMGx8
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=3Chtml=3E=3Chead=3E=3C/head=3E=3Cbody=3E=3Cdiv=3EResending this now that i=
 am on the correct mailing list=2E =3Cbr=3E=3C/div=3E=3Cdiv=3E=3Cbr=3E=3C/d=
iv=3E=3Cdiv=3EThank you for pointing this to the right location=2C =3Cbr=3E=
=3C/div=3E=3Cdiv=3E=3Cbr=3E=3C/div=3E=3Cdiv=3EIf i read your suggestion cor=
rectly=2C it was to replace=3C/div=3E=3Cdiv=3E=3Cbr=3E=3C/div=3E=3Cdiv=3E F=
ILES=5F=24=7BPN=7D-cxx =3D =22=24=7Blibdir=7D/*cxx*so=22=3C/div=3E=3Cdiv=3E=
=3Cbr=3E=3C/div=3E=3Cdiv=3Ewith=3C/div=3E=3Cdiv=3E=3Cbr=3E=3C/div=3E=3Cdiv=
=3EFILES=5F=24=7BPN=7D-dev +=3D =22=24=7Blibdir=7D/*cxx*so=22 =3Cbr=3E=3C/d=
iv=3E=3Cdiv=3E=3Cbr=3E=3C/div=3E=3Cdiv=3Ewhich I did and it did not change=
 the error=2E=3C/div=3E=3Cdiv=3E=3Cbr=3E=3C/div=3E=3Cbr=3E=3Cdiv=3EThanks=
=2C=3C/div=3EChad=3Cbr=3E=3Cbr=3E=3Cdiv=3EThanks=2C=3C/div=3E=3Cdiv=3EChad=
=3Cbr=3E=3C/div=3E=3Cbr=3E=3Cbr=3E=3Cbr=3E=3Cdiv=3E=3Cstrong=3E
From=3A
=3C/strong=3E
=20
Robert Yang =26lt=3Bliezhi=2Eyang=40windriver=2Ecom=26gt=3B
=3Cbr=3E
=3Cstrong=3E
To=3A
=3C/strong=3E
=20
Chad Gibeaut =26lt=3Bchadg=40videx=2Ecom=26gt=3B=2C oe-core =26lt=3Bopenemb=
edded-core=40lists=2Eopenembedded=2Eorg=26gt=3B
=3Cbr=3E
=3Cstrong=3E
Sent=3A
=20
=3C/strong=3E
4/23/2019 12=3A51 AM
=3Cbr=3E
=3Cstrong=3E
Subject=3A
=3C/strong=3E
=20
Re=3A =5Bbitbake-devel=5D QA Error for DB
=3Cbr=3E=3Cbr=3E=3Cblockquote class=3D=22mori=22 style=3D=22margin=3A0 0 0=
 =2E8ex=3Bborder-left=3A1px solid =23CCC=3Bpadding-left=3A1ex=3B=22=3EHi Ch=
ad=2C
=3Cbr=3E
=3Cbr=3EThis emails should go into oe-core mailing list =28Please see the T=
o list=29=2E
=3Cbr=3EAnd I think that something is wrong with=3A
=3Cbr=3E
=3Cbr=3E=26gt=3B =23 The executables go in a separate package - typically t=
here
=3Cbr=3E=26gt=3B =23 is no need to install these unless doing real database=

=3Cbr=3E=26gt=3B =23 management on the system=2E
=3Cbr=3E=26gt=3B inherit lib=5Fpackage
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B PACKAGES =3D+ =22=24=7BPN=7D-cxx=22
=3Cbr=3E=26gt=3B FILES=5F=24=7BPN=7D-cxx =3D =22=24=7Blibdir=7D/*cxx*so=22=

=3Cbr=3E
=3Cbr=3EOnly -dev/-dbg/nativesdk- packages can contain =2Eso =28endswith=20=
=2Eso=29 file=2C
=3Cbr=3Eso you can try=3A
=3Cbr=3E
=3Cbr=3EFILES=5F=24=7BPN=7D-dev +=3D =22=24=7Blibdir=7D/*cxx*so=22
=3Cbr=3E
=3Cbr=3EThis is just a rough suggestion=2C I didn=27t try it=2C you need te=
st it
=3Cbr=3Ecarefully before really use it=2E
=3Cbr=3E
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B =23 The dev package has the =2Eso link =28as in db3=29 and=
 the =2Ea=27s -
=3Cbr=3E=26gt=3B =23 it is therefore incompatible =28cannot be installed at=
 the
=3Cbr=3E=26gt=3B =23 same time=29 as the db3 package
=3Cbr=3E=26gt=3B =23 sort out the =2Eso since they do version prior to the=
 =2Eso
=3Cbr=3E=26gt=3B SOLIBS =3D =22-6*=2Eso=22
=3Cbr=3E=26gt=3B FILES=5FSOLIBSDEV =3D =22=24=7Blibdir=7D/libdb=2Eso =24=7B=
libdir=7D/libdb=5Fcxx=2Eso=22
=3Cbr=3E
=3Cbr=3E
=3Cbr=3E// Robert
=3Cbr=3E
=3Cbr=3E
=3Cbr=3EOn 4/20/19 1=3A43 AM=2C Chad Gibeaut wrote=3A
=3Cbr=3E=26gt=3B I am building images=28yocto=2Cbitbake=2Cbusybox=29 for tw=
o differnt karo SOM=27s=2E Both of=20
=3Cbr=3E=26gt=3B the configuration files are the same =28including my own s=
oftware=29
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B One build fails during the QA portion of the build process=
 on the recipe for the=20
=3Cbr=3E=26gt=3B Berkeley DB from Oracle=2E I am not even sure what is requ=
iring this=2C but=20
=3Cbr=3E=26gt=3B something does=2E
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B =7CERROR=3A db-6=2E0=2E30-r0 do=5Fpackage=5Fqa=3A QA Issue=
=3A non -dev/-dbg/nativesdk- package=20
=3Cbr=3E=26gt=3B contains symlink =2Eso=3A db path=20
=3Cbr=3E=26gt=3B =27work/cortexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r=
0/packages-split/db/usr/lib/libdb-6=2Eso=27=20
=3Cbr=3E=26gt=3B =5Bdev-so=5D ERROR=3A db-6=2E0=2E30-r0 do=5Fpackage=5Fqa=
=3A QA run found fatal errors=2E Please=20
=3Cbr=3E=26gt=3B consider fixing them=2E ERROR=3A db-6=2E0=2E30-r0 do=5Fpac=
kage=5Fqa=3A Function failed=3A=20
=3Cbr=3E=26gt=3B do=5Fpackage=5Fqa ERROR=3A Logfile of failure stored in=3A=
=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/temp/log=2Edo=5Fpackage=
=5Fqa=2E1270=20
=3Cbr=3E=26gt=3B ERROR=3A Task 2138=20
=3Cbr=3E=26gt=3B =28/home/test/karo/fsl-community-bsp=5F5011/sources/poky/m=
eta/recipes-support/db/db=5F6=2E0=2E30=2Ebb=2C=20
=3Cbr=3E=26gt=3B do=5Fpackage=5Fqa=29 failed with exit code =271=27 =7C
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B In the folder the error mentions is the =2Eso file along w=
ith a link back to that=20
=3Cbr=3E=26gt=3B same so file minus the minor version=2E
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B =7C-rwxr-xr-x 2 test test 1=2E1M Apr 9 12=3A23 libdb-6=2E0=
=2Eso lrwxrwxrwx 1 test test 12=20
=3Cbr=3E=26gt=3B Apr 9 12=3A24 libdb-6=2Eso -=26gt=3B libdb-6=2E0=2Eso =7C=

=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B This linked file is being created during the build at some=
 point =28removing the=20
=3Cbr=3E=26gt=3B linked file or even the whole build directory and rerunnin=
g results in the same=20
=3Cbr=3E=26gt=3B issue=29
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B I think I could probably find a way to disable the QA chec=
k=2C but thats not ideal=20
=3Cbr=3E=26gt=3B since something requires this and I dont like having to di=
sable checks for=20
=3Cbr=3E=26gt=3B production code=2E
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B The Error log file mentioned in the error is here=3A
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B ----------------------------------------------------------=
---------------------------------------------------------------------------=
----------------------ERROR=20
=3Cbr=3E=26gt=3B Log-------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
----------------------------------------
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B =7CDEBUG=3A Executing python function sstate=5Ftask=5Fpref=
unc DEBUG=3A Python function=20
=3Cbr=3E=26gt=3B sstate=5Ftask=5Fprefunc finished DEBUG=3A Executing python=
 function do=5Fpackage=5Fqa=20
=3Cbr=3E=26gt=3B NOTE=3A DO PACKAGE QA DEBUG=3A Executing python function r=
ead=5Fsubpackage=5Fmetadata=20
=3Cbr=3E=26gt=3B DEBUG=3A Python function read=5Fsubpackage=5Fmetadata fini=
shed NOTE=3A Package db=20
=3Cbr=3E=26gt=3B skipping QA tests=3A =5B=27dev-soalready-stripped=27=5D NO=
TE=3A Checking Package=3A db NOTE=3A=20
=3Cbr=3E=26gt=3B arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db/usr/lib=
/libdb-6=2E0=2Eso=20
=3Cbr=3E=26gt=3B ERROR=3A QA Issue=3A non -dev/-dbg/nativesdk- package cont=
ains symlink =2Eso=3A db path=20
=3Cbr=3E=26gt=3B =27work/cortexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r=
0/packages-split/db/usr/lib/libdb-6=2Eso=27=20
=3Cbr=3E=26gt=3B =5Bdev-so=5D NOTE=3A Checking Package=3A db-bin NOTE=3A ar=
m-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Fstat=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Fdeadlock=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Freplicate=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Flog=5Fverify=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Fverify=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Fupgrade=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Fprintlog=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Farchive=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Fhotbackup=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Fdump=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Fload=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Fcheckpoint=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Frecover=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-bin/usr=
/bin/db=5Ftuner=20
=3Cbr=3E=26gt=3B NOTE=3A Checking Package=3A db-staticdev NOTE=3A Checking=
 Package=3A db-dev NOTE=3A=20
=3Cbr=3E=26gt=3B Package db-cxx skipping QA tests=3A =5B=27dev-so=27=5D NOT=
E=3A Checking Package=3A db-cxx=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-cxx/usr=
/lib/libdb=5Fcxx-6=2E0=2Eso=20
=3Cbr=3E=26gt=3B NOTE=3A Checking Package=3A db-doc NOTE=3A Checking Packag=
e=3A db-dbg NOTE=3A=20
=3Cbr=3E=26gt=3B arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Fstat=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Fdeadlock=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Freplicate=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Flog=5Fverify=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Fverify=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Fupgrade=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Fprintlog=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Farchive=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Fhotbackup=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Fdump=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Fload=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Fcheckpoint=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Frecover=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/bin/=2Edebug/db=5Ftuner=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/lib/=2Edebug/libdb=5Fcxx-6=2E0=2Eso=20
=3Cbr=3E=26gt=3B NOTE=3A arm-poky-linux-gnueabi-objdump -p=20
=3Cbr=3E=26gt=3B /home/test/karo/fsl-community-bsp=5F5011/build/tmp/work/co=
rtexa7hf-neon-poky-linux-gnueabi/db/6=2E0=2E30-r0/packages-split/db-dbg/usr=
/lib/=2Edebug/libdb-6=2E0=2Eso=20
=3Cbr=3E=26gt=3B NOTE=3A Checking Package=3A db-locale ERROR=3A QA run foun=
d fatal errors=2E Please=20
=3Cbr=3E=26gt=3B consider fixing them=2E DEBUG=3A Python function do=5Fpack=
age=5Fqa finished ERROR=3A=20
=3Cbr=3E=26gt=3B Function failed=3A do=5Fpackage=5Fqa =7C
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B ----------------------------------------------------------=
---------------------------------------------------------------------------=
----------------------ERROR=20
=3Cbr=3E=26gt=3B Log-------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
----------------------------------------
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B And the busy box recipe is below=28from the repo somewhere=
=29=2E There is some mention=20
=3Cbr=3E=26gt=3B in there about dev so files=2C but Im not sure if that mig=
ht be the issue or even=20
=3Cbr=3E=26gt=3B what changes might need to be made then=2E
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B ----------------------------------------------------------=
---------------------------------------------------------------------------=
----------------------BB=20
=3Cbr=3E=26gt=3B File------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------------------------
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B =7C
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B =23 Version 6 of the Berkeley DB from Oracle =28formerly S=
leepycat=29 =23 =23 At present=20
=3Cbr=3E=26gt=3B this package only installs the DB code =23 itself =28share=
d libraries=2C =2Ea in the dev=20
=3Cbr=3E=26gt=3B package=29=2C =23 documentation and headers=2E =23 =23 The=
 headers have the same names as=20
=3Cbr=3E=26gt=3B those as v3 =23 of the DB=2C only one version can be used=
 *for dev* =23 at once - DB3=20
=3Cbr=3E=26gt=3B and DB6 can both be installed on the =23 same system at th=
e same time if really=20
=3Cbr=3E=26gt=3B necessary=2E SECTION =3D =22libs=22 SUMMARY =3D =22Berkele=
y Database v6=22 HOMEPAGE =3D=20
=3Cbr=3E=26gt=3B =22http=3A//www=2Eoracle=2Ecom/technetwork/database/databa=
se-technologies/berkeleydb/overview/index=2Ehtml=22=20
=3Cbr=3E=26gt=3B LICENSE =3D =22AGPL-3=2E0=22 VIRTUAL=5FNAME =3F=3D =22virt=
ual/db=22 RCONFLICTS=5F=24=7BPN=7D =3D =22db3=22 =23=20
=3Cbr=3E=26gt=3B Note=2C when upgraded to 6=2E1=2Ex=2C a patch in RPM will=
 need to be removed to activate=20
=3Cbr=3E=26gt=3B db 6=2E1 support=2E SRC=5FURI =3D=20
=3Cbr=3E=26gt=3B =22http=3A//download=2Eoracle=2Ecom/berkeley-db/db-=24=7BP=
V=7D=2Etar=2Egz=22 SRC=5FURI +=3D=20
=3Cbr=3E=26gt=3B =22file=3A//arm-thumb-mutex=5Fdb5=2Epatch=3Bpatchdir=3D=2E=
=2E =5C file=3A//fix-parallel-build=2Epatch=20
=3Cbr=3E=26gt=3B =5C file=3A//Makefile-let-libso=5Ftarget-depend-on-bt=5Fre=
c=2Epatch =5C=20
=3Cbr=3E=26gt=3B file=3A//Makefile-let-libdb-6=2E0=2Ela-depend-os=5Fmap=2El=
=2Epatch=3Bpatchdir=3D=2E=2E =5C =22=20
=3Cbr=3E=26gt=3B SRC=5FURI=5Bmd5sum=5D =3D =22ad28eb86ad3203b5422844db179c5=
85b=22 SRC=5FURI=5Bsha256sum=5D =3D=20
=3Cbr=3E=26gt=3B =22608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f=
3f6a20fd2=22 =23 Exclude NC=20
=3Cbr=3E=26gt=3B versions which lack AES encryption UPSTREAM=5FCHECK=5FREGE=
X =3D=20
=3Cbr=3E=26gt=3B =22db-=28=3FP=26lt=3Bpver=26gt=3B=5Cd+=5C=2E=5Cd+=28=5C=2E=
=5Cd+=29=3F=29=2Etar=22 UPSTREAM=5FCHECK=5FURI =3D=20
=3Cbr=3E=26gt=3B =22http=3A//www=2Eoracle=2Ecom/technetwork/products/berkel=
eydb/downloads/index-082944=2Ehtml=22=20
=3Cbr=3E=26gt=3B LIC=5FFILES=5FCHKSUM =3D =22file=3A//=2E=2E/LICENSE=3Bmd5=
=3D1ec8b0b17cc31513fe35ab10716f8490=22=20
=3Cbr=3E=26gt=3B inherit autotools =23 Put virtual/db in any appropriate pr=
ovider of a =23 relational=20
=3Cbr=3E=26gt=3B database=2C use it as a dependency in =23 place of a speci=
fic db and use=3A =23 =23=20
=3Cbr=3E=26gt=3B PREFERRED=5FPROVIDER=5Fvirtual/db =23 =23 to select the co=
rrect db in the build =28distro=29=20
=3Cbr=3E=26gt=3B =2Econf PROVIDES +=3D =22=24=7BVIRTUAL=5FNAME=7D=22 =23 bi=
tbake isn=27t quite clever enough to deal=20
=3Cbr=3E=26gt=3B with sleepycat=2C =23 the distribution sits in the expecte=
d directory=2C but all =23 the=20
=3Cbr=3E=26gt=3B builds must occur from a sub-directory=2E The following=20=
=23 persuades bitbake to go=20
=3Cbr=3E=26gt=3B to the right place S =3D =22=24=7BWORKDIR=7D/db-=24=7BPV=
=7D/dist=22 B =3D=20
=3Cbr=3E=26gt=3B =22=24=7BWORKDIR=7D/db-=24=7BPV=7D/build=5Funix=22 SPDX=5F=
S =3D =22=24=7BWORKDIR=7D/db-=24=7BPV=7D=22 =23 The=20
=3Cbr=3E=26gt=3B executables go in a separate package - typically there=20=
=23 is no need to install=20
=3Cbr=3E=26gt=3B these unless doing real database =23 management on the sys=
tem=2E inherit lib=5Fpackage=20
=3Cbr=3E=26gt=3B PACKAGES =3D+ =22=24=7BPN=7D-cxx=22 FILES=5F=24=7BPN=7D-cx=
x =3D =22=24=7Blibdir=7D/*cxx*so=22 =23 The dev package=20
=3Cbr=3E=26gt=3B has the =2Eso link =28as in db3=29 and the =2Ea=27s - =23=
 it is therefore incompatible=20
=3Cbr=3E=26gt=3B =28cannot be installed at the =23 same time=29 as the db3=
 package =23 sort out the =2Eso=20
=3Cbr=3E=26gt=3B since they do version prior to the =2Eso SOLIBS =3D =22-6*=
=2Eso=22 FILES=5FSOLIBSDEV =3D=20
=3Cbr=3E=26gt=3B =22=24=7Blibdir=7D/libdb=2Eso =24=7Blibdir=7D/libdb=5Fcxx=
=2Eso=22 =23configuration - set in local=2Econf=20
=3Cbr=3E=26gt=3B to override =23 All the --disable-* options replace --enab=
le-smallbuild=2C which=20
=3Cbr=3E=26gt=3B breaks a bunch of stuff =28eg=2E postfix=29 DB6=5FCONFIG=
 =3F=3D =22--enable-o=5Fdirect=20
=3Cbr=3E=26gt=3B --disable-cryptography --disable-queue --disable-replicati=
on --disable-verify=20
=3Cbr=3E=26gt=3B --disable-compat185 --disable-sql=22 EXTRA=5FOECONF =3D=20=
=22=24=7BDB6=5FCONFIG=7D --enable-shared=20
=3Cbr=3E=26gt=3B --enable-cxx --with-sysroot=22 =23 Override the MUTEX sett=
ing here=2C the POSIX=20
=3Cbr=3E=26gt=3B library is =23 the default - =22POSIX/pthreads/library=22=
=2E =23 Don=27t ignore the nice SWP=20
=3Cbr=3E=26gt=3B instruction on the ARM=3A =23 These enable the ARM assembl=
er mutex code ARM=5FMUTEX =3D=20
=3Cbr=3E=26gt=3B =22--with-mutex=3DARM/gcc-assembly=22 MUTEX =3D =22=22 MUT=
EX=5Farm =3D =22=24=7BARM=5FMUTEX=7D=22=20
=3Cbr=3E=26gt=3B MUTEX=5Farmeb =3D =22=24=7BARM=5FMUTEX=7D=22 EXTRA=5FOECON=
F +=3D =22=24=7BMUTEX=7D=22=20
=3Cbr=3E=26gt=3B EXTRA=5FOEMAKE=5Fclass-target =3D=20
=3Cbr=3E=26gt=3B =22LIBTOOL=3D=24=7BSTAGING=5FBINDIR=5FCROSS=7D/=24=7BHOST=
=5FSYS=7D-libtool=22 =23 Cancel the site stuff -=20
=3Cbr=3E=26gt=3B it=27s set for db3 and destroys the =23 configure=2E CONFI=
G=5FSITE =3D =22=22 do=5Fconfigure=28=29 =7B=20
=3Cbr=3E=26gt=3B gnu-configize --force =24=7BS=7D export STRIP=3D=22true=22=
 oe=5Frunconf =7D do=5Fcompile=5Fprepend=28=29=20
=3Cbr=3E=26gt=3B =7B sed -i -e =27s=7Chardcode=5Finto=5Flibs=3Dyes=7Chardco=
de=5Finto=5Flibs=3Dno=7C=27 =5C =24=7BB=7D/libtool =7D=20
=3Cbr=3E=26gt=3B do=5Finstall=5Fappend=28=29 =7B mkdir -p =24=7BD=7D/=24=7B=
includedir=7D/db60 mv=20
=3Cbr=3E=26gt=3B =24=7BD=7D/=24=7Bincludedir=7D/db=2Eh =24=7BD=7D/=24=7Binc=
ludedir=7D/db60/=2E mv =24=7BD=7D/=24=7Bincludedir=7D/db=5Fcxx=2Eh=20
=3Cbr=3E=26gt=3B =24=7BD=7D/=24=7Bincludedir=7D/db60/=2E ln -s db60/db=2Eh=
 =24=7BD=7D/=24=7Bincludedir=7D/db=2Eh ln -s=20
=3Cbr=3E=26gt=3B db60/db=5Fcxx=2Eh =24=7BD=7D/=24=7Bincludedir=7D/db=5Fcxx=
=2Eh =23 The docs end up in /usr/docs - not=20
=3Cbr=3E=26gt=3B right=2E if test -d =22=24=7BD=7D/=24=7Bprefix=7D/docs=22=
 then mkdir -p =22=24=7BD=7D/=24=7Bdatadir=7D=22 test !=20
=3Cbr=3E=26gt=3B -d =22=24=7BD=7D/=24=7Bdocdir=7D=22 =7C=7C rm -rf =22=24=
=7BD=7D/=24=7Bdocdir=7D=22 mv =22=24=7BD=7D/=24=7Bprefix=7D/docs=22=20
=3Cbr=3E=26gt=3B =22=24=7BD=7D/=24=7Bdocdir=7D=22 fi chown -R root=3Aroot=
 =24=7BD=7D =7D INSANE=5FSKIP=5F=24=7BPN=7D =3D =22dev-so=22=20
=3Cbr=3E=26gt=3B INSANE=5FSKIP=5F=24=7BPN=7D-cxx =3D =22dev-so=22 BBCLASSEX=
TEND =3D =22native nativesdk=22 =7C
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B Thanks=2C
=3Cbr=3E=26gt=3B Chad
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=26gt=3B Cyberlock=2C Inc=2E =7C Videx=2C Inc=2E =7C 1105 NE Circle=
 Blvd=2E =7C Corvallis=2C OR 97330 =7C=20
=3Cbr=3E=26gt=3B =28541=29 738-5500
=3Cbr=3E=26gt=3B This email is intended only for the addressee=28s=29 and m=
ay include material that=20
=3Cbr=3E=26gt=3B is privileged=2C confidential=2C and protected from disclo=
sure=2E No contract is=20
=3Cbr=3E=26gt=3B intended=2E =C2=A92019 Videx=2C Inc=2E
=3Cbr=3E=26gt=3B=20
=3Cbr=3E=3C/blockquote=3E=3C/div=3E=
=3CBR /=3E
=3CBR /=3E
Cyberlock=2C Inc=2E =7C Videx=2C Inc=2E =7C 1105 NE Circle Blvd=2E =7C Corv=
allis=2C OR 97330 =7C =28541=29 738-5500=3Cbr=3EThis email is intended only=
 for the addressee=28s=29 and may include material that is privileged=2C co=
nfidential=2C and protected from disclosure=2E  No contract is intended=2E=
  =C2=A92019 Videx=2C Inc=2E=3CBR /=3E
=3C/body=3E=3C/html=3E=


--=-TVEEy/b2y5HMo3gCMGx8--
