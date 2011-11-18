Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RRVKV-0003YH-1T
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 21:46:35 +0100
Received: by faat2 with SMTP id t2so4935037faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 12:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=CnyM35y/YXUFQ5Fc9Bzop2D15zBc0MEcULflBlAES18=;
	b=uLSrsmgJhkl4glhlLyhyXhOU5Bx0SVUWvCnE+mKO+nVqj33XWiFykUzUB/yLoyxK6f
	BKgR37Av392uodWBhpfGgD6kk1i2GmPK4rkFEtZu8WeqbT91bIQoAPzYMEkaicv7+BEl
	WWi7lvmya0ztjzUG/AjVDhkZ/JBNX52uk5K9I=
Received: by 10.152.102.148 with SMTP id fo20mr2960293lab.51.1321648807204;
	Fri, 18 Nov 2011 12:40:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 18 Nov 2011 12:39:35 -0800 (PST)
In-Reply-To: <j9ghc8$ps7$1@dough.gmane.org>
References: <1319505532-23199-1-git-send-email-julian.pidancet@gmail.com>
	<CAEsOVNen8kUVPge_jZDq5LjhC7BAG0YKx=wxO+ZysNGAd_KwQg@mail.gmail.com>
	<CAKZ=5EVjCrBdH2NBrVD_4UD52h6ZG=p6m-QS5L9K8xfpUcUr1g@mail.gmail.com>
	<1320784166.10843.109.camel@ted> <j9ghc8$ps7$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Nov 2011 12:39:35 -0800
Message-ID: <CAMKF1srW6U_iH=vFHSboX8o-BuEOx0fSe5xHeF9iA5npdpvRzw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Introduce biarch DISTRO_FEATURE
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
X-List-Received-Date: Fri, 18 Nov 2011 20:46:35 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 10, 2011 at 5:43 AM, Julian Pidancet
<julian.pidancet@gmail.com> wrote:
> On 11/08/11 20:29, Richard Purdie wrote:
>>
>> I'm left wondering how useful the resulting compiler is to most users.
>> In most cases a user would expect full libc support and hence this is
>> likely to confuse them. I do appreciate people do have usecases for a
>> compiler that can handle the other bit format though.
>>
>
> Standard linux distros out there like debian or gentoo already ship a
> biarch gcc per default. It wouldn't seem odd to me if OE had an option
> to enable the generation of a biarch compiler.
>
>> I think my biggest worry is the "--enable-targets=all" option which may
>> or may not enable things we might not want enabled. I've not had a
>> chance to go and look at gcc and convince myself that piece is safe. The
>> other pieces looked less worrying.
>>
>
> In the patch, the --enable-targets=all is only active in the x86 case. I
> did not find any other way of enabling both -m32 and -m64 switches in gcc.

enable-target=all would sort of create a single toolchain for multlibs we have
but it needs to package the gcc runtime and building glibc accordingly
I cant say
it will be just harmless to enable it right now mips/powerpc/x86 are
architectures
that could do it in oe.

>
> I've been successfully using this patch to generate a complete x86 32bit
> distro with a 64bit Xen hypervisor (I believe the result would have been
> the same if I tried to compile a 64bit linux kernel). I did not have any
> issues with it so far.
>
> Cheers,
>
> --
> Julian
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


