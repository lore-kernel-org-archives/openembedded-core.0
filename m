Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcNA-0006sR-6Y
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 09:56:20 +0200
Received: by pvc30 with SMTP id 30so1799429pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 00:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=LMbyCaWEJfyCkDCFmVCS57QYYCaOx3nUC7NgaY9uJU8=;
	b=kvQMDqSZNLg33OHyTmuxQwZOSuOCMgCYAAoYyD95BzHehoA5wm8GVsP9rrAU9S8f8e
	3sYtYCXgAfptrY+rw1n2/zyOcmUmbeS2T17gvxKk7d+7dSSABLKCanDVQro/vqP6nEbf
	3d7pBOSF54GR+JxC8pAoA2IIlSZc76QZQkPDc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=Ygj6knC1u0LyNwgwzychPLw+IkDWVGW4gD3JkOhIUnhduWxWj7PVIlYC2MsZ5HRxw3
	W0uJjyS/0NzQvTwMEoSnscNi7LZXZcz7LtJVjz4/iQDisT8imC1G7urhm2suVmCu8R+h
	YGANZmxrIk9w/h56EoQZVeLLiC871QuytBVKQ=
Received: by 10.68.37.72 with SMTP id w8mr6005356pbj.263.1304754817066;
	Sat, 07 May 2011 00:53:37 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 8sm2678783pbw.23.2011.05.07.00.53.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 00:53:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat,  7 May 2011 00:53:32 -0700
Message-Id: <cover.1304754527.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/8] Misc patches
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
X-List-Received-Date: Sat, 07 May 2011 07:56:20 -0000

This patchset addresses few issues remaining for uclibc support
and fixes some recipes which need patches to get compiling on
uclibc systems.

Replacing gconf-dbus with gconf is needed for ansgstrom to build
SDK images since in angstrom gconf-dbus is provided by gconf

we docuement the variable definions inside layer.conf

send-pull-request is fixed to CC only concerned folks per patch bases
and not collect all addresses and CC them on all assorted patches

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/misc-fixes
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (8):
  recipes: Replace gconf-dbus with gconf
  gcc-4.6.0: Apply linaro patches
  gettext.bbclass, bitbake.conf: Append nls options to EXTRA_OECONF
    instead of +=
  conf/layer.conf: Use .= to append to BBPATH and =+ for BBFILES
  libgalago_0.5.2.bb: Fix compile for uclibc
  liburcu_0.5.4.bb: Let it build on uclibc targets
  lttng-ust_0.12.bb: Fix compilation on uclibc
  scripts/send-pull-request: Add CC selectively

 .../recipes-gnome/gnome/libgnomekbd_2.26.0.bb      |    2 +-
 meta/classes/gettext.bbclass                       |    6 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/layer.conf                               |   13 +-
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    4 +
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    4 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch  |   51 ++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch  |   63 ++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch  |   32 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch  |   28 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch  |  653 ++++++++++++++++++++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch  |  126 ++++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch  |  177 ++++++
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    9 +
 meta/recipes-gnome/gnome/gnome-desktop.inc         |    2 +-
 meta/recipes-gnome/gthumb/gthumb_2.12.2.bb         |    2 +-
 meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    2 +-
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |   50 ++
 meta/recipes-kernel/lttng/lttng-ust_0.12.bb        |    4 +-
 meta/recipes-support/libproxy/libproxy_0.4.6.bb    |    2 +-
 meta/recipes-support/liburcu/liburcu_0.5.4.bb      |    2 +-
 scripts/send-pull-request                          |   51 +-
 22 files changed, 1249 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch

-- 
1.7.4.1



