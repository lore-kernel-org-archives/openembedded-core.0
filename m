Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QWFOV-0002YV-Vs
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 00:14:04 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QWFLE-0006l5-9R from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 15:10:40 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 13 Jun 2011 15:10:40 -0700
Received: from [172.30.80.132] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 13 Jun 2011 15:10:39 -0700
Message-ID: <4DF68AD4.1020403@mentor.com>
Date: Mon, 13 Jun 2011 15:10:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>	<4DF672F2.2030909@linux.intel.com>	<49501374-7FBE-400E-A91B-BD7EBD7FB65C@dominion.thruhere.net>
	<1308000620.15712.288.camel@rex>
In-Reply-To: <1308000620.15712.288.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 13 Jun 2011 22:10:40.0102 (UTC)
	FILETIME=[BAF2C060:01CC2A16]
Subject: Re: Where is atom-pc.conf hiding?
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
X-List-Received-Date: Mon, 13 Jun 2011 22:14:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/13/2011 02:30 PM, Richard Purdie wrote:
> On Mon, 2011-06-13 at 22:36 +0200, Koen Kooi wrote:
>> Op 13 jun 2011, om 22:28 heeft Saul Wold het volgende geschreven:
>>
>>> On 06/13/2011 11:31 AM, Koen Kooi wrote:
>>>> Hi,
>>>>
>>>> Khem was asking if I could reproduce the recent x86 breakage he was seeing[1] and I ran into another bug:
>>>>
>>>> koen@dominion:/OE/tentacle/sources/meta-intel$ git blame meta-n450/conf/machine/n450.conf  | grep atom
>>>> 158f88d7 (Saul Wold   2011-01-03 15:33:52 -0800  6) require conf/machine/atom-pc.conf
>>>>
>>> meta-yocto seems to be the place you need to look!
>>>
>>> I hope that the layering tools can help to detect and inform folks of this like of dependency.
>>
>> Isn't meta-yocto supposed to a the integration layer with no new
>> parts? I can't use meta-yocto since it has conflicting beagleboard
>> stuff in it, which means that meta-intel is now broken for me as well.
>> That surely isn't the intended plan?!?!
> 
> The plan on public record is that atom-pc moves to meta-intel as soon as
> the layer tooling comes online and meta-yocto becomes its own repo
> (which at present its not but its certainly the intent).

Until then, and even afterwards can we please get some testing of
non-poky builds done?  I know the autobuilder is full but can't we toss
a few things onto a personal box and try that a few times a week?

-- 
Tom Rini
Mentor Graphics Corporation


