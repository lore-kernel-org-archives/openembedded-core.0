Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RuUbT-0001iC-AK
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 20:51:55 +0100
Received: (qmail 20181 invoked by uid 1003); 6 Feb 2012 19:43:53 -0000
Received: from unknown (HELO ?192.168.43.128?)
	(philip@opensdr.com@32.165.15.243)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	6 Feb 2012 19:43:53 -0000
Message-ID: <4F302D77.7030902@balister.org>
Date: Mon, 06 Feb 2012 14:43:51 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>	<CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>	<1408084.uBj8QddilE@helios>
	<1328543751.14363.11.camel@phil-desktop>
In-Reply-To: <1328543751.14363.11.camel@phil-desktop>
X-Enigmail-Version: 1.1.2
Subject: Re: Duplicate recipes in meta-oe
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
X-List-Received-Date: Mon, 06 Feb 2012 19:51:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/06/2012 10:55 AM, Phil Blundell wrote:
> On Mon, 2012-02-06 at 15:39 +0000, Paul Eggleton wrote:
>> I talked to Koen at FOSDEM and apparently he prefers having a symlink rather 
>> than a copy for the timezone file. I can't express an opinion one way or 
>> another but it sounds like this one aspect still needs to be resolved - should 
>> this be selectable?
> 
> I guess this is all bound up with the "/usr on a separate partition"
> thing.  If your position is that the root filesystem is meant to work
> without /usr mounted then having /etc/localtime be a symlink
> into /usr/share is probably not going to fly.  Conversely, one were to
> take the view that any reasonable system in the 21st century is going to
> have / anḍ /usr on the same device, making it be a symlink would be a
> fine idea.
> 
> I think probably the right answer is to make "1970s-usr" be a
> DISTRO_FEATURE and then the timezone recipes (and others) can adapt
> themselves accordingly.

Does anyone use a system where /usr is on a separate partition?

Philip


