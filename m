Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UNQMP-0008Un-56
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 18:16:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2013 08:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="288836875"
Received: from unknown (HELO [10.255.14.19]) ([10.255.14.19])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2013 08:58:56 -0700
Message-ID: <515C51C0.10804@linux.intel.com>
Date: Wed, 03 Apr 2013 08:58:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <1365004276-20197-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1365004276-20197-1-git-send-email-radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Udev multilib fixes
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
X-List-Received-Date: Wed, 03 Apr 2013 16:16:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2013 08:51 AM, Radu Moisan wrote:
> Changed /lib with ${base_libdir}
> Fixes Bugz[4096]
>

Please include the bug information in the actual commit messages not in 
the covoer letter.  The correct format is:

[YOCTO #4096]

Thanks
	Sau!

> Radu Moisan (2):
>    initramfs-live-boot: enable multilib support
>    udev: enable multilib support
>
>   .../initrdscripts/initramfs-live-boot_1.0.bb       |    1 +
>   meta/recipes-core/udev/udev.inc                    |    1 +
>   2 files changed, 2 insertions(+)
>


