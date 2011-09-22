Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1R6hWW-0002fW-BC
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 13:33:00 +0200
Received: by fxi1 with SMTP id 1so2643374fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 04:27:41 -0700 (PDT)
Received: by 10.223.20.22 with SMTP id d22mr1695379fab.149.1316690860798;
	Thu, 22 Sep 2011 04:27:40 -0700 (PDT)
Received: from [172.20.1.6] (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id w6sm7209748fah.0.2011.09.22.04.27.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Sep 2011 04:27:39 -0700 (PDT)
Message-Id: <DCFAD0F1-1A5B-4038-8A0A-680B0B292F5D@dominion.thruhere.net>
From: Koen Kooi <koen@beagleboard.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1316686826.2029.30.camel@ted>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Thu, 22 Sep 2011 13:27:32 +0200
References: <4E7A3D3A.1030007@balister.org> <4E7A3E4C.6080206@windriver.com>
	<30E0E33D-A811-4023-8977-4CA73C4656E6@dominion.thruhere.net>
	<1316651210.13622.0.camel@ted>
	<A769990C-E69F-4882-B3B5-66048C9B5268@dominion.thruhere.net>
	<1316675047.2029.10.camel@ted>
	<CC6D993E-0C5B-4D42-BCB8-2C4C6E62EC77@dominion.thruhere.net>
	<1316686826.2029.30.camel@ted>
X-Mailer: Apple Mail (2.936)
Subject: Re: Fetch failure for source at kernel.org
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
X-List-Received-Date: Thu, 22 Sep 2011 11:33:00 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 22 sep 2011, om 12:20 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-09-22 at 10:28 +0200, Koen Kooi wrote:
>> Op 22 sep. 2011, om 09:03 heeft Richard Purdie het volgende  
>> geschreven:
>>> On Thu, 2011-09-22 at 08:40 +0200, Koen Kooi wrote:
>>>> Op 22 sep. 2011, om 02:26 heeft Richard Purdie het volgende  
>>>> geschreven:
>>>>> On Wed, 2011-09-21 at 21:49 +0200, Koen Kooi wrote:
>>>>>> Op 21 sep. 2011, om 21:43 heeft Mark Hatle het volgende  
>>>>>> geschreven:
>>>>>>
>>>>>>> On 9/21/11 2:38 PM, Philip Balister wrote:
>>>>>>>> I'm finally trying to get started with oe-core. I'm using a  
>>>>>>>> setup
>>>>>>>> created with the setup-script created by Koen. Everything  
>>>>>>>> looks ok until
>>>>>>>> it tried to build cpufrequtils. The recipe tries to fetch the  
>>>>>>>> source
>>>>>>>> from a git repo at kernel.org. Obviously, the fetch fails.
>>>>>>>>
>>>>>>>> What is odd, in the "good old days" I would expect this  
>>>>>>>> config to fall
>>>>>>>> back and use the Angstrom source mirror, but apparently this  
>>>>>>>> is not the
>>>>>>>> case with oe-core.
>>>>>>>>
>>>>>>>> Is this a bug or a feature? If this is a bug, is there a plan  
>>>>>>>> to fix it?
>>>>>>>> If it is a feature, how are we supposed to do builds if  
>>>>>>>> servers go away?
>>>>>>>> What do we do about GPL compliance?
>>>>>>>
>>>>>>> This is a feature, as people did not want oe-core tied to a  
>>>>>>> given mirror.
>>>>>>
>>>>>> This is the "OE core doesn't generate versioned git tarballs"  
>>>>>> problem
>>>>>> people keep talking about. I know I can edit each and every  
>>>>>> recipe to
>>>>>> add ';rebasable=true', but I'd like a global solution before  
>>>>>> the GPL
>>>>>> police starts looking at the angstrom source mirrors.
>>>>>
>>>>> Is this a versioned tarball problem or just the tarballs not being
>>>>> generated at all?
>>>>
>>>> versioned tarball problem, since the source mirror won't overwrite
>>>> files with the same name, so unversioned ones are both useless and
>>>> bandwidth wasting.
>>>
>>> They seem to be working perfectly well for Yocto...
>>>
>>> They're also not bandwidth wasting
>>
>> They are, since for the kernel you need to re-upload the 300MB  
>> tarball
>> to the source mirror for mirroring to work, even if there were no  
>> real
>> changes but bitbake repacked it. I know that versioned tarballs  
>> aren't
>> terribly efficient either, but at least they are deterministic.
>
> Well, it depends on your perspective, I was looking at this from a
> user's point of view. The server's bandwidth is nothing compared to  
> the
> users pulling the data.
>
>> The angstrom source mirror checks for duplicate filenames to avoid
>> introducing checksum changes due to upstream stupidity or corrupted
>> downloads.
>
> Fair enough but you could make an exception for the git scm tarballs
> (which follow a fairly identifiable pattern).

That still opens the door for people to upload "old" tarballs with  
less revs in them. No solution is perfect, though.

>>> since the fetcher is efficient and
>>> will incrementally update something that is incomplete.
>>
>> Which won't work currently since kernel.org is down.
>
> This just means there aren't appropriate git:// -> git:// mappings in
> people's mirrors files (including Yocto). If git:// -> git:// mappings
> don't work, we should fix that but they should.

You mean something like git.kernel.org/scm/torvalds/linux-2.6.git ->  
github.com/torvalds/linux.git ?

>>> Anyhow, this is the first time someone has explained that the mirror
>>> tarball improvements that were made to bitbake have not done  
>>> everything
>>> they desire. If you want someone on the Yocto team to look at this  
>>> I'd
>>> suggest a bug report or I'll take patches to bitbake (as always).
>>
>> But you do acknowledge the problem? FWIW, I've been arguing for a
>> global method of enabled versioned tarballs since I first started
>> using oe-core (called differently back then). I know linux-yocto
>> stretches the fetcher to its limits, but I'd like this change for all
>> the recipes using a single git tree with a single srcrev.
>
> Now someone has explained the issue, yes, I can see why it is causing
> problems. I do think some of them are of people's own choosing but I'm
> trying to be flexible and not make judgement on that.
>
> So we can do something along the lines of what you after but there are
> the following considerations:
>
> a) The versioned tarballs do need to be different to what we had  
> before
> in that the tarball will be of a .git directory containing the git
> metadata, not just a checkout. Why? This is so we can incrementally
> update a git repo if the user changes the source revision as one
> example. We're dealing with the git fetcher and limiting ourselves  
> to a
> flat one dimension doesn't make sense.

