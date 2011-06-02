Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QS9OH-0001YH-P9
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 17:00:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2011 07:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,310,1304319600"; 
   d="scan'208";a="8466049"
Received: from swold-mobl.jf.intel.com (HELO [10.24.4.14]) ([10.24.4.14])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2011 07:57:41 -0700
Message-ID: <4DE7A4E5.4050109@linux.intel.com>
Date: Thu, 02 Jun 2011 07:57:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307001679.git.sgw@linux.intel.com>
	<1307022616.27470.541.camel@rex>
In-Reply-To: <1307022616.27470.541.camel@rex>
Subject: Re: [CONSOLIDATED PULL 00/12] 2-June-2011
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
X-List-Received-Date: Thu, 02 Jun 2011 15:00:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2011 06:50 AM, Richard Purdie wrote:
> On Thu, 2011-06-02 at 01:04 -0700, Saul Wold wrote:
>> Pulling a number of patches and updates from the list, they have been
>> built on the autobuild.
>>
>> This has the gcc fix for qt4-x11-free in the form of a gcc patch
>>
>> The following changes since commit 0a496df0209c93fd00ea929b5f27faa1a6e600c0:
>>
>>    clutter-1.6: Add patch to update gettext macro version (2011-06-01 18:32:30 +0100)
>>
>> are available in the git repository at:
>>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>>
>> Jingdong Lu (1):
>>    libx11: fix libX11 keysyms to pass xts5 of lsb
>>
>> Kang Kai (1):
>>    task-core-lsb: add cups and ghostscript into image
>>
>> Koen Kooi (3):
>>    u-boot: package up u-boot.bin for field upgrades
>>    shadow: remove selinux entry from pam.d/login
>>    avahi: enable service when using systemd
>>
>> Nitin A Kamble (4):
>>    gettext-0.16.1: mark upstream status for gplv2 recipe's patches
>>
>> Phil Blundell (1):
>>    rootfs_ipk: delete opkg metadata if package management not required
>>      and all packages are configured
>>
>
> I merged the above.
>
>>    m4: upgrade from 1.4.15 to 1.4.16
>
> Khem asked what the license change was here and it should have been
> mentioned in the commit message.
>
I will update the commit message since Nitin is not available for the 
rest of this week.

>>    autoconf: upgrade from 2.65 to 2.68
>
> Not pulled as likely dependent on the above.
>
>>    bison: upgrade from 2.4.3 to 2.5
>
> Likewise.
>
>> Saul Wold (2):
>>    ghostscript: Fix up file locations and add i686
>
> Why did this need the location fixups? Something sounds wrong here and
> needs digging into.
>
So what I changed was to move the architecture header files (in 
architecture directories) into the ghostscript directory instead of 
being in the top level of the recipe directory.  I also need to add an 
i686 directory in addition to the i586 directory, if there is a way to 
map this for the native then more digging is needed.  This is required 
to build ghostscript-native.

>>    gcc: Fix volatile access issue for ARM
>
> I merged this.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


