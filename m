Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.1233.1589394543010788050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 11:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=W7F+Ig8O;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.221.50, mailfrom: rahulk@mvista.com)
Received: by mail-wr1-f50.google.com with SMTP id l11so712829wru.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 11:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=upkSA6Weu5rniLxbBFFnnZwfh6ATHXY6a55sx4PCM+0=;
        b=W7F+Ig8Ovh9z1w/Qi8OhrV1jERx+U5lLvAw141bbppJ/IIryUbGOI6Av3yac61K9pa
         SGwsqO0JPlbTISCzToykKzdocMTnHqkRffzo2IMl0hDoRqhWTID3HrATVriUC4wUwJGX
         llXFmXygZexu8ysB2b79L1pd6oIY1jypXMuE5tjK1LvTGxGSqiZJYBmS7uH+eGZCsr6X
         JC8QId2Juym63tgUc9Chs/LFKcptWFJ812fvC+WICLJdxq4btBwK6YJMfO9l75oG9+YF
         XRDlPsHfTf2pVOv0pcax/KQ9SsPsnWF+9qu4o+e16IF2w4Y2uT3/NrG2vzJcWrQZtkYK
         Ew7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=upkSA6Weu5rniLxbBFFnnZwfh6ATHXY6a55sx4PCM+0=;
        b=cpEmXH7lFX4XhhNu14VngUgZn5FW/35nj8A4BxiM1WLIUpjFiV2nSAihUrllmkvQti
         fR/uxm8TNqHG54D9QXCWIL0KzSPB42nLi6rCn74XjgF3QjspP9WAdpob414GzERvHe7w
         DF75arkdi5izw81bA/1Uxu9W6DyASIxG4rBMCOksOc2eJRQ2CenvEgczs2z5IhVlRgoM
         VwrU8N/nFVw359yqDXROj/1qFS2+keoAijR8WWbB4hv7/ckBQDEu54zCiEOC4WgPGvQ8
         N2lrVITNzR/Oloe3yXRCQaGzUBhXcTqTrcMd5EUn1UUGycMawCa3f5BNHxqbkU3nE1Jr
         Nj6A==
X-Gm-Message-State: AOAM530XPUPbeOWbjucgJzfd1fXWbBrgrhwFT7hcbsorl240DgXSgeAQ
	uSks6ZHXIQ2dPNVtrR1kgnD+GcfcX78ArIuuOqSCTA==
X-Google-Smtp-Source: ABdhPJwija4YLRlkU655Uj+LVO3sRBvWmVsiomF/X553joLkZJdn0Hj652Hq58ekSp9HQd2WMNkkrzvDdm9WzeYmEew=
X-Received: by 2002:adf:e951:: with SMTP id m17mr700596wrn.352.1589394541431;
 Wed, 13 May 2020 11:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
 <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
 <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
 <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com>
 <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com> <160C6C52084AA802.10857@lists.openembedded.org>
 <CANv91vOtL1SwZAUWkWyCLF7TY5bXdKdb_-TQOMPgvPpWcJwtiA@mail.gmail.com>
 <f97a12c8-3323-99ca-0f6a-dd2d020c217f@windriver.com> <8ca68742-7d12-a108-2206-4ce8c1d87e5c@windriver.com>
In-Reply-To: <8ca68742-7d12-a108-2206-4ce8c1d87e5c@windriver.com>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Wed, 13 May 2020 23:58:49 +0530
Message-ID: <CANv91vM-OTXEcwqKK-9yixM-KpbdkCBQDEZG0Lxum--02w7KgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000000ce10b05a58bc13c"

--0000000000000ce10b05a58bc13c
Content-Type: text/plain; charset="UTF-8"

Hi Trevor,

It will be really helpful to me.But I don't have a Fedora system with me.
I have only Ubuntu System.

I am available on #oe IRC Channels.

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Wed, May 13, 2020 at 7:58 PM Trevor Gamblin <trevor.gamblin@windriver.com>
wrote:

