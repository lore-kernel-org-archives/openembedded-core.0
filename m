Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 504A0731DC;
	Fri, 22 Jan 2016 01:28:56 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id e65so32862010pfe.0;
	Thu, 21 Jan 2016 17:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=NFl278OoYN9eDasJgJkIBX5s1LIG25iJ2xZrG/Adu5Y=;
	b=HwMKzeV1Cf5UFytv71u7/ejgE5Rkm1z0weMv0WYAirIff8shNBr1F7bKmFYBg0NZ2P
	d4gr9L3utdrIxeCWyX0SH+UZWX56o+jpDA48ORwn9a7o8N86cI2BLBnqEaxZSA1oha/8
	IpxAZ+Hgju6Z+Cz3vdIYaUXsrlQ23Cmyi9j68mpXkgjSImmzaSb1mAkSOvXAwzY29Q6+
	gc5Pp/dgxvGpTxo6X1MS/QsRuRm2vrDGhICFqGNsiea2J5jNCDgh/CHRqb0vPWb+KPMs
	wW8OikaAzqwr4DSyPhNFo/YL3sWnmjXzskYK1BIvbe/6JKR501H5rqcwXpdE7FfBFgkV
	7iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=NFl278OoYN9eDasJgJkIBX5s1LIG25iJ2xZrG/Adu5Y=;
	b=dj2ls/idmqMhKsAtAM1+IPV1+CYcHh8J6Uec7qe4GsaWJv+N3qEo0oATBSRz3lEy1w
	8gkaR1dWh6k618sD3VXIOhuMol9OxdhF3uFgi86Tym0rNX+QiWER+AYdXWnGaQYm2aMw
	HA3wsQkHbXfL6MsaJonWgebc21gYscycFXk+OMyVZHECu5CSC6SHjbGp794PQlhI0Xpo
	tnGq4Z6pRVpQuarBjdcS8OTXxWala1RY6Bb/EtoLGg8Cz9SEwsw212vgIobiAyyWD9Ei
	lLQrhCM18m0EbI/i0wudOcozxRZBt2v0codCU+lMzLC9ZiX93x6YUM5OsPJxUToovVRd
	nl9Q==
X-Gm-Message-State: AG10YOROypv/CZTnm9WbYeE6Y5oCXaLQ1PqRo1rIVx/B1FYNA0gI8vEypRJHoix/L8amHg==
X-Received: by 10.98.67.14 with SMTP id q14mr537287pfa.137.1453426137701;
	Thu, 21 Jan 2016 17:28:57 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:f0f5:a917:60f2:fe2?
	([2601:202:4000:1239:f0f5:a917:60f2:fe2])
	by smtp.googlemail.com with ESMTPSA id
	h87sm5286458pfd.33.2016.01.21.17.28.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jan 2016 17:28:56 -0800 (PST)
To: openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
References: <2747032A-1F56-4CA6-860C-484B9292A0B5@gmail.com>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56A185D6.8030502@gmail.com>
Date: Thu, 21 Jan 2016 17:28:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <2747032A-1F56-4CA6-860C-484B9292A0B5@gmail.com>
Subject: Re: [oe] [RFT] Glibc 2.23 and binutils 2.26
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
X-List-Received-Date: Fri, 22 Jan 2016 01:28:58 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 01/17/2016 03:54 AM, Khem Raj wrote:
> Hi all
> 
> upstream glibc and binutils release branches have been cut out and are being made ready for next release
> I have put together update patchset for both of them
> 
> here are the branches
> 
> https://github.com/kraj/openembedded-core/tree/kraj/binutils-2.26
> https://github.com/kraj/openembedded-core/tree/kraj/glibc-2.23

Several Security fixes will be included in glibc-2.23 update.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=8980


CVE-2015-8776 - Passing out of range data to strftime() causes a segfault

https://sourceware.org/bugzilla/show_bug.cgi?id=18985


CVE-2015-8777 - LD_POINTER_GUARD is not ignored for privileged binaries
https://sourceware.org/bugzilla/show_bug.cgi?id=18928

CVE-2015-8778 - hcreate((size_t)-1) should fail with ENOMEM
https://sourceware.org/bugzilla/show_bug.cgi?id=18240

CVE-2014-9761 - nan function unbounded stack allocation
https://sourceware.org/bugzilla/show_bug.cgi?id=16962

CVE-2015-8779 - catopen() Multiple unbounded stack allocations
https://sourceware.org/bugzilla/show_bug.cgi?id=17905

> 
> FYI These are still using autorev to ensure that we test tip of release branches
> 
> Please give them a shot in your environments and report any issues you encounter.

BTW, Mips64 Octeon3 works fine. Aarch64 qemu boot tested.

- Armin
> 
> Thanks for help
> 
> -Khem
> 
> 
> 
> 
> 

