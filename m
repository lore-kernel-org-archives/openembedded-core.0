Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 06D147970E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 07:09:07 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v17-v6so24386554wrr.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 00:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=9l3XIGt4N0iNncBgWsekqDvWH8IhrCPoYhjoChZ4hnM=;
	b=cyl+SIcYPuPUa6cLRa004OJRSI6IFnqnmX0dnJdSHJoYHbYqFbuoGi1/yfiEDVNLo0
	b4vv6tYYMPRSnUl2pHUjQg1kYaxXfbliV8J7iVyplz5axlQk1bbYl0VEzjcD5PO0v2Vd
	wWa0Dnno/ns5lACUldCBJnbnGwjGpkgbv6Efn2RoNJEpDmMuPKuCOPETZ4LDpQoaxhi9
	Qzuvmkmg42/IOG4mtPj6MMHE+CC9FtFYJIOykcfmwTI3VGN7Q/5CFLlNHFq2Ia0w+LnX
	2hRP9t5JMTF61uNQuOqYxV7ujhPUJ4wvncE1M09JeROjEZq7GEygtxujS1E5+3iKvKKg
	lHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=9l3XIGt4N0iNncBgWsekqDvWH8IhrCPoYhjoChZ4hnM=;
	b=HdsR8DJR5OOcXMpJ/KjGaI9b66B52om+hg6J3x6Ba59G1EYVTothUBTp5moj9G2EMe
	OP+cyqlvV1cL5LnjiOs68SVUgW0oDflkk+gh45WOSN418nsmL/vMNFGgmLAsK/iFLOnQ
	jkGABvNIV1BYTV14NSjxreRQgplK8OdCS0wuBzfLVrv9LNv1um9mjDWAy1feM7T7XRLV
	j32f4AT3p3R0uY29FN9rYjrhAQYn1OJZ9e7fXbdkKjDT5K2JYJqUDdDhj7X4gMWJ2DvX
	tZodqQvBsPbMCDzIrAQsWeSalcPqDbE/AjNbtRtJhL/OXGUGF6zloOojBPWUmvCoB09F
	JSNQ==
X-Gm-Message-State: APzg51AomNldjMi2/22swKNLHKVnkoU0/6JjUrq6moKwJeuggE9jGt00
	FXVpsVyJ6OWrPjhgw5Xro+Re/4YOwY0LzZRjwd8=
X-Google-Smtp-Source: ANB0VdbWRrkUJBk1dRtqFNwLIpe9IE8/42UVpFOb9dmrWUY6UsfJrkOoQvTWS12rVQXebcEirfp6xlK4sPWF1RzIK9U=
X-Received: by 2002:a5d:448d:: with SMTP id
	j13-v6mr17673228wrq.236.1536649748718; 
	Tue, 11 Sep 2018 00:09:08 -0700 (PDT)
MIME-Version: 1.0
Sender: rehsack@gmail.com
Received: by 2002:a5d:6511:0:0:0:0:0 with HTTP; Tue, 11 Sep 2018 00:09:07
	-0700 (PDT)
In-Reply-To: <CAJTo0LYHhteuX2y0cvW9DWOw1ey31EpWDB1Q8mHHCN2qaxUung@mail.gmail.com>
References: <20180907145533.31088-1-sno@netbsd.org>
	<10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
	<CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
	<CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
	<6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
	<CAJTo0LYHhteuX2y0cvW9DWOw1ey31EpWDB1Q8mHHCN2qaxUung@mail.gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Date: Tue, 11 Sep 2018 09:09:07 +0200
X-Google-Sender-Auth: 6k1XvN0nzKpgdKnc_TTfr0OuuSg
Message-ID: <CAANR1XFe-oSmieX32rSzWQHBqg=XfU0TAO2ehOk8sS8kd7XFuA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: =?UTF-8?Q?Sven_H=C3=A4drich?= <svenha@external.miltenyibiotec.de>,
	Igor Kreps <igork@miltenyibiotec.de>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2018 07:09:08 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-10 18:38 GMT+02:00 Burton, Ross <ross.burton@intel.com>:
> One thing to be aware of is that I've been fixing up Python's PGO
> support and there's a slew of patches in master-next and more just
> posted that this needs to be rebased on top of.  Good news is that my
> patches remove two of the patches we've been carrying!

That will be no problem. Just drop me a note, I'm happy to rebase to
get a python-3.7 with fixed PGO :)

> Ross
>
> On 10 September 2018 at 17:36, Jens Rehsack <sno@netbsd.org> wrote:
>>
>>
>> Am 10.09.2018 um 11:35 schrieb Alexander Kanavin <alex.kanavin@gmail.com>:
>>
>> Large parts of dnf and friends have been rewritten in c++. I have not
>> yet updated and reviewed that, that will happen in the next cycle.
>>
>>
>> If I can prepare something for you - drop me a note.
>> Otherwise - the perl-5.28 update ("." in @INC, regex buffer overflow, ...)
>> is also
>> awaiting some progress (I can keep "myself" busy).
>>
>> There's already enough disruption to deal with (postinsts errors,
>> openssl 1.1, both caused by me :)
>>
>>
>> You know, corner, ash, ... things happen. But there is progress! Great!
>>
>> Good that we got all the way to do_rootfs though with 3.7.
>>
>>
>> Yeah, but than came postinst (coreutils :P) :D
>>
>> Cheers
>>
>> Alex
>>
>> 2018-09-10 0:38 GMT+02:00 Tim Orling <ticotimo@gmail.com>:
>>
>> I did not review the patches closely, but I did try to build
>> core-image-full-cmdline with the tip of poky and these patches applied.
>> Everything was fine until do_rootfs... I've attached the log.
>>
>> Essentially, there are some bits of dnf and so on which are not ready for
>> Python 3.7. We have dnf version 2.7.5, but the latest upstream release is
>> 3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet if that would have
>> helped.
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>> --
>> Jens Rehsack - rehsack@gmail.com
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

