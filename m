Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Q4ikt-0001gy-Dp
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 01:55:23 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id BC7AC16601F0; Tue, 29 Mar 2011 17:53:25 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id E8F8816601EB;
	Tue, 29 Mar 2011 17:53:24 -0600 (MDT)
Message-ID: <4D9270F4.3080004@mlbassoc.com>
Date: Tue, 29 Mar 2011 17:53:24 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1300730825.git.raj.khem@gmail.com>	<00f980d5a81d4cd6273ec10b67e4d288b8fd64de.1300730825.git.raj.khem@gmail.com>	<1301405666.24596.27.camel@rex>
	<20110329150018.GB4529@sakrah.homelinux.org>
In-Reply-To: <20110329150018.GB4529@sakrah.homelinux.org>
Subject: Re: [PATCH 1/3] bitbake.conf: Prune global OPTIMIZATION flags
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
X-List-Received-Date: Tue, 29 Mar 2011 23:55:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2011 09:00 AM, Khem Raj wrote:
> On (29/03/11 14:34), Richard Purdie wrote:
>> On Mon, 2011-03-21 at 11:11 -0700, Khem Raj wrote:
>>> -fexpensive-optimizations is enabled by default at -O2
>>>
>>> -fomit-frame-pointer is enabled at -O2 selectively by gcc depending upon
>>>    architecture if debug info is not hurt
>>>
>>> -frename-registers - This might have some performance advantage on top
>>>   of O2 on architectures which have more registers and registers are left
>>>   after scheduling but it affects debuggability quite a bit so as a i
>>>   tradeoff we do not use it.
>>>
>>> -feliminate-dwarf2-dups - We use this option to reduce the size of debug
>>>   information by removing duplicates this is only valid for dwarf2+ and we
>>>   use dwarf2 by default
>>
>> I've disabled this flag for now as it was causing too many failures
>> across the board (various apps, prelinker). We can add it back when this
>> has been tested more extensively and its been confirmed to work with the
>> prelinker.
>
> It would have been better to disable one by one we would be able to
> utilize current testing. Most probaly the prelink issue is due to -feliminate-dwarf2-dups did you try to remove that out ?

This change, in particular adding -feliminate-dwarf2-dups, breaks my
build of chromium(*) (in strange ways, it ends up building .a libraries
which the linker can't parse).  Everything else I've tried to build
seems OK though.  For now, I've just dropped this option in my DISTRO.conf

(*) It took quite some time to isolate this as the problem as it is a royal
pain to test BTW as it takes more than an hour to build this one package on my
hefty build server!

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


