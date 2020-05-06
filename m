Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.4200.1588763867254630704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 04:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=TIaujBX6;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.128.45, mailfrom: rahulk@mvista.com)
Received: by mail-wm1-f45.google.com with SMTP id x4so2155108wmj.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 04:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PNKqnMPw0XXfOSehq0qgayne2aSUcZs4uHxrKyX4Vss=;
        b=TIaujBX6Wyvw9kFUuaqObkPxWX3AYrtmBIwuGY9MZPIuKf4W5UCBjk7g/wndhqp/v1
         2Pw/aGdlXaWySHBq+dQM8QmW8jHJVoJmt7x8Of8cxXzGvolWOEHmzeePnNOOllAwx38D
         TBLcPYX8CAodPGdTEBageUhYcxVmLJr/nVza7MS9qe8GMMxEQAbqbL56hRA/By6ce01x
         3D7sYJltF2fuyNS7wFo9p8SnFH1m5kOJwTRmHmPbL9H8rUvk1PHEKG4yb72Y+Mo+jJsQ
         j9CaG6AMbM+PN7pSsh0COk8UzSwtGxEi4k83zMuAzGFX3zgN4h8q4yiB70XIoBeUfqXG
         5OtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PNKqnMPw0XXfOSehq0qgayne2aSUcZs4uHxrKyX4Vss=;
        b=KnoOv3C22X8Sfs+oSVOAdAhkx4WcgxNF49TWYf9ucUQ6vX3My17vGdxI/fDAy1W+sZ
         nBp7t7Oy6C468ebxSN8oT7Aadw40VNLn9Pa98rXeEhthSzQvoZg7lcNVfg4LSXuEfh0H
         5ynK+8+arlInAcfZDYxmFsf3VCcOTTMz5vPGH0sH7m6uD8b2s0ciAYFPcFqwlmyIqbcp
         wWLCpJ16I9CA2X0xByZClWMTPuvlLneg5yv24ZhdHdT2FLiny8X2VkLTHv/eijmwc91Z
         B2+qzGXauzPHGVSdC9LRsiRif2U1lb57NvI/xtkAW6T+GQci0HWxTfembda6LZfj72Nv
         6AAA==
X-Gm-Message-State: AGi0PubrN51DpkEttJjKXnvZXmZQl7Ewh/aN7VPe8HT87QnnDdyKN0Z6
	YuaKOC2c2oXlGLPxujLmw2i39+rIV7NPp+yygbGEmA==
X-Google-Smtp-Source: APiQypKdwkkeIHbkhtTvicmbM+8/DKRLt58f+EnKq6wKqhnQEdfznOHfoTWhEBJhX3OgvVMUquPuHuymm2YTN/w2PCY=
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr3943727wme.79.1588763865497;
 Wed, 06 May 2020 04:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
 <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
 <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
 <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com> <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com>
In-Reply-To: <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Wed, 6 May 2020 16:47:34 +0530
Message-ID: <CANv91vPb2pThkW6Qm2venYzUyX7f5sFZEjNXevmW=X7Qn6fwtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000d5fada05a4f8e975"

--000000000000d5fada05a4f8e975
Content-Type: text/plain; charset="UTF-8"

Hi Randy,

As per your suggestion I did some progress.

Issue 1:
========

Configuration for this issue:
=============================
  MACHINE = "edgerouter"
  DISTRO = "poky"
  SDKMACHINE = "i686"
  PACKAGE_CLASSES = "package_rpm package_deb package_ipk"
  INHERIT += 'image-buildinfo'
  IMAGE_BUILDINFO_VARS_append = ' IMAGE_BASENAME IMAGE_NAME'
  QEMU_USE_KVM = 'True'
  INHERIT += 'report-error'
  PREMIRRORS = ''
  BB_GENERATE_MIRROR_TARBALLS = '1'
  BB_NUMBER_THREADS = '16'
  PARALLEL_MAKE = '-j 16'
  BB_TASK_NICE_LEVEL = '5'
  BB_TASK_NICE_LEVEL_task-testimage = '0'
  BB_TASK_IONICE_LEVEL = '2.7'
  BB_TASK_IONICE_LEVEL_task-testimage = '2.1'
  INHERIT += 'testimage'
  TEST_QEMUBOOT_TIMEOUT = '1500'
  SANITY_TESTED_DISTROS = ''
  SDK_EXT_TYPE = 'minimal'
  SDK_INCLUDE_TOOLCHAIN = '1'
