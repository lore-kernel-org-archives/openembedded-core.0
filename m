Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T2KLq-00022D-Oi
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 13:04:26 +0200
Received: from localhost ([127.0.0.1]:53312 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1T2KAG-00061f-D0; Fri, 17 Aug 2012 10:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=iFTJDkmNQPDD4s51RqpNjH2v2YM=; b=sP/b4z8HzDPEtYDiQA1BcFFjT/kK
	0d9TS9+3I0kCNUqsnrZwwa21I53Y5FBXayTZE02LhKmNHXXhdMy3o2pP93kNoYiH
	n0RMA52kJQQKq/axQKedAZX6RrCxRMHXLtHkkm1b9Q4X7gpH20T6WphRoqEfxl0Z
	XVbok65B1J2Uiu4=
Received: from [195.171.99.130] (port=35654 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1T2KAG-00061c-An; Fri, 17 Aug 2012 10:52:28 +0000
Message-ID: <502E22BF.4050809@communistcode.co.uk>
Date: Fri, 17 Aug 2012 11:53:51 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Henning Heinold <heinold@inf.fu-berlin.de>
References: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
	<1566766.76zJMGCy1b@helios> <1345197209.26132.2.camel@ted>
	<502E1777.6020006@communistcode.co.uk>
	<20120817102638.GD17007@mi.fu-berlin.de>
In-Reply-To: <20120817102638.GD17007@mi.fu-berlin.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/chrpath: trigger an error if chrpath fails
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
X-List-Received-Date: Fri, 17 Aug 2012 11:04:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/08/12 11:26, Henning Heinold wrote:
> On Fri, Aug 17, 2012 at 11:05:43AM +0100, Jack Mitchell wrote:
>> any provider
>> WARNING: Failed to fetch URL http://kernel.org/pub/linux/kernel/people/jsipek/guilt/guilt-0.33.tar.gz,
>> attempting MIRRORS if available
>> *ERROR: chrpath command failed with exit code 7
>> ERROR: chrpath command failed with exit code 7*
>
> Hi,
>
> you can grep the logfiles in the work-dir for chrpath call and you will find the package. I saw it on some perl modules, but not now.
>
> Bye Henning

Ok, here we go:

    x86_64-linux/perl-native-5.14.2-r1/temp/log.do_populate_sysroot.30355:ERROR:
    chrpath command failed with exit code 7
    x86_64-linux/perl-native-5.14.2-r1/temp/log.do_populate_sysroot.30355:ERROR:
    chrpath command failed with exit code 7

This is on kraj/toolchain-rework, I don't know how synced with master it 
is so apologies if it has already been fixed.


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



