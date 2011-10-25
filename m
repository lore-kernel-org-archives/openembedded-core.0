Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RIbMF-0005zg-Ea for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 09:23:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9P7HXIx005664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 08:17:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05121-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 08:17:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9P7HMkC005658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 08:17:24 +0100
Message-ID: <1319527042.26563.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 25 Oct 2011 08:17:22 +0100
In-Reply-To: <20111025070642.GE3602@jama.jama.net>
References: <cover.1319132699.git.nitin.a.kamble@intel.com>
	<c12754ae1baee14c13a2467e31efd975f7f33258.1319132699.git.nitin.a.kamble@intel.com>
	<20111025070642.GE3602@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] perl: upgrade from 5.12.3 to 5.14.2
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
X-List-Received-Date: Tue, 25 Oct 2011 07:23:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-25 at 09:06 +0200, Martin Jansa wrote:
> On Thu, Oct 20, 2011 at 10:47:08AM -0700, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > 
> > parallel build fix patches are not needed as they are upstream now.
> > Got a new set of debian patch set for 5.14.2
> 
> I know that nobody wants PR bumps and nobody cares so much about upgrade
> paths on target, but after this all perl stuff is still in
> 
> tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.12.3/
> tmp/sysroots/*/usr/lib/perl/5.12.3
> and also /usr/lib/perl/5.12.3 on target
> 
> so it won't work until someone manually rebuilds *perl*-native and
> target recipes with perl modules and user opkg install -force-reinstall
> them all..
> 
> I have just noticed because pulseaudio fails again:
> | checking for perl >= 5.8.1... 5.14.2
> | checking for XML::Parser... configure: error: XML::Parser perl module
> is required for intltool
> | + bbfatal 'oe_runconf failed'
> | + echo 'ERROR: oe_runconf failed'
> | ERROR: oe_runconf failed
> | + exit 1
> | ERROR: Function 'do_configure' failed (see
> /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/pulseaudio-0.9.23-r6/temp/log.do_configure.16391
> for further information)
> NOTE: package pulseaudio-0.9.23-r6: task do_configure: Failed
> 
> This time not because of wrong perl being used..

I'm about to get on a plane for ELC-E but if someone sends out a PR bump
patch which changes the appropriate pieces I'll merge it...

Cheers,

Richard



