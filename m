Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.519.1589325768399567757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 16:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04CNMfwW009157
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 12 May 2020 16:22:41 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 12 May
 2020 16:22:40 -0700
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Rahul Kumar <rahulk@mvista.com>,
        OE-core
	<openembedded-core@lists.openembedded.org>,
        Trevor Gamblin
	<trevor.gamblin@windriver.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
        Trevor Gamblin
	<trevor.gamblin@windriver.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
 <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
 <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
 <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com>
 <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com>
 <160C6C52084AA802.10857@lists.openembedded.org>
 <CANv91vOtL1SwZAUWkWyCLF7TY5bXdKdb_-TQOMPgvPpWcJwtiA@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <f97a12c8-3323-99ca-0f6a-dd2d020c217f@windriver.com>
Date: Tue, 12 May 2020 19:22:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANv91vOtL1SwZAUWkWyCLF7TY5bXdKdb_-TQOMPgvPpWcJwtiA@mail.gmail.com>
X-Originating-IP: [172.25.44.3]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 04CNMfwW009157
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2020-05-12 12:58 a.m., Rahul Kumar wrote:
> Hi,
>=20
> Can any one please help me to figure out how to deal with the GPLv3+ iss=
ue.
>=20
> you can see my Patch at below link
> https://patchwork.openembedded.org/patch/172134/
>=20
> *Issue:*
> the new license (GPLv3) causes problems:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1814
> *
> *

Hi Rahul,

I'm having some email problems with the oe-core list so apologies
if this is redundant.

What happens if you split the license info into two parts like:

$ grep "^LICENSE" recipes-extended/libvirt/libvirt_6.1.0.bb
LICENSE =3D "LGPLv2.1+ & GPLv2+"
LICENSE_${PN}-ptest =3D "GPLv2+ & LGPLv2.1+"
except of course with GPLv3.

I might try that tomorrow on our local instance of the YP autobuilder.
If you'd like to set one up @ mvista, I hear from Trevor that it doesn't
take all that much time. As others have explained, you can also dig
through the yocto-autobuilder2/yocto-autobuilder-helper git repos.

../Randy

