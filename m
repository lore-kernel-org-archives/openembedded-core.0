Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UPbLV-00062n-L0
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 18:24:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Apr 2013 09:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="225104570"
Received: from unknown (HELO [10.255.14.7]) ([10.255.14.7])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Apr 2013 09:07:11 -0700
Message-ID: <51643CAF.4070407@linux.intel.com>
Date: Tue, 09 Apr 2013 09:07:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Alex DAMIAN <alexandru.damian@intel.com>
References: <1365523119-27605-1-git-send-email-alexandru.damian@intel.com>
In-Reply-To: <1365523119-27605-1-git-send-email-alexandru.damian@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: changed location of udevd to /sbin/udev/udevd
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
X-List-Received-Date: Tue, 09 Apr 2013 16:25:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2013 08:58 AM, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This ammends the init script after changing the location from
> /lib to /sbin.
>
This only fixes one location and does not make it dynamic, I will have a 
patch shortly to fix this.

Sau!

> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>   meta/recipes-core/udev/udev/init |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> index 95d2672..ea87d64 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -15,7 +15,7 @@ export TZ=/etc/localtime
>
>   [ -d /sys/class ] || exit 1
>   [ -r /proc/mounts ] || exit 1
> -[ -x /lib/udev/udevd ] || exit 1
> +[ -x /sbin/udev/udevd ] || exit 1
>   [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
>   [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
>
> @@ -71,7 +71,7 @@ case "$1" in
>
>       # trigger the sorted events
>       echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
> -    /lib/udev/udevd -d
> +    /sbin/udev/udevd -d
>
>       /usr/bin/udevadm control --env=STARTUP=1
>       if [ "$not_first_boot" != "" ];then
>


