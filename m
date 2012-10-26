Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRjK5-0005c0-B9
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 14:47:37 +0200
Received: from localhost ([127.0.0.1]:45171 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRj70-0003H7-Kv; Fri, 26 Oct 2012 12:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=i7G4bM3hCaIAfUBcNgm1CH2N8Jk=; b=jHo+zHthKsU8ujmU9qFiOyWt9ydB
	ip5OlRbJizXSjex4a6r0g1lUXddvz/EPkS6vMbb4LrTk7KKInVSWgWqDrX2Vm0ee
	MWCoCfDr2Bi/G+l+njdI9mTCXd52kgJ30Jnk1xQbkcfAo4sVYfRsRTboU1nK7NOa
	a2dgH3EXGxkrLCM=
Received: from [195.171.99.130] (port=16797 helo=[192.168.0.67])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRj70-0003Gz-GI; Fri, 26 Oct 2012 12:34:06 +0000
Message-ID: <508A83A4.2040303@communistcode.co.uk>
Date: Fri, 26 Oct 2012 13:35:48 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1351252460-19953-1-git-send-email-ml@communistcode.co.uk>
	<3032332.QqX60qUNtI@helios>
In-Reply-To: <3032332.QqX60qUNtI@helios>
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
X-List-Received-Date: Fri, 26 Oct 2012 12:47:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/12 13:28, Paul Eggleton wrote:
> On Friday 26 October 2012 12:54:18 Jack Mitchell wrote:
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>
>> ---
>>
>> v2
>> - Don't use -D to define with make
>> - Rename EXTRA_OECONF_X to EXTRA_OEMAKE_X
>>
>> When DISTRO_FEATURES does not contain x11, disable GTK GUI and
>> also don't add gtk+ to the DEPENDS
>>
>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> I think because the commit message is below the first --- it won't be picked up
> when applied. This is probably where a cover letter is more appropriate.
>
> Cheers,
> Paul
>

Bah! One of these days I will get it right.

I think [1] should be updated for a few more use cases e.g. multiple 
patches.

So you're saying I should do:

git send-email -3 --no-chain-reply-to --cover-letter --to 
openembedded-core@lists.openembedded.org --subject-prefix=oe][PATCH

And also remove the '---' from my commit message on patch 1?

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



