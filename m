Received: from col0-omc3-s2.col0.hotmail.com ([65.55.34.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1RrzC0-00061D-LX
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 22:55:19 +0100
Received: from COL120-W22 ([65.55.34.136]) by col0-omc3-s2.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 30 Jan 2012 13:30:55 -0800
Message-ID: <COL120-W2242EEE7B2D3ED864B5FBDDD8D0@phx.gbl>
X-Originating-IP: [70.137.155.165]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jan 2012 13:30:54 -0800
Importance: Normal
In-Reply-To: <CAMKF1spe1G7Um=XEe44936tn4GEHiAeheSx7LE-mbS9fukLo-Q@mail.gmail.com>
References: <COL120-W51BE77DBA9D330FF475952DD880@phx.gbl>,
	<20120126003644.GA4973@sakrah.homelinux.org>,
	<COL120-W40F98EF50F803A1509B3AFDD890@phx.gbl>,
	<CAMKF1sotwjeYEqRot=aOiVMq4iGvOXfWcOocqFAXTFH=OTnozw@mail.gmail.com>,
	<COL120-W5491D70C591B2839B06CF3DD8E0@phx.gbl>,
	<20120128201145.GB22106@sakrah.homelinux.org>,
	<COL120-W1F0FB4D7EDB043B22BB17DD8D0@phx.gbl>,
	<CAMKF1spe1G7Um=XEe44936tn4GEHiAeheSx7LE-mbS9fukLo-Q@mail.gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 30 Jan 2012 21:30:55.0098 (UTC)
	FILETIME=[72CC45A0:01CCDF96]
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
X-List-Received-Date: Mon, 30 Jan 2012 21:55:19 -0000
Content-Type: multipart/alternative;
	boundary="_63d80cdb-fe32-45ac-8479-fe251b04da15_"

--_63d80cdb-fe32-45ac-8479-fe251b04da15_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello Raj=2C
I am getting the exact same error as before. Any ideas. I did
IMAGE_INSTALL_append_pn-devel-image =3D "libnet-ssleay-perl"=20

#bitbake devel-image
Gets stuck at the same Cant' locate ExtUtils.
Thanks for your help so far.



> From: raj.khem@gmail.com
> Date: Mon=2C 30 Jan 2012 12:30:27 -0800
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
>=20
> On Mon=2C Jan 30=2C 2012 at 12:22 PM=2C simran singh <kyoonn@hotmail.com>=
 wrote:
> > Hello=2C
> >
> > I was able to successfully add the patch to the core. Thanks to your
> > instructions.
> > Even though a recipe was created=2C It is not being built with either p=
erl or
> > openssl.
> > Do I need to add a dependency somewhere for the libnet-ssleay recipe to=
 be
> > recognized?
>=20
> it needs to get to the image either via some RDEPENDS or IMAGE_INSTALL
> variable. You can try to add it through
> your local.conf by adding
>=20
>=20
> IMAGE_INSTALL_append_pn-<your_image_name_here> =3D " libnet-ssleay"
>=20
>=20
> > Thanks.
> >
> >
> >> Date: Sat=2C 28 Jan 2012 12:11:45 -0800
> >
> >> From: raj.khem@gmail.com
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
> >>
> >> On (27/01/12 08:41)=2C simran singh wrote:
> >> >
> >> > Hello Raj=2C
> >> >
> >> > I am using open embedded provided through a company instead of
> >> > downloading from the git repository. Is there a way
> >> > to apply this patch manually without going through git?.
> >> > I tried 'bitbake patch filename' but that did not work.
> >>
> >> if you dont use git then just patch -p1 < <patchfilename> from
> >> openembedded-core directory should work.
> >>
> >> btw. learn about patch(man patch) it should really help you
> >>
> >> > Thanks a bunch for your help.
> >> >
> >> > Sim
> >> >
> >> > > From: raj.khem@gmail.com
> >> > > Date: Wed=2C 25 Jan 2012 17:49:48 -0800
> >> > > To: openembedded-core@lists.openembedded.org
> >> > > Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
> >> > >
> >> > > On Wed=2C Jan 25=2C 2012 at 4:50 PM=2C simran singh <kyoonn@hotmai=
l.com>
> >> > > wrote:
> >> > > >
> >> > > > Hello Raj=2C
> >> > > >
> >> > > > Thanks for the reply.
> >> > > > I do not have the file named "libnet-ssleay-license". Where can =
I
> >> > > > obtain
> >> > > > this?
> >> > > > If I try to build without that file=2C I get the same error abou=
t
> >> > > > command.pm.
> >> > >
> >> > > Did you apply the patch properly ?
> >> > >
> >> > > save the patch and cd into openembedded-core
> >> > > and then git am <patchfile>
> >> > > >
> >> > > >
> >> > > > Date: Wed=2C 25 Jan 2012 16:36:44 -0800
> >> > > > From: raj.khem@gmail.com
> >> > > > To: openembedded-core@lists.openembedded.org
> >> > > > Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL
> >> > > >
> >> > > >
> >> > > > On (25/01/12 14:50)=2C simran singh wrote:
> >> > > >>
> >> > > >> Hello=2C
> >> > > >>
> >> > > >> I am not sure if this is the right list.
> >> > > >>
> >> > > >> Trying to add Net::SSLeay perl module=2C I get the following er=
ror.
> >> > > >>
> >> > > >
> >> > > > Please try attached patch. I have not tested it
> >> > > >
> >> > > >
> >> > > >
> >> > > >>
> >> > > >>
> >> > > >> NOTE: Running task 204 of 315 (ID: 11=2C
> >> > > >>
> >> > > >>
> >> > > >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/en=
gage-blackcore-common/recipes/
> >> > > >>
> >> > > >> net-ssleay/net-ssleay_1.36.bb=2C do_compile)
> >> > > >>
> >> > > >> ERROR: TaskFailed event exception=2C aborting
> >> > > >>
> >> > > >> ERROR: Build of
> >> > > >>
> >> > > >>
> >> > > >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/en=
gage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb
> >> > > >>
> >> > > >> do_compile failed
> >> > > >>
> >> > > >> ERROR: Task 11
> >> > > >>
> >> > > >>
> >> > > >> (/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/e=
ngage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb=2C
> >> > > >>
> >> > > >> do_compile) failed with 256
> >> > > >>
> >> > > >> ERROR:
> >> > > >>
> >> > > >>
> >> > > >> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/e=
ngage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb'
> >> > > >> failed
> >> > > >>
> >> > > >> NOTE: package net-ssleay-1.36-r0: task do_compile: Started
> >> > > >>
> >> > > >> ERROR: Function do_compile failed
> >> > > >>
> >> > > >> NOTE: Task failed: ('function do_compile failed'=2C
> >> > > >>
> >> > > >>
> >> > > >> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/b=
uild_p4080ds_release/work/
> >> > > >>
> >> > > >> ppce500mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')
> >> > > >>
> >> > > >> ERROR: Logfile of failure stored in:
> >> > > >>
> >> > > >>
> >> > > >> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/bu=
ild_p4080ds_release/work/ppce500mc-
> >> > > >>
> >> > > >> linux/net-ssleay-1.36-r0/temp/log.do_compile.22680
> >> > > >>
> >> > > >> Log data follows:
> >> > > >>
> >> > > >> | NOTE: make -j 2 -e MAKEFLAGS=3D PASTHRU_INC=3D
> >> > > >> -fexpensive-optimizations
> >> > > >> -frename-registers -fomit-frame-pointer -O2 -g0 CCFLAGS=3D
> >> > > >> -fexpensive
> >> > > >>
> >> > > >> -optimizations -frename-registers -fomit-frame-pointer -O2 -g0
> >> > > >> LD=3Dpowerpc-linux-gnu-gcc -mcpu=3De500mc -maix-struct-return
> >> > > >> --sysroot=3D/home/Simran/
> >> > > >>
> >> > > >>
> >> > > >>
> >> > > >> Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_r=
elease/sysroots/ppce500mc-linux
> >> > > >>
> >> > > >> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc
> >> > > >>
> >> > > >>
> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-de=
v.git/build_p1023rds_release
> >> > > >>
> >> > > >> /sysroots/i686-linux/usr/lib/perl/5.10.1
> >> > > >>
> >> > > >>
> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-de=
v.git/build_p1023rds_release/sysroots/i686-linux/usr/lib
> >> > > >>
> >> > > >> /perl/5.10.1
> >> > > >>
> >> > > >>
> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-de=
v.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
> >> > > >>
> >> > > >> /home/
> >> > > >>
> >> > > >>
> >> > > >>
> >> > > >> jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/=
build_p1023rds_release/sysroots/i686-linux/usr/lib/perl
> >> > > >> .).
> >> > > >>
> >> > > >> | BEGIN failed--compilation aborted.
> >> > > >>
> >> > > >> | make: *** [blib/lib/Net/.exists] Error 2
> >> > > >>
> >> > > >> | make: *** Waiting for unfinished jobs....
> >> > > >>
> >> > > >> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc
> >> > > >>
> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-de=
v.git/
> >> > > >>
> >> > > >> build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
> >> > > >>
> >> > > >>
> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-de=
v.git/build_p1023rds_release
> >> > > >>
> >> > > >> /sysroots/i686-linux/usr/lib/perl/5.10.1
> >> > > >>
> >> > > >>
> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-de=
v.git/build_p1023rds_release/sysroots/i686-linux/usr
> >> > > >>
> >> > > >> /lib/perl/5.10.1
> >> > > >>
> >> > > >>
> >> > > >> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-de=
v.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl
> >> > > >> .).
> >> > > >>
> >> > > >> | BEGIN failed--compilation aborted.
> >> > > >>
> >> > > >> | make: *** [blib/arch/.exists] Error 2
> >> > > >>
> >> > > >> | FATAL: oe_runmake failed
> >> > > >>
> >> > > >> | ERROR: Function do_compile failed
> >> > > >>
> >> > > >> NOTE: package net-ssleay-1.36-r0: task do_compile: Failed
> >> > > >>
> >> > > >> ERROR: TaskFailed event exception=2C aborting
> >> > > >>
> >> > > >>
> >> > > >>
> >> > > >>
> >> > > >>
> >> > > >> I used the libnet-ssleay-perl_1.36.bb=2C I found in the oe-comm=
it
> >> > > >> archive.
> >> > > >>
> >> > > >> Please advice and thanks.
> >> > > >>
> >> > > >>
> >> > > >>
> >> > > >> Sim Gill
> >> > > >
> >> > > >
> >> > > >> _______________________________________________
> >> > > >> Openembedded-core mailing list
> >> > > >> Openembedded-core@lists.openembedded.org
> >> > > >>
> >> > > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core
> >> > > >
> >> > > >
> >> > > > --
> >> > > > -Khem
> >> > > >
> >> > > >
> >> > > > _______________________________________________ Openembedded-cor=
e
> >> > > > mailing
> >> > > > list Openembedded-core@lists.openembedded.org
> >> > > >
> >> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core
> >> > > >
> >> > > > _______________________________________________
> >> > > > Openembedded-core mailing list
> >> > > > Openembedded-core@lists.openembedded.org
> >> > > >
> >> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core
> >> > > >
> >> > >
> >> > > _______________________________________________
> >> > > Openembedded-core mailing list
> >> > > Openembedded-core@lists.openembedded.org
> >> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-c=
ore
> >> >
> >>
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-cor=
e
> >>
> >>
> >> --
> >> -Khem
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
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

--_63d80cdb-fe32-45ac-8479-fe251b04da15_
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
Hello Raj=2C<div><br></div><div>I am getting the exact same error as before=
. Any ideas. I did</div><div><br></div><div>IMAGE_INSTALL_append_pn-devel-i=
mage =3D "libnet-ssleay-perl"&nbsp=3B<br><br>#bitbake devel-image</div><div=
><br></div><div>Gets stuck at the same Cant' locate ExtUtils.</div><div><br=
></div><div>Thanks for your help so far.</div><div><br></div><div><br><br><=
br><div><div id=3D"SkyDrivePlaceholder"></div>&gt=3B From: raj.khem@gmail.c=
om<br>&gt=3B Date: Mon=2C 30 Jan 2012 12:30:27 -0800<br>&gt=3B To: openembe=
dded-core@lists.openembedded.org<br>&gt=3B Subject: Re: [OE-core] Net::SSLe=
ay perl extension OpenSSL<br>&gt=3B <br>&gt=3B On Mon=2C Jan 30=2C 2012 at =
12:22 PM=2C simran singh &lt=3Bkyoonn@hotmail.com&gt=3B wrote:<br>&gt=3B &g=
t=3B Hello=2C<br>&gt=3B &gt=3B<br>&gt=3B &gt=3B I was able to successfully =
add the patch to the core. Thanks to your<br>&gt=3B &gt=3B instructions.<br=
>&gt=3B &gt=3B Even though a recipe was created=2C It is not being built wi=
th either perl or<br>&gt=3B &gt=3B openssl.<br>&gt=3B &gt=3B Do I need to a=
dd a dependency somewhere for the libnet-ssleay recipe to be<br>&gt=3B &gt=
=3B recognized?<br>&gt=3B <br>&gt=3B it needs to get to the image either vi=
a some RDEPENDS or IMAGE_INSTALL<br>&gt=3B variable. You can try to add it =
through<br>&gt=3B your local.conf by adding<br>&gt=3B <br>&gt=3B <br>&gt=3B=
 IMAGE_INSTALL_append_pn-&lt=3Byour_image_name_here&gt=3B =3D " libnet-ssle=
ay"<br>&gt=3B <br>&gt=3B <br>&gt=3B &gt=3B Thanks.<br>&gt=3B &gt=3B<br>&gt=
=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B Date: Sat=2C 28 Jan 2012 12:11:45 -0800<b=
r>&gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B From: raj.khem@gmail.com<br>&gt=3B &=
gt=3B&gt=3B To: openembedded-core@lists.openembedded.org<br>&gt=3B &gt=3B&g=
t=3B Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL<br>&gt=3B &g=
t=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B On (27/01/12 08:41)=2C simran singh wrote=
:<br>&gt=3B &gt=3B&gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B Hello Raj=2C<=
br>&gt=3B &gt=3B&gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B I am using open=
 embedded provided through a company instead of<br>&gt=3B &gt=3B&gt=3B &gt=
=3B downloading from the git repository. Is there a way<br>&gt=3B &gt=3B&gt=
=3B &gt=3B to apply this patch manually without going through git?.<br>&gt=
=3B &gt=3B&gt=3B &gt=3B I tried 'bitbake patch filename' but that did not w=
ork.<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B if you dont use git then=
 just patch -p1 &lt=3B &lt=3Bpatchfilename&gt=3B from<br>&gt=3B &gt=3B&gt=
=3B openembedded-core directory should work.<br>&gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B&gt=3B btw. learn about patch(man patch) it should really help yo=
u<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B Thanks a bunch for y=
our help.<br>&gt=3B &gt=3B&gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B Sim<b=
r>&gt=3B &gt=3B&gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B From: raj=
.khem@gmail.com<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B Date: Wed=2C 25 Jan 20=
12 17:49:48 -0800<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B To: openembedded-cor=
e@lists.openembedded.org<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B Subject: Re: =
[OE-core] Net::SSLeay perl extension OpenSSL<br>&gt=3B &gt=3B&gt=3B &gt=3B =
&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B On Wed=2C Jan 25=2C 2012 at 4:5=
0 PM=2C simran singh &lt=3Bkyoonn@hotmail.com&gt=3B<br>&gt=3B &gt=3B&gt=3B =
&gt=3B &gt=3B wrote:<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B =
&gt=3B&gt=3B &gt=3B &gt=3B &gt=3B Hello Raj=2C<br>&gt=3B &gt=3B&gt=3B &gt=
=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B Thanks for th=
e reply.<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B I do not have the file=
 named "libnet-ssleay-license". Where can I<br>&gt=3B &gt=3B&gt=3B &gt=3B &=
gt=3B &gt=3B obtain<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B this?<br>&g=
t=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B If I try to build without that file=
=2C I get the same error about<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B =
command.pm.<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=
=3B &gt=3B Did you apply the patch properly ?<br>&gt=3B &gt=3B&gt=3B &gt=3B=
 &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B save the patch and cd into ope=
nembedded-core<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B and then git am &lt=3Bp=
atchfile&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B=
&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B Dat=
e: Wed=2C 25 Jan 2012 16:36:44 -0800<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &=
gt=3B From: raj.khem@gmail.com<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B =
To: openembedded-core@lists.openembedded.org<br>&gt=3B &gt=3B&gt=3B &gt=3B =
&gt=3B &gt=3B Subject: Re: [OE-core] Net::SSLeay perl extension OpenSSL<br>=
&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=
=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B On (25/01/12 14:50)=
=2C simran singh wrote:<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<b=
r>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B Hello=2C<br>&gt=3B &gt=3B&=
gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=
=3B&gt=3B I am not sure if this is the right list.<br>&gt=3B &gt=3B&gt=3B &=
gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B=
 Trying to add Net::SSLeay perl module=2C I get the following error.<br>&gt=
=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &=
gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B Please try attache=
d patch. I have not tested it<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B<b=
r>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &g=
t=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &=
gt=3B&gt=3B NOTE: Running task 204 of 315 (ID: 11=2C<br>&gt=3B &gt=3B&gt=3B=
 &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/Simran/Freescal=
e/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/<br=
>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=
=3B &gt=3B &gt=3B&gt=3B net-ssleay/net-ssleay_1.36.bb=2C do_compile)<br>&gt=
=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &=
gt=3B &gt=3B&gt=3B ERROR: TaskFailed event exception=2C aborting<br>&gt=3B =
&gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B ERROR: Build of<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=
=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/Simran/Freescale/QorIQ-DPAA-SDK-=
20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-sslea=
y_1.36.bb<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B do_compile failed<br>&gt=3B &gt=3B&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&=
gt=3B ERROR: Task 11<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&=
gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B=
 &gt=3B &gt=3B&gt=3B (/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-system=
builder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb=2C<br=
>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=
=3B &gt=3B &gt=3B&gt=3B do_compile) failed with 256<br>&gt=3B &gt=3B&gt=3B =
&gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B ERROR:<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &=
gt=3B&gt=3B '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/e=
ngage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb'<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B failed<br>&gt=3B &gt=3B&gt=3B &gt=3B &=
gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B NOTE: =
package net-ssleay-1.36-r0: task do_compile: Started<br>&gt=3B &gt=3B&gt=3B=
 &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B ERROR: Function do_compile failed<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B =
&gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B NOTE: Task f=
ailed: ('function do_compile failed'=2C<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B '/home/Simran/Freescale/QorIQ-D=
PAA-SDK-20111026-systembuilder/build_p4080ds_release/work/<br>&gt=3B &gt=3B=
&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=
=3B&gt=3B ppce500mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')<br=
>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=
=3B &gt=3B &gt=3B&gt=3B ERROR: Logfile of failure stored in:<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &=
gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/Simran/=
Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/work/=
ppce500mc-<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B linux/net-ssleay-1.36-r0/temp/log.do_c=
ompile.22680<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &g=
t=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B Log data follows:<br>&gt=3B &gt=3B&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&=
gt=3B | NOTE: make -j 2 -e MAKEFLAGS=3D PASTHRU_INC=3D<br>&gt=3B &gt=3B&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B -fexpensive-optimizations<br>&gt=3B &gt=3B&g=
t=3B &gt=3B &gt=3B &gt=3B&gt=3B -frename-registers -fomit-frame-pointer -O2=
 -g0 CCFLAGS=3D<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B -fexpensi=
ve<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B=
 &gt=3B &gt=3B &gt=3B&gt=3B -optimizations -frename-registers -fomit-frame-=
pointer -O2 -g0<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B LD=3Dpowe=
rpc-linux-gnu-gcc -mcpu=3De500mc -maix-struct-return<br>&gt=3B &gt=3B&gt=3B=
 &gt=3B &gt=3B &gt=3B&gt=3B --sysroot=3D/home/Simran/<br>&gt=3B &gt=3B&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&=
gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B Freescale/QorIQ-DPAA-SDK-20111026-systembuil=
der/build_p4080ds_release/sysroots/ppce500mc-linux<br>&gt=3B &gt=3B&gt=3B &=
gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B=
 | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc<br>&gt=3B &=
gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B=
 &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/jenki=
ns/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_re=
lease<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=
=3B &gt=3B &gt=3B &gt=3B&gt=3B /sysroots/i686-linux/usr/lib/perl/5.10.1<br>=
&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=
=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /=
home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p=
1023rds_release/sysroots/i686-linux/usr/lib<br>&gt=3B &gt=3B&gt=3B &gt=3B &=
gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /perl/=
5.10.1<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&g=
t=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B=
&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git=
/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1<br>&gt=3B &=
gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B=
 &gt=3B&gt=3B /home/<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&=
gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B=
 &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B jenk=
ins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_r=
elease/sysroots/i686-linux/usr/lib/perl<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B .).<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&=
gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B | BEGIN failed--compilation a=
borted.<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&=
gt=3B &gt=3B &gt=3B &gt=3B&gt=3B | make: *** [blib/lib/Net/.exists] Error 2=
<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &=
gt=3B &gt=3B &gt=3B&gt=3B | make: *** Waiting for unfinished jobs....<br>&g=
t=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B =
&gt=3B &gt=3B&gt=3B | Can't locate ExtUtils/Command.pm in @INC (@INC contai=
ns: inc<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&=
gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-=
step1/workspace/sb-dev.git/<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B build_p1023rds_releas=
e/sysroots/i686-linux/usr/lib/perl/5.10.1<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=
=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/jenkins/jenkins/jobs/qori=
q-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &=
gt=3B&gt=3B /sysroots/i686-linux/usr/lib/perl/5.10.1<br>&gt=3B &gt=3B&gt=3B=
 &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/jenkins/jenkins=
/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysr=
oots/i686-linux/usr<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&g=
t=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /lib/perl/5.10.1<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &=
gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B /home/jenkins=
/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_rele=
ase/sysroots/i686-linux/usr/lib/perl<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &=
gt=3B&gt=3B .).<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B=
 &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B | BEGIN failed--compilation aborte=
