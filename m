Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SEylk-0002Js-EZ
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 10:07:12 +0200
Received: from [192.168.0.51] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id A4DA62CFD9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2012 08:55:58 +0100 (BST)
Message-ID: <4F7AADA3.1020603@communistcode.co.uk>
Date: Tue, 03 Apr 2012 08:58:27 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120328 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F4B890D.90809@communistcode.co.uk>
	<4F61C5DF.8090705@communistcode.co.uk>
	<20120402165615.GB24832@sakrah.homelinux.org>
In-Reply-To: <20120402165615.GB24832@sakrah.homelinux.org>
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
X-List-Received-Date: Tue, 03 Apr 2012 08:07:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/12 17:56, Khem Raj wrote:
> On (15/03/12 10:35), Jack Mitchell wrote:
>> On 27/02/12 13:45, Jack Mitchell wrote:
>>> I am having issues compiling the systemd-image for beaglebone
>>> under Angstrom. I receive the following error message which seems
>>> to state that 'install' is missing, is anyone else having trouble
>>> or could provide some insight to this?
>>>
>>>     ERROR: Function failed: do_install (see
>>>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/temp/log.do_install.16223
>>>     for further information)
>>>     + cd
>>>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/git
>>>     + do_install
>>>     + oe_runmake -e install
>>>     DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
>>>     + '[' xmake = x ']'
>>>     + bbnote make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
>>>     'LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc'
>>>     STRIPCMD=echo -e install
>>>     DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
>>>     + echo 'NOTE: make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
>>>     LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc STRIPCMD=echo
>>>     -e install
>>>     DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image'
>>>     NOTE: make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
>>>     LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc STRIPCMD=echo
>>>     -e install
>>>     DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
>>>     + make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
>>>     'LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc'
>>>     STRIPCMD=echo -e install
>>>     DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
>>>     /usr/bin/install -c -d
>>>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/lib
>>>     /usr/bin/install -c -d
>>>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/bin
>>>     /usr/bin/install -c -m 644 -D man/cpufreq-set.1
>>>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/share/man/man1/cpufreq-set.1
>>>     /usr/bin/install -c -d
>>>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/share/locale
>>>     make: /usr/bin/install: Command not found
>> Ok, I fixed this finally! In archlinux `install` is not located in
>> /usr/bin/install but in /bin/install so a quick symlink and that was
>> fixed. However, should bitbake be going into my system to use
>> install like this, and should it be hard-coded in cpufrequtils?
> I think the package makefile is probably hardcoding the path here nothin
> that bitbake can do. You need to fix package build system to be cross
> compile friendly
>
Hi Khem,

Thanks for the reply. I did solve this issue (I could have sworn I 
posted a follow up email) and it was a hard coded link in the package. 
Cpufrequtils is vastly dated and it was just a dependency that something 
else was bringing in so I didn't really care for it. In the end I 
symlinked my install binary to where it expected it and that allowed me 
to build.

For the record the new kid on the block in this area is called 
'cpupower' it builds on cpufrequtils and brings it up to date (last 
cpufrequtils commit was sometime in 2009 if I remember correctly!) and 
is much better. If anyone is attempting to use cpufrequtils I would 
recommend checking it out instead.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



