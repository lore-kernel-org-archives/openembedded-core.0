Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TJEFC-0007ir-B0
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 03:59:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2012 18:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,525,1344236400"; d="scan'208";a="229823873"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by fmsmga002.fm.intel.com with ESMTP; 02 Oct 2012 18:46:24 -0700
Message-ID: <506B98F0.5000806@linux.intel.com>
Date: Tue, 02 Oct 2012 18:46:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1349193366-6632-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1349193366-6632-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "initrd: Spawn an emergency shell when something goes wrong"
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
X-List-Received-Date: Wed, 03 Oct 2012 01:59:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2012 08:56 AM, Ross Burton wrote:
> This had nowhere near enough testing...
>
> This reverts commit ffb6928f5783e5202d9849c3a185e29be1d41c63.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-core/initrdscripts/files/init-live.sh |   11 -----------
>   1 file changed, 11 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
> index 2639308..5682fd1 100644
> --- a/meta/recipes-core/initrdscripts/files/init-live.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> @@ -2,17 +2,6 @@
>
>   PATH=/sbin:/bin:/usr/sbin:/usr/bin
>
> -emergency_shell()
> -{
> -    echo "Bug in initramfs /init detected. Dropping to a shell. Good luck!"
> -    echo
> -    sh
> -}
> -trap "emergency_shell" 0 2
> -
> -# exit immediately if a command fails
> -set -e
> -
>   ROOT_MOUNT="/rootfs/"
>   ROOT_IMAGE="rootfs.img"
>   MOUNT="/bin/mount"
>

Merged into OE-Core

Thanks
	Sau!



