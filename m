Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1SmQna-0005Vt-SZ
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 16:43:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2012 07:32:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="161370875"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 Jul 2012 07:32:13 -0700
Received: from [10.237.105.47] (mlindnex-mobl1.ger.corp.intel.com
	[10.237.105.47])
	by linux.intel.com (Postfix) with ESMTP id 7157D2C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2012 07:32:16 -0700 (PDT)
Message-ID: <4FF453EC.8030007@linux.intel.com>
Date: Wed, 04 Jul 2012 17:32:12 +0300
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
Organization: Intel OTC
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJ2CSBsPhAtmpoTpBRzfqghV6tnRQXmjpcY415h=XfXtHxQzHQ@mail.gmail.com>
In-Reply-To: <CAJ2CSBsPhAtmpoTpBRzfqghV6tnRQXmjpcY415h=XfXtHxQzHQ@mail.gmail.com>
Subject: Re: gcc errors while building core-image-sato-sdk
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
X-List-Received-Date: Wed, 04 Jul 2012 14:43:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 7/4/2012 3:55 PM, Damian, Alexandru wrote:
> Hi guys,
> 
> From time to time I get errors building gcc (although I didn't trigger a rebuild!) when runnign
> bitbake core-image-sato-sdk
> 
> The error is attached:
> /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1+svnr188658-r2/temp/log.do_configure.20668
> 
> What is causing this, is this a know bug ?
> 
> Cheers,
> Alex
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 

To get a hint on why it fails, check in /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/gcc/config.log if there's "CROSS COMPILE Badness:" or "is unsafe for cross-compilation".

#$ grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/gcc/config.log

`bitbake` will fail if `grep` has results.

-- 
Mihai Lindner
Yocto Project




