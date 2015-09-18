Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id EEC6273D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 17:38:24 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id EF4E8F811D8; Fri, 18 Sep 2015 11:38:23 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 1D69DF811D8;
	Fri, 18 Sep 2015 11:38:23 -0600 (MDT)
To: openembedded-core@lists.openembedded.org
References: <20150918173055.GB2385@jama>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <55FC4C16.6000502@mlbassoc.com>
Date: Fri, 18 Sep 2015 11:38:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20150918173055.GB2385@jama>
Subject: Re: World builds HW Was: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Fri, 18 Sep 2015 17:38:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-18 11:30, Martin Jansa wrote:
> On Fri, Sep 18, 2015 at 12:24:00PM -0400, Randy MacLeod wrote:
>> On 2015-09-07 11:14 AM, Martin Jansa wrote:
>>> Full jenkins build test takes over 3 days (depending on sstate reuse,
>>> one MACHINE can take more than 24 hours), so if I add them to
>>> master-next after it's merged to oe-core it will take 3-6 days to
>>> build-test them (6 days if they are sent just after current queue is
>>> sent for build).
>>
>> Hi Martin,
>
> Hi Randy,
>
>> Replying privately but you can add the list back in your
>> reply if you like.
>
> OK, adding both MLs
>
>> I never build all of meta-oe but a day seems like a long time.
>> On a 3-4 year old 24 core system, with 64 GB RAM and
>> 2 large disks, I build oe-core + a whitelist of meta-oe + misc layers in
>> 5 hours using 18.3 of the 24 cores on average.
>> What are the specs of your build machine?
>
> It's one of VMs running on box donated by HP to webos-ports project. It
> has access to 8 E5-2630L 0 @ 2.00GHz cores (from IIRC 24) and slow IO
> which we try to compensate a bit by using tmpfs for TMPDIR, VM has 80G
> RAM, so I'm using 72G for tmpfs.
>
> Tom: please fill-in the gaps, I don't know any details about the real HW
> it's running on.
>
> The same machine is also running some webos-ports builds sometimes.
>
> BUT be aware that my world build is much bigger than what you're
> probably building and changes in oe-core almost always ensure very low
> sstate reuse.
>
> e.g. last build with only small oe-core upgrade since previous build:
> NOTE: Tasks Summary: Attempted 33283 tasks of which 5252 didn't need to be rerun and 33 failed.
> NOTE: Build completion summary:
> NOTE:   do_populate_sysroot: 21% sstate reuse (485 setscene, 1750 scratch)
> NOTE:   do_package_qa: 12% sstate reuse (262 setscene, 1760 scratch)
> NOTE:   do_package: 4% sstate reuse (76 setscene, 1750 scratch)
> NOTE:   do_packagedata: 13% sstate reuse (281 setscene, 1750 scratch)
> NOTE:   do_package_write_ipk: 12% sstate reuse (262 setscene, 1756 scratch)
> NOTE:   do_populate_lic: 22% sstate reuse (521 setscene, 1806 scratch)

(slightly off topic): How did you get this report?

>
> real	1485m40.070s
> user	4166m49.125s
> sys	2825m50.068s
>
> BTW: you can see all this information in the world logs I'm sending to MLs
> (but not all the builds make it to ML report).
>
>> A decent build box these days has 32+ cores, 64+ GB RAM  and
>> and SSD or RAID disk filesystem. The costs of such a system
>> are significant but worth it given the number of people's time
>> involved in meta-oe.
>
> That's true, but I have to do with what I have available :).
>
>> Also, it would be nice if OE had a few such machines each
>> working on builds for a MACHINE to reduce your turn-around
>> to more like a day or so. :)
>
> Yes, it would be nice, I'm trying to get Tom King to set another VM like
> this in another location (another HP donated server), hopefully he will
> finish it soon.
>
> It's all hosted together with OE infrastructure, bandwidth is limited, but
> all I need for these builds is to fetch sources and upload the logs, there
> are no package feeds or sstate from these builds usable outside, but now it
> rsync the downloaded sources to sources.openembedded.org
>
> If you know about some idling build servers, I would like to give them
> something to do :).
>
> Regards,
>
>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

