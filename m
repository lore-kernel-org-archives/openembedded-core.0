Received: from col0-omc3-s6.col0.hotmail.com ([65.55.34.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1RqDf7-0005US-Rj
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 01:58:02 +0100
Received: from COL120-W40 ([65.55.34.136]) by col0-omc3-s6.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 25 Jan 2012 16:50:12 -0800
Message-ID: <COL120-W40F98EF50F803A1509B3AFDD890@phx.gbl>
X-Originating-IP: [70.137.132.86]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2012 16:50:12 -0800
Importance: Normal
In-Reply-To: <20120126003644.GA4973@sakrah.homelinux.org>
References: <COL120-W51BE77DBA9D330FF475952DD880@phx.gbl>,
	<20120126003644.GA4973@sakrah.homelinux.org>
MIME-Version: 1.0
X-OriginalArrivalTime: 26 Jan 2012 00:50:12.0836 (UTC)
	FILETIME=[76198A40:01CCDBC4]
Subject: Re: Net::SSLeay perl extension OpenSSL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2012 00:58:02 -0000
Content-Type: multipart/alternative;
	boundary="_d9f5c504-f9fd-45c0-ad3d-9e33c570b748_"

--_d9f5c504-f9fd-45c0-ad3d-9e33c570b748_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



Hello Raj=2C

Thanks for the reply.
I do not have the file named "libnet-ssleay-license". Where can I obtain th=
is?
If I try to build without that file=2C I get the same error about command.p=
m.


Date: Wed=2C 25 Jan 2012 16:36:44 -0800
From: raj.khem@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL

On (25/01/12 14:50)=2C simran singh wrote:
>=20
> Hello=2C
>=20
> I am not sure if this is the right list.
>=20
> Trying to add Net::SSLeay perl module=2C I get the following error.
>=20
=20
Please try attached patch. I have not tested it
=20
=20
=20
>=20
>=20
>  NOTE: Running task 204 of 315 (ID: 11=2C=20
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-black=
core-common/recipes/
>=20
> net-ssleay/net-ssleay_1.36.bb=2C do_compile)
>=20
> ERROR: TaskFailed event exception=2C aborting
>=20
> ERROR: Build of=20
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-black=
core-common/recipes/net-ssleay/net-ssleay_1.36.bb
>=20
>  do_compile failed
>=20
> ERROR: Task 11=20
> (/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blac=
kcore-common/recipes/net-ssleay/net-ssleay_1.36.bb=2C
>=20
>  do_compile) failed with 256
>=20
> ERROR:=20
> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blac=
kcore-common/recipes/net-ssleay/net-ssleay_1.36.bb'
>  failed
>=20
> NOTE: package net-ssleay-1.36-r0: task do_compile: Started
>=20
> ERROR: Function do_compile failed
>=20
> NOTE: Task failed: ('function do_compile failed'=2C=20
> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080=
ds_release/work/
>=20
> ppce500mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')
>=20
> ERROR: Logfile of failure stored in:=20
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080d=
s_release/work/ppce500mc-
>=20
> linux/net-ssleay-1.36-r0/temp/log.do_compile.22680
>=20
> Log data follows:
>=20
> | NOTE: make -j 2 -e MAKEFLAGS=3D PASTHRU_INC=3D -fexpensive-optimization=
s=20
> -frename-registers -fomit-frame-pointer -O2 -g0 CCFLAGS=3D -fexpensive
>=20
> -optimizations -frename-registers -fomit-frame-pointer -O2 -g0=20
> LD=3Dpowerpc-linux-gnu-gcc -mcpu=3De500mc -maix-struct-return=20
> --sysroot=3D/home/Simran/
>=20
> Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sys=
roots/ppce500mc-linux
>=20
> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release
>=20
> /sysroots/i686-linux/usr/lib/perl/5.10.1=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release/sysroots/i686-linux/usr/lib
>=20
> /perl/5.10.1=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
>=20
>  /home/
>=20
> jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p102=
3rds_release/sysroots/i686-linux/usr/lib/perl .).
>=20
> | BEGIN failed--compilation aborted.
>=20
> | make: *** [blib/lib/Net/.exists] Error 2
>=20
> | make: *** Waiting for unfinished jobs....
>=20
> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/
>=20
> build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release
>=20
> /sysroots/i686-linux/usr/lib/perl/5.10.1=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release/sysroots/i686-linux/usr
>=20
> /lib/perl/5.10.1=20
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/buil=
d_p1023rds_release/sysroots/i686-linux/usr/lib/perl
>  .).
>=20
> | BEGIN failed--compilation aborted.
>=20
> | make: *** [blib/arch/.exists] Error 2
>=20
> | FATAL: oe_runmake failed
>=20
> | ERROR: Function do_compile failed
>=20
> NOTE: package net-ssleay-1.36-r0: task do_compile: Failed
>=20
> ERROR: TaskFailed event exception=2C aborting
>=20
>=20
>=20
>=20
>=20
> I used the libnet-ssleay-perl_1.36.bb=2C I found in the oe-commit archive=
.
>=20
> Please advice and thanks.
>=20
>=20
>=20
> Sim Gill 		 	   		   		 	   		 =20
=20
=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
=20
=20
--=20
-Khem

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core 		 	 =
  		  =

--_d9f5c504-f9fd-45c0-ad3d-9e33c570b748_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 10pt=3B
font-family:Tahoma
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>
<br>Hello Raj=2C<br><br>Thanks for the reply.<br>I do not have the file nam=
ed "libnet-ssleay-license". Where can I obtain this?<br>If I try to build w=
ithout that file=2C I get the same error about command.pm.<br><br><br><div>=
<div id=3D"SkyDrivePlaceholder"></div>Date: Wed=2C 25 Jan 2012 16:36:44 -08=
00<br>From: raj.khem@gmail.com<br>To: openembedded-core@lists.openembedded.=
org<br>Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL<br><br><pr=
e>On (25/01/12 14:50)=2C simran singh wrote:<br>&gt=3B <br>&gt=3B Hello=2C<=
br>&gt=3B <br>&gt=3B I am not sure if this is the right list.<br>&gt=3B <br=
>&gt=3B Trying to add Net::SSLeay perl module=2C I get the following error.=
<br>&gt=3B <br> <br>Please try attached patch. I have not tested it<br> <br=
> <br> <br>&gt=3B <br>&gt=3B <br>&gt=3B  NOTE: Running task 204 of 315 (ID:=
 11=2C <br>&gt=3B /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuil=
der/engage-blackcore-common/recipes/<br>&gt=3B <br>&gt=3B net-ssleay/net-ss=
leay_1.36.bb=2C do_compile)<br>&gt=3B <br>&gt=3B ERROR: TaskFailed event ex=
ception=2C aborting<br>&gt=3B <br>&gt=3B ERROR: Build of <br>&gt=3B /home/S=
imran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-comm=
on/recipes/net-ssleay/net-ssleay_1.36.bb<br>&gt=3B <br>&gt=3B  do_compile f=
ailed<br>&gt=3B <br>&gt=3B ERROR: Task 11 <br>&gt=3B (/home/Simran/Freescal=
e/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net=
-ssleay/net-ssleay_1.36.bb=2C<br>&gt=3B <br>&gt=3B  do_compile) failed with=
 256<br>&gt=3B <br>&gt=3B ERROR: <br>&gt=3B '/home/Simran/Freescale/QorIQ-D=
PAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/n=
et-ssleay_1.36.bb'<br>&gt=3B  failed<br>&gt=3B <br>&gt=3B NOTE: package net=
-ssleay-1.36-r0: task do_compile: Started<br>&gt=3B <br>&gt=3B ERROR: Funct=
ion do_compile failed<br>&gt=3B <br>&gt=3B NOTE: Task failed: ('function do=
_compile failed'=2C <br>&gt=3B '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111=
026-systembuilder/build_p4080ds_release/work/<br>&gt=3B <br>&gt=3B ppce500m=
c-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')<br>&gt=3B <br>&gt=3B=
 ERROR: Logfile of failure stored in: <br>&gt=3B /home/Simran/Freescale/Qor=
IQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/work/ppce500mc-<br=
>&gt=3B <br>&gt=3B linux/net-ssleay-1.36-r0/temp/log.do_compile.22680<br>&g=
t=3B <br>&gt=3B Log data follows:<br>&gt=3B <br>&gt=3B | NOTE: make -j 2 -e=
 MAKEFLAGS=3D PASTHRU_INC=3D -fexpensive-optimizations <br>&gt=3B -frename-=
registers -fomit-frame-pointer -O2 -g0 CCFLAGS=3D -fexpensive<br>&gt=3B <br=
>&gt=3B -optimizations -frename-registers -fomit-frame-pointer -O2 -g0 <br>=
&gt=3B LD=3Dpowerpc-linux-gnu-gcc -mcpu=3De500mc -maix-struct-return <br>&g=
t=3B --sysroot=3D/home/Simran/<br>&gt=3B <br>&gt=3B Freescale/QorIQ-DPAA-SD=
K-20111026-systembuilder/build_p4080ds_release/sysroots/ppce500mc-linux<br>=
&gt=3B <br>&gt=3B | Can't locate ExtUtils/Command.pm in @INC (@INC contains=
: inc <br>&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/=
sb-dev.git/build_p1023rds_release<br>&gt=3B <br>&gt=3B /sysroots/i686-linux=
/usr/lib/perl/5.10.1 <br>&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-s=
tep1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/li=
b<br>&gt=3B <br>&gt=3B /perl/5.10.1 <br>&gt=3B /home/jenkins/jenkins/jobs/q=
oriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i6=
86-linux/usr/lib/perl/5.10.1<br>&gt=3B <br>&gt=3B  /home/<br>&gt=3B <br>&gt=
=3B jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1=
023rds_release/sysroots/i686-linux/usr/lib/perl .).<br>&gt=3B <br>&gt=3B | =
BEGIN failed--compilation aborted.<br>&gt=3B <br>&gt=3B | make: *** [blib/l=
ib/Net/.exists] Error 2<br>&gt=3B <br>&gt=3B | make: *** Waiting for unfini=
shed jobs....<br>&gt=3B <br>&gt=3B | Can't locate ExtUtils/Command.pm in @I=
NC (@INC contains: inc <br>&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso=
-step1/workspace/sb-dev.git/<br>&gt=3B <br>&gt=3B build_p1023rds_release/sy=
sroots/i686-linux/usr/lib/perl/5.10.1 <br>&gt=3B /home/jenkins/jenkins/jobs=
/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release<br>&gt=3B=
 <br>&gt=3B /sysroots/i686-linux/usr/lib/perl/5.10.1 <br>&gt=3B /home/jenki=
ns/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_re=
lease/sysroots/i686-linux/usr<br>&gt=3B <br>&gt=3B /lib/perl/5.10.1 <br>&gt=
=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/bu=
ild_p1023rds_release/sysroots/i686-linux/usr/lib/perl<br>&gt=3B  .).<br>&gt=
=3B <br>&gt=3B | BEGIN failed--compilation aborted.<br>&gt=3B <br>&gt=3B | =
make: *** [blib/arch/.exists] Error 2<br>&gt=3B <br>&gt=3B | FATAL: oe_runm=
ake failed<br>&gt=3B <br>&gt=3B | ERROR: Function do_compile failed<br>&gt=
=3B <br>&gt=3B NOTE: package net-ssleay-1.36-r0: task do_compile: Failed<br=
>&gt=3B <br>&gt=3B ERROR: TaskFailed event exception=2C aborting<br>&gt=3B =
<br>&gt=3B <br>&gt=3B <br>&gt=3B <br>&gt=3B <br>&gt=3B I used the libnet-ss=
leay-perl_1.36.bb=2C I found in the oe-commit archive.<br>&gt=3B <br>&gt=3B=
 Please advice and thanks.<br>&gt=3B <br>&gt=3B <br>&gt=3B <br>&gt=3B Sim G=
ill 		 	   		   		 	   		  <br> <br> <br>&gt=3B ___________________________=
____________________<br>&gt=3B Openembedded-core mailing list<br>&gt=3B Ope=
nembedded-core@lists.openembedded.org<br>&gt=3B <a href=3D"http://lists.lin=
uxtogo.org/cgi-bin/mailman/listinfo/openembedded-core" target=3D"_blank">ht=
tp://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>=
 <br> <br>-- <br>-Khem<br></pre><br>_______________________________________=
________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</div>=
 		 	   		  </div></body>
</html>=

--_d9f5c504-f9fd-45c0-ad3d-9e33c570b748_--
