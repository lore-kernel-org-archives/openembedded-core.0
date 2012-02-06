Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RuXQZ-0007Aq-Hq
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 23:52:51 +0100
Received: (qmail 16114 invoked by uid 1003); 6 Feb 2012 22:44:49 -0000
Received: from unknown (HELO ?192.168.221.218?)
	(philip@opensdr.com@65.14.229.26)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	6 Feb 2012 22:44:49 -0000
Message-ID: <4F3057E0.9050404@balister.org>
Date: Mon, 06 Feb 2012 17:44:48 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAMvUbCz0Lts7dUOWWvJeivm9nUb3nuhEqS-QY4+nOYOgmDzEkw@mail.gmail.com>
	<2025C8A2-8B17-4F99-B4B3-3A0C8EC2C322@dominion.thruhere.net>
In-Reply-To: <2025C8A2-8B17-4F99-B4B3-3A0C8EC2C322@dominion.thruhere.net>
X-Enigmail-Version: 1.1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: armhf support in OpenEmbedded?
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
X-List-Received-Date: Mon, 06 Feb 2012 22:52:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/06/2012 04:17 PM, Koen Kooi wrote:
> 
> Op 6 feb. 2012, om 22:01 heeft Leon Woestenberg het volgende geschreven:
> 
>> Hello,
>>
>> do we already have support for the ARM "armhf" ABI in OpenEmbedded?  (A quick search on the ML didn't get me hits).
>>
>> Basically,"armhf" is built with -mfloat-abi=hard, and tuned for armv7-a CPUs.
> 
> Yes, we've had it for ages in OE-classic and Marks tune overhaul made it easy to use in OE-core as well. Also note that armhf has practically no adavantage over softfp in real world applications. The only things getting a decent speedup in proper benchmarks was povray.

From what I saw, the big win for hf is for functions that return floats.
I try to avoid writing functions that return floats and use pointers to
the variable :)

Philip


