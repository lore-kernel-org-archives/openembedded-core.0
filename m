Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S28iX-0006b8-IK
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 23:06:49 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Feb 2012 13:58:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111868390"
Received: from unknown (HELO [10.255.15.37]) ([10.255.15.37])
	by azsmga001.ch.intel.com with ESMTP; 27 Feb 2012 13:58:19 -0800
Message-ID: <4F4BFC7A.6020903@linux.intel.com>
Date: Mon, 27 Feb 2012 13:58:18 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330128803-26445-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1330128803-26445-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] layer.conf: add keymaps to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Mon, 27 Feb 2012 22:06:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2012 04:13 PM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/conf/layer.conf |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index dac9c97..93c087a 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -27,4 +27,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>     xserver-xf86-config \
>     pointercal \
>     base-files \
> +  keymaps \
>   "
Merged into OE-core

Thanks
	Sau!


