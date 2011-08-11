Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrcso-0003YF-FV
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 23:33:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2011 14:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37660511"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2011 14:29:09 -0700
Message-ID: <4E4449A4.9080606@linux.intel.com>
Date: Thu, 11 Aug 2011 14:29:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312785002-3627-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1312785002-3627-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] scripts/runqemu: Make it run on ubuntu 11.10
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
X-List-Received-Date: Thu, 11 Aug 2011 21:33:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2011 11:30 PM, Khem Raj wrote:
> location of libGL has moved in ubuntu 11.10
> so we look for it in the new locations
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   scripts/runqemu |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 9611c64..2b8e88a 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -388,6 +388,7 @@ libgl='no'
>
>   test -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so&&  libgl='yes'
>   test -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so&&  libgl='yes'
> +test -e /usr/lib/`uname -i`-linux-gnu/libGL.so -a -e /usr/lib/`uname -i`-linux-gnu/libGLU.so&&  libgl='yes'
>
>   if [ "$libgl" != 'yes' ]; then
>       echo "You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.

Merged into OE-Core

Thanks
	Sau!


