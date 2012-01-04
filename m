Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiF6P-0003i3-5V
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:53:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Jan 2012 16:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="52990753"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jan 2012 16:45:51 -0800
Message-ID: <4F03A13E.1050000@linux.intel.com>
Date: Tue, 03 Jan 2012 16:45:50 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325571068.git.sgw@linux.intel.com>
	<09b1dc8bd886c8cd2a5d4085d8bb4b73ece1f5b0.1325571069.git.sgw@linux.intel.com>
	<1325592886.24417.350.camel@phil-desktop>
	<4F03438F.3090702@windriver.com>
In-Reply-To: <4F03438F.3090702@windriver.com>
Subject: Re: [CONSOLIDATED PULL 012/113] base.bbclass: Allow buildstats to be optionally supplied
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
X-List-Received-Date: Wed, 04 Jan 2012 00:53:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2012 10:06 AM, Mark Hatle wrote:
> On 1/3/12 6:14 AM, Phil Blundell wrote:
>> On Mon, 2012-01-02 at 22:18 -0800, Saul Wold wrote:
>>> From: Mark Hatle<mark.hatle@windriver.com>
>>>
>>> Buildstats should be allowed to be optionally enabled. It's
>>> recommended that it be enabled via the USER_CLASSES setting.
>>>
>>> Alternatively it could be enabled via the INHERIT_DISTRO or
>>> similar mechanism.
>>>
>>> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
>>
>> I don't think the short summary of this patch gives a very clear
>> indication of what it's doing. The terminology "optionally supplied"
>> makes it sound as though you're talking about some sort of add-on data
>> file which can be enabled. Whereas, what the patch seems actually to be
>> doing is removing the unconditional inherit of buildstats (i.e. turning
>> it off for almost everyone who has it on today) and adding a suggestion
>> in local.conf.sample as to how it might be turned on again.
>
> Perhaps enabled is a better word then "supplied" in this case?
>
> I didn't comment that it was removing the unconditional inherit as I
> thought that was obvious..
>
> Saul -- can you change the short summary or should I resend it?
>
Already merged by the time this email came in!  Sorry.

Sau!

>> (That said, I do think the intent of this patch is a good one; it's been
>> a long-standing source of irritation to me that disabling buildstats is
>> so awkward at present.)
>
> This was causing a problem for me as well, thus the solution. Seemed
> simply enough and beneficial.
>
> --Mark
>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


