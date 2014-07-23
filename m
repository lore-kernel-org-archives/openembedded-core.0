Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EAD3670761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 09:06:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6N95ed0000806; Wed, 23 Jul 2014 10:06:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VSn9a26FgF8d; Wed, 23 Jul 2014 10:06:03 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6N961V6001886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 23 Jul 2014 10:06:02 +0100
Message-ID: <1406106360.22985.111.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 23 Jul 2014 10:06:00 +0100
In-Reply-To: <53CF7935.5070000@windriver.com>
References: <cover.1406022752.git.liezhi.yang@windriver.com>
	<CAAQYJAtLih10k7o+8OiR2AbijfSwj=JoNjBTeqmyGXrorWy+mA@mail.gmail.com>
	<53CE61AB.3060706@windriver.com>
	<CAAQYJAtUm680-C_vDLPaeGQvNkfw5MkYmRRaN-S3pWG5AUYCxw@mail.gmail.com>
	<53CF7935.5070000@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/40 V2] fix rdepends on bash perl and python
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
X-List-Received-Date: Wed, 23 Jul 2014 09:06:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-07-23 at 16:58 +0800, Robert Yang wrote:
> 
> On 07/23/2014 03:46 PM, Andrea Adami wrote:
> > On Tue, Jul 22, 2014 at 3:05 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> >>
> >>
> >> On 07/22/2014 08:37 PM, Andrea Adami wrote:
> >>>
> >>> On Tue, Jul 22, 2014 at 12:14 PM, Robert Yang <liezhi.yang@windriver.com>
> >>> wrote:
> >>>>
> >>>> Note:
> >>>> I put PATCH 3 to PATCH 40 in one email to avoid flushing the mailing
> >>>> list, I'd
> >>>> like to put them into one patch, but I have to write the reason one by
> >>>> one.
> >>>> Please get the commits from the repo.
> >>>>
> >>>> * V2: (Fixed comments from RP)
> >>>>     - Add bash-native to ASSUME_PROVIDED
> >>>>     - Use RDEPENDS_${PN} rather than RDEPENDS_${PN}_class-target
> >>>>
> >>>> * V1:
> >>>>     - Initial version
> >>>>
> >>>> // Robert
> >>>>
> >>>> The following changes since commit
> >>>> 6bc3696d8451a23d743daf03ee98c4ba54ce4551:
> >>>>
> >>>>     wget: Remove unneeded DEPENDS line (2014-07-21 19:10:30 +0100)
> >>>>
> >>>> are available in the git repository at:
> >>>>
> >>>>     git://git.openembedded.org/openembedded-core-contrib rbt/fixrdeps
> >>>>
> >>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/filedep
> >>>>
> >>>> Robert Yang (40):
> >>>>     bitbake.conf: add bash-native to ASSUME_PROVIDED
> >>>>     kernel.bbclass: add perl python bash to RDEPENDS_kernel-dev
> >>>>     groff: add perl to RDEPENDS_groff
> >>>>     attr: add perl to RDEPENDS_attr-ptest
> >>>>     git: add perl to RDEPENDS_gitweb
> >>>>     syslinux: add perl to RDEPENDS_syslinux-misc
> >>>>     texi2html: add perl to RDEPENDS_texi2html
> >>>>     gst-plugins-package: add perl to RDEPENDS_gst-plugins-base-apps
> >>>>     foomatic-filters: add perl to RDEPENDS_foomatic-filters
> >>>>     icon-naming-utils: add perl to RDEPENDS_icon-naming-utils
> >>>>     rpm: add perl to RDEPENDS_rpm-build
> >>>>     opensp: add perl to RDEPENDS_opensp
> >>>>     aspell: add perl to RDEPENDS_aspell-utils
> >>>>     glib-2.0: add perl to RDEPENDS_glib-2.0-utils
> >>>>     lttng-tools: add perl bash python to RDEPENDS_lttng-tools-ptest
> >>>>     quilt: add bash and perl to RDEPENDS
> >>>>     udev: add perl to RDEPENDS_udev-ptest
> >>>>     apt: add bash to RDEPENDS_apt
> >>>>     lsbtest: add bash to RDEPENDS_lsbtest
> >>>>     oprofile: add bash to RDEPENDS_oprofile-ptest
> >>>>     pax-utils: add bash to RDEPENDS_pax-utils
> >>>>     gzip: add bash to RDEPENDS_gzip
> >>>>     dtc: add bash to RDEPENDS_dtc
> >>>>     pm-utils: add bash to RDEPENDS_pm-utils
> >>>>     grep: add bash to RDEPENDS_grep
> >>>>     kconfig-frontends: add bash to RDEPENDS_kconfig-frontends
> >>>>     xz: add bash to RDEPENDS_xz
> >>>>     libpam: add bash to RDEPENDS_libpam-xtests
> >>>>     valgrind: add bash to RDEPENDS_valgrind-ptest
> >>>>     ltp: add bash and python to RDEPENDS_ltp
> >>>>     piglit: add bash to RDEPENDS_piglit
> >>>>     usbutils: add python to RDEPENDS_usbutils
> >>>>     libxml2: add python to RDEPENDS_libxml2-ptest
> >>>>     builder: add python to RDEPENDS_builder
> >>>>     lttng-ust: add python to RDEPENDS_lttng-ust-bin
> >>>>     libevent: add python to RDEPENDS_libevent
> >>>>     gconf: add python to RDEPENDS_gconf
> >>>>     blktrace: add python to RDEPENDS_blktrace
> >>>>     dpkg: add perl to RDEPENDS_perl
> >>>>     gnu-config: add perl to RDEPENDS_gnu-config
> >>>>
> >>>>    meta/classes/kernel.bbclass                        |    1 +
> >>>>    meta/conf/bitbake.conf                             |    1 +
> >>>>    meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |    2 +-
> >>>>    meta/recipes-bsp/usbutils/usbutils_007.bb          |    2 +-
> >>>>    meta/recipes-core/glib-2.0/glib.inc                |    2 ++
> >>>>    meta/recipes-core/libxml/libxml2.inc               |    2 ++
> >>>>    meta/recipes-core/udev/udev.inc                    |    2 +-
> >>>>    meta/recipes-devtools/apt/apt_0.9.9.4.bb           |    2 +-
> >>>>    meta/recipes-devtools/dpkg/dpkg.inc                |    2 +-
> >>>>    meta/recipes-devtools/git/git.inc                  |    2 +-
> >>>>    .../gnu-config/gnu-config_20120814.bb              |    2 ++
> >>>>    meta/recipes-devtools/gnu-config/gnu-config_git.bb |    2 ++
> >>>>    .../icon-naming-utils/icon-naming-utils_0.8.90.bb  |    2 ++
> >>>>    .../kconfig-frontends_3.12.0.0.bb                  |    2 ++
> >>>>    meta/recipes-devtools/opensp/opensp_1.5.2.bb       |    2 ++
> >>>>    meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb |    2 ++
> >>>>    meta/recipes-devtools/quilt/quilt-0.63.inc         |    5 +++--
> >>>>    meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    4 +---
> >>>>    meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    4 +---
> >>>>    meta/recipes-devtools/syslinux/syslinux_6.01.bb    |    1 +
> >>>>    meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |    2 +-
> >>>>    .../foomatic/foomatic-filters_4.0.17.bb            |    2 ++
> >>>>    meta/recipes-extended/grep/grep_2.19.bb            |    2 ++
> >>>>    meta/recipes-extended/groff/groff_1.22.2.bb        |    2 ++
> >>>>    meta/recipes-extended/gzip/gzip.inc                |    2 ++
> >>>>    meta/recipes-extended/lsb/lsbtest_1.0.bb           |    2 +-
> >>>>    meta/recipes-extended/ltp/ltp_20140422.bb          |    2 +-
> >>>>    meta/recipes-extended/pam/libpam_1.1.6.bb          |   12 ++++++++++--
> >>>>    meta/recipes-extended/texi2html/texi2html_5.0.bb   |    2 ++
> >>>>    meta/recipes-extended/xz/xz_5.1.3alpha.bb          |    2 ++
> >>>>    meta/recipes-gnome/gnome/gconf_3.2.6.bb            |    2 +-
> >>>>    meta/recipes-graphics/builder/builder_0.1.bb       |    2 +-
> >>>>    meta/recipes-graphics/piglit/piglit_git.bb         |    5 ++++-
> >>>>    meta/recipes-kernel/blktrace/blktrace_git.bb       |    2 ++
> >>>>    meta/recipes-kernel/dtc/dtc.inc                    |    1 +
> >>>>    meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb     |    2 +-
> >>>>    meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb     |    2 +-
> >>>>    meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb       |    2 +-
> >>>>    meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb       |    1 +
> >>>>    meta/recipes-kernel/oprofile/oprofile.inc          |    2 ++
> >>>>    .../gstreamer/gst-plugins-package.inc              |    1 +
> >>>>    meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    2 ++
> >>>>    meta/recipes-support/attr/attr.inc                 |    2 +-
> >>>>    meta/recipes-support/libevent/libevent_2.0.21.bb   |    2 ++
> >>>>    44 files changed, 76 insertions(+), 26 deletions(-)
> >>>>
> >>>> --
> >>>> 1.7.9.5
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >>>
> >>>
> >>> Hi Robert,
> >>>
> >>> many thanks for having looked at the issue in [YOCTO #1662].
> >>>
> >>> Having to deal with size-contrained devices I immediately noticed that
> >>> practically if we apply this patchset we risk to add bash (and perl &
> >>> python in lesser extent) to the normal images we build.
> >>
> >>
> >> If you use the rpm backend, the python/perl/bash dependencies should already
> >> be there with or without these patches since the rpm can scan the depends
> >> of bash/perl/python and install it, these patches should not affect the
> >> image's size.
> >>
> >> If you use dpkg or ipkg backend, they can't work even they are installed
> >> since lacks of interprets.
> >>
> >
> > Hello,
> >
> > FWIW I use opkg / ipk packages.
> > I'm pretty sure we deploy images since years able to upgrade and
> > update, without python/perl/bash.
> >
> >>
> >>>
> >>> I cannot imagine offhand why i.e. gzip/xz are rdepending on bash.
> >>
> >>
> >> For gzip, it is because:
> >>
> >>
> >> Subject: [PATCH 22/40] gzip: add bash to RDEPENDS_gzip
> >>
> >> Bash scripts:
> >> gzip/bin/zcat.gzip
> >> gzip/bin/gunzip.gzip
> >> gzip/bin/uncompress
> >> gzip/usr/bin/zfgrep
> >> gzip/usr/bin/gzexe
> >> gzip/usr/bin/zdiff
> >> gzip/usr/bin/zegrep
> >> gzip/usr/bin/zforce
> >> gzip/usr/bin/zmore
> >> gzip/usr/bin/zcmp
> >> gzip/usr/bin/zless
> >> gzip/usr/bin/znew
> >> gzip/usr/bin/zgrep
> >>
> >> [YOCTO #1662]
> >>
> >> I've looked at the files, there is a #!/bin/bash in the header, I've listed
> >> the files which require python, perl and bash in each commit message.
> >>
> >
> > I'm sorry I don't have time this week to look thoroughly, just giving
> > a glimpse to the sources however reveals:
> >
> > http://git.savannah.gnu.org/cgit/gzip.git/tree/zcat.in
> > #!/bin/sh
> > # Uncompress files to standard output.
> > ...
> >
> > so I don't see explicitely bash.
> >
> 
> It is #!/bin/sh in zcat.in, but #!/bin/bash in zcat since it will change
> the #!/bin/sh to the $SHELL (one of sh bash ksh sh5), and the AC_PROG_SHELL
> prog will get the value of SHELL, Seems that the AC_PROG_SHELL checks the
> host's /bin and /usr/bin, I will try to fix the AC_PROG_SHELL.
> I will verify whether other files have the similar issues.

A better fix for this case would be to force SHELL to /bin/sh rather
than DEPEND on bash...

Cheers,

Richard


