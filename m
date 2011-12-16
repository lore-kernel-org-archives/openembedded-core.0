Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RbRWn-0000g1-0R
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 07:44:21 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Dec 2011 22:37:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102854622"
Received: from unknown (HELO envy.home) ([10.255.12.224])
	by fmsmga002.fm.intel.com with ESMTP; 15 Dec 2011 22:37:20 -0800
Message-ID: <4EEAE704.9060003@linux.intel.com>
Date: Thu, 15 Dec 2011 22:36:52 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1324015563.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1324015563.git.dvhart@linux.intel.com>
X-Enigmail-Version: 1.3.3
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Drop dosfstools -d feature in favor of mtools mcopy
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
X-List-Received-Date: Fri, 16 Dec 2011 06:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 12/15/2011 10:14 PM, Darren Hart wrote:
> The dosfstools -d feature has been shown to be buggy, and even with Nitin's
> fixes applied to get directory hierarchies working, it still generates
> images that fail dosfsck and don't work with FAT32.
> 
> This series presents an alternative means of populating our live images
> using mcopy from mtools.
> 
> Applies on top of my earlier pull request:
> [PATCH 0/4] Fix grub efi menu, kernel messages, and live image dosfsck

I should add that I've built this with the fri2 BSP from the meta-intel
layer and tested EFI booting on 3 different platforms and legacy
SYSLINUX booting on 2 platforms - all using the same core-image-minimal
hddimg.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


