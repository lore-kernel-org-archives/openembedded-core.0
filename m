Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qp3Me-0000vH-LL
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 21:13:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Aug 2011 12:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,318,1309762800"; d="scan'208";a="34533071"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Aug 2011 12:09:27 -0700
Message-ID: <4E3AEE66.9020608@linux.intel.com>
Date: Thu, 04 Aug 2011 12:09:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312483886-31682-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312483886-31682-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64
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
X-List-Received-Date: Thu, 04 Aug 2011 19:13:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 11:51 AM, Kumar Gala wrote:
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/conf/bitbake.conf |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 6f0b42c..1d83459 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -7,7 +7,9 @@
>   #
>
>   # Used by multilib code to change the library paths
> -baselib = "lib"
> +baselib = "${BASELIB}"
> +BASELIB = "lib"
Should the be ?=

> +BASELIB_powerpc64 = "lib64"
>
And this located in the arch-powerpc64 file?

Sau!


>   # Path prefixes
>   export base_prefix = ""


