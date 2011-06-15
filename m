Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWtJ2-0008Na-0y
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 18:51:04 +0200
Received: by iye7 with SMTP id 7so464890iye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 09:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=gH64+GuKfSQVCgMrKTNrPSKnAeyN7ucz1/7pRBzBbxc=;
	b=IT46MjhWxI9401bazY0fmRQLqLgby56K/fpCOecWQz2ZlnlYIhsVEdzShNM+1lrTEZ
	XVW8YdnR8GpFUna8paFvDr0gBsODIu6Fzp3mX2k8rM+vsxgqxaRhw6s+ZE8tQcG4wgIb
	FCfZsUjp4/ftPT9s4JC5Ho/hCL/ScGrOgUjBE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=EXD5EZxbz17bLf++FYrh7XKN5VNAW4nsMvOPBOgK0GDQFMagfvTMgn1eSh1OKt7dlC
	uSJZDPjP/Ekp3mtC09F9IIdxESxxUPnT34S3SfFXX2Wv3F6YhTIBS6H2BWV8y+VbpwFQ
	Eu5TQlK8FiCWSqp4YDaNas+48tdje8gyswvnw=
Received: by 10.231.207.148 with SMTP id fy20mr577355ibb.186.1308156457008;
	Wed, 15 Jun 2011 09:47:37 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v16sm318120ibe.0.2011.06.15.09.47.35
	(version=SSLv3 cipher=OTHER); Wed, 15 Jun 2011 09:47:36 -0700 (PDT)
Message-ID: <4DF8E226.2090403@gmail.com>
Date: Wed, 15 Jun 2011 09:47:34 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308065443.25285.268.camel@phil-desktop>	<E934E895-3391-4437-A310-E5B99624AC38@dominion.thruhere.net>	<1308125091.6879.39.camel@lenovo.internal.reciva.com>	<1308148335.25285.1774.camel@phil-desktop>
	<4DF8DD52.70502@gmail.com>	<1308155502.25285.2038.camel@phil-desktop>
	<4DF8DF40.6050401@gmail.com>
	<1308156148.25285.2068.camel@phil-desktop>
In-Reply-To: <1308156148.25285.2068.camel@phil-desktop>
Subject: Re: [PATCH RFC] binutils: allow distro to select gold as default cross-linker
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
X-List-Received-Date: Wed, 15 Jun 2011 16:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2011 09:42 AM, Phil Blundell wrote:
> On Wed, 2011-06-15 at 09:35 -0700, Khem Raj wrote:
>> This will work. Do you know what problems eglibc has linking with gold ?
>> may be we can fix it
>
> If I remember right, it relies on linker script functionality which gold
> just doesn't have.  I suspect this would be hard to fix and, unless
> there is a pressing need to fight that particular battle, I would be
> inclined not to bother.
>
> That said, though, I haven't checked recently and it's possible that
> recent versions of gold will "just work".  If you wanted to give it a
> try then I think it'd just be a question of h4x0ring eglibc's configure
> script slightly to get it to accept gold as a valid linker version.
>

I remember now. Accepting gold would be easier but changing how ld.so is 
built where it asks ld to spit out default linker script and then munge 
it before reusing it is harder part. I think status is still same. It 
reminds me that we probably need ld.bfd for kernel too.


> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



