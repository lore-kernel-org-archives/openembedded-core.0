Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFDU9-0006fu-3N
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:50:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2012 16:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125047371"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2012 16:40:50 -0700
Message-ID: <4F7B8A82.8070408@linux.intel.com>
Date: Tue, 03 Apr 2012 16:40:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333246894.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1333246894.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/1] Fixed GL apps failure on qemux86/x86-64 on Ubuntu 11 with Nvidia GLX driver, Apr1, 2012
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
X-List-Received-Date: Tue, 03 Apr 2012 23:50:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/31/2012 07:24 PM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> All,
> Previous version of nVidia GLX driver in Ubuntu 10 cause qemu segfault, so we
> fall back to Mesa GLX driver if detecting nVidia driver installed. From Ubuntu
> 11, nVidia GLX driver works well, while previous work around cause GL apps
> failure. So this work around is limited in Ubuntu 10 only, and will be removed
> in future.
>
> Pls. help to review and pull.
>
> Thanks,
> Edwin
>
> The following changes since commit 8691a588267472eb5a32b978a0eb9ddfd0c91733:
>
>    cross-canadian.bbclass: fix rpath for sdk executables (2012-03-31 18:00:59 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/fix2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2
>
> Zhai Edwin (1):
>    qemugl: Fix GL apps failure on Ubuntu 11 host with nVidia GLX driver
>
>   scripts/runqemu-internal |   11 ++++++++---
>   1 files changed, 8 insertions(+), 3 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


