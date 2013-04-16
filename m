Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USEXX-0005aC-8W for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 00:39:56 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GMMA9c023988; Tue, 16 Apr 2013 23:22:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ihNOUwwbcueG; Tue, 16 Apr 2013 23:22:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GMM5XO023980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 16 Apr 2013 23:22:07 +0100
Message-ID: <1366150895.25282.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
Date: Tue, 16 Apr 2013 23:21:35 +0100
In-Reply-To: <7D46E86EC0A8354091174257B2FED101594F0D62@DLEE11.ent.ti.com>
References: <1365685393-611-1-git-send-email-Chase.Maupin@ti.com>
	<1365685393-611-2-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED101594F0D62@DLEE11.ent.ti.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] u-boot: Add UBOOT_LOCALVERSION to control version string
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
X-List-Received-Date: Tue, 16 Apr 2013 22:39:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-16 at 11:59 +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: Maupin, Chase
> > Sent: Thursday, April 11, 2013 8:03 AM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Maupin, Chase
> > Subject: [PATCHv2] u-boot: Add UBOOT_LOCALVERSION to control
> > version string
> > 
> > * Add a variable called UBOOT_LOCALVERSION which when set will
> >   place a version string in the .scmversion file of the u-boot
> >   sources.  This string will be picked up by the u-boot Makefile
> >   and will be appended to the u-boot version.  This is done to
> >   make it easier to identify what revision of the u-boot sources
> >   are being run.  For example you can use a setting like the
> >   following to add the short commit id to the u-boot version
> >   string:
> > 
> > UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV',
> > True).partition('+')[2][0:7]}"
> > 
> 
> Ping on this patch

These are really enhancements, not bug fixes and are too late for 1.4
since they came in after the feature freeze.

I'm nervous of them as there have been several iterations and I can't
easily tell what impact these will have on the different package
backends, or linux-yocto verses non linux-yocto for example.

Its simply too late and there are other bigger issues I'm worried about.
I therefore don't want to take this additional risk, sorry.

Cheers,

Richard



