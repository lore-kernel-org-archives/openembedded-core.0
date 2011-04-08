Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Q8EGb-0003lS-Ih
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 18:10:41 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 5600116603E9; Fri,  8 Apr 2011 10:08:27 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id AB31916603DC;
	Fri,  8 Apr 2011 10:08:26 -0600 (MDT)
Message-ID: <4D9F32FA.30208@mlbassoc.com>
Date: Fri, 08 Apr 2011 10:08:26 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4D9F2423.7060900@mlbassoc.com>
	<DD53E7EC-88AD-4F21-B670-6A846E74B03D@dominion.thruhere.net>
In-Reply-To: <DD53E7EC-88AD-4F21-B670-6A846E74B03D@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Poky Project <poky@yoctoproject.org>
Subject: Re: [poky] [PATCH] Control over when package init scripts are run
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
X-List-Received-Date: Fri, 08 Apr 2011 16:10:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2011 09:39 AM, Koen Kooi wrote:
> Something like this would be better:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=e124d03f532aad2ee22c60fda6824a8a1f2ef88f

Possibly, except for the fact that I posted this to the Poky list which
have different recipes (the one mentioned above does not apply)

> Op 8 apr 2011, om 17:05 heeft Gary Thomas het volgende geschreven:
>
>> The script /etc/rcS.d/S98configure is run on the first boot only
>> to process any postponed package post-install scripts.  The default
>> position of this (98 == last) can be wrong, so let the distribution
>> set this (just a matter of ?= assignment).  This patch also removes
>> some slugos stuff and extends the flexibility to systems which use
>> RPM packaging as well.
>>
>> Tested on my PowerPC router, running as S00configure - works a treat.


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


