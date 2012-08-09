Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SzUJG-0002qv-BF
	for openembedded-core@linuxtogo.org; Thu, 09 Aug 2012 17:06:02 +0200
Received: by eekc50 with SMTP id c50so184009eek.37
	for <openembedded-core@linuxtogo.org>;
	Thu, 09 Aug 2012 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=cfIlJq210uWtIcWnzEO3/mxQaS/KRlr4byCDm5aEo4o=;
	b=PKhntJGRE9HZuNI+rFwQboYHBIoTayNgdKgaC74xoqcnY+acX5l8E5ihUBGgBZv7oh
	qH7uN42aqqS1e5GWdOYbjJ24uer9r9TuHB2mzp8CdN13Y13MaBFHaxFUYsvrG/gETdNm
	FLtCrDuPM6vl+bx5F/GD1lZrVDU04uyF8EbOQpI00lUWVI/FuZFHibC//zVPHKki8cEP
	mPV+dWBlTVLMUD0uQNq63c92OhR7rFYjSybLMDrTKBxwzTeUNIJRIo7SrZNDcy4sliUw
	iv4UMDpr7fiIuzjLxL55Z3XWRTtqQX5bUw2oRQ0Twdkq3GP2HpttgKER+NVKfT1ycPZv
	YmRQ==
Received: by 10.14.203.69 with SMTP id e45mr18337614eeo.23.1344524054034; Thu,
	09 Aug 2012 07:54:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Thu, 9 Aug 2012 07:53:43 -0700 (PDT)
In-Reply-To: <20120809131016.GA3273@jama.jama.net>
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
	<20120809131016.GA3273@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Aug 2012 07:53:43 -0700
Message-ID: <CAMKF1sqC-_YTdwsLvVoVyz04ndMxNt6W1z__f_9nUTfb6aF8GQ@mail.gmail.com>
To: openembedded-core@linuxtogo.org
Subject: Re: binutils 2.23 call for testing the recipes
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
X-List-Received-Date: Thu, 09 Aug 2012 15:06:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 9, 2012 at 6:10 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Aug 08, 2012 at 10:45:19AM -0700, Khem Raj wrote:
>> Hi
>>
>> Binutils 2.23 branch has started upstream. Given that toolchain
>> components require a lot of soak time, I have created the recipes
>> for binutils 2.23 and pushed it here
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/binutils-2.23
>>
>> If you are using angstrom set
>>
>> ANGSTROM_BINUTILS_VERSION = "2.23" in local.conf after pulling that branch
>> for OE-Core it will work as it is
>>
>> Let me know if you see any errors.
>
> I was trying to build armv4t image with gold enabled again to see if
> those issues with gold are resolved and building linux-3.2 and linux-2.6.39
> are failing with this:
>
> |   LD      arch/arm/boot/compressed/vmlinux
> | arm-oe-linux-gnueabi-ld: error: DIV usage mismatch between arch/arm/boot/compressed/misc.o and output
> | arm-oe-linux-gnueabi-ld: error: DIV usage mismatch between arch/arm/boot/compressed/lib1funcs.o and output
> | make[2]: *** [arch/arm/boot/compressed/vmlinux] Error 1
>
> Any hint for that?

probably you need something like below
https://lists.yoctoproject.org/pipermail/poky/2011-January/003131.html

>
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


