Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNURM-0006pk-Vs
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 20:01:05 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Nov 2011 10:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,471,1315206000"; d="scan'208";a="34148425"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Nov 2011 10:54:50 -0800
Message-ID: <4EB8297A.20305@linux.intel.com>
Date: Mon, 07 Nov 2011 10:54:50 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320311143-5693-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1320311143-5693-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] connman 0.75: bump PR for iptables library change
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
X-List-Received-Date: Mon, 07 Nov 2011 19:01:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2011 02:05 AM, Koen Kooi wrote:
> connmand[180]: /usr/sbin/connmand: error while loading shared libraries: libxtables.so.5: cannot open shared object file: No such file or directory
>
> $ dpkg-deb -c ipk/armv7a/iptables_1.4.12.1-r0_armv7a.ipk  | grep libxtables
> -rwxr-xr-x root/root     35252 2011-11-01 20:16 ./usr/lib/libxtables.so.7.0.0
> lrwxrwxrwx root/root         0 2011-11-01 20:16 ./usr/lib/libxtables.so.7 ->  libxtables.so.7.0.0
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-connectivity/connman/connman_0.75.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman_0.75.bb b/meta/recipes-connectivity/connman/connman_0.75.bb
> index 78f2199..c6e911b 100644
> --- a/meta/recipes-connectivity/connman/connman_0.75.bb
> +++ b/meta/recipes-connectivity/connman/connman_0.75.bb
> @@ -1,5 +1,5 @@
>   require connman.inc
> -PR = "r3"
> +PR = "r4"
>
>   EXTRA_OECONF += "\
>     ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \

Merged into OE-Core

Thanks
	Sau!


