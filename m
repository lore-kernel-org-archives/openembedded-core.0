Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QP0FN-0005u8-1u
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 00:38:41 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2011 15:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,263,1304319600"; 
   d="scan'208";a="6980232"
Received: from unknown (HELO [10.255.12.149]) ([10.255.12.149])
	by fmsmga002.fm.intel.com with ESMTP; 24 May 2011 15:35:38 -0700
Message-ID: <4DDC32BE.6030802@linux.intel.com>
Date: Tue, 24 May 2011 15:35:42 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306276122.git.dvhart@linux.intel.com>
	<d65327722591ceae682f08ff28cae38f4d32267d.1306276122.git.dvhart@linux.intel.com>
In-Reply-To: <d65327722591ceae682f08ff28cae38f4d32267d.1306276122.git.dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] oe-setup-builddir: remove unreachable code, update comments
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
X-List-Received-Date: Tue, 24 May 2011 22:38:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/24/2011 03:31 PM, Darren Hart wrote:
> From: Darren Hart <dvhart@linux.intel.com>
> 
> The script forces TEMPLATECONF to be non-empty with:
> 
>     TEMPLATECONF=${TEMPLATECONF:-meta-yocto/conf}
> 
> This ensures that OELOCALCONF and OELAYERSCONF will be non-empty as well. Remove
> all the empty checks for these variables.
> 
> While this patch doesn't change behavior, all this code was unreachable, it does
> bring up a point of intent. It appears as though OE*CONF was intended to be
> configurable by the user via the environment, the code only allows for the user
> to set TEMPLATECONF. This means that in order to use something other than the
> sample default configs, the user must specify both a local.conf.sample and a
> bblayers.conf.sample in their TEMPLATECONF directory.
> 
> Update the comments to correctly identify the required files as local.conf.sample
> and bblayers.conf.sample.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>  scripts/create-pull-request |    2 +-
>  scripts/oe-setup-builddir   |   32 +++++++++++++-------------------
>  2 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index b808146..169b888 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -24,7 +24,7 @@
>  # submission to Open Embedded and The Yocto Project, as well as to
>  # related projects and layers.
>  #
> -
> +set -x


EEEK, sorry about that. I've removed this and re-pushed to the same
contrib/dvhart/build branch. The only file changed is
scripts/oe-setup-builddir.

Apologies.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


