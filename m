Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RYRIr-0006BO-94
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 00:53:33 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 9512DCE10
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 00:46:44 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AiIkAFz6305T4zgTPGdsb2JhbAAMN4lNnlKCTwEBAQE3giQBAQEBAzhAEQsYCRYPCQMCAQIBMRQGDQgBAb51g3SHQASUa5Ik
X-IronPort-AV: E=Sophos;i="4.71,316,1320620400"; d="scan'208";a="1770667984"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.19])
	by ipb4.telenor.se with ESMTP; 08 Dec 2011 00:46:44 +0100
Message-ID: <4EDFFAE5.2040705@emagii.com>
Date: Thu, 08 Dec 2011 00:46:45 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EDF2360.7090402@emagii.com>	<E5CF0974-DCA6-4DAA-859C-ED40990CC11E@dominion.thruhere.net>	<4EDF788E.60804@emagii.com>
	<3741284.XQAanrv0Ii@helios>	<1323270054.30601.26.camel@ted>
	<20111207214317.GC6351@sakrah.homelinux.org>
In-Reply-To: <20111207214317.GC6351@sakrah.homelinux.org>
Subject: Re: Possible stale tags in the download directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 07 Dec 2011 23:53:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-07 22:43, Khem Raj wrote:
> On (07/12/11 15:00), Richard Purdie wrote:
>> On Wed, 2011-12-07 at 14:37 +0000, Paul Eggleton wrote:
>>> On Wednesday 07 December 2011 15:30:38 Ulf Samuelsson wrote:
>>>> Richard says that if the *.done file is there, then the checksum is not
>>>> calculated.
>>>> Or that is at least how I interpret his comment.
>>>>
>>>> If the check is always there, why the tag?
>>> That's not what my reading of the bitbake source says.
>>> bitbake/lib/bb/fetch2/__init__.py contains the only references to .done files
>>> and all it does is make sure the done file gets "touched" whenever a fetch for
>>> the associated file occurs; it does not otherwise check for its existence.
>> It does two things, one is an activity marker useful for seeing whether
>> files are in active use and the second is for the checksum calculation
>> which only ever happens once after download due to the file (see
>> verify_checksum() in that file).
> when do we create .done files? if I am in middle of download of a tar
> file and I cancel it and restart it does not fetch the file again but
> tried to use the corrupt file.
>
> Is it a big build time hit if checksums are verified all the time ?
>

I have seen the same problem.

-- 
Best Regards
Ulf Samuelsson
eMagii



