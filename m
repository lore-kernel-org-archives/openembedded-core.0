Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SvE3L-0004ES-Uq
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 22:56:00 +0200
Received: from localhost ([127.0.0.1]:42705 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SvDsA-0001E6-Bb
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 20:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=6L3EpEji4ZZ9RE+iX3YHozYonv8=; b=oy+YArJkCvsVO73rCmlgfgA+ED6A
	upXit0+KLegiYZb74XvODt5iWh0LgRTUo7BlGvwwwZEBckpvbqCgrokYpEmW/O8v
	SUgYK25ZOAKeFgW38nQ+HBe1m0x8N6C9qfQh3g056RrzGYy3uaJadO4/weeDR7GP
	chFa2hQbQCwSyTc=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:53845 helo=[192.168.1.113])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1SvDnK-0001Aw-6y for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 20:39:26 +0000
Message-ID: <50144DFD.4040408@communistcode.co.uk>
Date: Sat, 28 Jul 2012 21:39:25 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
	<4d738395bf7cd05c924a9facf9677bab784cb1b6.1341763346.git.raj.khem@gmail.com>
	<5013C1BB.9020504@communistcode.co.uk>
	<CAMKF1spLQ5M7fpjninE_Gbyq=faW9V0psMN1Hb9NZKfXGDTMBg@mail.gmail.com>
	<5014425C.3090506@communistcode.co.uk>
	<20120728202414.GA3261@jama.jama.net>
In-Reply-To: <20120728202414.GA3261@jama.jama.net>
Subject: Re: [PATCH 08/19] bison: Fix for gets being removed from eglibc 2.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 28 Jul 2012 20:56:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2012 21:24, Martin Jansa wrote:
> On Sat, Jul 28, 2012 at 08:49:48PM +0100, Jack Mitchell wrote:
>> I'm not sure quite what you mean by pre-processed output but here is my
>> do_compile log which is where it fails.
>
> He meant C source code after processing by preprocessor (-E option for
> gcc), but it's not needed, see following patch.
>
> The problem was that patch was applied only for target recipe not
> -native which is failing for you (I guess you have (e)glibc-2.16 on host
> like I do)
>
> Cheers,

Do you know what, I should have seen this as I applied my patch to the 
BASE_SRC_URI. My patch failed with the same message again in the SRC_URI 
and I thought I had just deleted Khems patch line and then re-added my 
patch line in the wrong function.

I'll put it down to it being the weekend

I do have glibc-2.16 on my host and it's causing me no end of trouble - 
but someone has be the lab rat eh and I'm not under commercial pressure 
quite yet ;) I'll have another eglibc do_install issue coming along soon 
as I can't seem to fix it.

What would be the process to get the preprocessed output?

Cheers,
Jack.


