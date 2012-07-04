Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SmR0f-0005i0-MP for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 16:56:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64Ejpcr024489
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 15:45:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24103-04 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2012 15:45:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64EjiqB024483
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 15:45:45 +0100
Message-ID: <1341413143.3906.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jul 2012 15:45:43 +0100
In-Reply-To: <4FF453EC.8030007@linux.intel.com>
References: <CAJ2CSBsPhAtmpoTpBRzfqghV6tnRQXmjpcY415h=XfXtHxQzHQ@mail.gmail.com>
	<4FF453EC.8030007@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Wed, 04 Jul 2012 14:56:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-04 at 17:32 +0300, Mihai Lindner wrote:
> On 7/4/2012 3:55 PM, Damian, Alexandru wrote:
> > Hi guys,
> > 
> > From time to time I get errors building gcc (although I didn't trigger a rebuild!) when runnign
> > bitbake core-image-sato-sdk
> > 
> > The error is attached:
> > /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1+svnr188658-r2/temp/log.do_configure.20668
> > 
> > What is causing this, is this a know bug ?
> > 
> > Cheers,
> > Alex
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> > 
> 
> To get a hint on why it fails, check
> in /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1
> +svnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/gcc/config.log if there's "CROSS COMPILE Badness:" or "is unsafe for cross-compilation".
>
> #$ grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for
> cross-compilation' /home/ddalex/ssd/yocto/build/tmp/work/i586-poky-linux/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/gcc/config.log
>
> `bitbake` will fail if `grep` has results.

It might be slightly more complex than this. gcc is ugly in that the
compile task executes a ton of separate configure processes and it could
be tripping up on the above expression on any one of those config.log
files.

Once you find the config.log, report back on which one it is and what
the message says and then we can work through how to fix it.

Cheers,

Richard