Command:
========
bitbake core-image-sato core-image-sato-dev core-image-sato-sdk
core-image-minimal core-image-minimal-dev core-image-sato-ptest
core-image-sato:do_populate_sdk -k

but could not reproduce the issue.

work-around to reproduce this issue.
====================================
I am observing since bzip2-tests is a git repo and
fsmonitor-watchman.sample (.git/hooks/fsmonitor-watchman.sample) is perl
script.
that's why I got this error.
 so manually I copied fsmonitor-watchman.sample file into the
bzip2-tests/.git/hooks and able to reproduce the issue.
Error:
https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/1816
step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue:
/usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/fsmonitor-watchman.sample
contained in package bzip2-ptest requires /usr/bin/perl, but no providers
found in RDEPENDS_bzip2-ptest? [file-rdeps]
step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors.
Please consider fixing them.

I find out the solution by appending RDEPENDS_${PN}-ptest with perl.
RDEPENDS_${PN}-ptest += "make bash perl"

so this issue got resolved.

Issue2:
=======
Configuration for this issue
============================
  MACHINE = "qemux86"
  DISTRO = "poky"
  SDKMACHINE = "i686"
  PACKAGE_CLASSES = "package_rpm package_deb package_ipk"
  INCOMPATIBLE_LICENSE = '*GPLv3'
  WARN_QA_remove = 'incompatible-license'
  QEMU_USE_KVM = 'True'
  INHERIT += 'report-error'
  PREMIRRORS = ''
  BB_GENERATE_MIRROR_TARBALLS = '1'
  BB_NUMBER_THREADS = '16'
  PARALLEL_MAKE = '-j 16'
  BB_TASK_NICE_LEVEL = '5'
  BB_TASK_NICE_LEVEL_task-testimage = '0'
  BB_TASK_IONICE_LEVEL = '2.7'
  BB_TASK_IONICE_LEVEL_task-testimage = '2.1'
  INHERIT += 'testimage'
  TEST_QEMUBOOT_TIMEOUT = '1500'
  SANITY_TESTED_DISTROS = ''
  SDK_EXT_TYPE = 'minimal'
  SDK_INCLUDE_TOOLCHAIN = '1'
Command
=======
bitbake core-image-minimal core-image-full-cmdline -k


INCOMPATIBLE_LICENSE = '*GPLv3'
WARN_QA_remove = 'incompatible-license'
My doubt is since above configuration is using during build and we are
using GPLv3+ license then definetly it will report error.

It looks like you are packaging the test code/data with the main package
not in bzip2-ptest. Have a look at:
    meta/recipes-support/libpcre/libpcre_8.44.bb
for an example. There are many more.
Also, if you look at oe-core.git:
    $ rgrep LICENSE_ *  | grep PN
you can see many examples of sub-packages with different licenses
than the main package. One example is:
    meta/recipes-support/gnutls/gnutls_3.6.13.bb
I hope that can address the buildbot problem but I haven't tried it
myself yet.

Explanation:
I checked, Here is packaging the test code/data in bzip2-ptest.
/opt/opensource/build/tmp/work/mips64-poky-linux/bzip2/1.0.8-r0/packages-split/bzip2-ptest

I tried with the changes below  in the bzip2_1.0.8.bb file.
LICENSE = "bzip2"
LICENSE_${PN}-ptest = "GPLv3+"

WARNING: LICENSE_bzip2-ptest includes licenses (GPLv3+) that are not listed
in LICENSE
To resolve this warning i did below changes.
LICENSE = "bzip2 & GPLv3+"
LICENSE_${PN}-ptest = "GPLv3+"

But I am getting below error in both case

ERROR: Nothing RPROVIDES 'bzip2' (but
/opt/opensource/poky/meta/recipes-extended/packagegroups/
packagegroup-core-full-cmdline.bb,
/opt/opensource/poky/meta/recipes-devtools/python/python3_3.8.2.bb RDEPENDS
on or otherwise requires it)
bzip2 was skipped: it has incompatible license(s): GPL-3.0+
NOTE: Runtime target 'bzip2' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bzip2']