> Thanks & Regards,
> Rahul Kumar
> Software Engineer,Linux Solutions Engineering
> Group,Montavista Software LLC
> Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> <https://plus.google.com/+CodeTwoSoftware>
>=20
>=20
> On Wed, May 6, 2020 at 4:47 PM Rahul Kumar via lists.openembedded.org=20
> <http://lists.openembedded.org>=20
> <rahulk=3Dmvista.com@lists.openembedded.org=20
> <mailto:mvista.com@lists.openembedded.org>> wrote:
>=20
>     Hi Randy,
>=20
>     As per your suggestion I did some progress.
>=20
>     Issue 1:
>     =3D=3D=3D=3D=3D=3D=3D=3D
>=20
>     Configuration for this issue:
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>      =C2=A0 MACHINE =3D "edgerouter"
>      =C2=A0 DISTRO =3D "poky"
>      =C2=A0 SDKMACHINE =3D "i686"
>      =C2=A0 PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
>      =C2=A0 INHERIT +=3D 'image-buildinfo'
>      =C2=A0 IMAGE_BUILDINFO_VARS_append =3D ' IMAGE_BASENAME IMAGE_NAME'
>      =C2=A0 QEMU_USE_KVM =3D 'True'
>      =C2=A0 INHERIT +=3D 'report-error'
>      =C2=A0 PREMIRRORS =3D ''
>      =C2=A0 BB_GENERATE_MIRROR_TARBALLS =3D '1'
>      =C2=A0 BB_NUMBER_THREADS =3D '16'
>      =C2=A0 PARALLEL_MAKE =3D '-j 16'
>      =C2=A0 BB_TASK_NICE_LEVEL =3D '5'
>      =C2=A0 BB_TASK_NICE_LEVEL_task-testimage =3D '0'
>      =C2=A0 BB_TASK_IONICE_LEVEL =3D '2.7'
>      =C2=A0 BB_TASK_IONICE_LEVEL_task-testimage =3D '2.1'
>      =C2=A0 INHERIT +=3D 'testimage'
>      =C2=A0 TEST_QEMUBOOT_TIMEOUT =3D '1500'
>      =C2=A0 SANITY_TESTED_DISTROS =3D ''
>      =C2=A0 SDK_EXT_TYPE =3D 'minimal'
>      =C2=A0 SDK_INCLUDE_TOOLCHAIN =3D '1'
>     Command:
>     =3D=3D=3D=3D=3D=3D=3D=3D
>     bitbake core-image-sato core-image-sato-dev core-image-sato-sdk
>     core-image-minimal core-image-minimal-dev core-image-sato-ptest
>     core-image-sato:do_populate_sdk -k
>=20
>     but could not reproduce the issue.
>=20
>     work-around to reproduce this issue.
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     I am observing since bzip2-tests is a git repo and
>     fsmonitor-watchman.sample (.git/hooks/fsmonitor-watchman.sample) is
>     perl script.
>     that's why I got this error.
>      =C2=A0so manually I copied fsmonitor-watchman.sample file into the
>     bzip2-tests/.git/hooks and able to reproduce the issue.
>     Error:
>     https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/18=
16
>     step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue:
>     /usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/fsmonitor-watchman.sampl=
e contained
>     in package bzip2-ptest requires /usr/bin/perl, but no providers
>     found in RDEPENDS_bzip2-ptest? [file-rdeps]
>     step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal
>     errors. Please consider fixing them.
>=20
>     I find out the solution by appending RDEPENDS_${PN}-ptest with perl.
>     RDEPENDS_${PN}-ptest +=3D "make bash perl"
>=20
>     so this issue got resolved.
>=20
>     Issue2:
>     =3D=3D=3D=3D=3D=3D=3D
>     Configuration for this issue
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>      =C2=A0 MACHINE =3D "qemux86"
>      =C2=A0 DISTRO =3D "poky"
>      =C2=A0 SDKMACHINE =3D "i686"
>      =C2=A0 PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
>      =C2=A0 INCOMPATIBLE_LICENSE =3D '*GPLv3'
>      =C2=A0 WARN_QA_remove =3D 'incompatible-license'
>      =C2=A0 QEMU_USE_KVM =3D 'True'
>      =C2=A0 INHERIT +=3D 'report-error'
>      =C2=A0 PREMIRRORS =3D ''
>      =C2=A0 BB_GENERATE_MIRROR_TARBALLS =3D '1'
>      =C2=A0 BB_NUMBER_THREADS =3D '16'
>      =C2=A0 PARALLEL_MAKE =3D '-j 16'
>      =C2=A0 BB_TASK_NICE_LEVEL =3D '5'
>      =C2=A0 BB_TASK_NICE_LEVEL_task-testimage =3D '0'
>      =C2=A0 BB_TASK_IONICE_LEVEL =3D '2.7'
>      =C2=A0 BB_TASK_IONICE_LEVEL_task-testimage =3D '2.1'
>      =C2=A0 INHERIT +=3D 'testimage'
>      =C2=A0 TEST_QEMUBOOT_TIMEOUT =3D '1500'
>      =C2=A0 SANITY_TESTED_DISTROS =3D ''
>      =C2=A0 SDK_EXT_TYPE =3D 'minimal'
>      =C2=A0 SDK_INCLUDE_TOOLCHAIN =3D '1'
>     Command
>     =3D=3D=3D=3D=3D=3D=3D
>     bitbake core-image-minimal core-image-full-cmdline -k
>=20
>=20
>     INCOMPATIBLE_LICENSE =3D '*GPLv3'
>     WARN_QA_remove =3D 'incompatible-license'
>     My doubt is since above configuration is using during build and we
>     are using GPLv3+ license then definetly it will report error.
>=20
>     It looks like you are packaging the test code/data with the main pac=
kage
>     not in bzip2-ptest. Have a look at:
>      =C2=A0 =C2=A0 meta/recipes-support/libpcre/libpcre_8.44.bb
>     <http://libpcre_8.44.bb>
>     for an example. There are many more.
>     Also, if you look at oe-core.git:
>      =C2=A0 =C2=A0 $ rgrep LICENSE_ * =C2=A0| grep PN
>     you can see many examples of sub-packages with different licenses
>     than the main package. One example is:
>      =C2=A0 =C2=A0 meta/recipes-support/gnutls/gnutls_3.6.13.bb
>     <http://gnutls_3.6.13.bb>
>     I hope that can address the buildbot problem but I haven't tried it
>     myself yet.
>=20
>     Explanation:
>     I checked, Here is packaging the test code/data in bzip2-ptest.
>     /opt/opensource/build/tmp/work/mips64-poky-linux/bzip2/1.0.8-r0/pack=
ages-split/bzip2-ptest
>=20
>     I tried with the changes below=C2=A0 in the bzip2_1.0.8.bb
>     <http://bzip2_1.0.8.bb> file.
>     LICENSE =3D "bzip2"
>     LICENSE_${PN}-ptest =3D "GPLv3+"
>=20
>     WARNING: LICENSE_bzip2-ptest includes licenses (GPLv3+) that are not
>     listed in LICENSE
>     To resolve this warning i did below changes.
>     LICENSE =3D "bzip2 & GPLv3+"
>     LICENSE_${PN}-ptest =3D "GPLv3+"
>=20
>     But I am getting below error in both case
>=20
>     ERROR: Nothing RPROVIDES 'bzip2' (but
>     /opt/opensource/poky/meta/recipes-extended/packagegroups/packagegrou=
p-core-full-cmdline.bb
>     <http://packagegroup-core-full-cmdline.bb>,
>     /opt/opensource/poky/meta/recipes-devtools/python/python3_3.8.2.bb
>     <http://python3_3.8.2.bb> RDEPENDS on or otherwise requires it)
>     bzip2 was skipped: it has incompatible license(s): GPL-3.0+
>     NOTE: Runtime target 'bzip2' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['bzip2']
>=20
>     So as per my understanding, if we are splitting the package and
>     assigning Licence to it.
>     example:
>     LICENSE =3D "bzip2"
>     LICENSE_${PN}-ptest =3D "GPLv3+"
>=20
>     In this case I have to set LICENSE_PATH where your license file is
>     located.
>     or if I am using standard license, I have to set LICENSE first then
>     we can set LICENSE_${PN}-ptest.
>=20
>     Example:
>     LICENSE =3D "bzip2 & GPLv3+"
>     LICENSE_${PN}-ptest =3D "GPLv3+"
>=20
>     Kindly comment on it and feel free to point out if i am wrong at any
>     point.
>=20
>=20
>     *Thanks & Regards,*
>     Rahul Kumar
>     Software Engineer,Linux Solutions Engineering
>     Group,Montavista Software LLC
>     Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
>     <https://plus.google.com/+CodeTwoSoftware>
>=20
>=20
>     On Fri, May 1, 2020 at 6:56 AM Randy MacLeod
>     <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>>
>     wrote:
>=20
>         On 2020-04-27 3:39 p.m., Alexander Kanavin wrote:
>          > You need to first see from the failure page which
>         configuration is
>          > failing, for example non-gpl3 is one such.
>          >
>          > Then you find that configuration in config.json. The below
>         should
>          > hopefully be self-explanatory in how you should set up the bu=
ild?
>          >
>          > |"non-gpl3" : { "NEEDREPOS" : ["poky", "meta-gplv2"],
>         "MACHINE" :
>          > "qemux86", "BBTARGETS" : "core-image-minimal
>         core-image-full-cmdline",
>          > "extravars" : [ "INCOMPATIBLE_LICENSE =3D '*GPLv3'",
>         "WARN_QA_remove =3D
>          > 'incompatible-license'" ], "EXTRACMDS" : [
>          > "../../yocto-autobuilder-helper/scripts/check-gplv3" ] },
>          >
>          > |
>          >
>          > |
>          > |
>          >
>          > |Alex
>=20
>         Hi Rahul,
>=20
>         Sorry for my late reply.
>=20
>         The commit log for v2 is very good now!
>         Thanks for incorporating my --pedantic suggestions. ;-)
>=20
>         It seems that you need a perl dependency for something (docs?
>          =C2=A0 =C2=A0 $ cd .../bzip2.git
>          =C2=A0 =C2=A0 $ grep -r "perl " *
>          =C2=A0 =C2=A0 format.pl:#!/usr/bin/perl -w
>          =C2=A0 =C2=A0 README.XML.STUFF:It uses format.pl <http://format=
.pl>, a
>         perl script...
>=20
>         Then we need to figure out how to deal with the GPLv3 issue.
>=20
>         The buildbot output can be tedious to figure out. I haven't real=
ly
>         spent enough time plugging away at it to be proficient yet eithe=
r.
>         Have you been able to reproduce the problems that Richard report=
ed?
>         If not, and you've tried for a bit, then just say so and I'll tr=
y to
>         help tomorrow or early next week.
>=20
>         It looks like you are packaging the test code/data with the main
>         package
>         not in bzip2-ptest. Have a look at:
>          =C2=A0 =C2=A0 meta/recipes-support/libpcre/libpcre_8.44.bb
>         <http://libpcre_8.44.bb>
>         for an example. There are many more.
>         Also, if you look at oe-core.git:
>          =C2=A0 =C2=A0 $ rgrep LICENSE_ *=C2=A0 | grep PN
>         you can see many examples of sub-packages with different license=
s
>         than the main package. One example is:
>          =C2=A0 =C2=A0 meta/recipes-support/gnutls/gnutls_3.6.13.bb
>         <http://gnutls_3.6.13.bb>
>         I hope that can address the buildbot problem but I haven't tried=
 it
>         myself yet.
>=20
>         BTW, Trevor has gotten the YP autobuilder going at Wind River an=
d
>         he'll be sending a few documentation updates next week or so.
>         That may help in case you want to reproduce the YP AB test
>         infrastructure. I expect that you don't _have_ to do so but
>         I think it would be good if more contributing organizations did
>         have an instance with only limited builders of the YP AB so that
>         we can do more testing before Richard runs our changes through
>         the main system. Richard has cautioned that the YP AB has lots o=
f
>         builders each of which has many cores but I hope that we can at
>         least
>         do some AB checking ourselves.
>=20
>         ../Randy
>=20
>=20
>          > |
>          >
>          >
>          > On Mon, 27 Apr 2020 at 20:54, Rahul Kumar <rahulk@mvista.com
>         <mailto:rahulk@mvista.com>
>          > <mailto:rahulk@mvista.com <mailto:rahulk@mvista.com>>> wrote:
>          >
>          >=C2=A0 =C2=A0 =C2=A0Hi Richard/Alexander,
>          >
>          >=C2=A0 =C2=A0 =C2=A0I am not able to understand how I can use =
the below file.
>          >
>         http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-help=
er/tree/config.json
>          >
>          >=C2=A0 =C2=A0 =C2=A0did you mean to say that i have to set MAC=
RO in
>         local.conf based on
>          >=C2=A0 =C2=A0 =C2=A0this file.
>          >
>          >=C2=A0 =C2=A0 =C2=A0*Thanks & Regards,*
>          >=C2=A0 =C2=A0 =C2=A0Rahul Kumar
>          >=C2=A0 =C2=A0 =C2=A0Software Engineer,Linux Solutions Engineer=
ing
>          >=C2=A0 =C2=A0 =C2=A0Group,Montavista Software LLC
>          >=C2=A0 =C2=A0 =C2=A0Email Id: rahulk@mvista.com <mailto:rahulk=
@mvista.com>
>         <mailto:rahulk@mvista.com <mailto:rahulk@mvista.com>>
>          >=C2=A0 =C2=A0 =C2=A0<https://plus.google.com/+CodeTwoSoftware>
>          >
>          >
>          >=C2=A0 =C2=A0 =C2=A0On Mon, Apr 27, 2020 at 11:46 PM Richard P=
urdie
>          >=C2=A0 =C2=A0 =C2=A0<richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>
>          >=C2=A0 =C2=A0 =C2=A0<mailto:richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>>> wrote:
>          >
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 2020-04-27 at 18:30 =
+0200, Alexander Kanavin
>         wrote:
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > You need to look at confi=
gurations defined here:
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >
>         http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-help=
er/tree/config.json
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > and replicate them locall=
y. Then you can reproduce the
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failures that
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > the AB gets in those conf=
igurations.
>          >
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0That start of the failing lo=
gs on the autobuilder
>         also list out the
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration options for th=
at build.
>          >
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,
>          >
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Richard
>          >
>          >
>          >
>          >
>=20
>=20
>         --=20
>         # Randy MacLeod
>         # Wind River Linux
>=20
>    =20
>=20


--=20
# Randy MacLeod
# Wind River Linux
