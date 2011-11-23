Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RT8tm-000674-M9 for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 10:13:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAN97Fmk032440
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 09:07:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31359-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 09:07:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAN976Rk032433
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 09:07:07 GMT
Message-ID: <1322039233.18926.75.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2011 09:07:13 +0000
In-Reply-To: <4ECBFF1A.9060002@linux.intel.com>
References: <cover.1321921040.git.nitin.a.kamble@intel.com>
	<4ECBFF1A.9060002@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] netbase.bbappend version fix - version 2
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
X-List-Received-Date: Wed, 23 Nov 2011 09:13:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-22 at 11:59 -0800, Saul Wold wrote:
> On 11/21/2011 04:18 PM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > The following changes since commit 7022a8f8045bdf82b9209b8cd62fb09c4a7a24f8:
> >
> >    gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a (2011-11-21 16:55:12 +0000)
> >
> > are available in the git repository at:
> >    git://git.pokylinux.org/poky-contrib nitin/misc
> >    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
> >
> > Nitin A Kamble (1):
> >    netbase.bbappend: sync up with oecore/yocto layer
> >
> >   .../beagleboard/interfaces                         |    0
> >   ...netbase_4.46.bbappend =>  netbase_4.47.bbappend} |    0
> >   2 files changed, 0 insertions(+), 0 deletions(-)
> >   rename meta-yocto/recipes-core/netbase/{netbase-4.46 =>  netbase-4.47}/beagleboard/interfaces (100%)
> >   rename meta-yocto/recipes-core/netbase/{netbase_4.46.bbappend =>  netbase_4.47.bbappend} (100%)
> >
> 
> This should really go to the poky@yoctoproject.org list since it's poky 
> specific.

There has also been a fix for this merged already.

Cheers,

Richard



