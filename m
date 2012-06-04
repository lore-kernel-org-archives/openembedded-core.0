Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Sbajl-0007Vw-97
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 19:06:37 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga11.intel.com with ESMTP/TLS/RC4-MD5; 04 Jun 2012 09:56:11 -0700
Received: by dano14 with SMTP id o14so5862343dan.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 09:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=ohTeMZJ1+8m+IKBMP/tPBo5bb3wI9eWr9JnrOgrnXxo=;
	b=PhtJe88vZLyHMdYh0CV/8pk0Lg5Br1TWbgVmlq1SahCgaQzHPzRITvGyO3DsxKp4qa
	g6w6i5jQXMJXqt2csbrVgDn/BKKntvdBiQ8CxqeXzzM2MwW0sWKBnUc/0aNymuMFx7SZ
	ro82AYUTk5Qs2Potyf6RoRa4zPvL8xcWsWFZbEWCr27mB+mc2xHOk8fetjlvD8jDMZlT
	31zxBDvxVkW4D2Ki6WpT4WEplrelXP5Ptz2EHJv6BkVQHS/dbYcZyX0XRNtrqxsULwE2
	Ocgof9KtKTdj9+IP+DDKb4N+D/z3GOKGr29fAj2fj6+dUWlbAtxafyTRAq464TBTb+TE
	KICw==
Received: by 10.68.232.161 with SMTP id tp1mr41131897pbc.44.1338828970619;
	Mon, 04 Jun 2012 09:56:10 -0700 (PDT)
Received: from [0.0.0.0] (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
	by mx.google.com with ESMTPS id pe2sm13831488pbc.59.2012.06.04.09.56.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 09:56:09 -0700 (PDT)
Message-ID: <4FCCE8B8.7020705@intel.com>
Date: Mon, 04 Jun 2012 09:56:24 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	richard.purdie@linuxfoundation.org
X-Gm-Message-State: ALoCoQntjqu2YIX0/YS15u3rFZTXjbMWP6B89EtCNug1yKgNjtxdtDsAvlFWMOjGQOrCdrX6tE6F
Subject: [Consolidated Pull 00/19] General pull request
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
X-List-Received-Date: Mon, 04 Jun 2012 17:06:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard,

These patches have been tested on the autobuilder with no introduced issues.

I've excluded Mark's RPM update until we figure out why it's failing
do_populate_sdk as well as Cristian Iorga's ltp patch which breaks ltp
do_compiles.

I seem to be having issues posting to the OE-core list from
git-send-mail, so this
is being sent outside of git-send-mail.

-b

The following changes since commit de4cdfd6bc1280ac7ac0559b87734d26294ef773:

  documentation/kernel-manual/kernel-how-to.xml: Updated to kernel 3.4
(2012-05-31 21:16:55 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib stage/eflanagan_mut
 
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stage/eflanagan_mut

Christopher Larson (3):
  external-sourcery: extract src and dest sysroot paths from gcc
  tcmode-external-sourcery: pass -msgxx-glibc for x86
  external-sourcery-toolchain: forcibly create usr/lib

Elizabeth Flanagan (3):
  license.bbclass: Adding PV to package.manifest
  license.bbclass: optimize pkg runtime data
  lsbinitscripts: Missing popt DEPENDS

Laurentiu Palcu (2):
  directfb: upgrade to 1.5.3
  directfb-examples: upgrade to 1.5.3

Radu Moisan (1):
  dbus: update to version 1.4.20

Robert Yang (3):
  kernel.py: replace os.popen with subprocess.Popen
  generate-manifest-2.7.py: replace os.popen with os.unlink
  opkg 0.1.8: respect to the arch when choose the alternatives

Ross Burton (1):
  connman: just give xuser the extra rights it needs

Xiaofeng Yan (5):
  lsbinitscripts: Add initscripts to enhance init functions in an lsb
    image
  lsbinitscripts: Patch file functions for confirming to an lsb image
  task-core-lsb: Add another initscripts to an lsb image
  archiver.bbclass: Improve the usability for the archiver classes
  local.conf.sample.extended: Change the usage about arhiver.bbclass

Xin Ouyang (1):
  cpan.bbclass: Fix config error while patches to Makefile.PL

 meta-yocto/conf/local.conf.sample.extended         |   31 +++--
 meta/classes/archiver.bbclass                      |    6 +-
 meta/classes/cpan.bbclass                          |    1 +
 meta/classes/license.bbclass                       |   42 ++++----
 .../distro/include/tcmode-external-sourcery.inc    |   48 +++++---
 .../connman/add_xuser_dbus_permission.patch        |   14 +--
 .../dbus/{dbus-1.4.16 => dbus-1.4.20}/dbus-1.init  |    0
 .../dbus/{dbus-1.4.16 => dbus-1.4.20}/tmpdir.patch |    0
 meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init     |  121
++++++++++++++++++++
 meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch    |   44 +++++++
 meta/recipes-core/dbus/dbus_1.4.16.bb              |    7 -
 meta/recipes-core/dbus/dbus_1.4.20.bb              |    6 +
 meta/recipes-core/dbus/dbus_1.5.12.bb              |    9 ++
 .../meta/external-sourcery-toolchain.bb            |   25 ++---
 .../opkg/opkg/respect-to-arch.patch                |   47 ++++++++
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    3 +-
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
 .../lsb/lsbinitscripts/functions.patch             |   11 ++
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb   |   27 +++++
 meta/recipes-extended/tasks/task-core-lsb.bb       |    3 +-
 ...xamples_1.2.0.bb => directfb-examples_1.5.3.bb} |    4 +-
 meta/recipes-graphics/directfb/directfb.inc        |    2 +-
 ...se-ARM-assembler-for-atomic-operations-on.patch |   27 +++++
 ...ibdirect-remove-include-of-linux-config.h.patch |   27 +++++
 meta/recipes-graphics/directfb/directfb_1.4.15.bb  |   20 ----
 meta/recipes-graphics/directfb/directfb_1.5.3.bb   |   23 ++++
 scripts/contrib/python/generate-manifest-2.7.py    |    5 +-
 scripts/lib/bsp/kernel.py                          |    5 +-
 28 files changed, 448 insertions(+), 113 deletions(-)
 rename meta/recipes-core/dbus/{dbus-1.4.16 => dbus-1.4.20}/dbus-1.init
(100%)
 rename meta/recipes-core/dbus/{dbus-1.4.16 => dbus-1.4.20}/tmpdir.patch
(100%)
 create mode 100644 meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
 create mode 100644 meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch
 delete mode 100644 meta/recipes-core/dbus/dbus_1.4.16.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.4.20.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.5.12.bb
 create mode 100644 meta/recipes-devtools/opkg/opkg/respect-to-arch.patch
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/functions.patch
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
 rename meta/recipes-graphics/directfb/{directfb-examples_1.2.0.bb =>
directfb-examples_1.5.3.bb} (77%)
 create mode 100644
meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch
 create mode 100644
meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.4.15.bb
 create mode 100644 meta/recipes-graphics/directfb/directfb_1.5.3.bb

-- 
1.7.5.4



