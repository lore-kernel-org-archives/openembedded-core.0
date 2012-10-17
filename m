Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOKbC-0002WV-GJ
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 05:47:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2012 20:33:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,597,1344236400"; d="scan'208";a="228513645"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by orsmga002.jf.intel.com with ESMTP; 16 Oct 2012 20:33:54 -0700
Message-ID: <507E2722.9020904@linux.intel.com>
Date: Tue, 16 Oct 2012 20:33:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348577801.31293.71.camel@phil-desktop>
	<50785717.8000606@linux.intel.com>
	<1350294414.3259.128.camel@phil-desktop>
In-Reply-To: <1350294414.3259.128.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] eglibc: Move perl- and bash-using scripts to separate recipes
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
X-List-Received-Date: Wed, 17 Oct 2012 03:47:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/2012 02:46 AM, Phil Blundell wrote:
> On Fri, 2012-10-12 at 10:44 -0700, Saul Wold wrote:
>

> On 09/25/2012 05:56 AM, Phil Blundell wrote:
>>> This removes the dependency of eglibc.bb itself on perl and bash
>>> which, in turn, eliminates the need to build those two recipes if the
>>> scripts which need them are not going to be installed.
>>>
>>
>> I think you missed dealing with an RPOVIDES someplace as I am getting
>> the following error during build:
>>
>>> ERROR: Nothing RPROVIDES 'libc-mtrace' (but /intel/poky/distro/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb RDEPENDS on or otherwise requires it)
>>> NOTE: Runtime target 'libc-mtrace' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['libc-mtrace']
>>> ERROR: Required build target 'packagegroup-core-tools-debug' has no buildable providers.
>>> Missing or unbuildable dependency chain was: ['packagegroup-core-tools-debug', 'libc-mtrace']
>
> Right, sorry about that.  The attached fixes this for me.
>

Another edge case?
> ERROR: Function failed: do_evacuate_scripts (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/temp/log.do_evacuate_scripts.1600 for further information)
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/temp/log.do_evacuate_scripts.1600
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
> | DEBUG: Executing shell function do_evacuate_scripts
> | cp: cannot stat `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/image/opt/poky/1.3+snapshot/sysroots/i686-pokysdk-linux/usr/bin/mtrace': No such file or directory
> | ERROR: Function failed: do_evacuate_scripts (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/temp/log.do_evacuate_scripts.1600 for further information)
> NOTE: recipe nativesdk-eglibc-initial-2.16-r16+svnr20393: task do_evacuate_scripts: Failed
> NOTE: recipe gupnp-av-0.8.0-r2: task do_compile: Started
> ERROR: Task 1593 (virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/meta/recipes-core/eglibc/eglibc-initial_2.16.bb, do_evacuate_scripts) failed with exit code '1'

This was a build for the meta-toolchain-gmae, but I also saw this with 
the multilib build.


Sau!




> p.
>


