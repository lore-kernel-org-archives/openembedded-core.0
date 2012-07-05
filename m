Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Smppz-00038e-Gz
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:27:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2012 10:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="167440481"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2012 10:16:25 -0700
Message-ID: <4FF5CBE9.80003@linux.intel.com>
Date: Thu, 05 Jul 2012 10:16:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341401643-4395-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1341401643-4395-1-git-send-email-cristian.iorga@intel.com>
Subject: Re: [PATCH 0/5] Comm and Multimedia package updates, 5 pkg
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
X-List-Received-Date: Thu, 05 Jul 2012 17:27:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2012 04:33 AM, Cristian Iorga wrote:
> Hello all,
>
> This patchset upgrades the packages listed below.
> All packages were succesfully built for all architectures.
> Where it was possible, basic sanity tests were performed on
> a qemux86 image. No obvious issues spotted.
> Linux kernel boot messages were also inspected for issues.
>
> Regards,
> Cristian Iorga
>
> Cristian Iorga (5):
>    telepathy-glib: update to ver. 0.19.2
>    bluez4: update to ver. 4.101
You seemed to introduce a new set of QA warnings that should be fixed

>    netbase: update to ver. 5.0
You need to make sure to update the meta-yocto parts of recipes, and 
send those patches to poky@yoctoproject.org in the future.

>    gst-plugin-bluetooth: update to ver. 4.101
>    ofono: update to ver. 1.8
>
These where merged into OE-Core, please address the above issue with 
Bluez, RP already fixed the meta-yocto issue.

Thanks
	Sau!


>   ...{netbase_4.47.bbappend => netbase_5.0.bbappend} |    0
>   .../{bluez4-4.99 => bluez4-4.101}/bluetooth.conf   |    0
>   .../{bluez4-4.99 => bluez4-4.101}/sbc_mmx.patch    |    0
>   .../bluez/{bluez4_4.99.bb => bluez4_4.101.bb}      |    9 ++++-----
>   ...tooth_4.99.bb => gst-plugin-bluetooth_4.101.bb} |    7 +++----
>   .../ofono/{ofono_1.6.bb => ofono_1.8.bb}           |    5 +++--
>   ...thy-glib_0.19.1.bb => telepathy-glib_0.19.2.bb} |    4 ++--
>   .../netbase/{netbase-4.47 => netbase-5.0}/hosts    |    0
>   .../netbase/{netbase-4.47 => netbase-5.0}/init     |    0
>   .../{netbase-4.47 => netbase-5.0}/interfaces       |    0
>   .../netbase/{netbase-4.47 => netbase-5.0}/nfsroot  |    0
>   .../qemuarm/interfaces                             |    0
>   .../qemuarmv6/interfaces                           |    0
>   .../qemuarmv7/interfaces                           |    0
>   .../qemumips/interfaces                            |    0
>   .../qemumips64/interfaces                          |    0
>   .../qemuppc/interfaces                             |    0
>   .../qemush4/interfaces                             |    0
>   .../qemux86-64/interfaces                          |    0
>   .../qemux86/interfaces                             |    0
>   .../netbase/{netbase_4.47.bb => netbase_5.0.bb}    |    6 +++---
>   21 files changed, 15 insertions(+), 16 deletions(-)
>   rename meta-yocto/recipes-core/netbase/{netbase_4.47.bbappend => netbase_5.0.bbappend} (100%)
>   rename meta/recipes-connectivity/bluez/{bluez4-4.99 => bluez4-4.101}/bluetooth.conf (100%)
>   rename meta/recipes-connectivity/bluez/{bluez4-4.99 => bluez4-4.101}/sbc_mmx.patch (100%)
>   rename meta/recipes-connectivity/bluez/{bluez4_4.99.bb => bluez4_4.101.bb} (83%)
>   rename meta/recipes-connectivity/bluez/{gst-plugin-bluetooth_4.99.bb => gst-plugin-bluetooth_4.101.bb} (81%)
>   rename meta/recipes-connectivity/ofono/{ofono_1.6.bb => ofono_1.8.bb} (64%)
>   rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.1.bb => telepathy-glib_0.19.2.bb} (82%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/hosts (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/init (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/interfaces (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/nfsroot (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemuarm/interfaces (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemuarmv6/interfaces (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemuarmv7/interfaces (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemumips/interfaces (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemumips64/interfaces (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemuppc/interfaces (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemush4/interfaces (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemux86-64/interfaces (100%)
>   rename meta/recipes-core/netbase/{netbase-4.47 => netbase-5.0}/qemux86/interfaces (100%)
>   rename meta/recipes-core/netbase/{netbase_4.47.bb => netbase_5.0.bb} (91%)
>