>
> On 5/12/20 7:22 PM, Randy MacLeod wrote:
> > On 2020-05-12 12:58 a.m., Rahul Kumar wrote:
> >> Hi,
> >>
> >> Can any one please help me to figure out how to deal with the GPLv3+
> >> issue.
> >>
> >> you can see my Patch at below link
> >> https://patchwork.openembedded.org/patch/172134/
> >>
> >> *Issue:*
> >> the new license (GPLv3) causes problems:
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1814
> >> *
> >> *
> >
> > Hi Rahul,
> >
> > I'm having some email problems with the oe-core list so apologies
> > if this is redundant.
> >
> > What happens if you split the license info into two parts like:
> >
> > $ grep "^LICENSE" recipes-extended/libvirt/libvirt_6.1.0.bb
> > LICENSE = "LGPLv2.1+ & GPLv2+"
> > LICENSE_${PN}-ptest = "GPLv2+ & LGPLv2.1+"
> > except of course with GPLv3.
> >
> > I might try that tomorrow on our local instance of the YP autobuilder.
> > If you'd like to set one up @ mvista, I hear from Trevor that it doesn't
> > take all that much time. As others have explained, you can also dig
> > through the yocto-autobuilder2/yocto-autobuilder-helper git repos.
>
> Hi Rahul, I can definitely help you get an autobuilder instance running
> locally, if you'd like. At the moment I'd suggest doing so on a host
> that's running Fedora, as that's where I've had the most success
> (Richard has explained to me how they run it on Ubuntu, but I haven't
> gotten it fully functional there yet).
>
> Are you on either the #yocto and/or #oe IRC channels?
>
> >
> > ../Randy
> >
> >> Thanks & Regards,
> >> Rahul Kumar
> >> Software Engineer,Linux Solutions Engineering
> >> Group,Montavista Software LLC
> >> Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> >> <https://plus.google.com/+CodeTwoSoftware>
> >>
> >>
> >> On Wed, May 6, 2020 at 4:47 PM Rahul Kumar via lists.openembedded.org
> >> <http://lists.openembedded.org>
> >> <rahulk=mvista.com@lists.openembedded.org
> >> <mailto:mvista.com@lists.openembedded.org>> wrote:
> >>
> >>     Hi Randy,
> >>
> >>     As per your suggestion I did some progress.
> >>
> >>     Issue 1:
> >>     ========
> >>
> >>     Configuration for this issue:
> >>     =============================
> >>        MACHINE = "edgerouter"
> >>        DISTRO = "poky"
> >>        SDKMACHINE = "i686"
> >>        PACKAGE_CLASSES = "package_rpm package_deb package_ipk"
> >>        INHERIT += 'image-buildinfo'
> >>        IMAGE_BUILDINFO_VARS_append = ' IMAGE_BASENAME IMAGE_NAME'
> >>        QEMU_USE_KVM = 'True'
> >>        INHERIT += 'report-error'
> >>        PREMIRRORS = ''
> >>        BB_GENERATE_MIRROR_TARBALLS = '1'
> >>        BB_NUMBER_THREADS = '16'
> >>        PARALLEL_MAKE = '-j 16'
> >>        BB_TASK_NICE_LEVEL = '5'
> >>        BB_TASK_NICE_LEVEL_task-testimage = '0'
> >>        BB_TASK_IONICE_LEVEL = '2.7'
> >>        BB_TASK_IONICE_LEVEL_task-testimage = '2.1'
> >>        INHERIT += 'testimage'
> >>        TEST_QEMUBOOT_TIMEOUT = '1500'
> >>        SANITY_TESTED_DISTROS = ''
> >>        SDK_EXT_TYPE = 'minimal'
> >>        SDK_INCLUDE_TOOLCHAIN = '1'
> >>     Command:
> >>     ========
> >>     bitbake core-image-sato core-image-sato-dev core-image-sato-sdk
> >>     core-image-minimal core-image-minimal-dev core-image-sato-ptest
> >>     core-image-sato:do_populate_sdk -k
> >>
> >>     but could not reproduce the issue.
> >>
> >>     work-around to reproduce this issue.
> >>     ====================================
> >>     I am observing since bzip2-tests is a git repo and
> >>     fsmonitor-watchman.sample (.git/hooks/fsmonitor-watchman.sample) is
> >>     perl script.
> >>     that's why I got this error.
> >>       so manually I copied fsmonitor-watchman.sample file into the
> >>     bzip2-tests/.git/hooks and able to reproduce the issue.
> >>     Error:
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/1816
> >>     step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue:
> >> /usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/fsmonitor-watchman.sample
> >> contained
> >>     in package bzip2-ptest requires /usr/bin/perl, but no providers
> >>     found in RDEPENDS_bzip2-ptest? [file-rdeps]
> >>     step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal
> >>     errors. Please consider fixing them.
> >>
> >>     I find out the solution by appending RDEPENDS_${PN}-ptest with perl.
> >>     RDEPENDS_${PN}-ptest += "make bash perl"
> >>
> >>     so this issue got resolved.
> >>
> >>     Issue2:
> >>     =======
> >>     Configuration for this issue
> >>     ============================
> >>        MACHINE = "qemux86"
> >>        DISTRO = "poky"
> >>        SDKMACHINE = "i686"
> >>        PACKAGE_CLASSES = "package_rpm package_deb package_ipk"
> >>        INCOMPATIBLE_LICENSE = '*GPLv3'
> >>        WARN_QA_remove = 'incompatible-license'
> >>        QEMU_USE_KVM = 'True'
> >>        INHERIT += 'report-error'
> >>        PREMIRRORS = ''
> >>        BB_GENERATE_MIRROR_TARBALLS = '1'
> >>        BB_NUMBER_THREADS = '16'
> >>        PARALLEL_MAKE = '-j 16'
> >>        BB_TASK_NICE_LEVEL = '5'
> >>        BB_TASK_NICE_LEVEL_task-testimage = '0'
> >>        BB_TASK_IONICE_LEVEL = '2.7'
> >>        BB_TASK_IONICE_LEVEL_task-testimage = '2.1'
> >>        INHERIT += 'testimage'
> >>        TEST_QEMUBOOT_TIMEOUT = '1500'
> >>        SANITY_TESTED_DISTROS = ''
> >>        SDK_EXT_TYPE = 'minimal'
> >>        SDK_INCLUDE_TOOLCHAIN = '1'
> >>     Command
> >>     =======
> >>     bitbake core-image-minimal core-image-full-cmdline -k
> >>
> >>
> >>     INCOMPATIBLE_LICENSE = '*GPLv3'
> >>     WARN_QA_remove = 'incompatible-license'
> >>     My doubt is since above configuration is using during build and we
> >>     are using GPLv3+ license then definetly it will report error.
> >>
> >>     It looks like you are packaging the test code/data with the main
> >> package
> >>     not in bzip2-ptest. Have a look at:
> >>          meta/recipes-support/libpcre/libpcre_8.44.bb
> >>     <http://libpcre_8.44.bb>
> >>     for an example. There are many more.
> >>     Also, if you look at oe-core.git:
> >>          $ rgrep LICENSE_ *  | grep PN
> >>     you can see many examples of sub-packages with different licenses
> >>     than the main package. One example is:
> >>          meta/recipes-support/gnutls/gnutls_3.6.13.bb
> >>     <http://gnutls_3.6.13.bb>
> >>     I hope that can address the buildbot problem but I haven't tried it
> >>     myself yet.
> >>
> >>     Explanation:
> >>     I checked, Here is packaging the test code/data in bzip2-ptest.
> >>
> /opt/opensource/build/tmp/work/mips64-poky-linux/bzip2/1.0.8-r0/packages-split/bzip2-ptest
> >>
> >>     I tried with the changes below  in the bzip2_1.0.8.bb
> >>     <http://bzip2_1.0.8.bb> file.
> >>     LICENSE = "bzip2"
> >>     LICENSE_${PN}-ptest = "GPLv3+"
> >>
> >>     WARNING: LICENSE_bzip2-ptest includes licenses (GPLv3+) that are not
> >>     listed in LICENSE
> >>     To resolve this warning i did below changes.
> >>     LICENSE = "bzip2 & GPLv3+"
> >>     LICENSE_${PN}-ptest = "GPLv3+"
> >>
> >>     But I am getting below error in both case
> >>
> >>     ERROR: Nothing RPROVIDES 'bzip2' (but
> >> /opt/opensource/poky/meta/recipes-extended/packagegroups/
> packagegroup-core-full-cmdline.bb
> >>     <http://packagegroup-core-full-cmdline.bb>,
> >> /opt/opensource/poky/meta/recipes-devtools/python/python3_3.8.2.bb
> >>     <http://python3_3.8.2.bb> RDEPENDS on or otherwise requires it)
> >>     bzip2 was skipped: it has incompatible license(s): GPL-3.0+
> >>     NOTE: Runtime target 'bzip2' is unbuildable, removing...
> >>     Missing or unbuildable dependency chain was: ['bzip2']
> >>
> >>     So as per my understanding, if we are splitting the package and
> >>     assigning Licence to it.
> >>     example:
> >>     LICENSE = "bzip2"
> >>     LICENSE_${PN}-ptest = "GPLv3+"
> >>
> >>     In this case I have to set LICENSE_PATH where your license file is
> >>     located.
> >>     or if I am using standard license, I have to set LICENSE first then
> >>     we can set LICENSE_${PN}-ptest.
> >>
> >>     Example:
> >>     LICENSE = "bzip2 & GPLv3+"
> >>     LICENSE_${PN}-ptest = "GPLv3+"
> >>
> >>     Kindly comment on it and feel free to point out if i am wrong at any
> >>     point.
> >>
> >>
> >>     *Thanks & Regards,*
> >>     Rahul Kumar
> >>     Software Engineer,Linux Solutions Engineering
> >>     Group,Montavista Software LLC
> >>     Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> >>     <https://plus.google.com/+CodeTwoSoftware>
> >>
> >>
> >>     On Fri, May 1, 2020 at 6:56 AM Randy MacLeod
> >>     <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>>
> >>     wrote:
> >>
> >>         On 2020-04-27 3:39 p.m., Alexander Kanavin wrote:
> >>          > You need to first see from the failure page which
> >>         configuration is
> >>          > failing, for example non-gpl3 is one such.
> >>          >
> >>          > Then you find that configuration in config.json. The below
> >>         should
> >>          > hopefully be self-explanatory in how you should set up the
> >> build?
> >>          >
> >>          > |"non-gpl3" : { "NEEDREPOS" : ["poky", "meta-gplv2"],
> >>         "MACHINE" :
> >>          > "qemux86", "BBTARGETS" : "core-image-minimal
> >>         core-image-full-cmdline",
> >>          > "extravars" : [ "INCOMPATIBLE_LICENSE = '*GPLv3'",
> >>         "WARN_QA_remove =
> >>          > 'incompatible-license'" ], "EXTRACMDS" : [
> >>          > "../../yocto-autobuilder-helper/scripts/check-gplv3" ] },
> >>          >
> >>          > |
> >>          >
> >>          > |
> >>          > |
> >>          >
> >>          > |Alex
> >>
> >>         Hi Rahul,
> >>
> >>         Sorry for my late reply.
> >>
> >>         The commit log for v2 is very good now!
> >>         Thanks for incorporating my --pedantic suggestions. ;-)
> >>
> >>         It seems that you need a perl dependency for something (docs?
> >>              $ cd .../bzip2.git
> >>              $ grep -r "perl " *
> >>              format.pl:#!/usr/bin/perl -w
> >>              README.XML.STUFF:It uses format.pl <http://format.pl>, a
> >>         perl script...
> >>
> >>         Then we need to figure out how to deal with the GPLv3 issue.
> >>
> >>         The buildbot output can be tedious to figure out. I haven't
> >> really
> >>         spent enough time plugging away at it to be proficient yet
> >> either.
> >>         Have you been able to reproduce the problems that Richard
> >> reported?
> >>         If not, and you've tried for a bit, then just say so and I'll
> >> try to
> >>         help tomorrow or early next week.
> >>
> >>         It looks like you are packaging the test code/data with the main
> >>         package
> >>         not in bzip2-ptest. Have a look at:
> >>              meta/recipes-support/libpcre/libpcre_8.44.bb
> >>         <http://libpcre_8.44.bb>
> >>         for an example. There are many more.
> >>         Also, if you look at oe-core.git:
> >>              $ rgrep LICENSE_ *  | grep PN
> >>         you can see many examples of sub-packages with different
> >> licenses
> >>         than the main package. One example is:
> >>              meta/recipes-support/gnutls/gnutls_3.6.13.bb
> >>         <http://gnutls_3.6.13.bb>
> >>         I hope that can address the buildbot problem but I haven't
> >> tried it
> >>         myself yet.
> >>
> >>         BTW, Trevor has gotten the YP autobuilder going at Wind River
> >> and
> >>         he'll be sending a few documentation updates next week or so.
> >>         That may help in case you want to reproduce the YP AB test
> >>         infrastructure. I expect that you don't _have_ to do so but
> >>         I think it would be good if more contributing organizations did
> >>         have an instance with only limited builders of the YP AB so that
> >>         we can do more testing before Richard runs our changes through
> >>         the main system. Richard has cautioned that the YP AB has
> >> lots of
> >>         builders each of which has many cores but I hope that we can at
> >>         least
> >>         do some AB checking ourselves.
> >>
> >>         ../Randy
> >>
> >>
> >>          > |
> >>          >
> >>          >
> >>          > On Mon, 27 Apr 2020 at 20:54, Rahul Kumar <rahulk@mvista.com
> >>         <mailto:rahulk@mvista.com>
> >>          > <mailto:rahulk@mvista.com <mailto:rahulk@mvista.com>>>
> wrote:
> >>          >
> >>          >     Hi Richard/Alexander,
> >>          >
> >>          >     I am not able to understand how I can use the below file.
> >>          >
> >>
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
> >>          >
> >>          >     did you mean to say that i have to set MACRO in
> >>         local.conf based on
> >>          >     this file.
> >>          >
> >>          >     *Thanks & Regards,*
> >>          >     Rahul Kumar
> >>          >     Software Engineer,Linux Solutions Engineering
> >>          >     Group,Montavista Software LLC
> >>          >     Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> >>         <mailto:rahulk@mvista.com <mailto:rahulk@mvista.com>>
> >>          >  <https://plus.google.com/+CodeTwoSoftware>
> >>          >
> >>          >
> >>          >     On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie
> >>          >     <richard.purdie@linuxfoundation.org
> >>         <mailto:richard.purdie@linuxfoundation.org>
> >>          >     <mailto:richard.purdie@linuxfoundation.org
> >> <mailto:richard.purdie@linuxfoundation.org>>> wrote:
> >>          >
> >>          >         On Mon, 2020-04-27 at 18:30 +0200, Alexander Kanavin
> >>         wrote:
> >>          >          > You need to look at configurations defined here:
> >>          >          >
> >>          >
> >>
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
> >>          >          > and replicate them locally. Then you can
> >> reproduce the
> >>          >         failures that
> >>          >          > the AB gets in those configurations.
> >>          >
> >>          >         That start of the failing logs on the autobuilder
> >>         also list out the
> >>          >         configuration options for that build.
> >>          >
> >>          >         Cheers,
> >>          >
> >>          >         Richard
> >>          >
> >>          >
> >>          >
> >>          >
> >>
> >>
> >>         --         # Randy MacLeod
> >>         # Wind River Linux
> >>
> >>     
> >>
> >
> >
>

--0000000000000ce10b05a58bc13c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi=C2=A0Trevor,</div><div class=3D"gmail_default"=
 style=3D"font-family:verdana,sans-serif;color:#0b5394"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b5394">=
It will be really helpful to me.But I don&#39;t have a Fedora system with m=
e.</div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-seri=
f;color:#0b5394">I have only Ubuntu System.<br></div><div class=3D"gmail_de=
fault" style=3D"font-family:verdana,sans-serif;color:#0b5394"><br></div><di=
v class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b=
5394">I am available on #oe IRC Channels.</div><div class=3D"gmail_default"=
 style=3D"font-family:verdana,sans-serif;color:#0b5394"><br></div><div><div=
 dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><span style=3D"c=
olor:rgb(111,168,220)">	=09
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
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 13=
, 2020 at 7:58 PM Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windr=
iver.com">trevor.gamblin@windriver.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br>
On 5/12/20 7:22 PM, Randy MacLeod wrote:<br>
&gt; On 2020-05-12 12:58 a.m., Rahul Kumar wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; Can any one please help me to figure out how to deal with the GPL=
v3+ <br>
&gt;&gt; issue.<br>
&gt;&gt;<br>
&gt;&gt; you can see my Patch at below link<br>
&gt;&gt; <a href=3D"https://patchwork.openembedded.org/patch/172134/" rel=
=3D"noreferrer" target=3D"_blank">https://patchwork.openembedded.org/patch=
/172134/</a><br>
&gt;&gt;<br>
&gt;&gt; *Issue:*<br>
&gt;&gt; the new license (GPLv3) causes problems:<br>
&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/75/builds/1814" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/75/builds/1814</a><br>
&gt;&gt; *<br>
&gt;&gt; *<br>
&gt;<br>
&gt; Hi Rahul,<br>
&gt;<br>
&gt; I&#39;m having some email problems with the oe-core list so apologies=
<br>
&gt; if this is redundant.<br>
&gt;<br>
&gt; What happens if you split the license info into two parts like:<br>
&gt;<br>
&gt; $ grep &quot;^LICENSE&quot; recipes-extended/libvirt/<a href=3D"http:=
//libvirt_6.1.0.bb" rel=3D"noreferrer" target=3D"_blank">libvirt_6.1.0.bb</=
a><br>
&gt; LICENSE =3D &quot;LGPLv2.1+ &amp; GPLv2+&quot;<br>
&gt; LICENSE_${PN}-ptest =3D &quot;GPLv2+ &amp; LGPLv2.1+&quot;<br>
&gt; except of course with GPLv3.<br>
&gt;<br>
&gt; I might try that tomorrow on our local instance of the YP autobuilder=
.<br>
&gt; If you&#39;d like to set one up @ mvista, I hear from Trevor that it =
doesn&#39;t<br>
&gt; take all that much time. As others have explained, you can also dig<b=
r>
&gt; through the yocto-autobuilder2/yocto-autobuilder-helper git repos.<br=
>
<br>
Hi Rahul, I can definitely help you get an autobuilder instance running <b=
r>
locally, if you&#39;d like. At the moment I&#39;d suggest doing so on a ho=
st <br>
that&#39;s running Fedora, as that&#39;s where I&#39;ve had the most succe=
ss <br>
(Richard has explained to me how they run it on Ubuntu, but I haven&#39;t =
<br>
gotten it fully functional there yet).<br>
<br>
Are you on either the #yocto and/or #oe IRC channels?<br>
<br>
&gt;<br>
&gt; ../Randy<br>
&gt;<br>
&gt;&gt; Thanks &amp; Regards,<br>
&gt;&gt; Rahul Kumar<br>
&gt;&gt; Software Engineer,Linux Solutions Engineering<br>
&gt;&gt; Group,Montavista Software LLC<br>
&gt;&gt; Email Id: <a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">=
rahulk@mvista.com</a> &lt;mailto:<a href=3D"mailto:rahulk@mvista.com" targe=
t=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt;&gt; &lt;<a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"n=
oreferrer" target=3D"_blank">https://plus.google.com/+CodeTwoSoftware</a>&g=
t;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Wed, May 6, 2020 at 4:47 PM Rahul Kumar via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> <br>
&gt;&gt; &lt;<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" =
target=3D"_blank">http://lists.openembedded.org</a>&gt; <br>
&gt;&gt; &lt;rahulk=3D<a href=3D"mailto:mvista.com@lists.openembedded.org"=
 target=3D"_blank">mvista.com@lists.openembedded.org</a> <br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:mvista.com@lists.openembedded.org" t=
arget=3D"_blank">mvista.com@lists.openembedded.org</a>&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Hi Randy,<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 As per your suggestion I did some progress.<br=
>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Issue 1:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Configuration for this issue:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 MACHINE =3D &quot;edgerouter&quot=
;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 DISTRO =3D &quot;poky&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDKMACHINE =3D &quot;i686&quot;<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PACKAGE_CLASSES =3D &quot;package=
_rpm package_deb package_ipk&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INHERIT +=3D &#39;image-buildinfo=
&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 IMAGE_BUILDINFO_VARS_append =3D &=
#39; IMAGE_BASENAME IMAGE_NAME&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 QEMU_USE_KVM =3D &#39;True&#39;<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INHERIT +=3D &#39;report-error&#3=
9;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PREMIRRORS =3D &#39;&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_GENERATE_MIRROR_TARBALLS =3D &=
#39;1&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_NUMBER_THREADS =3D &#39;16&#39=
;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PARALLEL_MAKE =3D &#39;-j 16&#39;=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_NICE_LEVEL =3D &#39;5&#39=
;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_NICE_LEVEL_task-testimage=
 =3D &#39;0&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_IONICE_LEVEL =3D &#39;2.7=
&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_IONICE_LEVEL_task-testima=
ge =3D &#39;2.1&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INHERIT +=3D &#39;testimage&#39;<=
br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 TEST_QEMUBOOT_TIMEOUT =3D &#39;15=
00&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SANITY_TESTED_DISTROS =3D &#39;&#=
39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDK_EXT_TYPE =3D &#39;minimal&#39=
;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDK_INCLUDE_TOOLCHAIN =3D &#39;1&=
#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Command:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 bitbake core-image-sato core-image-sato-dev co=
re-image-sato-sdk<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 core-image-minimal core-image-minimal-dev core=
-image-sato-ptest<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 core-image-sato:do_populate_sdk -k<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 but could not reproduce the issue.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 work-around to reproduce this issue.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 I am observing since bzip2-tests is a git repo=
 and<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 fsmonitor-watchman.sample (.git/hooks/fsmonito=
r-watchman.sample) is<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 perl script.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 that&#39;s why I got this error.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0so manually I copied fsmonitor-wat=
chman.sample file into the<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 bzip2-tests/.git/hooks and able to reproduce t=
he issue.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Error:<br>
&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/62/builds/1816" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/62/builds/1816</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: Q=
A Issue:<br>
&gt;&gt; /usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/fsmonitor-watchman.sa=
mple <br>
&gt;&gt; contained<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 in package bzip2-ptest requires /usr/bin/perl,=
 but no providers<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 found in RDEPENDS_bzip2-ptest? [file-rdeps]<br=
>
&gt;&gt; =C2=A0=C2=A0=C2=A0 step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: Q=
A run found fatal<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 errors. Please consider fixing them.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 I find out the solution by appending RDEPENDS_=
${PN}-ptest with perl.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 RDEPENDS_${PN}-ptest +=3D &quot;make bash perl=
&quot;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 so this issue got resolved.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Issue2:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Configuration for this issue<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 MACHINE =3D &quot;qemux86&quot;<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 DISTRO =3D &quot;poky&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDKMACHINE =3D &quot;i686&quot;<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PACKAGE_CLASSES =3D &quot;package=
_rpm package_deb package_ipk&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INCOMPATIBLE_LICENSE =3D &#39;*GP=
Lv3&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 WARN_QA_remove =3D &#39;incompati=
ble-license&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 QEMU_USE_KVM =3D &#39;True&#39;<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INHERIT +=3D &#39;report-error&#3=
9;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PREMIRRORS =3D &#39;&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_GENERATE_MIRROR_TARBALLS =3D &=
#39;1&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_NUMBER_THREADS =3D &#39;16&#39=
;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 PARALLEL_MAKE =3D &#39;-j 16&#39;=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_NICE_LEVEL =3D &#39;5&#39=
;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_NICE_LEVEL_task-testimage=
 =3D &#39;0&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_IONICE_LEVEL =3D &#39;2.7=
&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 BB_TASK_IONICE_LEVEL_task-testima=
ge =3D &#39;2.1&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 INHERIT +=3D &#39;testimage&#39;<=
br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 TEST_QEMUBOOT_TIMEOUT =3D &#39;15=
00&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SANITY_TESTED_DISTROS =3D &#39;&#=
39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDK_EXT_TYPE =3D &#39;minimal&#39=
;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 SDK_INCLUDE_TOOLCHAIN =3D &#39;1&=
#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Command<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 bitbake core-image-minimal core-image-full-cmd=
line -k<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 INCOMPATIBLE_LICENSE =3D &#39;*GPLv3&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 WARN_QA_remove =3D &#39;incompatible-license&#=
39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 My doubt is since above configuration is using=
 during build and we<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 are using GPLv3+ license then definetly it wil=
l report error.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 It looks like you are packaging the test code/=
data with the main <br>
&gt;&gt; package<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 not in bzip2-ptest. Have a look at:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 meta/recipes-support/libpc=
re/<a href=3D"http://libpcre_8.44.bb" rel=3D"noreferrer" target=3D"_blank">=
libpcre_8.44.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://libpcre_8.44.bb" rel=3D"=
noreferrer" target=3D"_blank">http://libpcre_8.44.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 for an example. There are many more.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Also, if you look at oe-core.git:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 $ rgrep LICENSE_ * =C2=A0|=
 grep PN<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 you can see many examples of sub-packages with=
 different licenses<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 than the main package. One example is:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 meta/recipes-support/gnutl=
s/<a href=3D"http://gnutls_3.6.13.bb" rel=3D"noreferrer" target=3D"_blank">=
gnutls_3.6.13.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://gnutls_3.6.13.bb" rel=3D=
"noreferrer" target=3D"_blank">http://gnutls_3.6.13.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 I hope that can address the buildbot problem b=
ut I haven&#39;t tried it<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 myself yet.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Explanation:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 I checked, Here is packaging the test code/dat=
a in bzip2-ptest.<br>
&gt;&gt; /opt/opensource/build/tmp/work/mips64-poky-linux/bzip2/1.0.8-r0/p=
ackages-split/bzip2-ptest<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 I tried with the changes below=C2=A0 in the <a=
 href=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">bzip2_=
1.0.8.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://bzip2_1.0.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://bzip2_1.0.8.bb</a>&gt; file.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 LICENSE =3D &quot;bzip2&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 LICENSE_${PN}-ptest =3D &quot;GPLv3+&quot;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 WARNING: LICENSE_bzip2-ptest includes licenses=
 (GPLv3+) that are not<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 listed in LICENSE<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 To resolve this warning i did below changes.<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 LICENSE =3D &quot;bzip2 &amp; GPLv3+&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 LICENSE_${PN}-ptest =3D &quot;GPLv3+&quot;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 But I am getting below error in both case<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 ERROR: Nothing RPROVIDES &#39;bzip2&#39; (but<=
br>
&gt;&gt; /opt/opensource/poky/meta/recipes-extended/packagegroups/<a href=
=3D"http://packagegroup-core-full-cmdline.bb" rel=3D"noreferrer" target=3D=
"_blank">packagegroup-core-full-cmdline.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://packagegroup-core-full-c=
mdline.bb" rel=3D"noreferrer" target=3D"_blank">http://packagegroup-core-fu=
ll-cmdline.bb</a>&gt;,<br>
&gt;&gt; /opt/opensource/poky/meta/recipes-devtools/python/<a href=3D"http=
://python3_3.8.2.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb<=
/a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://python3_3.8.2.bb" rel=3D=
"noreferrer" target=3D"_blank">http://python3_3.8.2.bb</a>&gt; RDEPENDS on =
or otherwise requires it)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 bzip2 was skipped: it has incompatible license=
(s): GPL-3.0+<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 NOTE: Runtime target &#39;bzip2&#39; is unbuil=
dable, removing...<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Missing or unbuildable dependency chain was: [=
&#39;bzip2&#39;]<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 So as per my understanding, if we are splittin=
g the package and<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 assigning Licence to it.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 example:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 LICENSE =3D &quot;bzip2&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 LICENSE_${PN}-ptest =3D &quot;GPLv3+&quot;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 In this case I have to set LICENSE_PATH where =
your license file is<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 located.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 or if I am using standard license, I have to s=
et LICENSE first then<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 we can set LICENSE_${PN}-ptest.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Example:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 LICENSE =3D &quot;bzip2 &amp; GPLv3+&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 LICENSE_${PN}-ptest =3D &quot;GPLv3+&quot;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Kindly comment on it and feel free to point ou=
t if i am wrong at any<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 point.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 *Thanks &amp; Regards,*<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Rahul Kumar<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Software Engineer,Linux Solutions Engineering<=
br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Group,Montavista Software LLC<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Email Id: <a href=3D"mailto:rahulk@mvista.com"=
 target=3D"_blank">rahulk@mvista.com</a> &lt;mailto:<a href=3D"mailto:rahul=
k@mvista.com" target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"https://plus.google.com/+CodeTw=
oSoftware" rel=3D"noreferrer" target=3D"_blank">https://plus.google.com/+Co=
deTwoSoftware</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 On Fri, May 1, 2020 at 6:56 AM Randy MacLeod<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"mailto:randy.macleod@windriver.=
com" target=3D"_blank">randy.macleod@windriver.com</a> &lt;mailto:<a href=
=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@wi=
ndriver.com</a>&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 wrote:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 On 2020-04-27 3:39 p.m=
., Alexander Kanavin wrote:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; You need to=
 first see from the failure page which<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configuration is<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; failing, fo=
r example non-gpl3 is one such.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; Then you fi=
nd that configuration in config.json. The below<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; hopefully b=
e self-explanatory in how you should set up the <br>
&gt;&gt; build?<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; |&quot;non-=
gpl3&quot; : { &quot;NEEDREPOS&quot; : [&quot;poky&quot;, &quot;meta-gplv2&=
quot;],<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;MACHINE&quot; :<=
br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; &quot;qemux=
86&quot;, &quot;BBTARGETS&quot; : &quot;core-image-minimal<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 core-image-full-cmdlin=
e&quot;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; &quot;extra=
vars&quot; : [ &quot;INCOMPATIBLE_LICENSE =3D &#39;*GPLv3&#39;&quot;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;WARN_QA_remove =
=3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; &#39;incomp=
atible-license&#39;&quot; ], &quot;EXTRACMDS&quot; : [<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; &quot;../..=
/yocto-autobuilder-helper/scripts/check-gplv3&quot; ] },<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; |<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; |<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; |<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; |Alex<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hi Rahul,<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Sorry for my late repl=
y.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The commit log for v2 =
is very good now!<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thanks for incorporati=
ng my --pedantic suggestions. ;-)<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It seems that you need=
 a perl dependency for something (docs?<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 $ =
cd .../bzip2.git<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 $ =
grep -r &quot;perl &quot; *<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 fo=
rmat.pl:#!/usr/bin/perl -w<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 RE=
ADME.XML.STUFF:It uses <a href=3D"http://format.pl" rel=3D"noreferrer" targ=
et=3D"_blank">format.pl</a> &lt;<a href=3D"http://format.pl" rel=3D"norefer=
rer" target=3D"_blank">http://format.pl</a>&gt;, a<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perl script...<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Then we need to figure=
 out how to deal with the GPLv3 issue.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The buildbot output ca=
n be tedious to figure out. I haven&#39;t <br>
&gt;&gt; really<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spent enough time plug=
ging away at it to be proficient yet <br>
&gt;&gt; either.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Have you been able to =
reproduce the problems that Richard <br>
&gt;&gt; reported?<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If not, and you&#39;ve=
 tried for a bit, then just say so and I&#39;ll <br>
&gt;&gt; try to<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help tomorrow or early=
 next week.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It looks like you are =
packaging the test code/data with the main<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not in bzip2-ptest. Ha=
ve a look at:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 me=
ta/recipes-support/libpcre/<a href=3D"http://libpcre_8.44.bb" rel=3D"norefe=
rrer" target=3D"_blank">libpcre_8.44.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://=
libpcre_8.44.bb" rel=3D"noreferrer" target=3D"_blank">http://libpcre_8.44.b=
b</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for an example. There =
are many more.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Also, if you look at o=
e-core.git:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 $ =
rgrep LICENSE_ *=C2=A0 | grep PN<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 you can see many examp=
les of sub-packages with different <br>
&gt;&gt; licenses<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 than the main package.=
 One example is:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 me=
ta/recipes-support/gnutls/<a href=3D"http://gnutls_3.6.13.bb" rel=3D"norefe=
rrer" target=3D"_blank">gnutls_3.6.13.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://=
gnutls_3.6.13.bb" rel=3D"noreferrer" target=3D"_blank">http://gnutls_3.6.13=
.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I hope that can addres=
s the buildbot problem but I haven&#39;t <br>
&gt;&gt; tried it<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 myself yet.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BTW, Trevor has gotten=
 the YP autobuilder going at Wind River <br>
&gt;&gt; and<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 he&#39;ll be sending a=
 few documentation updates next week or so.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 That may help in case =
you want to reproduce the YP AB test<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 infrastructure. I expe=
ct that you don&#39;t _have_ to do so but<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I think it would be go=
od if more contributing organizations did<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 have an instance with =
only limited builders of the YP AB so that<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 we can do more testing=
 before Richard runs our changes through<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the main system. Richa=
rd has cautioned that the YP AB has <br>
&gt;&gt; lots of<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 builders each of which=
 has many cores but I hope that we can at<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 least<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do some AB checking ou=
rselves.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ../Randy<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; |<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; On Mon, 27 =
Apr 2020 at 20:54, Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com" tar=
get=3D"_blank">rahulk@mvista.com</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;mailto:<a href=3D"=
mailto:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; &lt;mailto:=
<a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a=
> &lt;mailto:<a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahulk@=
mvista.com</a>&gt;&gt;&gt; wrote:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0Hi Richard/Alexander,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0I am not able to understand how I can use the below file.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobu=
ilder-helper/tree/config.json" rel=3D"noreferrer" target=3D"_blank">http://=
git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.jso=
n</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0did you mean to say that i have to set MACRO in<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local.conf based on<br=
>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0this file.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0*Thanks &amp; Regards,*<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0Rahul Kumar<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0Software Engineer,Linux Solutions Engineering<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0Group,Montavista Software LLC<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0Email Id: <a href=3D"mailto:rahulk@mvista.com" target=3D"_blank"=
>rahulk@mvista.com</a> &lt;mailto:<a href=3D"mailto:rahulk@mvista.com" targ=
et=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;mailto:<a href=3D"=
mailto:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a> &lt;mailt=
o:<a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com<=
/a>&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt; =C2=A0&lt;<=
a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noreferrer" targ=
et=3D"_blank">https://plus.google.com/+CodeTwoSoftware</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=
=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;mailto:<a href=3D"=
mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie=
@linuxfoundation.org</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
 target=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundation.org" =
target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;&gt;&gt; wrote:=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 2020-04-27 at 18:30 +0200, Alexander Kanav=
in<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wrote:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &gt; You need to look at configurations defined h=
ere:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobu=
ilder-helper/tree/config.json" rel=3D"noreferrer" target=3D"_blank">http://=
git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.jso=
n</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &gt; and replicate them locally. Then you can <br=
>
&gt;&gt; reproduce the<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0failures that<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &gt; the AB gets in those configurations.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0That start of the failing logs on the autobuilder<=
br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 also list out the<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0configuration options for that build.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Richard<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -- =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # Randy MacLeod<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Wind River Linux<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 <br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--0000000000000ce10b05a58bc13c--