d.<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B=
 &gt=3B &gt=3B &gt=3B&gt=3B | make: *** [blib/arch/.exists] Error 2<br>&gt=
=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &=
gt=3B &gt=3B&gt=3B | FATAL: oe_runmake failed<br>&gt=3B &gt=3B&gt=3B &gt=3B=
 &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B | ER=
ROR: Function do_compile failed<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B=
&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B NOTE: package net-=
ssleay-1.36-r0: task do_compile: Failed<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=
=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B ERROR: T=
askFailed event exception=2C aborting<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B =
&gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &g=
t=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B =
&gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &g=
t=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B I used the libnet-ssleay-perl_1.36.bb=
=2C I found in the oe-commit<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=
=3B archive.<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &g=
t=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B Please advice and thanks.<br>&gt=3B &=
gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B=
 &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B<br>&gt=3B &=
gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B Sim Gill<br>&gt=3B &gt=3B&gt=3B &gt=
=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B ______________________________________=
_________<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B Openembedded-co=
re mailing list<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B Openembed=
ded-core@lists.openembedded.org<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B=
&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B&gt=3B http://lists.linux=
togo.org/cgi-bin/mailman/listinfo/openembedded-core<br>&gt=3B &gt=3B&gt=3B =
&gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B =
&gt=3B&gt=3B &gt=3B &gt=3B &gt=3B --<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &=
gt=3B -Khem<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=
=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B ______=
_________________________________________ Openembedded-core<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B mailing<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B=
 &gt=3B list Openembedded-core@lists.openembedded.org<br>&gt=3B &gt=3B&gt=
