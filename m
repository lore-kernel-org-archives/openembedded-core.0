Received: from 16.63.mail-out.ovh.net ([188.165.37.81]
	helo=63.mail-out.ovh.net) by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QR0zQ-00044y-Kr
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 13:50:32 +0200
Received: (qmail 11388 invoked by uid 503); 30 May 2011 04:05:37 -0000
Received: from b6.ovh.net (HELO mail182.ha.ovh.net) (213.186.33.56)
	by 63.mail-out.ovh.net with SMTP; 30 May 2011 04:05:37 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 May 2011 09:47:28 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 30 May 2011 09:47:25 +0200
Message-ID: <4DE34B8D.5080907@eukrea.com>
Date: Mon, 30 May 2011 09:47:25 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <53EA452E-5E40-471F-8AF7-BE8303945241@dominion.thruhere.net>	<4DE34507.2090107@eukrea.com>
	<C74466A4-5C79-4E68-8D19-443498EF130E@dominion.thruhere.net>
In-Reply-To: <C74466A4-5C79-4E68-8D19-443498EF130E@dominion.thruhere.net>
X-Ovh-Tracer-Id: 5444007526086782402
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: Any volunteers for fixing all the kernel version	checks?
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
X-List-Received-Date: Mon, 30 May 2011 11:50:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 30/05/2011 09:33, Koen Kooi wrote:
>
> Op 30 mei 2011, om 09:19 heeft Eric Bénard het volgende geschreven:
>
>> Hi,
>>
>> On 30/05/2011 08:52, Koen Kooi wrote:
>>> As some of you might have seen already: http://lwn.net/Articles/445223/ - linux 3.0 is going to happen.
>>>
>>> This means all the crufty "is it 2.4 or 2.6" checks are going to need a rework :)
>>
>> Does supporting 2.4 kernels still makes sense in 2011 ?
>
> No, but I bet there are still checks present for that :) Or at least references like modprobe.26.

so can the fix be : remove any reference to the check and assume we are using 
a 2.6/3.0 kernel ?

Eric


