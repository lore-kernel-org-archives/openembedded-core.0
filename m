Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RgJyA-0007Sp-3R
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 18:40:46 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Dec 2011 09:33:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="91314183"
Received: from unknown (HELO [10.255.13.80]) ([10.255.13.80])
	by orsmga001.jf.intel.com with ESMTP; 29 Dec 2011 09:33:30 -0800
Message-ID: <4EFCA469.8020607@linux.intel.com>
Date: Thu, 29 Dec 2011 09:33:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325141432.git.liezhi.yang@windriver.com>
	<b77e4e9e630e0ae691e6f524c356745e0c42ffb2.1325141432.git.liezhi.yang@windriver.com>
In-Reply-To: <b77e4e9e630e0ae691e6f524c356745e0c42ffb2.1325141432.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 2/2] Incremental image generation(Add config sample)
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
X-List-Received-Date: Thu, 29 Dec 2011 17:40:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/2011 11:00 PM, Robert Yang wrote:
> Add the config sample for incremental image generation to
> meta-yocto/conf/local.conf.sample
>
> [YOCTO #1651]
>
> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
> ---
>   meta-yocto/conf/local.conf.sample |    7 +++++++
>   1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
> index ca8636c..e33ffd9 100644
> --- a/meta-yocto/conf/local.conf.sample
> +++ b/meta-yocto/conf/local.conf.sample
> @@ -222,3 +222,10 @@ PATCHRESOLVE = "noop"
>   # track the version of this file when it was generated. This can safely be ignored if
>   # this doesn't mean anything to you.
>   CONF_VERSION = "1"
> +
> +# Incremental image generation(only for rpm based rootfs currently), the rootfs
> +# would be totally removed and re-created in the second generation by default,
> +# but with INC_IMAGE_GEN = "1", the rootfs would be kept, and will do
> +# update(remove/add some pkgs) on it.
> +# NOTE: This is not suggested when you want to create a productive rootfs
> +#INC_IMAGE_GEN = "1"

This should probably belong in the local.conf.sample.extended file.

Sau!


