Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QpOLP-0007bZ-6k
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 19:37:59 +0200
Received: by iyf13 with SMTP id 13so5484595iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 10:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=e1Hz9HevDuurMmaT4patZANTJtDpNqWsGGfIyfmcNlY=;
	b=ZrBh/1v0wUlgdvTkt7dqtH5u7Z8sBufHiyy0Y4O6rADy61LiVpX6ktq4ZwC3oVkiYd
	jJjLucCVswqa/0s28hVYUSuj3C8lqBoP6NHCobyf2K+6VXFruztH+F1sUkUuoWwFc0NY
	x97IASMpHcx+Slgk4HgWpmJ3Dxv28bvQL9Hsk=
Received: by 10.42.154.131 with SMTP id q3mr2047919icw.312.1312565613344;
	Fri, 05 Aug 2011 10:33:33 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q13sm2154413ibi.60.2011.08.05.10.33.32
	(version=SSLv3 cipher=OTHER); Fri, 05 Aug 2011 10:33:32 -0700 (PDT)
Message-ID: <4E3C295C.6060700@gmail.com>
Date: Fri, 05 Aug 2011 10:33:16 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110801 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
	<CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
	<4E396097.1000207@gmail.com>
	<CAGiJk9fsRGZiA92vpOcT8X95KscOg-vFxqdB7hcW16MOSk0PWQ@mail.gmail.com>
	<4E3ABA58.9040408@gmail.com>
	<CAGiJk9eZgic_cL23CEJYq+++OW3233cdhpehwhsJkwo4=1yr9Q@mail.gmail.com>
In-Reply-To: <CAGiJk9eZgic_cL23CEJYq+++OW3233cdhpehwhsJkwo4=1yr9Q@mail.gmail.com>
X-Enigmail-Version: 1.2pre
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
X-List-Received-Date: Fri, 05 Aug 2011 17:37:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/04/2011 10:25 PM, Samuel Stirtzel wrote:
> 2011/8/4 Khem Raj <raj.khem@gmail.com>:
>> On 08/04/2011 01:08 AM, Samuel Stirtzel wrote:
>>> 
>>> 2011/8/3 Khem Raj<raj.khem@gmail.com>:
>>>> 
>>>> There is a smart script in scripts/ dir that you could use 
>>>> something like this
>>>> 
>>>> runqemu 
>>>> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> 
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
>>>> 
>>>> and it will setup everything (even networking) for you
>>>> 
>>> Already tried this one, but for some unknown reasons it doesn't 
>>> work, I get the following output: - 
>>> samuel@S-Linux:/var/oe-core/setup-scripts$ runqemu 
>>> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin
>>> 
>>> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> 
Set MACHINE to [qemuarm] based on kernel
>>> [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> 
Continuing with the following parameters:
>>> KERNEL: 
>>> [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> 
ROOTFS:
>>> [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2]
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> 
FSTYPE: [ext2]
>>> Setting up tap interface under sudo [sudo] password for samuel: 
>>> sudo runqemu-ifup<gid>  <native-sysroot-basedir> 
>>> samuel@S-Linux:/var/oe-core/setup-scripts$
>> 
>> A fix for this problem has been committed to oe-core already. 
>> Update and retry
>> 
> After i updated my oe-core files the script still won't work for me. 
> The new output is:: - 
> samuel@S-Stirtzel-Linux:/var/oe-core/setup-scripts$ runqemu 
> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin 
> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
>
>
>
>
>
>
>
> 
Set MACHINE to [qemuarm] based on kernel
> [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]
> 
> Continuing with the following parameters: KERNEL: 
> [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin] 
> ROOTFS: 
> [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2]
>
>
>
>
>
>
>
> 
FSTYPE: [ext2]
> Setting up tap interface under sudo [sudo] password for samuel: 
> Acquiring lockfile for tap0... Error: Unable to support this 
> combination of options

It means QEMUOPTIONS is empty in your case because you are sing ext2
image. It supports ext3 and btrfs

but it should be easy to add ext2 to mix. Can you try something like below

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index c15632d..64635df 100755
- --- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -277,7 +277,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" =
"qemuarmv6" -o "$MACHINE" = "qemuarm
     MACHINE_SUBTYPE=versatilepb
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
- -    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
+    if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" =
"ext2" ]; then
         KERNCMDLINE="root=/dev/sda rw console=ttyAMA0,115200
console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY hi
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M versatilepb -hda $ROOTFS
- -no-reboot $QEMU_UI_OPTIONS"
     fi


> Set 'tap0' nonpersistent Releasing lockfile of preconfigured tap 
> device 'tap0' -
> 
> This error was not created from the runqemu script itself. Maybe the
>  runqemu-initial script was expecting other options?
> 
> 
> Regards Samuel
> 
> _______________________________________________ Openembedded-core 
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


- --
>
>
>
>
>
>
> 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk48KVsACgkQuwUzVZGdMxSNaACffDYUHfK9qKdnYNdzCJCGr+3W
lqoAn2AFkMaezl4MLN7WbaE/zDjvu4vR
=pUFt
-----END PGP SIGNATURE-----


