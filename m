Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SIQDd-0000td-HK
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 22:02:13 +0200
Received: (qmail 15561 invoked by uid 1003); 12 Apr 2012 19:46:12 -0000
Received: from unknown (HELO ?192.168.1.110?) (philip@opensdr.com@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	12 Apr 2012 19:46:12 -0000
Message-ID: <4F873102.6020603@balister.org>
Date: Thu, 12 Apr 2012 12:46:10 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>	<4F84D58F.8020608@gmail.com>
	<1334221321.31685.24.camel@ted>	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>	<D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>	<CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
	<1334256020.7309.45.camel@ted>
In-Reply-To: <1334256020.7309.45.camel@ted>
X-Enigmail-Version: 1.1.2
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 20:02:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/12/2012 11:40 AM, Richard Purdie wrote:
> On Thu, 2012-04-12 at 14:32 -0300, Otavio Salvador wrote:
>> On Thu, Apr 12, 2012 at 14:22, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> You just volunteered to handle all the "Does it work with yocto 1.2?" questions :)
>>>
>>> Simply put: people are stupid, they need explicit PHB compliant names in tags, even if it isn't 100% politically correct to say "yocto" when we actually mean "oe-core".
>>>
>>> Unless the yocto 1.2 release note state that it's based on oe-core "foo" and all layers compatible with "foo" use "foo" in tags/branches.
>>
>> I think layers ought to have tags for both ...
>>
>> <layer>-oe-core-<tag>
>> <layer>-yocto-<tag>
> 
> This would be rather sad if it were necessary. The whole point is we're
> trying to build things which are compatible with each other. If that
> turns out not to be the case I want to fix it, not encourage it.

We need a coherent tag name to use across layers. The Yocto Project is
the umbrella project, so using the yocto-project in the tag name is a
good way to show this coordination among projects to people not familiar
with how things are working. (As Koen notes, this makes communication
with people whose primary exposure to the Yocto Project is watching
youtube videos)

I do not want to see table containing Yocto Project release information
and they relate to a set of seemingly random tags in other layers.

Philip

PS: For various reasons, the tag needs to be yocto-project.... not yocto....


