Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qocs6-00079r-BX
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 16:56:34 +0200
Received: by ywe9 with SMTP id 9so512829ywe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=62o9eF6mVNItM2/Q0hynX/ti4ZHIf4cUgHnRplpU8FM=;
	b=rkfVoXN1TWe6euAO1f4ki4v+bpdIlx9OaRGw+L3/PTWVCcNZNJuOVoPYdERBsz9QU7
	V81yreONZ9TSKK3FziZDLn5Eu9AQfqRHF9puaCGxKB94BSHnzx1lWeYA0O+jN/hjyHqy
	+RgedNOW7qd4WqqPiQ7Mn7PmxTK2MXckgvRQs=
Received: by 10.143.26.13 with SMTP id d13mr707212wfj.226.1312383131040;
	Wed, 03 Aug 2011 07:52:11 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id m12sm591841wfh.7.2011.08.03.07.52.09
	(version=SSLv3 cipher=OTHER); Wed, 03 Aug 2011 07:52:09 -0700 (PDT)
Message-ID: <4E396097.1000207@gmail.com>
Date: Wed, 03 Aug 2011 07:52:07 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110627 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
	<CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
In-Reply-To: <CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Aug 2011 14:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2011 11:18 PM, Samuel Stirtzel wrote:
> Hi,
> well I never thought this would work out, but after adding "-o rw" to
> the -append parameters the system started and the login prompt
> appeared.
>
> So this problem is solved, for completenes I append my used command
> line to start qemu:
>
> qemu-system-arm -M versatilepb -m 128 -kernel
> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin -hda
> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
> -append "root=/dev/sda -o rw"
>

There is a smart script in scripts/ dir that you could use something 
like this

runqemu /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin 
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2

and it will setup everything (even networking) for you

make sure that its run in shell where you have sourced setup environment 
of either oe-core or angstrom
Hope that helps

-Khem


