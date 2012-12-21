Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tm6kN-0007sE-A7
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 18:51:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Dec 2012 09:36:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,331,1355126400"; d="scan'208";a="265660505"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.4])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2012 09:36:11 -0800
Message-ID: <50D49E0B.40208@linux.intel.com>
Date: Fri, 21 Dec 2012 09:36:11 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1356022882.git.radu.moisan@intel.com>
	<CAJTo0LaRLqYM8DC185riHPo_hTy+-GCn_-xntvCeX_JnCcjbXQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaRLqYM8DC185riHPo_hTy+-GCn_-xntvCeX_JnCcjbXQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 21 Dec 2012 17:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2012 03:31 AM, Burton, Ross wrote:
> On 20 December 2012 17:11, Radu Moisan <radu.moisan@intel.com> wrote:
>> I've rebased my branch, again :), with some cleanups here and there
>> I also pushed a few patches suggested by Martin.
>> Feel free to comment on everything.
>>
>> The following changes since commit 958162e96b4a4f23bca94500b5f20975633dd5c6:
>>
>>    bitbake: hob: use base image only if it was set (2012-12-14 17:31:31 +0000)
>
> That's 95 patches away from poky master, please fetch origin and rebase.
>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib rmoisan/systemd
>>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd
>
> The short log looks like this:
>
> 86470e3 Systemd initial integration
> d1fa1fa Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
> d7f6847 Automatically set PREFERRED_PROVIDER_udev
> a2edc09 Add systemd_base.bbclass
> ccc83ce Include systemd-compat-units and avahi-systemd
> addb2bc Inherit the systemd_base class
> 2426a47 set default.target to multi-user.target
> 42cbe6f wpa-supplicant: Fix indentation
> e715fa0 dropbear: Fix indentation and cleanup
> 83311c9 systemd: Some more cleanup
> f091e53 systemd: disable  source rcS-default
> a7dc429 polkit: merge together the two instances of PACKAGECONFIG
> 14165c9 systemd-native: update FILESPATH with *-native directory
> eaa960c systemd: Remove gitpkgv.bbclass
> 6220483 systemd: (temporary) remove dependency on cairo
> 1527d71 cgroups: Add INSANE_SKIP to avoid warning about .so file
> 0bd67a2 initscripts: Cleanup recipe
> 4aeecde systemd: disable sysfs.service
> 9869ffd Remove sysvinit mount related services if systemd is enabled
> 3b0884e systemd: Make the main systemd files proper CONFFILES
> 43609a3 systemd-systemctl-native: fix FILESPATH to find systemctl
> 901deef xserver-nodm-init: add systemd support
> 9427b9f systemd: add PACKAGES_DYNAMIC
> 02cde59 util-linux: Enable systemd support
> 3f07f4c lighttpd: Remove automake patch
> 7428e54 systemd: Introduce a create-volatile to create tmp directories
> 1b0886e systemd: Fix build when base_libdir is not /lib
> 60da63d systemd: move disable operation into prerm() script
>
> First, in a branch for review you don't want to have "fix this",
> "delete that", and so on.  If a file was added in one commit and
> removed later, squash them together so the file doesn't exist.  If you
> fix whitespace, squash them together so it was always fixed.
>
Just to be clear about whitespace changes, they should go in a separate 
and distinct "whitespace changes" commit, that way reviewers aren't 
trying to hunt down the non-whitespace changes.

Sau!

> Next the mantra is single, obvious changes.  The first change should
> be to introduce the systemd packages, then the integration into the
> build, then the fixes to individual packages.
>
> Any patches that are not related to systemd (eg lighttpd: Remove
> automake patch) should be submitted separately.
>
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