Agreed on that. The bitbake patch I sent does at least do that :)

> b) We need to agree what order the tarballs on the server should be
> searched for. The "obvious" order would be:
>
> 1. Specific Revision X tarball
> 2. generic mirror tarball
> 3. git clone
>
> The problems come about when we have an existing git checkout which
> doesn't contain the revision we want.

There currently is a bug in the fetcher that makes it hard to use now  
that kernel.org is down. The situation:

I have a recipe that pulls from git (e.g. cpufrequtils.git from  
kernel.org) with SRCREV fixed to e.g. deadbeef. DL_DIR/git/ 
git.kernel.org.utils.cpufrequtils has revision deadbeef. When I do a - 
c fetch -f it will try to do an update and fail since kernel.org is  
down. I would have expected it to check the existing bare clone for  
deadbeef first and not try updating if it is present.

Anyway, I agree on the search order above.

>  Currently we can just update and
> assume that will bring in the revision. If we now support people doing
> rebases and other things, we now at least in theory have to:
>
> 1. See if the revision exists locally
> 2. Try pulling
> 3. If that doesn't work look for a versioned tarball
> 4. Blow away all fetcher git status from DL_DIR
> 5. Extract the tarball

Since git supports local fetches the above can be:

1) see if rev exists
2) try pulling
3) try versioned tarball
4) extract tarball into tmpdir, fetch objects into DL_DIR/git2 repo

That would stop things from being blown away. It does allow the  
versioned snapshots to differ, but they will always have the rev they  
were versioned with.

> My big concern with this is rather than having some general
> archictecture and standard way of doing this, the fetcher once again
> becomes a set of special case if A do B but if C do D first then do E
> but don't forget to do A if Z happens type code.

I know virtually nothing of the fetcher code, but I think treating  
every tarball as a local mirror that gets fetched into DL_DIR/git2/ 
repodir would avoid a lot of special casing.

> So what I'm saying is I don't want the fetcher to become the
> unmaintainable mess the that the code paths in fetch1 were. I don't
> honestly know how to add a code path like the above and avoid this :(
>
> The patch on the bitbake list doesn't consider any of this  
> complexity or
> the corner cases

Sadly it's the best thing I can accomplish with my python skills :( It  
does solve my #1 need, which is an easy way (ls | grep) to check for  
GPL compliance.

regards,

Koen


