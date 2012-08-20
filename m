Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3VOs-0000Wn-Nv
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 19:04:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Aug 2012 09:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,797,1336374000"; d="scan'208";a="183213802"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by azsmga001.ch.intel.com with ESMTP; 20 Aug 2012 09:52:22 -0700
Message-ID: <50326B45.4020807@linux.intel.com>
Date: Mon, 20 Aug 2012 09:52:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1345225925.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1345225925.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] runqemu fix for yocto-bsp kernels
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
X-List-Received-Date: Mon, 20 Aug 2012 17:04:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2012 10:54 AM, Scott Garman wrote:
> The yocto-bsp tool generates kernels with additional strings within
> the filename, e.g. zImage-myqemuarm.bin. Loosen the MACHINE detection
> regex to work with these filenames.
>
> Fixes [YOCTO #2890].
>
> Scott
>
> The following changes since commit bb74035190c7794fcebaa7f6ba247672a4c34cde:
>
>    libsamplerate: depends on libsdnfile (2012-08-17 18:04:12 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib sgarman/runqemu-yocto-bsp-oe
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=runqemu-yocto-bsp
>
> Scott Garman (1):
>    runqemu: work with yocto-bsp created kernel filenames
>
>   scripts/runqemu |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
Merged into OE-Core

Thanks
	Sau!



