Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOHEF-0006BW-7r
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 01:39:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2012 16:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="137872267"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2012 16:29:21 -0700
Message-ID: <4F9C7D51.8030206@linux.intel.com>
Date: Sat, 28 Apr 2012 16:29:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
	<1f5da4562c4858fa00b16b8bce10682f2619d7c6.1335600691.git.dongxiao.xu@intel.com>
In-Reply-To: <1f5da4562c4858fa00b16b8bce10682f2619d7c6.1335600691.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 5/8] iproute2: upgrade to version 3.3.0
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
X-List-Received-Date: Sat, 28 Apr 2012 23:39:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/28/2012 01:12 AM, Dongxiao Xu wrote:
> Signed-off-by: Dongxiao Xu<dongxiao.xu@intel.com>
> ---
>   .../configure-cross.patch                          |    0
>   .../{iproute2_3.2.0.bb =>  iproute2_3.3.0.bb}       |    2 +-
>   2 files changed, 1 insertions(+), 1 deletions(-)
>   rename meta/recipes-connectivity/iproute2/{iproute2-3.2.0 =>  iproute2-3.3.0}/configure-cross.patch (100%)
>   rename meta/recipes-connectivity/iproute2/{iproute2_3.2.0.bb =>  iproute2_3.3.0.bb} (97%)
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-3.3.0/configure-cross.patch
> similarity index 100%
> rename from meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch
> rename to meta/recipes-connectivity/iproute2/iproute2-3.3.0/configure-cross.patch
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.3.0.bb
> similarity index 97%
> rename from meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
> rename to meta/recipes-connectivity/iproute2/iproute2_3.3.0.bb
> index 5af12af..2c3c857 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_3.3.0.bb
> @@ -1,6 +1,6 @@
>   require iproute2.inc
>
> -PR = "r1"
> +PR = "r0"
>
>   #v3.2.0 tag is "447c118f138171b260ad045ad6e1b17f9ef462e2"
>   #but it was not fully tested and had build error, and the next commit fixed it.

You updated the recipe name, but not the git tag, so this is still the 
3.2.0 version.

Sau!


