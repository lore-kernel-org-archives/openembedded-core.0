Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id CA8116DF7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 15:23:44 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 9ED9FF811E2; Thu,  5 Dec 2013 08:23:44 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id AA33AF811E4;
	Thu,  5 Dec 2013 08:23:42 -0700 (MST)
Message-ID: <52A09AA7.1020600@mlbassoc.com>
Date: Thu, 05 Dec 2013 08:24:23 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <52A06F24.1060009@mlbassoc.com>
	<1386251419.25847.19.camel@ted>	<52A0892D.3090400@mlbassoc.com>
	<1386256186.25847.20.camel@ted>
In-Reply-To: <1386256186.25847.20.camel@ted>
Subject: Re: BB_NO_NETWORK broken for git
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
X-List-Received-Date: Thu, 05 Dec 2013 15:23:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-12-05 08:09, Richard Purdie wrote:
> On Thu, 2013-12-05 at 07:09 -0700, Gary Thomas wrote:
>> On 2013-12-05 06:50, Richard Purdie wrote:
>>> On Thu, 2013-12-05 at 05:18 -0700, Gary Thomas wrote:
>>>> I try to use a local source mirror, fully populated with packages, so I
>>>> can deliver a complete (no network required) bundle to my customers.  This
>>>> has recently been broken.
>>>>
>>>> I can no longer use BB_NO_NETWORK=1 for git recipes, since this revision:
>>>> commit 2354250a95eab484459f41f8715ae112295c2174
>>>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> Date:   Mon Nov 18 17:17:16 2013 +0000
>>>
>>> Its actually the metadata that has the issue. The commit specified is
>>> not on the master branch, its on the cross_prelink branch so the fetcher
>>> is justifiably getting upset.
>>>
>>> When the network is present it does a complete reset to upstream and
>>> then assumes the revision is present though which is something we might
>>> want to fix too.
>>>
>>> For now we can at least correct the metadata to point at the right
>>> branch. I've sent out a patch accordingly.
>>
>> Does this work for other git based repositories?  My example was for
>> prelink, but it seems to fail for me for any SRC_URI that uses git.
>> For example, matchbox-keyboard also fails under the same test scenario.
>
> Its the same problem. The commit referenced is not on master but on a
> different branch. The URL needs fixing to point at the right branch.

So I just [luckily] picked two recipes that have incorrect SRC_URI??
How many others will there be?  I'd wager most all since very few of
them actually mention a branch, just a revision.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

