Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 5197E73243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:11:22 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id F05CAF811F3; Thu, 10 Sep 2015 06:11:21 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9215BF811F2;
	Thu, 10 Sep 2015 06:11:21 -0600 (MDT)
To: openembedded-core@lists.openembedded.org
References: <cover.1441753511.git.raj.khem@gmail.com>
	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
	<32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>
	<55F1679C.5090508@linux.intel.com> <55F16E82.1070708@gmail.com>
	<55F172C9.3030601@linux.intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <55F173AC.7010808@mlbassoc.com>
Date: Thu, 10 Sep 2015 06:12:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55F172C9.3030601@linux.intel.com>
Subject: Re: Policy for 'Pending' patches (was Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Sep 2015 12:11:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-10 06:08, Alexander Kanavin wrote:
> On 09/10/2015 02:50 PM, Trevor Woerner wrote:
>
>>> Then we can formulate a policy on top of that: for example, if a patch
>>> has been 'Pending' for 3 months, the person who added it gets a
>>> reminder to update the status; if the patch has been 'Pending' for 6
>>> months and the patch person has been unresponsive, no more patches are
>>> accepted from that person until he does the upstreaming of the ones he
>>> already got into oe-core. Something like that.
>>
>> With so many maintainers on so many different layers/etc we would need
>> some sort of billboard somewhere listing the names of people currently
>> on the "naughty" list ;-)
>
> Yes, something similar to http://recipes.yoctoproject.org
>
> And the autobuilder could automatically reject or flag a patch that adds custom 'Pending' patches, if the patch author is determined to be on the 'naughty' list :-)

What would you do to the poor sod that sends a patch upstream
(i.e. Pending) that is not being moved on by the upstream holders?
Punish him by making his patch (and potentially all others he
has created) invalid?  Seems a bit harsh...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

