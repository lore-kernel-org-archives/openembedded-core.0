Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2OgL-0000Xu-SD
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 17:41:53 +0200
Received: from localhost ([127.0.0.1]:45351 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2OUl-0005Mn-8x
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=StuAzXBGk85QQvrZzPjCSGjkvLo=; b=mVZ+goIGWPp7gcHY3PR6QfUYjwUs
	x4+zBg/QAfGNx8r/0Jyvy6znpHWquAE5fj8dTyBEEWaH0Uzg+R3Lg6nZb1hWs4ic
	ThwiZEQKOoGuX6xXD4ITLEvDaio/akz8YZWPpg5JhM7yvb/13zrxCjnGDmMVbkYp
	xphueo5DBvsdOLc=
Received: from [195.171.99.130] (port=35506 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2OUl-0005Mk-6h
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:29:55 +0000
Message-ID: <502E63C5.3010205@communistcode.co.uk>
Date: Fri, 17 Aug 2012 16:31:17 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <502E5B0E.8040809@communistcode.co.uk> <1364366.gWn3960rnI@helios>
	<1345216456.27428.13.camel@ted>
In-Reply-To: <1345216456.27428.13.camel@ted>
Subject: Re: qemu opengl issues
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
X-List-Received-Date: Fri, 17 Aug 2012 15:41:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>
>> Right, this is a known limitation - see Yocto Project bug 2407. By pure
>> coincidence I was thinking about fixing it today as I am testing some other
>> related changes; for now the only options are install the required recipes or
>> hack out the gl-requiring parts of the qemu recipe.
>
> I think we're about at the point where we're going to remove GL pass
> through support and drop our qemu GL patches. Patches will likely appear
> next week.
>
> Cheers,
>
> Richard
>

Sounds good, I'm on holiday from the 22nd till 29th so will hopefully 
see them when I get back!

Apologies for not checking the bug tracker first.

*side note: with so many categories it can be a massive farse trying to 
navigate the bugzilla to find bugs, even more so on top of an already 
cluttered/complicated web application.

edit: I have just looked to see if I could find the bug without looking 
at it first (using the id) and I failed miserably.. maybe the force is 
not with my today but I couldn't even decipher where qemu issues would be.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



