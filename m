Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TdzH9-0007VN-Uf
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 09:15:16 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Nov 2012 00:00:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,182,1355126400"; d="scan'208";a="224117783"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 29 Nov 2012 00:00:48 -0800
Message-ID: <50B7162F.5050108@intel.com>
Date: Thu, 29 Nov 2012 10:00:47 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <cover.1354169442.git.hongxu.jia@windriver.com>
	<e5340a75b4d8dcdc897814eb2620828498cb8328.1354169442.git.hongxu.jia@windriver.com>
In-Reply-To: <e5340a75b4d8dcdc897814eb2620828498cb8328.1354169442.git.hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] populate_sdk_base:tarball installer:add sudo prompt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 08:15:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The small typo I mentioned in the previous mail is still there...

Thanks,
Laurentiu

On 11/29/2012 08:15 AM, Hongxu Jia wrote:
> +# if don't have the right to access dir, gain by sudo 
> +if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
> +	SUDO_EXEC=$(which "sudo")
> +	if [ -z $SUDO_EXEC ]; then
> +		echo "No command 'sudo' found, please install sduo first. Abort!"
s/sduo/sudo/                                                  ^^^^

> +		exit 1
> +	fi
> +
> +	# test sudo could gain root right
> +	$SUDO_EXEC pwd >/dev/null 2>&1
> +	[ $? -ne 0 ] && echo "Sorry, you are not allowed to execute as root." && exit 1
>  fi


