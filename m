Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Tob09-0002Wp-S7
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 15:33:36 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Dec 2012 06:18:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,369,1355126400"; 
	d="scan'208,217";a="239850317"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 28 Dec 2012 06:18:35 -0800
Message-ID: <50DDABA4.70309@intel.com>
Date: Fri, 28 Dec 2012 16:24:36 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1356022882.git.radu.moisan@intel.com>
	<50D8FDBE.4030203@linux.intel.com>
In-Reply-To: <50D8FDBE.4030203@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28][RFC] systemd Integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Dec 2012 14:33:36 -0000
Content-Type: multipart/alternative;
	boundary="------------010409040904080004080400"

--------------010409040904080004080400
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 12/25/2012 03:13 AM, Saul Wold wrote:
> On 12/20/2012 09:11 AM, Radu Moisan wrote:
>> I've rebased my branch, again :), with some cleanups here and there
>> I also pushed a few patches suggested by Martin.
>> Feel free to comment on everything.
>>
>> The following changes since commit 
>> 958162e96b4a4f23bca94500b5f20975633dd5c6:
>>
>>    bitbake: hob: use base image only if it was set (2012-12-14 
>> 17:31:31 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib rmoisan/systemd
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd
>>
>> Enrico Scholz (1):
>>    systemd: move disable operation into prerm() script
>>
>> Holger Hans Peter Freyther (2):
>>    systemd: Make the main systemd files proper CONFFILES
>>    systemd: Introduce a create-volatile to create tmp directories
>>
>> Khem Raj (1):
>>    systemd: Fix build when base_libdir is not /lib
>>
>> Martin Donnelly (2):
>>    cgroups: Add INSANE_SKIP to avoid warning about .so file
>>    Remove sysvinit mount related services if systemd is enabled
>>
>> Martin Jansa (2):
>>    systemd-systemctl-native: fix FILESPATH to find systemctl
>>    systemd: add PACKAGES_DYNAMIC
>>
>> Radu Moisan (20):
>>    Systemd initial integration
>>    Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
>>    Automatically set PREFERRED_PROVIDER_udev
>>    Add systemd_base.bbclass
>>    Include systemd-compat-units and avahi-systemd
>>    Inherit the systemd_base class
>>    set default.target to multi-user.target
>>    wpa-supplicant: Fix indentation
>>    dropbear: Fix indentation and cleanup
>>    systemd: Some more cleanup
>>    systemd: disable  source rcS-default
>>    polkit: merge together the two instances of PACKAGECONFIG
>>    systemd-native: update FILESPATH with *-native directory
>>    systemd: Remove gitpkgv.bbclass
>>    systemd: (temporary) remove dependency on cairo
>>    initscripts: Cleanup recipe
>>    systemd: disable sysfs.service
>>    xserver-nodm-init: add systemd support
>>    util-linux: Enable systemd support
>>    lighttpd: Remove automake patch
>>
>
> Please be sure to build this with the INCOMPATIBLE_LICENSE = "GPLv3" 
> settig, I saw the following issues on the Autobuilder.

I've seen a patch from Martin Ertsaas <mailto:mertsas@cisco.com> which 
will allow us to compile systemd without xz. I'll take a look over it.

>
>>
>> NOTE: Resolving any missing task queue dependencies
>> ERROR: Nothing PROVIDES 'xz' (but 
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb 
>> DEPENDS on or otherwise requires it)
>> ERROR: xz was skipped: incompatible with license GPLv2+ & GPLv3+ & 
>> LGPLv2.1+
>> ERROR: Nothing RPROVIDES 'udev-systemd' (but 
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb 
>> RDEPENDS on or otherwise requires it)
>> ERROR: No eligible RPROVIDERs exist for 'udev-systemd'
>> NOTE: Runtime target 'udev-systemd' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['udev-systemd']
>> ERROR: Nothing RPROVIDES 'systemd' (but 
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb 
>> RDEPENDS on or otherwise requires it)
>> ERROR: No eligible RPROVIDERs exist for 'systemd'
>> NOTE: Runtime target 'systemd' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['systemd']
>> ERROR: Nothing RPROVIDES 'systemd-dev' (but 
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb 
>> RDEPENDS on or otherwise requires it)
>> ERROR: No eligible RPROVIDERs exist for 'systemd-dev'
>> NOTE: Runtime target 'systemd-dev' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['systemd-dev']
>> NOTE: Runtime target 'systemd-serialgetty' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['systemd-serialgetty']
>> NOTE: Preparing runqueue
>> NOTE: Executing SetScene Tasks
>
> Also, you do not provide very clear information at the beginning, but 
> I assume to enable systemd, it's just setting DISTRO_FEATURE += 
> "systemd", or is there more?
>

DISTRO_FEATURES_INITMAN = "systemd" it's all you need. DISTRO_FEATURE += 
"systemd" might also work in some extent since I'm checking against 
DISTRO_FEATURES, however there are variables like 
VIRTUAL_RUNTIME_init_manager (which is inherited legacy) which get set 
from DISTRO_FEATURES_INITMAN. The way to go is with DISTRO_FEATURES_INITMAN.

Radu

Radu

--------------010409040904080004080400
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 12/25/2012 03:13 AM, Saul Wold
      wrote:<br>
    </div>
    <blockquote cite="mid:50D8FDBE.4030203@linux.intel.com" type="cite">On
      12/20/2012 09:11 AM, Radu Moisan wrote:
      <br>
      <blockquote type="cite">I've rebased my branch, again :), with
        some cleanups here and there
        <br>
        I also pushed a few patches suggested by Martin.
        <br>
        Feel free to comment on everything.
        <br>
        <br>
        The following changes since commit
        958162e96b4a4f23bca94500b5f20975633dd5c6:
        <br>
        <br>
        &nbsp;&nbsp; bitbake: hob: use base image only if it was set (2012-12-14
        17:31:31 +0000)
        <br>
        <br>
        are available in the git repository at:
        <br>
        <br>
        &nbsp;&nbsp; git://git.yoctoproject.org/poky-contrib rmoisan/systemd
        <br>
        &nbsp;&nbsp;
        <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd">http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd</a>
        <br>
        <br>
        Enrico Scholz (1):
        <br>
        &nbsp;&nbsp; systemd: move disable operation into prerm() script
        <br>
        <br>
        Holger Hans Peter Freyther (2):
        <br>
        &nbsp;&nbsp; systemd: Make the main systemd files proper CONFFILES
        <br>
        &nbsp;&nbsp; systemd: Introduce a create-volatile to create tmp
        directories
        <br>
        <br>
        Khem Raj (1):
        <br>
        &nbsp;&nbsp; systemd: Fix build when base_libdir is not /lib
        <br>
        <br>
        Martin Donnelly (2):
        <br>
        &nbsp;&nbsp; cgroups: Add INSANE_SKIP to avoid warning about .so file
        <br>
        &nbsp;&nbsp; Remove sysvinit mount related services if systemd is enabled
        <br>
        <br>
        Martin Jansa (2):
        <br>
        &nbsp;&nbsp; systemd-systemctl-native: fix FILESPATH to find systemctl
        <br>
        &nbsp;&nbsp; systemd: add PACKAGES_DYNAMIC
        <br>
        <br>
        Radu Moisan (20):
        <br>
        &nbsp;&nbsp; Systemd initial integration
        <br>
        &nbsp;&nbsp; Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
        <br>
        &nbsp;&nbsp; Automatically set PREFERRED_PROVIDER_udev
        <br>
        &nbsp;&nbsp; Add systemd_base.bbclass
        <br>
        &nbsp;&nbsp; Include systemd-compat-units and avahi-systemd
        <br>
        &nbsp;&nbsp; Inherit the systemd_base class
        <br>
        &nbsp;&nbsp; set default.target to multi-user.target
        <br>
        &nbsp;&nbsp; wpa-supplicant: Fix indentation
        <br>
        &nbsp;&nbsp; dropbear: Fix indentation and cleanup
        <br>
        &nbsp;&nbsp; systemd: Some more cleanup
        <br>
        &nbsp;&nbsp; systemd: disable&nbsp; source rcS-default
        <br>
        &nbsp;&nbsp; polkit: merge together the two instances of PACKAGECONFIG
        <br>
        &nbsp;&nbsp; systemd-native: update FILESPATH with *-native directory
        <br>
        &nbsp;&nbsp; systemd: Remove gitpkgv.bbclass
        <br>
        &nbsp;&nbsp; systemd: (temporary) remove dependency on cairo
        <br>
        &nbsp;&nbsp; initscripts: Cleanup recipe
        <br>
        &nbsp;&nbsp; systemd: disable sysfs.service
        <br>
        &nbsp;&nbsp; xserver-nodm-init: add systemd support
        <br>
        &nbsp;&nbsp; util-linux: Enable systemd support
        <br>
        &nbsp;&nbsp; lighttpd: Remove automake patch
        <br>
        <br>
      </blockquote>
      <br>
      Please be sure to build this with the INCOMPATIBLE_LICENSE =
      "GPLv3" settig, I saw the following issues on the Autobuilder.
      <br>
    </blockquote>
    <br>
    I've seen a patch from <a href="mailto:mertsas@cisco.com">Martin
      Ertsaas</a> which will allow us to compile systemd without xz.
    I'll take a look over it.<br>
    <br>
    <blockquote cite="mid:50D8FDBE.4030203@linux.intel.com" type="cite">
      <br>
      <blockquote type="cite">
        <br>
        NOTE: Resolving any missing task queue dependencies
        <br>
        ERROR: Nothing PROVIDES 'xz' (but
        /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb
        DEPENDS on or otherwise requires it)
        <br>
        ERROR: xz was skipped: incompatible with license GPLv2+ &amp;
        GPLv3+ &amp; LGPLv2.1+
        <br>
        ERROR: Nothing RPROVIDES 'udev-systemd' (but
        /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb
        RDEPENDS on or otherwise requires it)
        <br>
        ERROR: No eligible RPROVIDERs exist for 'udev-systemd'
        <br>
        NOTE: Runtime target 'udev-systemd' is unbuildable, removing...
        <br>
        Missing or unbuildable dependency chain was: ['udev-systemd']
        <br>
        ERROR: Nothing RPROVIDES 'systemd' (but
        /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb
        RDEPENDS on or otherwise requires it)
        <br>
        ERROR: No eligible RPROVIDERs exist for 'systemd'
        <br>
        NOTE: Runtime target 'systemd' is unbuildable, removing...
        <br>
        Missing or unbuildable dependency chain was: ['systemd']
        <br>
        ERROR: Nothing RPROVIDES 'systemd-dev' (but
        /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb
        RDEPENDS on or otherwise requires it)
        <br>
        ERROR: No eligible RPROVIDERs exist for 'systemd-dev'
        <br>
        NOTE: Runtime target 'systemd-dev' is unbuildable, removing...
        <br>
        Missing or unbuildable dependency chain was: ['systemd-dev']
        <br>
        NOTE: Runtime target 'systemd-serialgetty' is unbuildable,
        removing...
        <br>
        Missing or unbuildable dependency chain was:
        ['systemd-serialgetty']
        <br>
        NOTE: Preparing runqueue
        <br>
        NOTE: Executing SetScene Tasks
        <br>
      </blockquote>
      <br>
      Also, you do not provide very clear information at the beginning,
      but I assume to enable systemd, it's just setting DISTRO_FEATURE
      += "systemd", or is there more?
      <br>
      <br>
    </blockquote>
    <br>
    DISTRO_FEATURES_INITMAN = "systemd" it's all you need.
    DISTRO_FEATURE += "systemd" might also work in some extent since I'm
    checking against DISTRO_FEATURES, however there are variables like
    VIRTUAL_RUNTIME_init_manager (which is inherited legacy) which get
    set from DISTRO_FEATURES_INITMAN. The way to go is with
    DISTRO_FEATURES_INITMAN.<br>
    <br>
    Radu<br>
    <br>
    Radu<br>
  </body>
</html>

--------------010409040904080004080400--
