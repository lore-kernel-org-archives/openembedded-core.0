Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 621956DB40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 00:31:32 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BC786F811F7; Wed, 19 Mar 2014 18:31:32 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 76D76F811E4;
	Wed, 19 Mar 2014 18:31:31 -0600 (MDT)
Message-ID: <532A36F3.2090800@mlbassoc.com>
Date: Wed, 19 Mar 2014 18:31:47 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>	<23BFBADE-120F-4DBC-AABF-A9F802B8222C@dominion.thruhere.net>	<1395147366.3808.70.camel@ted>
	<CAP9ODKqhnScZ+__098Q7OS53WrkkASfrfSxdkGt3OeozZ=2yJA@mail.gmail.com>
In-Reply-To: <CAP9ODKqhnScZ+__098Q7OS53WrkkASfrfSxdkGt3OeozZ=2yJA@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [PATCH 1/2] linaro-pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Thu, 20 Mar 2014 00:31:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2014-03-19 16:38, Otavio Salvador wrote:
> On Tue, Mar 18, 2014 at 9:56 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2014-03-18 at 13:29 +0100, Koen Kooi wrote:
>>> Op 18 mrt. 2014, om 12:56 heeft Chase Maupin <Chase.Maupin@ti.com> het volgende geschreven:
>>>
>>>> * The power management test utilities from Linaro can be used
>>>>  to test multiple PM features such as cpufreq, cpuidle, thermal
>>>>  control and suspend operations.
>>>> * These utilities are not platform specific and can be used by
>>>>  a broader base of users.
>>>
>>> PN should me 'pm-qa' or 'pm-qa-utils'.
>>
>> Agreed.
>>
>>>  And it would fit better in meta-oe since it's not 'core' enough for oe-core.
>>
>> I'm open to discussion on that. Certainly if there is just one user,
>> meta-oe would be appropriate. If these are generically useful and the
>> plan is we integrate these into the larger automated test picture,
>> oe-core may make sense.
>>
>> So if there a bigger picture plan here? Would these make sense in the
>> broader picture?
> 
> I prefer if this is done in meta-oe first and we move to oe-core when
> needed. For now it is at very beginning so we still does not know what
> will be the real final picture of t.
> 

What are you afraid of?  Putting this in OE-core _may_ make sense
if it serves a larger community, but having it there will not be
destabilizing, so why not?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

