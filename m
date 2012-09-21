Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TF4nL-0004U0-6i
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 17:05:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Sep 2012 07:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,463,1344236400"; d="scan'208";a="147582646"
Received: from unknown (HELO [10.252.121.247]) ([10.252.121.247])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Sep 2012 07:52:44 -0700
Message-ID: <505C7F3A.7020400@intel.com>
Date: Fri, 21 Sep 2012 17:52:42 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: ml@communistcode.co.uk
References: <505C7402.4060604@communistcode.co.uk>
In-Reply-To: <505C7402.4060604@communistcode.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: ld problems with relocated toolchain
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
X-List-Received-Date: Fri, 21 Sep 2012 15:05:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 09/21/2012 05:04 PM, Jack Mitchell wrote:
> I am currently having issues building my application with the latest 
> toolchain.
> 
> I have used the new capabilities of it being relocatable to place it 
> somewhere sensible and I think this may be what is breaking it. My old 
> toolchain in /opt still works perfectly.
> 
> The error I receive is:
> 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: 
> cannot find crtbegin.o: No such file or directory
> collect2: error: ld returned 1 exit status
> make: *** [R0005] Error 1
Did this error appear after the latest SDK fixes that were merged today?
Can you activate compiler verbose mode so we can see the arguments
passed to the linker? Does it work if you install in the default
location? Or better, can you tell the exact steps you followed to get
this issue?

Thanks,
Laurentiu
> 
> However, crtbeign.o is at the path:
> 
>     [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ pwd
> /home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi
>     [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ find . -name
>     crtbegin.o
>     ./usr/lib/arm-poky-linux-gnueabi/4.7.2/crtbegin.o
>     [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/lib
>     lib/     libexec/
>     [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/libexec/
>     pt_chown
>     [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$
> 
> 
> Does anyone have an idea what is the issue here? Why can't it find the 
> object file?
> 


