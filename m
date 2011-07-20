Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjaIB-0005mt-Jq
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 19:10:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jul 2011 10:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="30297647"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2011 10:06:15 -0700
Message-ID: <4E270B07.2090300@linux.intel.com>
Date: Wed, 20 Jul 2011 10:06:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311097369-17260-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311097369-17260-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] tune-ppce500mc: Add a tune file for PowerPC e500mc core
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
X-List-Received-Date: Wed, 20 Jul 2011 17:10:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2011 10:42 AM, Kumar Gala wrote:
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/conf/machine/include/tune-ppce500mc.inc |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>   create mode 100644 meta/conf/machine/include/tune-ppce500mc.inc
>
> diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
> new file mode 100644
> index 0000000..763ec1a
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-ppce500mc.inc
> @@ -0,0 +1,4 @@
> +TARGET_CC_ARCH = "-mcpu=e500mc"
> +BASE_PACKAGE_ARCH = "ppce500mc"
> +FEED_ARCH = "ppce500mc"
> +PACKAGE_EXTRA_ARCHS = "powerpc ppce500mc"

Merged into OE-Core

Thanks
	Sau!


