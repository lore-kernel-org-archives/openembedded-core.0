Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Pyooe-0005gU-B7
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Mar 2011 18:10:53 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id D2694166033E; Sun, 13 Mar 2011 11:00:23 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4C82816601E8;
	Sun, 13 Mar 2011 11:00:23 -0600 (MDT)
Message-ID: <4D7CF827.60904@mlbassoc.com>
Date: Sun, 13 Mar 2011 11:00:23 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1299940883.git.raj.khem@gmail.com>	<4D7CE94A.5080706@mlbassoc.com>
	<CCDB3981-855D-444D-A271-A863C2765CC4@dominion.thruhere.net>
In-Reply-To: <CCDB3981-855D-444D-A271-A863C2765CC4@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 0/1] Import own-mirrors class from OE
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
X-List-Received-Date: Sun, 13 Mar 2011 17:10:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2011 10:13 AM, Koen Kooi wrote:
>
> Op 13 mrt 2011, om 16:56 heeft Gary Thomas het volgende geschreven:
>
>> On 03/12/2011 08:04 AM, Khem Raj wrote:
>>> Hi Richard
>>>
>>>
>>>
>>> Pull URL: git://git.openembedded.org/openembedded-core-contrib.git
>>>    Branch: kraj/own-mirror
>>>    Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/own-mirror
>>>
>>> Thanks,
>>>      Khem Raj<raj.khem@gmail.com>
>>> ---
>>>
>>>
>>> Khem Raj (1):
>>>    own-mirrors.bbclass: Bring own-mirrors.bbclass from oe commit
>>>      0ef914b250df46a41348479446214575668943fb
>>>
>>>   meta/classes/own-mirrors.bbclass |   12 ++++++++++++
>>>   1 files changed, 12 insertions(+), 0 deletions(-)
>>>   create mode 100644 meta/classes/own-mirrors.bbclass
>>>
>>
>> Poky/Yocto already has a mechanism for this by overriding PREMIRRORS
>> I would think sticking with one extension method would be better.
>>
>> Here's what I have in my [Poky] DISTRO.conf:
>>
>> SOURCE_DIR ?= "/opt/poky/sources"
>> PREMIRRORS = "\
>> http://.*/.*   file://${SOURCE_DIR}/ \n \
>> https://.*/.*  file://${SOURCE_DIR}/ \n \
>> ftp://.*/.*    file://${SOURCE_DIR}/ \n \
>> bzr://.*/.*    file://${SOURCE_DIR}/ \n \
>> cvs://.*/.*    file://${SOURCE_DIR}/ \n \
>> git://.*/.*    file://${SOURCE_DIR}/ \n \
>> hg://.*/.*     file://${SOURCE_DIR}/ \n \
>> osc://.*/.*    file://${SOURCE_DIR}/ \n \
>> p4://.*/.*     file://${SOURCE_DIR}/ \n \
>> svk://.*/.*    file://${SOURCE_DIR}/ \n \
>> svn://.*/.*    file://${SOURCE_DIR}/ \n"
>>
>> Users can have their own mirror by defining SOURCE_DIR in local.conf
>
> How is that easier and more maintainable than:
>
> INHERIT += "own-mirrors"
> SOURCE_MIRROR_URL = "/some/dir"
>
> ?
>
> Especially when more uri methods get added to the fetcher and oe-core.

Ask Richard?  I was just pointing out that Poky/Yocto already has a mechanism;
perhaps the OE one is better, who knows.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


