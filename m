Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SrTJC-0002mH-9N for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 14:24:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ICDUHV024599
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 13:13:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24227-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 13:13:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ICDNKp024592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 13:13:24 +0100
Message-ID: <1342613606.30680.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2012 13:13:26 +0100
In-Reply-To: <20120718112359.GC29030@mi.fu-berlin.de>
References: <CAJTo0LY9WbxAW35NS-C1M4_rpDDD6SCXcRPw7OtdoR5WkFZirA@mail.gmail.com>
	<20120718112359.GC29030@mi.fu-berlin.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: eglibc-initial trying to remove files in /usr
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
X-List-Received-Date: Wed, 18 Jul 2012 12:24:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-18 at 13:23 +0200, Henning Heinold wrote:
> On Wed, Jul 18, 2012 at 10:41:13AM +0100, Burton, Ross wrote:
> > Hi,
> > 
> > My nightly run of master failed last night, but not in a way that the
> > autobuilder is seeing...
> > 
> > ERROR: Function failed: do_install (see
> > /data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/temp/log.do_install.10450
> > for further information)
> > ERROR: Logfile of failure stored in:
> > /data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/temp/log.do_install.10450
> > Log data follows:
> > | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common',
> > 'common-linux', 'common-glibc', 'i586-linux', 'common']
> > | DEBUG: Executing shell function do_install
> > | NOTE: make PARALLELMFLAGS=-j 8 cross-compiling=yes
> > install_root=/data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/image
> > includedir=/usr/include prefix=/usr install-bootstrap-headers=yes
> > install-headers
> > ...
> > | make[1]: Entering directory
> > `/data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/eglibc-2_15/libc'
> > | /usr/bin/install -c -m 644 include/limits.h /usr/include/limits.h
> > | /usr/bin/install: cannot remove `/usr/include/limits.h': Permission denied
> > | make[1]: *** [/usr/include/limits.h] Error 1
> > | make[1]: Leaving directory
> > `/data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/eglibc-2_15/libc'
> > | make: *** [install-headers] Error 2
> > | ERROR: oe_runmake failed
> > 
> > Any ideas?
> > 
> > Ross
> 
> NOTE: make PARALLELMFLAGS=-j 8 cross-compiling=yes prefix=/usr
> 
> So it tries to install eglibc to the host dirs which is of course failing.

install_root is also set though so it shouldn't be installing to host
dirs...

Cheers,

Richard



