Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TliZY-00082N-7T
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 17:02:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2012 07:46:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,324,1355126400"; d="scan'208";a="237027713"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 20 Dec 2012 07:47:24 -0800
Message-ID: <50D3330B.1020202@intel.com>
Date: Thu, 20 Dec 2012 17:47:23 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1355933032-25392-1-git-send-email-laurentiu.palcu@intel.com>
	<1356016878.24487.187.camel@phil-desktop>
In-Reply-To: <1356016878.24487.187.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: have postinstalls run at do_rootfs time
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
X-List-Received-Date: Thu, 20 Dec 2012 16:02:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/20/2012 05:21 PM, Phil Blundell wrote:
> On Wed, 2012-12-19 at 18:03 +0200, Laurentiu Palcu wrote:
>> Since pango-native is built anyway and all the modules are in the native
>> sysroot, create the cache file by scanning those files instead of the
>> target files. The latter will fail because the shared objects wouldn't
>> be from the same ELF class.
> 
> Is it guaranteed that the native build will have the same set of
> modules?  It seems to me that it would be safer to scan the target ones
> under qemu as you did for gtk-immodules.
AFAIK pango-native builds all modules. I suppose I could also do it as I
did it for matchbox-keyboard package but I'd always prefer to avoid qemu
overhead whenever we can do it entirely natively.

Thanks,
Laurentiu
> 
> p.
> 
> 


