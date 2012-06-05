Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sc1xB-0002RB-Tw for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 00:10:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q55LxgQw002842;
	Tue, 5 Jun 2012 22:59:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01224-07; Tue,  5 Jun 2012 22:59:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q55LxLuN002832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 5 Jun 2012 22:59:27 +0100
Message-ID: <1338933560.20169.277.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Date: Tue, 05 Jun 2012 22:59:20 +0100
In-Reply-To: <4FCCE8B8.7020705@intel.com>
References: <4FCCE8B8.7020705@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Consolidated Pull 00/19] General pull request
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
X-List-Received-Date: Tue, 05 Jun 2012 22:10:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-06-04 at 09:56 -0700, Elizabeth Flanagan wrote:
> Richard,
> 
> These patches have been tested on the autobuilder with no introduced issues.
> 
> I've excluded Mark's RPM update until we figure out why it's failing
> do_populate_sdk as well as Cristian Iorga's ltp patch which breaks ltp
> do_compiles.
> 
> I seem to be having issues posting to the OE-core list from
> git-send-mail, so this
> is being sent outside of git-send-mail.

Thanks for putting this together, it helps!

> The following changes since commit de4cdfd6bc1280ac7ac0559b87734d26294ef773:
> 
>   documentation/kernel-manual/kernel-how-to.xml: Updated to kernel 3.4
> (2012-05-31 21:16:55 +0100)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib stage/eflanagan_mut
>  
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stage/eflanagan_mut
> 
> Christopher Larson (3):
>   external-sourcery: extract src and dest sysroot paths from gcc
>   tcmode-external-sourcery: pass -msgxx-glibc for x86
>   external-sourcery-toolchain: forcibly create usr/lib
> 
> Elizabeth Flanagan (3):
>   license.bbclass: Adding PV to package.manifest
>   license.bbclass: optimize pkg runtime data
>   lsbinitscripts: Missing popt DEPENDS
> 
> Laurentiu Palcu (2):
>   directfb: upgrade to 1.5.3
>   directfb-examples: upgrade to 1.5.3
> 
> Radu Moisan (1):
>   dbus: update to version 1.4.20
> 
> Robert Yang (3):
>   kernel.py: replace os.popen with subprocess.Popen
>   generate-manifest-2.7.py: replace os.popen with os.unlink
>   opkg 0.1.8: respect to the arch when choose the alternatives
> 
> Ross Burton (1):
>   connman: just give xuser the extra rights it needs
> 
> Xiaofeng Yan (5):
>   lsbinitscripts: Add initscripts to enhance init functions in an lsb
>     image
>   lsbinitscripts: Patch file functions for confirming to an lsb image
>   task-core-lsb: Add another initscripts to an lsb image
>   archiver.bbclass: Improve the usability for the archiver classes
>   local.conf.sample.extended: Change the usage about arhiver.bbclass
> 
> Xin Ouyang (1):
>   cpan.bbclass: Fix config error while patches to Makefile.PL

I merged these apart from the opkg change where Koen has a valid issue
with the change which we need to figure out. I took the v2 of Chris'
patches.

Cheers,

Richard



