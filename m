Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJTBf-0000TB-U7
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 18:20:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2011 09:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,341,1301900400"; d="scan'208";a="433043342"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 09:17:08 -0700
Message-ID: <4DC81383.4080501@linux.intel.com>
Date: Mon, 09 May 2011 09:17:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1304658053-15502-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1304658053-15502-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] conf/layer.conf: Use .= to append to BBPATH and	+= for BBFILES
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
X-List-Received-Date: Mon, 09 May 2011 16:20:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2011 10:00 PM, Khem Raj wrote:
> This helps bitbake in organising BBPATH and BBFILES with given
> BBFILE_PRIORITY order
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/conf/layer.conf |    5 ++---
>   1 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 5287417..3f63c7d 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -1,9 +1,8 @@
>   BBPATH ?= ""
>   # We have a conf and classes directory, add to BBPATH
> -BBPATH := "${BBPATH}:${LAYERDIR}"
> -
> +BBPATH .= ":${LAYERDIR}"
>   # We have a packages directory, add to BBFILES
> -BBFILES := "${BBFILES} ${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
> +BBFILES += "${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
>
>   BBFILE_COLLECTIONS += "normal"
>   BBFILE_PATTERN_normal := "^${LAYERDIR}/"

Merged into oe-core

Thanks
	Sau!


