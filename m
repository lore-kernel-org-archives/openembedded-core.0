Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qoztj-0004nY-R4
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:31:48 +0200
Received: by pzk2 with SMTP id 2so1866112pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=P7KJw6IwkFBrEY32jWE2YVOY7/d5E/hqaDSpBrWFVS0=;
	b=CinvXFgr3Hd+981amo5d2RNpMtu5EXVw/PHCOFxhG/Y2ScEHAYpDH/pCncuBmtuFsp
	78SLu+6I7uRUIx03NL/s38gP7wML0QalFQslmtrSrhIeZIWzktsclxR6gGk2PGG0y7p2
	FWARofw34XRrkfaaDp8AM+hs6514l9QfZZCzI=
Received: by 10.142.152.32 with SMTP id z32mr894154wfd.396.1312471643319;
	Thu, 04 Aug 2011 08:27:23 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v2sm2333721pbi.35.2011.08.04.08.27.22
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 08:27:22 -0700 (PDT)
Message-ID: <4E3ABA58.9040408@gmail.com>
Date: Thu, 04 Aug 2011 08:27:20 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110627 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
	<CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
	<4E396097.1000207@gmail.com>
	<CAGiJk9fsRGZiA92vpOcT8X95KscOg-vFxqdB7hcW16MOSk0PWQ@mail.gmail.com>
In-Reply-To: <CAGiJk9fsRGZiA92vpOcT8X95KscOg-vFxqdB7hcW16MOSk0PWQ@mail.gmail.com>
Subject: Re: Error running QEMU with oe-core / angstrom console-image, hwclock: can't open '/dev/misc/rtc' : No such file or directory
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
X-List-Received-Date: Thu, 04 Aug 2011 15:31:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 01:08 AM, Samuel Stirtzel wrote:
> 2011/8/3 Khem Raj<raj.khem@gmail.com>:
>> There is a smart script in scripts/ dir that you could use something like
>> this
>>
>> runqemu /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin
>> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
>>
>> and it will setup everything (even networking) for you
>>
> Already tried this one, but for some unknown reasons it doesn't work,
> I get the following output:
> -
> samuel@S-Linux:/var/oe-core/setup-scripts$ runqemu
> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin
> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
> Set MACHINE to [qemuarm] based on kernel
> [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]
>
> Continuing with the following parameters:
> KERNEL: [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]
> ROOTFS: [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2]
> FSTYPE: [ext2]
> Setting up tap interface under sudo
> [sudo] password for samuel:
> sudo runqemu-ifup<gid>  <native-sysroot-basedir>
> samuel@S-Linux:/var/oe-core/setup-scripts$

A fix for this problem has been committed to oe-core already. Update and 
retry

> -
> This is all, no QEMU window appears or any other messages, or do I
> have run something else.

Nothing more. It should pop up a window where you will see the new 
machine booting

>
> For remote debugging purpose I wrote a generic script that will set up
> a tap and bridge interface and restores the network connection after
> qemu closes.
> This script can also run QEMU with standard network settings.
> Basically runqemu and my scripts should do the same thing(?), but
> since runqemu doesn't work for me I made my own scripts (also it won't
> need sudo if the standard network option is used).
>
> The scripts are attached in this mail, to run the script you could use
> "sh /somedir/generic_qemu_loader.sh --help".
> This script however may not work on other systems than ubuntu, I share
> it only for information exchange purpose.
> If you still want to use it, keep in thought that I am a beginner in
> shell coding!
>
> The difference between the standard network settings and the
> bridge/tap interfaces is, that the standard network only supports
> outgoing TCP and UDP connections while the bridge/tap interface can be
> used to host, for example, a gdbserver.
>
>
> Regards
> Samuel
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



