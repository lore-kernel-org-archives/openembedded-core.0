Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNQsN-0006Ll-T1
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 16:40:28 +0200
Received: by pzk36 with SMTP id 36so1757863pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=vU4ApOZaRJk/hHARvCyME/ATVZDtQWQFS0OPPQLCWKs=;
	b=ScDS32tnHQ9QhjF8G7mHQ9ceTY66ZYh9UZu+vJ5AQSbJ/9bVupvqAf8HuFV3oVWsFd
	L3yRXMKCmDZHOK8voiOw/1UfbEiR8iokWqwzKFAwiCpXA8695MjFl0YA1Ffx290JuKa0
	CzUXwMg9mhFiMtq86R1MkyW7R+KmXk2DLv8fI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=g4x8KWtxS1/WJtz1PdYbfMYvVrQrgjlWsvthwOHc41wjYd0xnHyb/MlIZYZgw/9VWO
	SfGTnZ2PTaXf7CaVK+c7Zfn3gVER9xVfU/LeUwrh5q63WWB7UIBjF4nmjCiAM4svgyua
	yTDGmBTjvx1BYmSTe5HuWE+1pgXycgklwedKA=
Received: by 10.143.62.18 with SMTP id p18mr2601903wfk.259.1305902249558;
	Fri, 20 May 2011 07:37:29 -0700 (PDT)
Received: from [192.168.1.82] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 25sm3295891wfb.10.2011.05.20.07.37.26
	(version=SSLv3 cipher=OTHER); Fri, 20 May 2011 07:37:27 -0700 (PDT)
Message-ID: <4DD67CAB.2060604@gmail.com>
Date: Fri, 20 May 2011 07:37:31 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <BF0FE697-3489-4B92-AB20-36DE6B63E5C0@dominion.thruhere.net>
In-Reply-To: <BF0FE697-3489-4B92-AB20-36DE6B63E5C0@dominion.thruhere.net>
Subject: Re: New fetcher failure for local files
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
X-List-Received-Date: Fri, 20 May 2011 14:40:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/2011 12:25 AM, Koen Kooi wrote:
> Hi,
>
> Since a few days the fetcher is behaving strangely:
>
> NOTE: package linux-omap-psp-2.6.32-r99b+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155: task do_fetch: Started
> ERROR: Function 'Fetcher failure for URL: 'file://defconfig'. Unable to fetch URL file://defconfig from any source.' failed
>
> It is present:
>
> koen@dominion:/OE/tentacle/sources/meta-texasinstruments$ find . -name "defconfig" | grep beagle
> ./recipes-bsp/linux/linux-omap-psp-2.6.32/beagleboard/defconfig
> ./recipes-bsp/linux/linux-omap/beagleboard/defconfig
>
> The strange thing is that it will work once (e.g. bitbake console-image) but it will fail after switching TCLIBC. And once it started failing, it doesn't work for the default TCLIBC either.
>
> What's the best way to debug this? -DDD isn't giving much clues, nor does strace :(
>

one reason could be FILESPATH is missing the paths which are appended 
with overrides like MACHINE and others
check dump of bitbake -e <recipe>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



