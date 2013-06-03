Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 539C56A5A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 11:18:12 +0000 (UTC)
Received: (qmail 4350 invoked by uid 1003); 3 Jun 2013 11:18:12 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@96.240.166.228)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 Jun 2013 11:18:12 -0000
Message-ID: <51AC7B73.8040005@balister.org>
Date: Mon, 03 Jun 2013 07:18:11 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <51781746.2000509@linux.intel.com> <2278334.0GkpBHEP1r@helios>
	<20130531173450.GC23802@jama> <51A8E185.1010303@linux.intel.com>
	<938455D5-B24C-4B2E-880B-A235A10D22C5@dominion.thruhere.net>
In-Reply-To: <938455D5-B24C-4B2E-880B-A235A10D22C5@dominion.thruhere.net>
X-Enigmail-Version: 1.5.1
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Garman,
	Scott A" <scott.a.garman@intel.com>
Subject: Re: Stable Release Process
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
X-List-Received-Date: Mon, 03 Jun 2013 11:18:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/03/2013 02:00 AM, Koen Kooi wrote:
> 
> Op 31 mei 2013, om 19:44 heeft Darren Hart <dvhart@linux.intel.com> het volgende geschreven:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>>
>>
>> On 05/31/2013 10:34 AM, Martin Jansa wrote:
>>> On Fri, May 31, 2013 at 05:34:51PM +0100, Paul Eggleton wrote:
>>>> Hi Darren,
>>>>
>>>> Sorry it's taken me so long to reply to this.
>>>>
>>>> On Wednesday 24 April 2013 10:32:54 Darren Hart wrote:
>>>>> As the stable releases become first class citizens, we should
>>>>> probably look at streamlining the process of getting patches to
>>>>> them.
>>>>>
>>>>> The maintainer for the stable release currently changes by
>>>>> release, which undoubtedly creates some confusion of where to
>>>>> send patches and who to CC. These maintainers currently attempt
>>>>> to track these patches via email filters searching for release
>>>>> branch names and such, which is proving tedious and prone to
>>>>> missing patches.
>>>>>
>>>>> Other projects have seen good results using a stable list for
>>>>> this purpose. This would both make it obvious when a patch is
>>>>> intended for a stable release as well as remove any confusion
>>>>> about who to Cc as it would be the same list for all releases.
>>>>> Perhaps something like 
>>>>> openembedded-core-stable@lists.openembedded.org?
>>>>
>>>> In the OE-Classic days we used to have an
>>>> openembedded-stablebranch mailing list for the same purpose. I
>>>> don't recall anyone complaining about that when we had it, so
>>>> this sounds like it could help with the aforementioned issues.
>>>>
>>>> The downside I can see is that it's one more mailing list with
>>>> the associated problems of not everyone monitoring it ("that
>>>> patch of mine shouldn't have been backported!" or "you backported
>>>> one of my patches but missed an associated one"), and new users
>>>> erroneously emailing it with requests for help that should have
>>>> gone to the normal mailing list. That could however be outweighed
>>>> by the advantage of stable branch patches not being drowned out
>>>> by the rest of the patches as they currently can be.
>>>>
>>>>> In addition to the list, some policy would need to be
>>>>> documented on how to use the list. For example, it should
>>>>> always be Cc'd, and never emailed with patches directly that
>>>>> don't go first to the master branch. Backports being the
>>>>> exception. A policy could also be put in place to aid in
>>>>> automatic processing, such as that employed by the Linux
>>>>> kernel stable project. The following would request that the
>>>>> patch be applied to the denzil and danny stable releases:
>>>>>
>>>>> Cc: <openembedded-core-stable@lists.openembedded.org> # denzil 
>>>>> Cc: <openembedded-core-stable@lists.openembedded.org> # danny 
>>>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>>>>
>>>>> The advantage here over something like a subject tag, "[danny]"
>>>>> is that it scales a bit better to sending a patch for multiple
>>>>> releases.
>>>>>
>>>>> There are certainly other approaches, I mention this one as it
>>>>> has a proven track record and I don't have a reason to deviate
>>>>> from it.
>>>>
>>>> I'm not familiar with this, but I've never had any direct contact
>>>> with the kernel patch submission process so that might explain
>>>> it. I have to say I'm not unhappy with the existing convention we
>>>> have of marking it in the title of the email though.
>>>>
>>>> I'd like to hear more opinions from others, particularly
>>>> submitters of stable branch patches and other stable branch
>>>> maintainers who have been doing it longer than I have. Ping...?
>>>
>>> I like subject tags, at least because they are nicely shown in
>>> patchwork subject, so I can easily sort incoming patches to right
>>> bundles.
>>>
>>> And this problem with scaling when sending a patch for multiple 
>>> releases we already have when tagging multiple affected layers
>>> (which happens more often for meta-oe layers then multiple
>>> releases).
>>
>> It has been expressed that this has been challenging to enforce
>> (anything that is freeform is). Do you have any suggestions on how we
>> could address that? Documentation? Firm maintainer policy of willfully
>> ignoring non-tagged patches?
> 
> An email saying "wrong tag, please read README and resubmit" followed by willfully ignoring wrong tags has worked quite well in the past. But only if the README clearly states the tags needed and has a sample git-send-email cmdline.

I find the sample git send-email line in the README to be a huge help
for me.

Philip

