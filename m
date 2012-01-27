Received: from col0-omc3-s2.col0.hotmail.com ([65.55.34.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1RqpBI-0001Me-F1
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:01:44 +0100
Received: from COL120-W54 ([65.55.34.135]) by col0-omc3-s2.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 27 Jan 2012 08:41:26 -0800
Message-ID: <COL120-W5491D70C591B2839B06CF3DD8E0@phx.gbl>
X-Originating-IP: [70.137.132.86]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jan 2012 08:41:26 -0800
Importance: Normal
In-Reply-To: <CAMKF1sotwjeYEqRot=aOiVMq4iGvOXfWcOocqFAXTFH=OTnozw@mail.gmail.com>
References: <COL120-W51BE77DBA9D330FF475952DD880@phx.gbl>,
	<20120126003644.GA4973@sakrah.homelinux.org>,
	<COL120-W40F98EF50F803A1509B3AFDD890@phx.gbl>,
	<CAMKF1sotwjeYEqRot=aOiVMq4iGvOXfWcOocqFAXTFH=OTnozw@mail.gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 27 Jan 2012 16:41:26.0307 (UTC)
	FILETIME=[82F3D730:01CCDD12]
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
X-List-Received-Date: Fri, 27 Jan 2012 17:01:44 -0000
Content-Type: multipart/alternative;
	boundary="_7f1473fa-e368-4116-b239-9944fb51d561_"

--_7f1473fa-e368-4116-b239-9944fb51d561_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello Raj=2C

I am using open embedded provided through a company instead of downloading =
from the git repository. Is there a way=20
to apply this patch manually without going through git?.
I tried 'bitbake patch filename' but that did not work.
Thanks a bunch for your help.

Sim =20

> From: raj.khem@gmail.com
> Date: Wed=2C 25 Jan 2012 17:49:48 -0800
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
>=20
> On Wed=2C Jan 25=2C 2012 at 4:50 PM=2C simran singh <kyoonn@hotmail.com> =
wrote:
> >
> > Hello Raj=2C
> >
> > Thanks for the reply.
> > I do not have the file named "libnet-ssleay-license". Where can I obtai=
n
> > this?
> > If I try to build without that file=2C I get the same error about comma=
nd.pm.
>=20
> Did you apply the patch properly ?
>=20
> save the patch and cd into openembedded-core
> and then git am <patchfile>
> >
> >
> > Date: Wed=2C 25 Jan 2012 16:36:44 -0800
> > From: raj.khem@gmail.com
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
> >
> >
> > On (25/01/12 14:50)=2C simran singh wrote:
> >>
> >> Hello=2C
> >>
> >> I am not sure if this is the right list.
> >>
> >> Trying to add Net::SSLeay perl module=2C I get the following error.
> >>
> >
> > Please try attached patch. I have not tested it
> >
> >
> >
> >>
> >>
> >>  NOTE: Running task 204 of 315 (ID: 11=2C
> >>
> >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-bl=
ackcore-common/recipes/
> >>
> >> net-ssleay/net-ssleay_1.36.bb=2C do_compile)
> >>
> >> ERROR: TaskFailed event exception=2C aborting
> >>
> >> ERROR: Build of
> >>
> >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-bl=
ackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb
> >>
> >>  do_compile failed
> >>
> >> ERROR: Task 11
> >>
> >> (/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-b=
lackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb=2C
> >>
> >>  do_compile) failed with 256
> >>
> >> ERROR:
> >>
> >> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-b=
lackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb'
> >>  failed
> >>
> >> NOTE: package net-ssleay-1.36-r0: task do_compile: Started
> >>
> >> ERROR: Function do_compile failed
> >>
> >> NOTE: Task failed: ('function do_compile failed'=2C
> >>
> >> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4=
080ds_release/work/
> >>
> >> ppce500mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')
> >>
> >> ERROR: Logfile of failure stored in:
> >>
> >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p40=
80ds_release/work/ppce500mc-
> >>
> >> linux/net-ssleay-1.36-r0/temp/log.do_compile.22680
> >>
> >> Log data follows:
> >>
> >> | NOTE: make -j 2 -e MAKEFLAGS=3D PASTHRU_INC=3D -fexpensive-optimizat=
ions
> >> -frename-registers -fomit-frame-pointer -O2 -g0 CCFLAGS=3D -fexpensive
> >>
> >> -optimizations -frename-registers -fomit-frame-pointer -O2 -g0
> >> LD=3Dpowerpc-linux-gnu-gcc -mcpu=3De500mc -maix-struct-return
> >> --sysroot=3D/home/Simran/
> >>
> >>
> >> Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/=
sysroots/ppce500mc-linux
> >>
> >> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc
> >>
> >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/b=
uild_p1023rds_release
> >>
> >> /sysroots/i686-linux/usr/lib/perl/5.10.1
> >>
> >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/b=
uild_p1023rds_release/sysroots/i686-linux/usr/lib
> >>
> >> /perl/5.10.1
> >>
> >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/b=
uild_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
> >>
> >>  /home/
> >>
> >>
> >> jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p=
1023rds_release/sysroots/i686-linux/usr/lib/perl
> >> .).
> >>
> >> | BEGIN failed--compilation aborted.
> >>
> >> | make: *** [blib/lib/Net/.exists] Error 2
> >>
> >> | make: *** Waiting for unfinished jobs....
> >>
> >> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc
> >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/
> >>
> >> build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
> >>
> >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/b=
uild_p1023rds_release
> >>
> >> /sysroots/i686-linux/usr/lib/perl/5.10.1
> >>
> >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/b=
uild_p1023rds_release/sysroots/i686-linux/usr
> >>
> >> /lib/perl/5.10.1
> >>
> >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/b=
uild_p1023rds_release/sysroots/i686-linux/usr/lib/perl
> >>  .).
> >>
> >> | BEGIN failed--compilation aborted.
> >>
> >> | make: *** [blib/arch/.exists] Error 2
> >>
> >> | FATAL: oe_runmake failed
> >>
> >> | ERROR: Function do_compile failed
> >>
> >> NOTE: package net-ssleay-1.36-r0: task do_compile: Failed
> >>
> >> ERROR: TaskFailed event exception=2C aborting
> >>
> >>
> >>
> >>
> >>
> >> I used the libnet-ssleay-perl_1.36.bb=2C I found in the oe-commit arch=
ive.
> >>
> >> Please advice and thanks.
> >>
> >>
> >>
> >> Sim Gill 		 	   		   		 	   	=09
> >
> >
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
> > --
> > -Khem
> >
> >
> > _______________________________________________ Openembedded-core maili=
ng
> > list Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
 		 	   		  =

--_7f1473fa-e368-4116-b239-9944fb51d561_
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
Hello Raj=2C<br><br>I am using open embedded provided through a company ins=
tead of downloading from the git repository. Is there a way <br>to apply th=
is patch manually without going through git?.<br>I tried 'bitbake patch fil=
ename' but that did not work.<br>Thanks a bunch for your help.<br><br>Sim&n=
bsp=3B <br><br><div><div id=3D"SkyDrivePlaceholder"></div>&gt=3B From: raj.=
khem@gmail.com<br>&gt=3B Date: Wed=2C 25 Jan 2012 17:49:48 -0800<br>&gt=3B =
To: openembedded-core@lists.openembedded.org<br>&gt=3B Subject: Re: [OE-cor=
e] Net::SSLeay perl extension OpenSSL<br>&gt=3B <br>&gt=3B On Wed=2C Jan 25=
=2C 2012 at 4:50 PM=2C simran singh &lt=3Bkyoonn@hotmail.com&gt=3B wrote:<b=
r>&gt=3B &gt=3B<br>&gt=3B &gt=3B Hello Raj=2C<br>&gt=3B &gt=3B<br>&gt=3B &g=
t=3B Thanks for the reply.<br>&gt=3B &gt=3B I do not have the file named "l=
ibnet-ssleay-license". Where can I obtain<br>&gt=3B &gt=3B this?<br>&gt=3B =
&gt=3B If I try to build without that file=2C I get the same error about co=
mmand.pm.<br>&gt=3B <br>&gt=3B Did you apply the patch properly ?<br>&gt=3B=
 <br>&gt=3B save the patch and cd into openembedded-core<br>&gt=3B and then=
 git am &lt=3Bpatchfile&gt=3B<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B<br>&gt=3B &=
gt=3B Date: Wed=2C 25 Jan 2012 16:36:44 -0800<br>&gt=3B &gt=3B From: raj.kh=
em@gmail.com<br>&gt=3B &gt=3B To: openembedded-core@lists.openembedded.org<=
br>&gt=3B &gt=3B Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL<=
br>&gt=3B &gt=3B<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B On (25/01/12 14:50)=2C s=
imran singh wrote:<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B Hello=2C<b=
r>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B I am not sure if this is the r=
ight list.<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B Trying to add Net:=
:SSLeay perl module=2C I get the following error.<br>&gt=3B &gt=3B&gt=3B<br=
>&gt=3B &gt=3B<br>&gt=3B &gt=3B Please try attached patch. I have not teste=
d it<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=
=3B<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B  NOTE: Running task 204 o=
f 315 (ID: 11=2C<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B /home/Simran=
/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/re=
cipes/<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B net-ssleay/net-ssleay_=
1.36.bb=2C do_compile)<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B ERROR:=
 TaskFailed event exception=2C aborting<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &g=
t=3B&gt=3B ERROR: Build of<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B /h=
ome/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore=
-common/recipes/net-ssleay/net-ssleay_1.36.bb<br>&gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B&gt=3B  do_compile failed<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B=
&gt=3B ERROR: Task 11<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B (/home/=
Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-com=
mon/recipes/net-ssleay/net-ssleay_1.36.bb=2C<br>&gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B&gt=3B  do_compile) failed with 256<br>&gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B&gt=3B ERROR:<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B '/hom=
e/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-c=
ommon/recipes/net-ssleay/net-ssleay_1.36.bb'<br>&gt=3B &gt=3B&gt=3B  failed=
<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B NOTE: package net-ssleay-1.3=
6-r0: task do_compile: Started<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=
=3B ERROR: Function do_compile failed<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=
=3B&gt=3B NOTE: Task failed: ('function do_compile failed'=2C<br>&gt=3B &gt=
=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B '/home/Simran/Freescale/QorIQ-DPAA-SDK-201=
11026-systembuilder/build_p4080ds_release/work/<br>&gt=3B &gt=3B&gt=3B<br>&=
gt=3B &gt=3B&gt=3B ppce500mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.2=
2680')<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B ERROR: Logfile of fail=
ure stored in:<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B /home/Simran/F=
reescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/work/p=
pce500mc-<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B linux/net-ssleay-1.=
36-r0/temp/log.do_compile.22680<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=
=3B Log data follows:<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B | NOTE:=
 make -j 2 -e MAKEFLAGS=3D PASTHRU_INC=3D -fexpensive-optimizations<br>&gt=
=3B &gt=3B&gt=3B -frename-registers -fomit-frame-pointer -O2 -g0 CCFLAGS=3D=
 -fexpensive<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B -optimizations -=
frename-registers -fomit-frame-pointer -O2 -g0<br>&gt=3B &gt=3B&gt=3B LD=3D=
powerpc-linux-gnu-gcc -mcpu=3De500mc -maix-struct-return<br>&gt=3B &gt=3B&g=
t=3B --sysroot=3D/home/Simran/<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=
=3B<br>&gt=3B &gt=3B&gt=3B Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/=
build_p4080ds_release/sysroots/ppce500mc-linux<br>&gt=3B &gt=3B&gt=3B<br>&g=
t=3B &gt=3B&gt=3B | Can't locate ExtUtils/Command.pm in @INC (@INC contains=
: inc<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/j=
obs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release<br>&gt=
=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B /sysroots/i686-linux/usr/lib/perl/5=
.10.1<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/j=
obs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroo=
ts/i686-linux/usr/lib<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B /perl/5=
.10.1<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/j=
obs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroo=
ts/i686-linux/usr/lib/perl/5.10.1<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&g=
t=3B  /home/<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B=
&gt=3B jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build=
_p1023rds_release/sysroots/i686-linux/usr/lib/perl<br>&gt=3B &gt=3B&gt=3B .=
).<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B | BEGIN failed--compilatio=
n aborted.<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B | make: *** [blib/=
lib/Net/.exists] Error 2<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B | ma=
ke: *** Waiting for unfinished jobs....<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &g=
t=3B&gt=3B | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc<b=
r>&gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/works=
pace/sb-dev.git/<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B build_p1023r=
ds_release/sysroots/i686-linux/usr/lib/perl/5.10.1<br>&gt=3B &gt=3B&gt=3B<b=
r>&gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/works=
pace/sb-dev.git/build_p1023rds_release<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=
=3B&gt=3B /sysroots/i686-linux/usr/lib/perl/5.10.1<br>&gt=3B &gt=3B&gt=3B<b=
r>&gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/works=
pace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr<br>&gt=3B &g=
t=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B /lib/perl/5.10.1<br>&gt=3B &gt=3B&gt=3B<b=
r>&gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/works=
pace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl<br>=
&gt=3B &gt=3B&gt=3B  .).<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B | BE=
GIN failed--compilation aborted.<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=
=3B | make: *** [blib/arch/.exists] Error 2<br>&gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B&gt=3B | FATAL: oe_runmake failed<br>&gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B&gt=3B | ERROR: Function do_compile failed<br>&gt=3B &gt=3B&gt=3B=
<br>&gt=3B &gt=3B&gt=3B NOTE: package net-ssleay-1.36-r0: task do_compile: =
Failed<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B ERROR: TaskFailed even=
t exception=2C aborting<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B<br>&g=
t=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &=
gt=3B&gt=3B I used the libnet-ssleay-perl_1.36.bb=2C I found in the oe-comm=
it archive.<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B Please advice and=
 thanks.<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=
