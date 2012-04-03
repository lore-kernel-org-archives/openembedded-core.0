Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFCvy-00064o-W9
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:14:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2012 16:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125039304"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2012 16:05:30 -0700
Message-ID: <4F7B823A.6000802@linux.intel.com>
Date: Tue, 03 Apr 2012 16:05:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333078789.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1333078789.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/1] Fix GL failure on qemuarm/mips/ppc, V2, Mar32, 2012
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
X-List-Received-Date: Tue, 03 Apr 2012 23:14:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2012 08:43 PM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> This is the V2 version after Martin and RP's comments: no COMPATIBLE_MACHINE,
> and no change for global default preferred virtual/libgl.
>
> Pls. review.
>
> Thanks,
> Edwin
>
>
> The following changes since commit 265903bdffb10c95ceaf7a892151a50b67939c71:
>
>    procps: don't print error message with kernel 3.0+ (2012-03-28 10:16:30 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/fix2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2
>
> Zhai Edwin (1):
>    virtual/libgl: use mesa-xlib for qemuarm/qemumips/qemuppc
>
>   meta/conf/machine/include/qemu.inc |    1 +
>   meta/conf/machine/qemux86-64.conf  |    1 +
>   meta/conf/machine/qemux86.conf     |    1 +
>   3 files changed, 3 insertions(+), 0 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


