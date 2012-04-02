Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SEkhC-0007aj-Eq
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 19:05:34 +0200
Received: by pbcum15 with SMTP id um15so3867234pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2012 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8562FqYtHjIdBFEi1JgsxnqkJaMP5sIPBmBxgL7lXd8=;
	b=iI7E0FXOwqLrC3He8wFo+db3rUqloe0DIe4DQ7H1caXLQHDfeGlh5OXU0ccbHgsXii
	n9/smeLFT0ZmnbzstBep4d3BiPpafl9WYHq3+/0gE+HCz1fHp5ip3CSmIsn5T0E8BKxw
	qQdGewLqIw6SatASvuQzrBl7KmEAdIpn0CpYsGhGAZ40UmNxGu9sas7x29jFlJ0/uK2Q
	nfC4BO3skphbZ1w9sjHCqct/ucwNdD3riGgqYi8OKArGZ8G699AtFKAPldIv+04GyyYd
	/4unUCMkmX5EDevKHyLuvafZ/AJuz0sLuhx5z6+txB8v3ClkyFLqvFlHXcRK8snHNCXk
	26ng==
Received: by 10.68.226.5 with SMTP id ro5mr21526304pbc.138.1333385785348;
	Mon, 02 Apr 2012 09:56:25 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id
	ko12sm14355665pbb.52.2012.04.02.09.56.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Apr 2012 09:56:23 -0700 (PDT)
Date: Mon, 2 Apr 2012 09:56:15 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120402165615.GB24832@sakrah.homelinux.org>
References: <4F4B890D.90809@communistcode.co.uk>
	<4F61C5DF.8090705@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <4F61C5DF.8090705@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: cpufrequtils do_install issue
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
X-List-Received-Date: Mon, 02 Apr 2012 17:05:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/03/12 10:35), Jack Mitchell wrote:
> On 27/02/12 13:45, Jack Mitchell wrote:
> >I am having issues compiling the systemd-image for beaglebone
> >under Angstrom. I receive the following error message which seems
> >to state that 'install' is missing, is anyone else having trouble
> >or could provide some insight to this?
> >
> >    ERROR: Function failed: do_install (see
> >    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/temp/log.do_install.16223
> >    for further information)
> >    + cd
> >    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/git
> >    + do_install
> >    + oe_runmake -e install
> >    DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
> >    + '[' xmake = x ']'
> >    + bbnote make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
> >    'LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc'
> >    STRIPCMD=echo -e install
> >    DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
> >    + echo 'NOTE: make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
> >    LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc STRIPCMD=echo
> >    -e install
> >    DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image'
> >    NOTE: make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
> >    LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc STRIPCMD=echo
> >    -e install
> >    DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
> >    + make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
> >    'LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc'
> >    STRIPCMD=echo -e install
> >    DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
> >    /usr/bin/install -c -d
> >    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/lib
> >    /usr/bin/install -c -d
> >    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/bin
> >    /usr/bin/install -c -m 644 -D man/cpufreq-set.1
> >    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/share/man/man1/cpufreq-set.1
> >    /usr/bin/install -c -d
> >    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/share/locale
> >    make: /usr/bin/install: Command not found
> 
> Ok, I fixed this finally! In archlinux `install` is not located in
> /usr/bin/install but in /bin/install so a quick symlink and that was
> fixed. However, should bitbake be going into my system to use
> install like this, and should it be hard-coded in cpufrequtils?

I think the package makefile is probably hardcoding the path here nothin
that bitbake can do. You need to fix package build system to be cross
compile friendly

-- 
-Khem


