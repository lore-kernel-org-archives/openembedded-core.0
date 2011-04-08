Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Q8CNV-0001ZT-IR
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 16:09:38 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 0241D166079E; Fri,  8 Apr 2011 08:07:26 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 571041660759;
	Fri,  8 Apr 2011 08:07:25 -0600 (MDT)
Message-ID: <4D9F169D.9020502@mlbassoc.com>
Date: Fri, 08 Apr 2011 08:07:25 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4D9F0B82.9080803@mlbassoc.com>		<8B7010C5-9902-4372-BF78-252D85C4BF46@dominion.thruhere.net>	<1302270609.22904.128.camel@rex>
	<4D9F1540.6020902@mlbassoc.com>
In-Reply-To: <4D9F1540.6020902@mlbassoc.com>
Subject: Re: [poky] Early image startup
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
X-List-Received-Date: Fri, 08 Apr 2011 14:09:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2011 08:01 AM, Gary Thomas wrote:
> On 04/08/2011 07:50 AM, Richard Purdie wrote:
>> On Fri, 2011-04-08 at 15:30 +0200, Koen Kooi wrote:
>>> Op 8 apr 2011, om 15:20 heeft Gary Thomas het volgende geschreven:
>>>
>>>> I have a Poky image which uses a number of kernel modules. For
>>>> whatever reason, the raw image has not had the modules configured
>>>> (no /lib/modules/.../modules.dep) This file is created by 'update-modules'
>>>> but that is run too late in the boot process. The problem is that
>>>> other code, e.g. I'm using iptables via modules, requires the modules
>>>> be configured early and this fails. If I reboot (after 'update-modules'
>>>> has run), everything is fine.
>>>
>>> Sound like you need http://patches.openembedded.org/patch/1917/
>>
>> To be honest that sounds like a more fundamental problem as if the user
>> cares which rtc should be rtc0, there are other ordering constraints
>> being imposed such as a symlink to the "best" rtc device...
>
> Indeed, this patch did not help my situation at all.
>
> I think my problem is that of post-install package scripts (hence
> 'Configuring ...') not being run until quite late.

Looking at the pre-run image, I see that there is /etc/rcS.d/S98configure
which runs these scripts.  Is there any reason I can't move it earlier?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


