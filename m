Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRjLF-0005ee-MT
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 14:48:49 +0200
Received: from localhost ([127.0.0.1]:54761 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRj8B-0003Mh-OF
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 12:35:19 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=oGp0ZpL3qWi+i2zZHX2Azumk5B0=; b=pCo3poDNowBRw4jwKMfGUSinfdZP
	SDJkgQOA5VTyGphM7RR7mBGX0PO/jxx3ASRViliOU9UEJkr2hCdPX1l0HbiJMXQn
	jY3ARARFKmH0ecSE4T0UUAfGk6UGoaVrYCtSR0SW59atLF/4YzXzjyvbNfWjoI5x
	9zjnhN6EUdQr6vI=
Received: from [195.171.99.130] (port=22345 helo=[192.168.0.67])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRj8B-0003Me-LU
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 12:35:19 +0000
Message-ID: <508A83F0.7040603@communistcode.co.uk>
Date: Fri, 26 Oct 2012 13:37:04 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1351252460-19953-1-git-send-email-ml@communistcode.co.uk>
	<3032332.QqX60qUNtI@helios> <508A83A4.2040303@communistcode.co.uk>
In-Reply-To: <508A83A4.2040303@communistcode.co.uk>
Subject: Re: [oe][PATCH 1/3] latencytop: disable GTK and remove gtk+ dependacy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 12:48:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/12 13:35, Jack Mitchell wrote:
> On 26/10/12 13:28, Paul Eggleton wrote:
>> On Friday 26 October 2012 12:54:18 Jack Mitchell wrote:
>>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>>
>>> ---
>>>
>>> v2
>>> - Don't use -D to define with make
>>> - Rename EXTRA_OECONF_X to EXTRA_OEMAKE_X
>>>
>>> When DISTRO_FEATURES does not contain x11, disable GTK GUI and
>>> also don't add gtk+ to the DEPENDS
>>>
>>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>> I think because the commit message is below the first --- it won't be 
>> picked up
>> when applied. This is probably where a cover letter is more appropriate.
>>
>> Cheers,
>> Paul
>>
>
> Bah! One of these days I will get it right.
>
> I think [1] should be updated for a few more use cases e.g. multiple 
> patches.
>
> So you're saying I should do:
>
> git send-email -3 --no-chain-reply-to --cover-letter --to 
> openembedded-core@lists.openembedded.org --subject-prefix=oe][PATCH
>
> And also remove the '---' from my commit message on patch 1?
>

[1] http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



