Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U343M-0005TP-LT
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 13:24:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2013 04:08:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,615,1355126400"; d="scan'208";a="281665657"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2013 04:08:42 -0800
Message-ID: <511247C9.2010505@intel.com>
Date: Wed, 06 Feb 2013 14:08:41 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130206093802.16EA32097@opal> <20130206115620.GT3271@jama>
In-Reply-To: <20130206115620.GT3271@jama>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : add fontcache.bbclass
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
X-List-Received-Date: Wed, 06 Feb 2013 12:24:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/06/2013 01:56 PM, Martin Jansa wrote:
> Fails in do_rootfs here, but without any details in log:
> Building from feeds activated!
> Running intercept scripts:
>> > Executing update_font_cache
> ERROR: Function failed: do_rootfs (see
> /OE/shr-core/tmp-eglibc/work/tuna-oe-linux-gnueabi/shr-image/2.0-r20/temp/log.do_rootfs.2236
> for further information)
> 
Most probably fontconfig package was not rebuilt with the new sysroot
feature. Can you run the native fc-cache with --help and look for a
sysroot option? If it's there, than it's probably a qemu issue... :/

Thanks,
Laurentiu


