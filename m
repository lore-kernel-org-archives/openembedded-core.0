Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QmgbW-0003h9-MJ
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 08:31:26 +0200
Received: by pzk1 with SMTP id 1so5874955pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 23:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=C6oOPYvry4EWe2xOiao45HcM/t2l1148VrzVgTzgxm4=;
	b=pcMbs+KjpcbNITcQGrpddJCIH6/Q9PdzsfLaw2Yelh1NApA4Rvlu52O+C5Dj+DuO9b
	BqQccKVTjQshBSsLb+DIEbM2uzyMkeo8r2s5p3p8d2DcmHvb2rMs/wCnKcBMl0dC6UHN
	jPI8VMvraP5EoTYUgKEr6zgtlsRv5yasp1L6A=
Received: by 10.68.8.72 with SMTP id p8mr1765035pba.0.1311920828903;
	Thu, 28 Jul 2011 23:27:08 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id e6sm1801169pbm.87.2011.07.28.23.27.08
	(version=SSLv3 cipher=OTHER); Thu, 28 Jul 2011 23:27:08 -0700 (PDT)
Message-ID: <4E3252BA.8000500@gmail.com>
Date: Thu, 28 Jul 2011 23:27:06 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>	<1311777255.30326.347.camel@phil-desktop>
	<4E302785.9070705@windriver.com>
In-Reply-To: <4E302785.9070705@windriver.com>
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
X-List-Received-Date: Fri, 29 Jul 2011 06:31:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2011 07:58 AM, Mark Hatle wrote:
> For the tune names..  armv5 means I want classic ARM instructions, while armv5t
> means I was thumb instructions.
>
> So armv5 and armv5t are distinct in the contents of the tunings.

fwiw its confusing since armv5t will be confused with arm architecture 
context where it means 'yes I have thumb and you can use it if you want'
but what you are saying here is that if its armv5t then it means 'arm 
v5t and yes use thumb' It should be called something else probably to 
make that distinction

>
> There were armv5's without thumb support.. but that doesn't matter much.  A
> machine with thumb is compatible (run-time) with one that does not.  A machine
> w/o thumb is not necessarily compatible with thumb executables.
>
>>> >>  +# Little Endian + VFP/DSP
>>> >>  +AVAILTUNES += "armv5-vfp armv5t-vfp armv5hf-vfp armv5thf-vfp"
>> >
>> >  The comment doesn't seem to match the code here since this is the
>> >  section for chips without DSP.  Incidentally, the name "dsp" for this
>> >  feature seems quite a bad one: maybe we should just call it "armv5e".
> Yes, the mention of DSP should be using the 'e'.  What I'm not sure of is does
> the "dsp" capabilities actually change any of the code or support generated.  If
> not then we can ignore it.
>
> For armv5 this gives us:
>
> armv5, armv5t, armv5e, armv5te... add in their VFP variants and the hard float
> EABI...
>
> --Mark
>



