Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QGj6T-0006l6-9m
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 04:43:17 +0200
Received: by gyf1 with SMTP id 1so1964771gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 May 2011 19:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=rHrrIqP3pdllfN46MNusqWuKXhuGh/X47bixSkqXA3E=;
	b=iSaNYJ6RTz+2kh1CVcgz3R7CDCL4zHx6Ewh2oCJHwDWMYNXIWqDTEjs9AKQmzvQ+Mb
	r8/i5ZTwUTJgkt7Di27qR2y1jkd3iJCELkSFRNt+USzLTWrEVRw2YMtr0h/j89KcY09h
	aqEFMq3Q6HJZScmXJ63qCFFYswM4qqJgzB4E4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pjmZV89Pw4uWJbK+MQOpO0Zc/Y970sPwGyuhWEyXgHBUzuk3Kn0rXzCOzCU1xb30mP
	9NGGGT1Rd1IDIo15jXkHrM/aWgDYaX1UAyi2aOby+FlHW8624aMKlsPiiji+zB74Ea2h
	9fNFYFj1n8Rq4/PzW/4yBETgL6Hvs1e7wOVB0=
MIME-Version: 1.0
Received: by 10.90.136.1 with SMTP id j1mr6214015agd.85.1304304040579; Sun, 01
	May 2011 19:40:40 -0700 (PDT)
Received: by 10.90.104.11 with HTTP; Sun, 1 May 2011 19:40:40 -0700 (PDT)
In-Reply-To: <BANLkTi=9fddo=qaHhom4cw9mBLrNP1rs8w@mail.gmail.com>
References: <BANLkTi=9fddo=qaHhom4cw9mBLrNP1rs8w@mail.gmail.com>
Date: Sun, 1 May 2011 22:40:40 -0400
Message-ID: <BANLkTikw8npv5q-gbhHWiOpxtVAwMo-XGA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to patch yocto kernel
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
X-List-Received-Date: Mon, 02 May 2011 02:43:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, May 1, 2011 at 9:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> I am trying to test this patch
>
> http://uclibc.org/~kraj/perf-tool-Fix-gcc-4.6.0-issues.patch
>
> to fix the build using gcc 4.6.0 but the kernel patching for yocto is
> not as usual as other recipes
> since it uses entire set of tooling around it.
>
> I tried to look around for documentation and few references I found
>
> https://wiki.pokylinux.org/wiki/Wind_River_Kernel
>
> discourages putting patches in metadata. and in another document it
> says it uses git to do patching but does not explain how.
>
> So if someone can explain in simple terms how to patch a linux-yocto
> would be really helpful from a
> developer POV or any documentation will be helpful.
>
> How do people develop/test patches on linux-yocto I understand
> eventually they are desired to be part
> of linux-yocto git but that comes after they are tried and tested locally
>
> I would have preferred to have the usual SRC_URI patching atleast for
> local testing. As of now
> it seems not to use normal OE recipe procedures.

Are you actually not  seeing this work ? I put in place compatibility
with existing patching via the SRC_URI for just this reason. A patch
specified in the SRC_URI will be picked up by the tools and applied
to the end of the BSP branch during the patching phase.

It has definitely worked during all the development cycles, so if you
are seeing it not work, it's a bug and I'll fix it.

Cheers,

Bruce

>
> Thanks
> -Khem
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


