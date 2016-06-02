Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4DDC4774AA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 19:30:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u52JUFSA025474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Jun 2016 12:30:15 -0700 (PDT)
Received: from server.local (147.11.116.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 2 Jun 2016 12:30:15 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<8934616.REGKCHSCIX@peggleto-mobl.ger.corp.intel.com>
	<2b2ba358-1012-e27a-4b52-502673c218cc@windriver.com>
	<16461829.3PMlXGZ7eP@peggleto-mobl.ger.corp.intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <0d8a5a78-304b-5018-556d-d586149d0fde@windriver.com>
Date: Thu, 2 Jun 2016 15:30:14 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <16461829.3PMlXGZ7eP@peggleto-mobl.ger.corp.intel.com>
Cc: Chris Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/42] gcc: Add gcc6 recipes
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
X-List-Received-Date: Thu, 02 Jun 2016 19:30:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-06-02 3:24 PM, Paul Eggleton wrote:
> On Thu, 02 Jun 2016 15:19:37 Bruce Ashfield wrote:
>> On 2016-06-02 3:15 PM, Paul Eggleton wrote:
>>> On Thu, 02 Jun 2016 18:05:35 Martin Jansa wrote:
>>>> On Wed, Jun 01, 2016 at 10:23:35AM +1200, Paul Eggleton wrote:
>>>>> On Wed, 01 Jun 2016 10:20:23 Paul Eggleton wrote:
>>>>>> On Tue, 31 May 2016 11:12:21 Jussi Kukkonen wrote:
>>>>>>> On 11 May 2016 at 20:35, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>>> +#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
>>>>>>>> +BASEURI ?= "git://
>>>>>>>> github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
>>>>>>>
>>>>>>> I guess this is where git2_github.com.gcc-mirror.gcc.tar.gz download
>>>>>>> comes from? It increased the size of my downloads-directory by >30% --
>>>>>>> and I must have quite a bit of old junk in that directory already.
>>>>>>>
>>>>>>> Is there no other solution to this than a 2.5G git copy (honest
>>>>>>> question, I don't know gcc)?
>>>>>>
>>>>>> We went down this road before and it wasn't great for users. There is
>>>>>> at
>>>>>> least a tarball for 6.1, we'd presumably need some patches on top of
>>>>>> that (~43 if we were to simply take what's in the gcc-6-branch between
>>>>>> 6.1 and bd9a826, minus the "daily bumps").
>>>>>
>>>>> Perhaps that was a little unclear - when I say "we went down this road
>>>>> before" I'm agreeing with Jussi - we pointed to a git branch in a
>>>>> previous release with the same resulting huge download for everyone,
>>>>> something I think we should avoid if at all possible.
>>>>
>>>> Maybe it's biggest but at least there is only one copy of it:
>>>>
>>>> top 10 in my downloads (archives and then git clones).
>>>>
>>>> 823M
>>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.14.git.tar.gz
>>>> 831M
>>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.10.git.tar.gz
>>>> 893M
>>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.17.git.tar.gz
>>>> 934M
>>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.19.git.tar.gz
>>>> 969M
>>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-4.1.git.tar.gz
>>>> 1.2G
>>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-dev.git.tar.gz
>>>>
>>>> 2.4G    /OE/downloads/git2_github.com.gcc-mirror.gcc.tar.gz
>>>>
>>>> 854M    /OE/downloads/git2/github.com.qtproject.qtwebengine-chromium.git
>>>>
>>>> 877M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.10.git
>>>> 900M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git
>>>> 921M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.17.git
>>>> 964M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.19.git
>>>> 999M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-4.1.git
>>>> 1.3G    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-dev.git
>>>> 2.3G    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-4.4.git
>>>
>>> No argument from me there - it does seem a little wasteful given that
>>> there must be a huge overlap between those repos.
>>
>> In other build systems, I've simply been able to reference a common
>> repository for the majority of the blobs. That isn't an option with
>> oe/bitbake (as far as I know).
>
> It's possible we could add functionality along those lines to at least save
> download time; disk usage would probably be unaffected though.

Nope. Disk usage goes down as well. With alternate objects, each
repo is only the size of what is unique to the repo.

>
>> We could also do shallow clones, but I'm also unsure of how well that
>> is supported.
>
> I know Chris looked into adding this, I don't recall how far he got.
>
>> With the amount of series that are completely rebased and dynamic in
>> content, the trees do need to be separate per version. It becomes
>> completely un-bisectable and maintainable any other way.
>
> Bisectability is function of how the branch is managed, not the repository -
> surely? Perhaps I'm missing something.

Terminology perhaps? branch, repository .. whatever. They are all
the same.

Granularity of kernel commits. Over time with features like lttng,
aufs, preempt-rt, backports, etc, etc, It becomes impossible to 
integrate new features and kernel updates without conflicts.

You end up with a tree riddled with merge commits, reverts and other
garbage that obscure the real changes.

I've lived that life, and its a not fun.

Bruce

>
> Cheers,
> Paul
>


