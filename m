Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qmgm7-000493-19
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 08:42:24 +0200
Received: by yxi19 with SMTP id 19so2117402yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 23:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=CZfTC+QJn+ANTCyj6HvZPowDkknfdumTcfWZWHvP60w=;
	b=M/WVsDbtYRfI8yq3VkAys2mMvTfjHRFix2AwWYFSrTvL6AO9WhL1MrmeSTVKLGd9F8
	jDKpUwtkap+5N+4adW+Ta2smnCcDHMbbe+KEEayo++Q3cTWQETM5ui3is346KL52JeWZ
	td0DKAM49/Fyzzeq4zbTIODIx6T6JU7JnmMCI=
Received: by 10.142.213.5 with SMTP id l5mr606895wfg.153.1311921484103;
	Thu, 28 Jul 2011 23:38:04 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t20sm1063330wfe.0.2011.07.28.23.38.02
	(version=SSLv3 cipher=OTHER); Thu, 28 Jul 2011 23:38:03 -0700 (PDT)
Message-ID: <4E325549.6080908@gmail.com>
Date: Thu, 28 Jul 2011 23:38:01 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>	<1311777255.30326.347.camel@phil-desktop>	<4E302785.9070705@windriver.com>
	<1311780347.30326.376.camel@phil-desktop>
In-Reply-To: <1311780347.30326.376.camel@phil-desktop>
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Fri, 29 Jul 2011 06:42:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2011 08:25 AM, Phil Blundell wrote:
> On Wed, 2011-07-27 at 09:58 -0500, Mark Hatle wrote:
>> For the tune names..  armv5 means I want classic ARM instructions, while armv5t
>> means I was thumb instructions.
>>
>> So armv5 and armv5t are distinct in the contents of the tunings.
>
> Ah, I see.  Does that go for v4t too?  I can imagine cases where you
> would want to say "select the v4T ISA but generate ARM code not Thumb".
>
>> Yes, the mention of DSP should be using the 'e'.  What I'm not sure of is does
>> the "dsp" capabilities actually change any of the code or support generated.  If
>> not then we can ignore it.
>
> Yes.  PLD, for example, is only available in ARMv5E (not ARMv5) and this
> will affect any code which uses __builtin_prefetch().  I don't think GCC
> will ever open-code the saturating arithmetic instructions, but it does
> expose the v5/v5e distinction through preprocessor macros and source
> code might use that to select asm() statements which use those opcodes.

LDRD/STRD which are armv5e only are used by gcc IIRC

>
>> For armv5 this gives us:
>>
>> armv5, armv5t, armv5e, armv5te... add in their VFP variants and the hard float
>> EABI...
>
> Does anybody really want the hardfloat abi on armv5?  I guess it doesn't
> hurt all that much to offer it, but anything that makes that monstrous
> set of .inc files bigger seems like a bad thing.
>
> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



