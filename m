Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B584B608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 19:30:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 20 Aug 2015 12:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,716,1432623600"; d="scan'208";a="787961027"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2015 12:30:52 -0700
To: brendan.le.foll@intel.com, openembedded-core@lists.openembedded.org
References: <1439991165-13121-1-git-send-email-brendan.le.foll@intel.com>
	<1439991165-13121-4-git-send-email-brendan.le.foll@intel.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <55D62AEC.6040606@linux.intel.com>
Date: Thu, 20 Aug 2015 12:30:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1439991165-13121-4-git-send-email-brendan.le.foll@intel.com>
Subject: Re: [PATCH 3/3] toolchain-shar-extract.sh: explain why we cannot use sudo in extensible SDK
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
X-List-Received-Date: Thu, 20 Aug 2015 19:30:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2015 06:32 AM, brendan.le.foll@intel.com wrote:
> From: Brendan Le Foll <brendan.le.foll@intel.com>
>
> Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
> ---
>   meta/files/toolchain-shar-extract.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
> index c4c2a70..d8e714a 100644
> --- a/meta/files/toolchain-shar-extract.sh
> +++ b/meta/files/toolchain-shar-extract.sh
> @@ -135,7 +135,7 @@ mkdir -p $target_sdk_dir >/dev/null 2>&1
>   # if don't have the right to access dir, gain by sudo
>   if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then
>   	if [ "$SDK_EXTENSIBLE" = "1" ]; then
> -		echo "Unable to access \"$target_sdk_dir\"."
> +		echo "Unable to access \"$target_sdk_dir\", can\'t install extensible SDK as root."

This is a bit unclear since it makes it sound like the user was trying to 
install as root, which would have already failed if that were the case. Perhaps 
wording it as: "Unable to access $dir, will not attempt to install using sudo, 
because the extensible sdk can't be installed as root."

>   		exit 1
>   	fi
>
>


