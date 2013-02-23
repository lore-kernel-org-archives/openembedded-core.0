Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1U9Eof-0004I2-41
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Feb 2013 14:07:01 +0100
Message-ID: <5128B95D.5070305@communistcode.co.uk>
Date: Sat, 23 Feb 2013 12:43:09 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1361563821-7683-1-git-send-email-cristian.iorga@intel.com>
	<7EF31BEB21E340DBAFB08ABD4321A269@intel.com>
	<5128858F.1030107@communistcode.co.uk> <3284634.41HXpyBOqa@helios>
In-Reply-To: <3284634.41HXpyBOqa@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: enable connman client
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
X-List-Received-Date: Sat, 23 Feb 2013 13:07:02 -0000
X-List-Received-Date: Sat, 23 Feb 2013 13:07:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/23/13 11:30, Paul Eggleton wrote:
> On Saturday 23 February 2013 09:02:07 Jack Mitchell wrote:
>> On 02/23/13 08:34, Ross Burton wrote:
>>> Also the fact that you have to do this is depressing.  I wonder why
>>> upstream doesn't want to install any of the tools?
>> Connmanctl is a helper, even though I have connman in my image, I
>> wouldn't want connmanctl. I assume this is why they don't ship it by
>> default; as my use case is fairly normal for connman.
> I would have thought if you had asked for the client to be built (or not asked
> for it not to be built, as the case may be) then surely you would want it
> installed (as far as make install goes anyway)?

Yes I misread, I thought we were explicity enabling it. I'll try to send 
an email off to upstream and see what they think.

>
>> Which leads to the next point, this should be a seperate package.
> Probably should be I think yes.

If no one beats me to it I'll look into this at work next week. Some of 
the tools should be split into packages too and I think there may be 
some distro specific tweaks also (e.g. wifi enabled etc).

>
> Cheers,
> Paul
>