=3B<br>&gt=3B &gt=3B&gt=3B Sim Gill 		 	   		   		 	   		<br>&gt=3B &gt=3B<=
br>&gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B ___________________________________=
____________<br>&gt=3B &gt=3B&gt=3B Openembedded-core mailing list<br>&gt=
=3B &gt=3B&gt=3B Openembedded-core@lists.openembedded.org<br>&gt=3B &gt=3B&=
gt=3B http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=
<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B --<br>&gt=3B &gt=3B -Kh=
em<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B _____________________=
__________________________ Openembedded-core mailing<br>&gt=3B &gt=3B list =
Openembedded-core@lists.openembedded.org<br>&gt=3B &gt=3B http://lists.linu=
xtogo.org/cgi-bin/mailman/listinfo/openembedded-core<br>&gt=3B &gt=3B<br>&g=
t=3B &gt=3B _______________________________________________<br>&gt=3B &gt=
=3B Openembedded-core mailing list<br>&gt=3B &gt=3B Openembedded-core@lists=
.openembedded.org<br>&gt=3B &gt=3B http://lists.linuxtogo.org/cgi-bin/mailm=
an/listinfo/openembedded-core<br>&gt=3B &gt=3B<br>&gt=3B <br>&gt=3B _______=
________________________________________<br>&gt=3B Openembedded-core mailin=
g list<br>&gt=3B Openembedded-core@lists.openembedded.org<br>&gt=3B http://=
lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core<br></div> 		=
 	   		  </div></body>
</html>=

--_7f1473fa-e368-4116-b239-9944fb51d561_--
