Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QZ3UT-0006Mo-KN
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 18:07:49 +0200
Received: from mail170.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 2376BDC17F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 15:33:20 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Jun 2011 15:33:05 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Jun 2011 15:33:04 +0200
Message-ID: <4E009D8F.10301@eukrea.com>
Date: Tue, 21 Jun 2011 15:33:03 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1308658461.20015.24.camel@rex>	<BANLkTimMLo4g7uWsrhAr=hun4wZ6AaDjQg@mail.gmail.com>
	<1308663032.20015.29.camel@rex>
In-Reply-To: <1308663032.20015.29.camel@rex>
X-Ovh-Tracer-Id: 11353574660925468098
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -200
X-VR-SPAMCAUSE: Vade Retro 01.322.10 AV+AS Profile: OVH; Bailout: 300;
	@!Recipients (-100); (-100)
Subject: Re: Multilib Development Update
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
X-List-Received-Date: Tue, 21 Jun 2011 16:07:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/06/2011 15:30, Richard Purdie wrote:
> On Tue, 2011-06-21 at 15:02 +0200, Frans Meulenbroeks wrote:
>> As I already asked before: what is the benefit having this in embedded
>> systems?
>>
>> If I am doing an embedded system I know the target hardware, and there
>> is no need to have e.g. both 32 and 64 bit libs.
>
> This has been mentioned before but there are embedded use cases where
> the requirement is to have a low overhead OS using 32 bit libs and
> binaries to save memory but the main application (like a database
> server) runs in 64 bit mode with 64 bit libraries so it can take
> advantage of system memory, extra instructions or so forth. This applies
> to mips and powerpc as well as x86.
>
> The implementation is fairly self contained so if you don't want
> multilib, you shouldn't even be aware its there...
>
will that feature allow to build a sdk running on both x86 and amd64 hosts 
whatever is the build host ?

Eric


