Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QpCym-0001yY-KA
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 07:29:52 +0200
Received: by fxg11 with SMTP id 11so1636387fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 22:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=mkc9fgCMEflaK59qhnu0Nq3aAFpE43nlae6iBl8dxhM=;
	b=qoyAjglgZOeGqI///l6Wfd0XlLbM2kDvMEMydfSrFl/zKL64A/HiggsqIoru6FhU8T
	lWZ+RrXVuDXVlO5bqtx+nik9wIEiOg2UsJFyo9nu9VqzmAFcAfLIAQBcJs8Ct3PgZ+2t
	8vph/oR+fG83M6+++f1SFu2h6+0J0+NhtziBc=
MIME-Version: 1.0
Received: by 10.223.7.66 with SMTP id c2mr2322083fac.35.1312521928353; Thu, 04
	Aug 2011 22:25:28 -0700 (PDT)
Received: by 10.223.123.2 with HTTP; Thu, 4 Aug 2011 22:25:28 -0700 (PDT)
In-Reply-To: <4E3ABA58.9040408@gmail.com>
References: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
	<CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
	<4E396097.1000207@gmail.com>
	<CAGiJk9fsRGZiA92vpOcT8X95KscOg-vFxqdB7hcW16MOSk0PWQ@mail.gmail.com>
	<4E3ABA58.9040408@gmail.com>
Date: Fri, 5 Aug 2011 07:25:28 +0200
Message-ID: <CAGiJk9eZgic_cL23CEJYq+++OW3233cdhpehwhsJkwo4=1yr9Q@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 05 Aug 2011 05:29:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/8/4 Khem Raj <raj.khem@gmail.com>:
> On 08/04/2011 01:08 AM, Samuel Stirtzel wrote:
>>
>> 2011/8/3 Khem Raj<raj.khem@gmail.com>:
>>>
>>> There is a smart script in scripts/ dir that you could use something li=
ke
>>> this
>>>
>>> runqemu /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bi=
n
>>> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext=
2
>>>
>>> and it will setup everything (even networking) for you
>>>
>> Already tried this one, but for some unknown reasons it doesn't work,
>> I get the following output:
>> -
>> samuel@S-Linux:/var/oe-core/setup-scripts$ runqemu
>> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin
>> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
>> Set MACHINE to [qemuarm] based on kernel
>> [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]
>>
>> Continuing with the following parameters:
>> KERNEL: [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bi=
n]
>> ROOTFS:
>> [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext=
2]
>> FSTYPE: [ext2]
>> Setting up tap interface under sudo
>> [sudo] password for samuel:
>> sudo runqemu-ifup<gid> =A0<native-sysroot-basedir>
>> samuel@S-Linux:/var/oe-core/setup-scripts$
>
> A fix for this problem has been committed to oe-core already. Update and
> retry
>
After i updated my oe-core files the script still won't work for me.
The new output is::
-
samuel@S-Stirtzel-Linux:/var/oe-core/setup-scripts$ runqemu
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
Set MACHINE to [qemuarm] based on kernel
[/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]

Continuing with the following parameters:
KERNEL: [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]
ROOTFS: [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuar=
m.ext2]
FSTYPE: [ext2]
Setting up tap interface under sudo
[sudo] password for samuel:
Acquiring lockfile for tap0...
Error: Unable to support this combination of options
Set 'tap0' nonpersistent
Releasing lockfile of preconfigured tap device 'tap0'
-

This error was not created from the runqemu script itself.
Maybe the runqemu-initial script was expecting other options?


Regards
Samuel