So as per my understanding, if we are splitting the package and assigning
Licence to it.
example:
LICENSE = "bzip2"
LICENSE_${PN}-ptest = "GPLv3+"

In this case I have to set LICENSE_PATH where your license file is located.
or if I am using standard license, I have to set LICENSE first then we can
set LICENSE_${PN}-ptest.

Example:
LICENSE = "bzip2 & GPLv3+"
LICENSE_${PN}-ptest = "GPLv3+"

Kindly comment on it and feel free to point out if i am wrong at any point.


*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Fri, May 1, 2020 at 6:56 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2020-04-27 3:39 p.m., Alexander Kanavin wrote:
> > You need to first see from the failure page which configuration is
> > failing, for example non-gpl3 is one such.
> >
> > Then you find that configuration in config.json. The below should
> > hopefully be self-explanatory in how you should set up the build?
> >
> > |"non-gpl3" : { "NEEDREPOS" : ["poky", "meta-gplv2"], "MACHINE" :
> > "qemux86", "BBTARGETS" : "core-image-minimal core-image-full-cmdline",
> > "extravars" : [ "INCOMPATIBLE_LICENSE = '*GPLv3'", "WARN_QA_remove =
> > 'incompatible-license'" ], "EXTRACMDS" : [
> > "../../yocto-autobuilder-helper/scripts/check-gplv3" ] },
> >
> > |
> >
> > |
> > |
> >
> > |Alex
>
> Hi Rahul,
>
> Sorry for my late reply.
>
> The commit log for v2 is very good now!
> Thanks for incorporating my --pedantic suggestions. ;-)
>
> It seems that you need a perl dependency for something (docs?
>     $ cd .../bzip2.git
>     $ grep -r "perl " *
>     format.pl:#!/usr/bin/perl -w
>     README.XML.STUFF:It uses format.pl, a perl script...
>
> Then we need to figure out how to deal with the GPLv3 issue.
>
> The buildbot output can be tedious to figure out. I haven't really
> spent enough time plugging away at it to be proficient yet either.
> Have you been able to reproduce the problems that Richard reported?
> If not, and you've tried for a bit, then just say so and I'll try to
> help tomorrow or early next week.
>
> It looks like you are packaging the test code/data with the main package
> not in bzip2-ptest. Have a look at:
>     meta/recipes-support/libpcre/libpcre_8.44.bb
> for an example. There are many more.
> Also, if you look at oe-core.git:
>     $ rgrep LICENSE_ *  | grep PN
> you can see many examples of sub-packages with different licenses
> than the main package. One example is:
>     meta/recipes-support/gnutls/gnutls_3.6.13.bb
> I hope that can address the buildbot problem but I haven't tried it
> myself yet.
>
> BTW, Trevor has gotten the YP autobuilder going at Wind River and
> he'll be sending a few documentation updates next week or so.
> That may help in case you want to reproduce the YP AB test
> infrastructure. I expect that you don't _have_ to do so but
> I think it would be good if more contributing organizations did
> have an instance with only limited builders of the YP AB so that
> we can do more testing before Richard runs our changes through
> the main system. Richard has cautioned that the YP AB has lots of
> builders each of which has many cores but I hope that we can at least
> do some AB checking ourselves.
>
> ../Randy
>
>
> > |
> >
> >
> > On Mon, 27 Apr 2020 at 20:54, Rahul Kumar <rahulk@mvista.com
> > <mailto:rahulk@mvista.com>> wrote:
> >
> >     Hi Richard/Alexander,
> >
> >     I am not able to understand how I can use the below file.
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
> >
> >     did you mean to say that i have to set MACRO in local.conf based on
> >     this file.
> >
> >     *Thanks & Regards,*
> >     Rahul Kumar
> >     Software Engineer,Linux Solutions Engineering
> >     Group,Montavista Software LLC
> >     Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> >     <https://plus.google.com/+CodeTwoSoftware>
> >
> >
> >     On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie
> >     <richard.purdie@linuxfoundation.org
> >     <mailto:richard.purdie@linuxfoundation.org>> wrote:
> >
> >         On Mon, 2020-04-27 at 18:30 +0200, Alexander Kanavin wrote:
> >          > You need to look at configurations defined here:
> >          >
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
> >          > and replicate them locally. Then you can reproduce the
> >         failures that
> >          > the AB gets in those configurations.
> >
> >         That start of the failing logs on the autobuilder also list out
> the
> >         configuration options for that build.
> >
> >         Cheers,
> >
> >         Richard
> >
> >
> > 
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

--000000000000d5fada05a4f8e975
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi Randy,<br></div><div class=3D"gmail_default" s=
tyle=3D"font-family:verdana,sans-serif;color:#0b5394"><br>As per your sugge=
stion I did some progress.<br><br>Issue 1:<br>=3D=3D=3D=3D=3D=3D=3D=3D<br><=
br>Configuration for this issue:<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>=C2=A0 MACHINE =3D &qu=
ot;edgerouter&quot;<br>=C2=A0 DISTRO =3D &quot;poky&quot;<br>=C2=A0 SDKMACH=
INE =3D &quot;i686&quot;<br>=C2=A0 PACKAGE_CLASSES =3D &quot;package_rpm pa=
ckage_deb package_ipk&quot;<br>=C2=A0 INHERIT +=3D &#39;image-buildinfo&#39=
;<br>=C2=A0 IMAGE_BUILDINFO_VARS_append =3D &#39; IMAGE_BASENAME IMAGE_NAME=
&#39;<br>=C2=A0 QEMU_USE_KVM =3D &#39;True&#39;<br>=C2=A0 INHERIT +=3D &#39=
;report-error&#39;<br>=C2=A0 PREMIRRORS =3D &#39;&#39;<br>=C2=A0 BB_GENERAT=
E_MIRROR_TARBALLS =3D &#39;1&#39;<br>=C2=A0 BB_NUMBER_THREADS =3D &#39;16&#=
39;<br>=C2=A0 PARALLEL_MAKE =3D &#39;-j 16&#39;<br>=C2=A0 BB_TASK_NICE_LEVE=
L =3D &#39;5&#39;<br>=C2=A0 BB_TASK_NICE_LEVEL_task-testimage =3D &#39;0&#3=
9;<br>=C2=A0 BB_TASK_IONICE_LEVEL =3D &#39;2.7&#39;<br>=C2=A0 BB_TASK_IONIC=
E_LEVEL_task-testimage =3D &#39;2.1&#39;<br>=C2=A0 INHERIT +=3D &#39;testim=
age&#39;<br>=C2=A0 TEST_QEMUBOOT_TIMEOUT =3D &#39;1500&#39;<br>=C2=A0 SANIT=
Y_TESTED_DISTROS =3D &#39;&#39;<br>=C2=A0 SDK_EXT_TYPE =3D &#39;minimal&#39=
;<br>=C2=A0 SDK_INCLUDE_TOOLCHAIN =3D &#39;1&#39;<br>Command:<br>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>bitbake core-image-sato core-image-sato-dev core-image-=
sato-sdk core-image-minimal core-image-minimal-dev core-image-sato-ptest co=
re-image-sato:do_populate_sdk -k <br><br>but could not reproduce the issue.=
<br><br>work-around to reproduce this issue.<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>I am observing since bzip2-tests is a git repo and fsmonitor-=
watchman.sample (.git/hooks/fsmonitor-watchman.sample) is perl script.<br>t=
hat&#39;s why I got this error.<br>=C2=A0so manually I copied fsmonitor-wat=
chman.sample file into the bzip2-tests/.git/hooks and able to reproduce the=
 issue. <br>Error:<br><a href=3D"https://autobuilder.yoctoproject.org/typho=
on/#/builders/62/builds/1816">https://autobuilder.yoctoproject.org/typhoon/=
#/builders/62/builds/1816</a><br>step1b: ERROR: bzip2-1.0.8-r0 do_package_q=
a: QA Issue: /usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/fsmonitor-watchman=
.sample contained in package bzip2-ptest requires /usr/bin/perl, but no pro=
viders found in RDEPENDS_bzip2-ptest? [file-rdeps]<br>step1b: ERROR: bzip2-=
1.0.8-r0 do_package_qa: QA run found fatal errors. Please consider fixing t=
hem.<br><br>I find out the solution by appending RDEPENDS_${PN}-ptest with =
perl.<br>RDEPENDS_${PN}-ptest +=3D &quot;make bash perl&quot;<br><br>so thi=
s issue got resolved.<br><br>Issue2:<br>=3D=3D=3D=3D=3D=3D=3D<br>Configurat=
ion for this issue<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>=C2=A0 MACHINE =3D &quot;qemux86&quot=
;<br>=C2=A0 DISTRO =3D &quot;poky&quot;<br>=C2=A0 SDKMACHINE =3D &quot;i686=
&quot;<br>=C2=A0 PACKAGE_CLASSES =3D &quot;package_rpm package_deb package_=
ipk&quot;<br>=C2=A0 INCOMPATIBLE_LICENSE =3D &#39;*GPLv3&#39;<br>=C2=A0 WAR=
N_QA_remove =3D &#39;incompatible-license&#39;<br>=C2=A0 QEMU_USE_KVM =3D &=
#39;True&#39;<br>=C2=A0 INHERIT +=3D &#39;report-error&#39;<br>=C2=A0 PREMI=
RRORS =3D &#39;&#39;<br>=C2=A0 BB_GENERATE_MIRROR_TARBALLS =3D &#39;1&#39;<=
br>=C2=A0 BB_NUMBER_THREADS =3D &#39;16&#39;<br>=C2=A0 PARALLEL_MAKE =3D &#=
39;-j 16&#39;<br>=C2=A0 BB_TASK_NICE_LEVEL =3D &#39;5&#39;<br>=C2=A0 BB_TAS=
K_NICE_LEVEL_task-testimage =3D &#39;0&#39;<br>=C2=A0 BB_TASK_IONICE_LEVEL =
=
=3D &#39;2.7&#39;<br>=C2=A0 BB_TASK_IONICE_LEVEL_task-testimage =3D &#39;2=
.1&#39;<br>=C2=A0 INHERIT +=3D &#39;testimage&#39;<br>=C2=A0 TEST_QEMUBOOT_=
TIMEOUT =3D &#39;1500&#39;<br>=C2=A0 SANITY_TESTED_DISTROS =3D &#39;&#39;<b=
r>=C2=A0 SDK_EXT_TYPE =3D &#39;minimal&#39;<br>=C2=A0 SDK_INCLUDE_TOOLCHAIN=
 =3D &#39;1&#39;<br>Command<br>=3D=3D=3D=3D=3D=3D=3D<br>bitbake core-image-=
minimal core-image-full-cmdline -k <br><br><br>INCOMPATIBLE_LICENSE =3D &#3=
9;*GPLv3&#39;<br>WARN_QA_remove =3D &#39;incompatible-license&#39;<br>My do=
ubt is since above configuration is using during build and we are using GPL=
v3+ license then definetly it will report error.<br><br>It looks like you a=
re packaging the test code/data with the main package<br>not in bzip2-ptest=
. Have a look at:<br>=C2=A0 =C2=A0 meta/recipes-support/libpcre/<a href=3D"=
http://libpcre_8.44.bb">libpcre_8.44.bb</a><br>for an example. There are ma=
ny more.<br>Also, if you look at oe-core.git:<br>=C2=A0 =C2=A0 $ rgrep LICE=
NSE_ * =C2=A0| grep PN<br>you can see many examples of sub-packages with di=
fferent licenses<br>than the main package. One example is:<br>=C2=A0 =C2=A0=
 meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.6.13.bb">gnutls_3.6=
.13.bb</a><br>I hope that can address the buildbot problem but I haven&#39;=
t tried it<br>myself yet.<br><br>Explanation:<br>I checked, Here is packagi=
ng the test code/data in bzip2-ptest.<br>/opt/opensource/build/tmp/work/mip=
s64-poky-linux/bzip2/1.0.8-r0/packages-split/bzip2-ptest<br><br></div><div =
class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b53=
94">I tried with the changes below=C2=A0 in the <a href=3D"http://bzip2_1.0=
.8.bb">bzip2_1.0.8.bb</a> file.<br>LICENSE =3D &quot;bzip2&quot;<br>LICENSE=
_${PN}-ptest =3D &quot;GPLv3+&quot;<br><br>WARNING: LICENSE_bzip2-ptest inc=
ludes licenses (GPLv3+) that are not listed in LICENSE<br>To resolve this w=
arning i did below changes.<br>LICENSE =3D &quot;bzip2 &amp; GPLv3+&quot;<b=
r>LICENSE_${PN}-ptest =3D &quot;GPLv3+&quot;<br><br>But I am getting below =
error in both case<br><br>ERROR: Nothing RPROVIDES &#39;bzip2&#39; (but /op=
t/opensource/poky/meta/recipes-extended/packagegroups/<a href=3D"http://pac=
kagegroup-core-full-cmdline.bb">packagegroup-core-full-cmdline.bb</a>, /opt=
/opensource/poky/meta/recipes-devtools/python/<a href=3D"http://python3_3.8=
.2.bb">python3_3.8.2.bb</a> RDEPENDS on or otherwise requires it)<br>bzip2 =
was skipped: it has incompatible license(s): GPL-3.0+<br>NOTE: Runtime targ=
et &#39;bzip2&#39; is unbuildable, removing...<br>Missing or unbuildable de=
pendency chain was: [&#39;bzip2&#39;]<br><br>So as per my understanding, if=
 we are splitting the package and assigning Licence to it.<br>example:<br>L=
ICENSE =3D &quot;bzip2&quot;<br>LICENSE_${PN}-ptest =3D &quot;GPLv3+&quot;<=
br><br>In this case I have to set LICENSE_PATH where your license file is l=
ocated.<br>or if I am using standard license, I have to set LICENSE first t=
hen we can set LICENSE_${PN}-ptest.<br><br>Example:<br>LICENSE =3D &quot;bz=
ip2 &amp; GPLv3+&quot;<br>LICENSE_${PN}-ptest =3D &quot;GPLv3+&quot;<br><br=
>Kindly comment on it and feel free to point out if i am wrong at any point=
.<br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-s=
erif;color:#0b5394"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:verdana,sans-serif;color:#0b5394"><br></div><div><div dir=3D"ltr" clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div><span style=3D"color:rgb(111,168,220=
)">	=09
  =09
  
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b=
></span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"co=
lor:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><s=
pan style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"=
color:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</s=
pan></span></div><div><span style=3D"color:rgb(11,83,148)">Software Enginee=
r,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,=
83,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"col=
or:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mail=
to:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span>=
<span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener"=
 target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:=
10pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div><br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 1,=
 2020 at 6:56 AM Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windrive=
r.com">randy.macleod@windriver.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On 2020-04-27 3:39 p.m., Alexander Kanavi=
n wrote:<br>
&gt; You need to first see from the failure page which configuration is <b=
r>
&gt; failing, for example non-gpl3 is one such.<br>
&gt; <br>
&gt; Then you find that configuration in config.json. The below should <br=
>
&gt; hopefully be self-explanatory in how you should set up the build?<br>
&gt; <br>
&gt; |&quot;non-gpl3&quot; : { &quot;NEEDREPOS&quot; : [&quot;poky&quot;, =
&quot;meta-gplv2&quot;], &quot;MACHINE&quot; : <br>
&gt; &quot;qemux86&quot;, &quot;BBTARGETS&quot; : &quot;core-image-minimal=
 core-image-full-cmdline&quot;, <br>
&gt; &quot;extravars&quot; : [ &quot;INCOMPATIBLE_LICENSE =3D &#39;*GPLv3&=
#39;&quot;, &quot;WARN_QA_remove =3D <br>
&gt; &#39;incompatible-license&#39;&quot; ], &quot;EXTRACMDS&quot; : [ <br=
>
&gt; &quot;../../yocto-autobuilder-helper/scripts/check-gplv3&quot; ] },<b=
r>
&gt; <br>
&gt; |<br>
&gt; <br>
&gt; |<br>
&gt; |<br>
&gt; <br>
&gt; |Alex<br>
<br>
Hi Rahul,<br>
<br>
Sorry for my late reply.<br>
<br>
The commit log for v2 is very good now!<br>
Thanks for incorporating my --pedantic suggestions. ;-)<br>
<br>
It seems that you need a perl dependency for something (docs?<br>
=C2=A0 =C2=A0 $ cd .../bzip2.git<br>
=C2=A0 =C2=A0 $ grep -r &quot;perl &quot; *<br>
=C2=A0 =C2=A0 format.pl:#!/usr/bin/perl -w<br>
=C2=A0 =C2=A0 README.XML.STUFF:It uses <a href=3D"http://format.pl" rel=3D=
"noreferrer" target=3D"_blank">format.pl</a>, a perl script...<br>
<br>
Then we need to figure out how to deal with the GPLv3 issue.<br>
<br>
The buildbot output can be tedious to figure out. I haven&#39;t really<br>
spent enough time plugging away at it to be proficient yet either.<br>
Have you been able to reproduce the problems that Richard reported?<br>
If not, and you&#39;ve tried for a bit, then just say so and I&#39;ll try =
to<br>
help tomorrow or early next week.<br>
<br>
It looks like you are packaging the test code/data with the main package <=
br>
not in bzip2-ptest. Have a look at:<br>
=C2=A0 =C2=A0 meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.44.=
bb" rel=3D"noreferrer" target=3D"_blank">libpcre_8.44.bb</a><br>
for an example. There are many more.<br>
Also, if you look at oe-core.git:<br>
=C2=A0 =C2=A0 $ rgrep LICENSE_ *=C2=A0 | grep PN<br>
you can see many examples of sub-packages with different licenses<br>
than the main package. One example is:<br>
=C2=A0 =C2=A0 meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.6.13.=
bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3.6.13.bb</a><br>
I hope that can address the buildbot problem but I haven&#39;t tried it<br=
>
myself yet.<br>
<br>
BTW, Trevor has gotten the YP autobuilder going at Wind River and<br>
he&#39;ll be sending a few documentation updates next week or so.<br>
That may help in case you want to reproduce the YP AB test<br>
infrastructure. I expect that you don&#39;t _have_ to do so but<br>
I think it would be good if more contributing organizations did<br>
have an instance with only limited builders of the YP AB so that<br>
we can do more testing before Richard runs our changes through<br>
the main system. Richard has cautioned that the YP AB has lots of<br>
builders each of which has many cores but I hope that we can at least<br>
do some AB checking ourselves.<br>
<br>
../Randy<br>
<br>
<br>
&gt; |<br>
&gt; <br>
&gt; <br>
&gt; On Mon, 27 Apr 2020 at 20:54, Rahul Kumar &lt;<a href=3D"mailto:rahul=
k@mvista.com" target=3D"_blank">rahulk@mvista.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rah=
ulk@mvista.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Richard/Alexander,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I am not able to understand how I can use the belo=
w file.<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.c=
gi/yocto-autobuilder-helper/tree/config.json" rel=3D"noreferrer" target=3D"=
_blank">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/=
tree/config.json</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0did you mean to say that i have to set MACRO in lo=
cal.conf based on<br>
&gt;=C2=A0 =C2=A0 =C2=A0this file.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0*Thanks &amp; Regards,*<br>
&gt;=C2=A0 =C2=A0 =C2=A0Rahul Kumar<br>
&gt;=C2=A0 =C2=A0 =C2=A0Software Engineer,Linux Solutions Engineering<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group,Montavista Software LLC<br>
&gt;=C2=A0 =C2=A0 =C2=A0Email Id: <a href=3D"mailto:rahulk@mvista.com" tar=
get=3D"_blank">rahulk@mvista.com</a> &lt;mailto:<a href=3D"mailto:rahulk@mv=
ista.com" target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://plus.google.com/+CodeTwoSof=
tware" rel=3D"noreferrer" target=3D"_blank">https://plus.google.com/+CodeTw=
oSoftware</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 2020-04-27 at 18:30 +0200, A=
lexander Kanavin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; You need to look at configurat=
ions defined here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.o=
rg/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json" rel=3D"noreferr=
er" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autob=
uilder-helper/tree/config.json</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; and replicate them locally. Th=
en you can reproduce the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failures that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; the AB gets in those configura=
tions.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0That start of the failing logs on th=
e autobuilder also list out the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration options for that build=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
</blockquote></div>

--000000000000d5fada05a4f8e975--
