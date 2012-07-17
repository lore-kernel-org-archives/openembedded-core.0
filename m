Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrBCN-00035v-Sh
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:04:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2012 09:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="173262276"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2012 09:53:15 -0700
Message-ID: <5005987B.30109@linux.intel.com>
Date: Tue, 17 Jul 2012 09:53:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341305368-30561-1-git-send-email-sen.zhang@windriver.com>
In-Reply-To: <1341305368-30561-1-git-send-email-sen.zhang@windriver.com>
Subject: Re: [PATCH] udev: don't mount with -o sync
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
X-List-Received-Date: Tue, 17 Jul 2012 17:04:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 01:49 AM, Jesse Zhang wrote:
> mount.sh mounts all partitions with -o sync, which is bad for system
> performance.
>
> Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
> ---
>   meta/recipes-core/udev/udev/mount.sh |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/udev/udev/mount.sh b/meta/recipes-core/udev/udev/mount.sh
> index 53fefa3..c13b8bb 100644
> --- a/meta/recipes-core/udev/udev/mount.sh
> +++ b/meta/recipes-core/udev/udev/mount.sh
> @@ -23,7 +23,7 @@ automount() {
>
>   	! test -d "/media/$name" && mkdir -p "/media/$name"
>   	
> -	if ! $MOUNT -t auto -o sync $DEVNAME "/media/$name"
> +	if ! $MOUNT -t auto $DEVNAME "/media/$name"
>   	then
>   		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
>   		rm_dir "/media/$name"
>

Merged into OE-Core

Thanks
	Sau!