=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B http:/=
/lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core<br>&gt=3B &=
gt=3B&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=
=3B _______________________________________________<br>&gt=3B &gt=3B&gt=3B =
&gt=3B &gt=3B &gt=3B Openembedded-core mailing list<br>&gt=3B &gt=3B&gt=3B =
&gt=3B &gt=3B &gt=3B Openembedded-core@lists.openembedded.org<br>&gt=3B &gt=
=3B&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core<br>&g=
t=3B &gt=3B&gt=3B &gt=3B &gt=3B &gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B=
<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B _____________________________________=
__________<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B Openembedded-core mailing l=
ist<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B Openembedded-core@lists.openembedd=
ed.org<br>&gt=3B &gt=3B&gt=3B &gt=3B &gt=3B http://lists.linuxtogo.org/cgi-=
bin/mailman/listinfo/openembedded-core<br>&gt=3B &gt=3B&gt=3B &gt=3B<br>&gt=
=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B &gt=3B ____________________________=
___________________<br>&gt=3B &gt=3B&gt=3B &gt=3B Openembedded-core mailing=
 list<br>&gt=3B &gt=3B&gt=3B &gt=3B Openembedded-core@lists.openembedded.or=
g<br>&gt=3B &gt=3B&gt=3B &gt=3B http://lists.linuxtogo.org/cgi-bin/mailman/=
listinfo/openembedded-core<br>&gt=3B &gt=3B&gt=3B<br>&gt=3B &gt=3B&gt=3B<br=
>&gt=3B &gt=3B&gt=3B --<br>&gt=3B &gt=3B&gt=3B -Khem<br>&gt=3B &gt=3B&gt=3B=
<br>&gt=3B &gt=3B&gt=3B _______________________________________________<br>=
&gt=3B &gt=3B&gt=3B Openembedded-core mailing list<br>&gt=3B &gt=3B&gt=3B O=
penembedded-core@lists.openembedded.org<br>&gt=3B &gt=3B&gt=3B http://lists=
.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core<br>&gt=3B &gt=3B<=
br>&gt=3B &gt=3B _______________________________________________<br>&gt=3B =
&gt=3B Openembedded-core mailing list<br>&gt=3B &gt=3B Openembedded-core@li=
sts.openembedded.org<br>&gt=3B &gt=3B http://lists.linuxtogo.org/cgi-bin/ma=
ilman/listinfo/openembedded-core<br>&gt=3B &gt=3B<br>&gt=3B <br>&gt=3B ____=
___________________________________________<br>&gt=3B Openembedded-core mai=
ling list<br>&gt=3B Openembedded-core@lists.openembedded.org<br>&gt=3B http=
://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core<br></div>=
</div> 		 	   		  </div></body>
</html>=

--_63d80cdb-fe32-45ac-8479-fe251b04da15_--
