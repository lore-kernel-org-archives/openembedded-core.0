Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SrSXG-0001eJ-TD
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 13:35:18 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SrSMK-0005Dj-Ju>; Wed, 18 Jul 2012 13:24:00 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SrSMK-0004CR-HB>; Wed, 18 Jul 2012 13:24:00 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SrSMJ-00084Z-EM
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 13:23:59 +0200
Date: Wed, 18 Jul 2012 13:23:59 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120718112359.GC29030@mi.fu-berlin.de>
References: <CAJTo0LY9WbxAW35NS-C1M4_rpDDD6SCXcRPw7OtdoR5WkFZirA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY9WbxAW35NS-C1M4_rpDDD6SCXcRPw7OtdoR5WkFZirA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
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
X-List-Received-Date: Wed, 18 Jul 2012 11:35:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 18, 2012 at 10:41:13AM +0100, Burton, Ross wrote:
> Hi,
> 
> My nightly run of master failed last night, but not in a way that the
> autobuilder is seeing...
> 
> ERROR: Function failed: do_install (see
> /data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/temp/log.do_install.10450
> for further information)
> ERROR: Logfile of failure stored in:
> /data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/temp/log.do_install.10450
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common',
> 'common-linux', 'common-glibc', 'i586-linux', 'common']
> | DEBUG: Executing shell function do_install
> | NOTE: make PARALLELMFLAGS=-j 8 cross-compiling=yes
> install_root=/data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/image
> includedir=/usr/include prefix=/usr install-bootstrap-headers=yes
> install-headers
> ...
> | make[1]: Entering directory
> `/data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/eglibc-2_15/libc'
> | /usr/bin/install -c -m 644 include/limits.h /usr/include/limits.h
> | /usr/bin/install: cannot remove `/usr/include/limits.h': Permission denied
> | make[1]: *** [/usr/include/limits.h] Error 1
> | make[1]: Leaving directory
> `/data/nightly-build-Uju/build/tmp/work/i586-poky-linux/eglibc-initial-2.15-r12+svnr19294/eglibc-2_15/libc'
> | make: *** [install-headers] Error 2
> | ERROR: oe_runmake failed
> 
> Any ideas?
> 
> Ross

NOTE: make PARALLELMFLAGS=-j 8 cross-compiling=yes prefix=/usr

So it tries to install eglibc to the host dirs which is of course failing.

Bye Henning


