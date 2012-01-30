Received: from col0-omc3-s14.col0.hotmail.com ([65.55.34.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1RrxsX-0002Dz-6v
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 21:31:05 +0100
Received: from COL120-W1 ([65.55.34.135]) by col0-omc3-s14.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 30 Jan 2012 12:22:07 -0800
Message-ID: <COL120-W1F0FB4D7EDB043B22BB17DD8D0@phx.gbl>
X-Originating-IP: [70.137.155.165]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jan 2012 12:22:07 -0800
Importance: Normal
In-Reply-To: <20120128201145.GB22106@sakrah.homelinux.org>
References: <COL120-W51BE77DBA9D330FF475952DD880@phx.gbl>,
	<20120126003644.GA4973@sakrah.homelinux.org>,
	<COL120-W40F98EF50F803A1509B3AFDD890@phx.gbl>,
	<CAMKF1sotwjeYEqRot=aOiVMq4iGvOXfWcOocqFAXTFH=OTnozw@mail.gmail.com>,
	<COL120-W5491D70C591B2839B06CF3DD8E0@phx.gbl>,
	<20120128201145.GB22106@sakrah.homelinux.org>
MIME-Version: 1.0
X-OriginalArrivalTime: 30 Jan 2012 20:22:07.0713 (UTC)
	FILETIME=[D6AF4D10:01CCDF8C]
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
X-List-Received-Date: Mon, 30 Jan 2012 20:31:05 -0000
Content-Type: multipart/alternative;
	boundary="_4cecc173-63d7-48ae-a318-445826def467_"

--_4cecc173-63d7-48ae-a318-445826def467_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello=2C
I was able to successfully add the patch to the core. Thanks to your instru=
ctions. Even though a recipe was created=2C It is not being built with eith=
er perl or openssl. Do I need to add a dependency somewhere for the libnet-=
ssleay recipe to be recognized?Thanks.

> Date: Sat=2C 28 Jan 2012 12:11:45 -0800
> From: raj.khem@gmail.com
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
>=20
> On (27/01/12 08:41)=2C simran singh wrote:
> >=20
> > Hello Raj=2C
> >=20
> > I am using open embedded provided through a company instead of download=
ing from the git repository. Is there a way=20
> > to apply this patch manually without going through git?.
> > I tried 'bitbake patch filename' but that did not work.
>=20
> if you dont use git then just patch -p1 < <patchfilename> from
> openembedded-core directory should work.
>=20
> btw. learn about patch(man patch) it should really help you
>=20
> > Thanks a bunch for your help.
> >=20
> > Sim =20
> >=20
> > > From: raj.khem@gmail.com
> > > Date: Wed=2C 25 Jan 2012 17:49:48 -0800
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
> > >=20
> > > On Wed=2C Jan 25=2C 2012 at 4:50 PM=2C simran singh <kyoonn@hotmail.c=
om> wrote:
> > > >
> > > > Hello Raj=2C
> > > >
> > > > Thanks for the reply.
> > > > I do not have the file named "libnet-ssleay-license". Where can I o=
btain
> > > > this?
> > > > If I try to build without that file=2C I get the same error about c=
ommand.pm.
> > >=20
> > > Did you apply the patch properly ?
> > >=20
> > > save the patch and cd into openembedded-core
> > > and then git am <patchfile>
> > > >
> > > >
> > > > Date: Wed=2C 25 Jan 2012 16:36:44 -0800
> > > > From: raj.khem@gmail.com
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
> > > >
> > > >
> > > > On (25/01/12 14:50)=2C simran singh wrote:
> > > >>
> > > >> Hello=2C
> > > >>
> > > >> I am not sure if this is the right list.
> > > >>
> > > >> Trying to add Net::SSLeay perl module=2C I get the following error=
.
> > > >>
> > > >
> > > > Please try attached patch. I have not tested it
> > > >
> > > >
> > > >
> > > >>
> > > >>
> > > >>  NOTE: Running task 204 of 315 (ID: 11=2C
> > > >>
> > > >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engag=
e-blackcore-common/recipes/
> > > >>
> > > >> net-ssleay/net-ssleay_1.36.bb=2C do_compile)
> > > >>
> > > >> ERROR: TaskFailed event exception=2C aborting
> > > >>
> > > >> ERROR: Build of
> > > >>
> > > >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engag=
e-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb
> > > >>
> > > >>  do_compile failed
> > > >>
> > > >> ERROR: Task 11
> > > >>
> > > >> (/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/enga=
ge-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb=2C
> > > >>
> > > >>  do_compile) failed with 256
> > > >>
> > > >> ERROR:
> > > >>
> > > >> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/enga=
ge-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb'
> > > >>  failed
> > > >>
> > > >> NOTE: package net-ssleay-1.36-r0: task do_compile: Started
> > > >>
> > > >> ERROR: Function do_compile failed
> > > >>
> > > >> NOTE: Task failed: ('function do_compile failed'=2C
> > > >>
> > > >> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/buil=
d_p4080ds_release/work/
> > > >>
> > > >> ppce500mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')
> > > >>
> > > >> ERROR: Logfile of failure stored in:
> > > >>
> > > >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build=
_p4080ds_release/work/ppce500mc-
> > > >>
> > > >> linux/net-ssleay-1.36-r0/temp/log.do_compile.22680
> > > >>
> > > >> Log data follows:
> > > >>
> > > >> | NOTE: make -j 2 -e MAKEFLAGS=3D PASTHRU_INC=3D -fexpensive-optim=
izations
> > > >> -frename-registers -fomit-frame-pointer -O2 -g0 CCFLAGS=3D -fexpen=
sive
> > > >>
> > > >> -optimizations -frename-registers -fomit-frame-pointer -O2 -g0
> > > >> LD=3Dpowerpc-linux-gnu-gcc -mcpu=3De500mc -maix-struct-return
> > > >> --sysroot=3D/home/Simran/
> > > >>
> > > >>
> > > >> Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_rele=
ase/sysroots/ppce500mc-linux
> > > >>
> > > >> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc
> > > >>
> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.g=
it/build_p1023rds_release
> > > >>
> > > >> /sysroots/i686-linux/usr/lib/perl/5.10.1
> > > >>
> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.g=
it/build_p1023rds_release/sysroots/i686-linux/usr/lib
> > > >>
> > > >> /perl/5.10.1
> > > >>
> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.g=
it/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
> > > >>
> > > >>  /home/
> > > >>
> > > >>
> > > >> jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/bui=
ld_p1023rds_release/sysroots/i686-linux/usr/lib/perl
> > > >> .).
> > > >>
> > > >> | BEGIN failed--compilation aborted.
> > > >>
> > > >> | make: *** [blib/lib/Net/.exists] Error 2
> > > >>
> > > >> | make: *** Waiting for unfinished jobs....
> > > >>
> > > >> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc
> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.g=
it/
> > > >>
> > > >> build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
> > > >>
> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.g=
it/build_p1023rds_release
> > > >>
> > > >> /sysroots/i686-linux/usr/lib/perl/5.10.1
> > > >>
> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.g=
it/build_p1023rds_release/sysroots/i686-linux/usr
> > > >>
> > > >> /lib/perl/5.10.1
> > > >>
> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.g=
it/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl
> > > >>  .).
> > > >>
> > > >> | BEGIN failed--compilation aborted.
> > > >>
> > > >> | make: *** [blib/arch/.exists] Error 2
> > > >>
> > > >> | FATAL: oe_runmake failed
> > > >>
> > > >> | ERROR: Function do_compile failed
> > > >>
> > > >> NOTE: package net-ssleay-1.36-r0: task do_compile: Failed
> > > >>
> > > >> ERROR: TaskFailed event exception=2C aborting
> > > >>
> > > >>
> > > >>
> > > >>
> > > >>
> > > >> I used the libnet-ssleay-perl_1.36.bb=2C I found in the oe-commit =
archive.
> > > >>
> > > >> Please advice and thanks.
> > > >>
> > > >>
> > > >>
> > > >> Sim Gill 		 	   		   		 	   	=09
> > > >
> > > >
> > > >> _______________________________________________
> > > >> Openembedded-core mailing list
> > > >> Openembedded-core@lists.openembedded.org
> > > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-c=
ore
> > > >
> > > >
> > > > --
> > > > -Khem
> > > >
> > > >
> > > > _______________________________________________ Openembedded-core m=
ailing
> > > > list Openembedded-core@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re
> > > >
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re
> > > >
> > >=20
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >  		 	   		 =20
>=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> --=20
> -Khem
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
 		 	   		  =

--_4cecc173-63d7-48ae-a318-445826def467_
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
Hello=2C<div><br></div><div>I was able to successfully add the patch to the=
 core. Thanks to your instructions.&nbsp=3B</div><div>Even though a recipe =
was created=2C It is not being built with either perl or openssl.&nbsp=3B</=
div><div>Do I need to add a dependency somewhere for the libnet-ssleay reci=
pe to be recognized?</div><div>Thanks.</div><div><br></div><div><br><div><d=
iv id=3D"SkyDrivePlaceholder"></div>&gt=3B Date: Sat=2C 28 Jan 2012 12:11:4=
5 -0800<br>&gt=3B From: raj.khem@gmail.com<br>&gt=3B To: openembedded-core@=
lists.openembedded.org<br>&gt=3B Subject: Re: [OE-core] Net::SSLeay perl ex=
tension OpenSSL<br>&gt=3B <br>&gt=3B On (27/01/12 08:41)=2C simran singh wr=
ote:<br>&gt=3B &gt=3B <br>&gt=3B &gt=3B Hello Raj=2C<br>&gt=3B &gt=3B <br>&=
gt=3B &gt=3B I am using open embedded provided through a company instead of=
 downloading from the git repository. Is there a way <br>&gt=3B &gt=3B to a=
pply this patch manually without going through git?.<br>&gt=3B &gt=3B I tri=
ed 'bitbake patch filename' but that did not work.<br>&gt=3B <br>&gt=3B if =
you dont use git then just patch -p1 &lt=3B &lt=3Bpatchfilename&gt=3B from<=
br>&gt=3B openembedded-core directory should work.<br>&gt=3B <br>&gt=3B btw=
. learn about patch(man patch) it should really help you<br>&gt=3B <br>&gt=
=3B &gt=3B Thanks a bunch for your help.<br>&gt=3B &gt=3B <br>&gt=3B &gt=3B=
 Sim  <br>&gt=3B &gt=3B <br>&gt=3B &gt=3B &gt=3B From: raj.khem@gmail.com<b=
r>&gt=3B &gt=3B &gt=3B Date: Wed=2C 25 Jan 2012 17:49:48 -0800<br>&gt=3B &g=
t=3B &gt=3B To: openembedded-core@lists.openembedded.org<br>&gt=3B &gt=3B &=
gt=3B Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL<br>&gt=3B &=
gt=3B &gt=3B <br>&gt=3B &gt=3B &gt=3B On Wed=2C Jan 25=2C 2012 at 4:50 PM=
=2C simran singh &lt=3Bkyoonn@hotmail.com&gt=3B wrote:<br>&gt=3B &gt=3B &gt=
=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B Hello Raj=2C<br>&gt=3B &gt=3B &gt=
=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B Thanks for the reply.<br>&gt=3B &=
gt=3B &gt=3B &gt=3B I do not have the file named "libnet-ssleay-license". W=
here can I obtain<br>&gt=3B &gt=3B &gt=3B &gt=3B this?<br>&gt=3B &gt=3B &gt=
=3B &gt=3B If I try to build without that file=2C I get the same error abou=
t command.pm.<br>&gt=3B &gt=3B &gt=3B <br>&gt=3B &gt=3B &gt=3B Did you appl=
y the patch properly ?<br>&gt=3B &gt=3B &gt=3B <br>&gt=3B &gt=3B &gt=3B sav=
e the patch and cd into openembedded-core<br>&gt=3B &gt=3B &gt=3B and then =
git am &lt=3Bpatchfile&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=
=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B Date: Wed=2C 25 Jan 2012 1=
6:36:44 -0800<br>&gt=3B &gt=3B &gt=3B &gt=3B From: raj.khem@gmail.com<br>&g=
t=3B &gt=3B &gt=3B &gt=3B To: openembedded-core@lists.openembedded.org<br>&=
gt=3B &gt=3B &gt=3B &gt=3B Subject: Re: [OE-core] Net::SSLeay perl extensio=
n OpenSSL<br>&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B<br>=
&gt=3B &gt=3B &gt=3B &gt=3B On (25/01/12 14:50)=2C simran singh wrote:<br>&=
gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B Hello=
=2C<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B I am not sure if this is the right list.<br>&gt=3B &gt=3B &gt=3B &gt=3B=
&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B Trying to add Net::SSLeay perl =
module=2C I get the following error.<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<b=
r>&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B Please try att=
ached patch. I have not tested it<br>&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B =
&gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B=
 &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B =
&gt=3B&gt=3B  NOTE: Running task 204 of 315 (ID: 11=2C<br>&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/Simran/Freescal=
e/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/<br=
>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B net=
-ssleay/net-ssleay_1.36.bb=2C do_compile)<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B ERROR: TaskFailed event exception=
=2C aborting<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &=
gt=3B&gt=3B ERROR: Build of<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B =
&gt=3B &gt=3B &gt=3B&gt=3B /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-s=
ystembuilder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb<=
br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B  =
do_compile failed<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B ERROR: Task 11<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B (/home/Simran/Freescale/QorIQ-DPAA-SDK-20111=
026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.3=
6.bb=2C<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B=
&gt=3B  do_compile) failed with 256<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br=
>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B ERROR:<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B '/home/Simran/Freescale/QorIQ-DPAA=
-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-=
ssleay_1.36.bb'<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B  failed<br>&gt=3B &gt=
=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B NOTE: package =
net-ssleay-1.36-r0: task do_compile: Started<br>&gt=3B &gt=3B &gt=3B &gt=3B=
&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B ERROR: Function do_compile fail=
ed<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B NOTE: Task failed: ('function do_compile failed'=2C<br>&gt=3B &gt=3B &g=
t=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B '/home/Simran/Freesc=
ale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/work/<br>&g=
t=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B ppce50=
0mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')<br>&gt=3B &gt=3B &=
gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B ERROR: Logfile of f=
ailure stored in:<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuild=
er/build_p4080ds_release/work/ppce500mc-<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B linux/net-ssleay-1.36-r0/temp/log.=
do_compile.22680<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B Log data follows:<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>=
&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B | NOTE: make -j 2 -e MAKEFLAGS=3D PASTHRU=
_INC=3D -fexpensive-optimizations<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B -fre=
name-registers -fomit-frame-pointer -O2 -g0 CCFLAGS=3D -fexpensive<br>&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B -optimi=
zations -frename-registers -fomit-frame-pointer -O2 -g0<br>&gt=3B &gt=3B &g=
t=3B &gt=3B&gt=3B LD=3Dpowerpc-linux-gnu-gcc -mcpu=3De500mc -maix-struct-re=
turn<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B --sysroot=3D/home/Simran/<br>&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B Freescale/QorIQ-DPAA-SDK-20111026-systembuil=
der/build_p4080ds_release/sysroots/ppce500mc-linux<br>&gt=3B &gt=3B &gt=3B =
&gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B | Can't locate ExtUtils/C=
ommand.pm in @INC (@INC contains: inc<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<=
br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-=
iso-step1/workspace/sb-dev.git/build_p1023rds_release<br>&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /sysroots/i686-linux/=
usr/lib/perl/5.10.1<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &=
gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspac=
e/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib<br>&gt=3B &=
gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /perl/5.10.1=
<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B =
/home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_=
p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1<br>&gt=3B &gt=3B &=
gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B  /home/<br>&gt=3B &=
gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &g=
t=3B &gt=3B &gt=3B&gt=3B jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspac=
e/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl<br>&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B .).<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>=
&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B | BEGIN failed--compilation aborted.<br>&=
gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B | mak=
e: *** [blib/lib/Net/.exists] Error 2<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<=
br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B | make: *** Waiting for unfinished job=
s....<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&g=
t=3B | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc<br>&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-st=
ep1/workspace/sb-dev.git/<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &g=
t=3B &gt=3B &gt=3B&gt=3B build_p1023rds_release/sysroots/i686-linux/usr/lib=
/perl/5.10.1<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &=
gt=3B&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-de=
v.git/build_p1023rds_release<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B=
 &gt=3B &gt=3B &gt=3B&gt=3B /sysroots/i686-linux/usr/lib/perl/5.10.1<br>&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/j=
enkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rd=
s_release/sysroots/i686-linux/usr<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&=
gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /lib/perl/5.10.1<br>&gt=3B &gt=3B &gt=3B &=
gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/jobs=
/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/=
i686-linux/usr/lib/perl<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B  .).<br>&gt=3B=
 &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B | BEGIN fa=
iled--compilation aborted.<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &=
gt=3B &gt=3B &gt=3B&gt=3B | make: *** [blib/arch/.exists] Error 2<br>&gt=3B=
 &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B | FATAL: o=
e_runmake failed<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B | ERROR: Function do_compile failed<br>&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B NOTE: package net-ssl=
eay-1.36-r0: task do_compile: Failed<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<b=
r>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B ERROR: TaskFailed event exception=2C ab=
orting<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&=
gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&g=
t=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B I used the libnet-ssleay-perl_1.36.bb=2C I found in the oe-commit archi=
ve.<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B Please advice and thanks.<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B Sim Gill 		 	   		   		 	   		<br>&gt=3B &gt=
=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B &g=
t=3B&gt=3B _______________________________________________<br>&gt=3B &gt=3B=
 &gt=3B &gt=3B&gt=3B Openembedded-core mailing list<br>&gt=3B &gt=3B &gt=3B=
 &gt=3B&gt=3B Openembedded-core@lists.openembedded.org<br>&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openem=
bedded-core<br>&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B<b=
r>&gt=3B &gt=3B &gt=3B &gt=3B --<br>&gt=3B &gt=3B &gt=3B &gt=3B -Khem<br>&g=
t=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B &=
gt=3B &gt=3B _______________________________________________ Openembedded-c=
ore mailing<br>&gt=3B &gt=3B &gt=3B &gt=3B list Openembedded-core@lists.ope=
nembedded.org<br>&gt=3B &gt=3B &gt=3B &gt=3B http://lists.linuxtogo.org/cgi=
-bin/mailman/listinfo/openembedded-core<br>&gt=3B &gt=3B &gt=3B &gt=3B<br>&=
gt=3B &gt=3B &gt=3B &gt=3B _______________________________________________<=
br>&gt=3B &gt=3B &gt=3B &gt=3B Openembedded-core mailing list<br>&gt=3B &gt=
=3B &gt=3B &gt=3B Openembedded-core@lists.openembedded.org<br>&gt=3B &gt=3B=
 &gt=3B &gt=3B http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembe=
dded-core<br>&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B &gt=3B <br>&gt=3B=
 &gt=3B &gt=3B _______________________________________________<br>&gt=3B &g=
t=3B &gt=3B Openembedded-core mailing list<br>&gt=3B &gt=3B &gt=3B Openembe=
dded-core@lists.openembedded.org<br>&gt=3B &gt=3B &gt=3B http://lists.linux=
togo.org/cgi-bin/mailman/listinfo/openembedded-core<br>&gt=3B &gt=3B  		 	 =
  		  <br>&gt=3B <br>&gt=3B &gt=3B ________________________________________=
_______<br>&gt=3B &gt=3B Openembedded-core mailing list<br>&gt=3B &gt=3B Op=
enembedded-core@lists.openembedded.org<br>&gt=3B &gt=3B http://lists.linuxt=
ogo.org/cgi-bin/mailman/listinfo/openembedded-core<br>&gt=3B <br>&gt=3B <br=
>&gt=3B -- <br>&gt=3B -Khem<br>&gt=3B <br>&gt=3B __________________________=
_____________________<br>&gt=3B Openembedded-core mailing list<br>&gt=3B Op=
enembedded-core@lists.openembedded.org<br>&gt=3B http://lists.linuxtogo.org=
/cgi-bin/mailman/listinfo/openembedded-core<br></div></div> 		 	   		  </di=
v></body>
</html>=

--_4cecc173-63d7-48ae-a318-445826def467_--
