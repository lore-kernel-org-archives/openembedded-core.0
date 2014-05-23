Return-Path: <dvhart@linux.intel.com>
Received: from mga14.intel.com (unknown [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4B7816B3A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 18:28:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 23 May 2014 11:24:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,895,1392192000"; d="scan'208";a="536728171"
Received: from msegurah-mobl4.amr.corp.intel.com ([10.254.42.19])
	by fmsmga001.fm.intel.com with ESMTP; 23 May 2014 11:28:53 -0700
Message-ID: <537F939F.2010808@linux.intel.com>
Date: Fri, 23 May 2014 11:29:51 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1400868965-6748-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1400868965-6748-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] poky-tiny: ensure that both poky and poky-tiny distro overrides are used
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 May 2014 18:28:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for digging into this one Saul,

On 5/23/14, 11:16, Saul Wold wrote:
> [YOCTO #6353]
>

We do need to include a brief blurb in the commit message about what the 
problem was and why this fixes it - it can't be contained entirely in 
the BZ.

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta-yocto/conf/distro/poky-tiny.conf | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
> index 2548d79..5b67e32 100644
> --- a/meta-yocto/conf/distro/poky-tiny.conf
> +++ b/meta-yocto/conf/distro/poky-tiny.conf
> @@ -30,6 +30,8 @@
>
>   require conf/distro/poky.conf
>   DISTRO = "poky-tiny"
> +DISTROOVERRIDES = "poky:poky-tiny"

    ^ Whitespace issue here?

> +
>
>   # FIXME: consider adding a new "tiny" feature
>   #DISTRO_FEATURES_append = " tiny"
>

Thanks Saul,

-- 
Darren Hart			Open Source Technology Center
darren.hart@intel.com		            Intel Corporation

